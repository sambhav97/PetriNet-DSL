module petrinet::Plugin

import petrinet::AST;
import ParseTree;
import util::IDE;
import petrinet::Check;
import petrinet::Parser;
import petrinet::CST2AST;
import IO;

/*
 * This module integrates all parts of the project including parsing, transforming, checking,
 * and Python code generation for a given file. It also provides the function to write content to a file.
 */

/*
 * Function: checkWellformedness
 * This function checks the well-formedness of a program defined in a file.
 * The program is first parsed to a concrete syntax tree, then transformed to an abstract syntax tree,
 * and finally checked for well-formedness. If the program is well-formed, Python code is generated,
 * and written to a .py file.
 *
 * @param fil: The location of the file containing the program.
 * @return: A boolean value indicating whether the program is well-formed.
 */
bool checkWellformedness(loc fil) {
    // Parsing the file to a concrete syntax tree.
	&T resource = parserPetriNet(fil);
    // Transforming the concrete syntax tree to an abstract syntax tree.
	&T ast = cst2ast(resource);
	print(ast);
	// Evaluating the well-formedness of the abstract syntax tree.
	bool x = checkPetriNetConfiguration(ast);
	// If the program is well-formed, generate Python code from the abstract syntax tree.
	if(x) {
		str pythonCode = generatePythonCode(ast);
		// Write the generated Python code to a .py file.
		loc pythonFile = |project://DSL-Design-2023-Assignment-3/generated.py|;
		writeFile(pythonFile, pythonCode);
	}
	return x;
}

/*
 * Function: generatePythonCode
 * This function generates a string of Python code for creating a Petri net using the pm4py library. It starts by importing necessary classes from the library and initializing a new PetriNet object, along with initial and final Marking objects.
 * It then iterates through each transition in the Petri net and calls generateTransition function, which returns a string of Python code for each transition and appends this to the result string.
 * It does the same for the initial and final places in the Petri net by calling the generatePlace function.
 *
 * @param net: The PetriNet in AST form.
 * @return: A string of Python code that constructs the Petri net.
 */
public str generatePythonCode(PETRINET net) {
    str result = "from pm4py.objects.petri_net.obj import PetriNet, Marking\n"
         + "net = PetriNet(\"new_petri_net\")\n"
         + "initial_marking = Marking()\n"
         + "final_marking = Marking()\n";

    // Generate Python code for each transition in the Petri net.
    for (TRANSITIONS t <- net.trans) {
         result += generateTransition(t) + "\n";
    }
    
    // Generate Python code for the initial and final place in the Petri net.
    for (PLACE p <- [net.iniMark.pl, net.finiMark.pl]) {
         result += generatePlace(p) + "\n";
    }

    return result;
}

/*
 * Function: generateTransition
 * This function generates Python code to create a PetriNet.Transition object in the pm4py library. It also adds the transition to the net.transitions set.
 * It then checks for each place_name if it exists in net.places. If not, it creates a new place and adds it to net.places. Then, it checks if place_name is the sourceName. 
 * If it is, an arc from place to transition is added, otherwise an arc from transition to place is added.
 *
 * @param t: The TRANSITIONS object.
 * @return: A string of Python code for creating a transition, its associated places, and their arcs.
 */
public str generateTransition(TRANSITIONS t) {
    return "t = PetriNet.Transition(\"<t.transitioname.tnn>\")\n"
         + "net.transitions.add(t)\n"
         + "for place_name in [\"<t.sourceName.s>\", \"<t.targetName.tr>\"]:\n"
         + "\tif place_name not in [p.name for p in net.places]:\n"
         + "\t\tp = PetriNet.Place(place_name)\n"
         + "\t\tnet.places.add(p)\n"
         + "\telse:\n"
         + "\t\tp = [p for p in net.places if p.name == place_name][0]\n"
         + "\tif place_name == \"<t.sourceName.s>\":\n"
         + "\t\tnet.arcs.add(PetriNet.Arc(p, t))\n"
         + "\telse:\n"
         + "\t\tnet.arcs.add(PetriNet.Arc(t, p))\n";
}

/*
 * Function: generatePlace
 * This function generates Python code to create a PetriNet.Place object in the pm4py library. It adds the place to the net.places set and sets its initial and final marking.
 *
 * @param p: The PLACE object.
 * @return: A string of Python code for creating a place and setting its initial and final marking.
 */
public str generatePlace(PLACE p) {
    return "p = PetriNet.Place(\"<p.pn.bs>\")\n"
         + "net.places.add(p)\n"
         + "initial_marking[p] = <p.tk.d>\n"
         + "final_marking[p] = <p.tk.d>\n";
}