module petrinet::Check

import petrinet::AST;

import Set;
import petrinet::Plugin;
import String;
import Exception;
import IO;

/*
 * This module implements a well-formedness checker for the PetriNet using the AST.
 * It provides a set of functions to ensure the validity of the Petri network.
 */

/*
 * Function: checkPetriNetConfiguration
 * This function calls a set of helper functions to check the well-formedness of a Petri network.
 *
 * @param petriNet: The PetriNet in AST form.
 * @return: A boolean value indicating whether the PetriNet is well-formed.
 */
public bool checkPetriNetConfiguration(PETRINET petriNet) {
    return checkArcDirection(petriNet) && 
    	   checkUniqueTransitionNames(petriNet) &&
           checkInitialPlaceTokens(petriNet) &&
           checkFinalMarking(petriNet);
}

/*
 * Function to check that there are no arcs between place to place.
*/
private bool checkArcDirection(PETRINET petriNet) {
    for (TRANSITIONS transitions <- petriNet.trans) {
        if (transitions.sourceName == transitions.targetName) {
            return false; // Arc between place to place detected.
        }
    }
    return true; // No arc between place to place.
}

/*
 * Function to check that transitions have unique names.
*/
private bool checkUniqueTransitionNames(PETRINET petriNet) {
    set[TRANSITIONNAME] transitionNames = {};
    
    for (TRANSITIONS transitions <- petriNet.trans) {
        if (transitions.transitioname in transitionNames) {
            return false; // Duplicate transition name detected.
        } else {
            transitionNames += transitions.transitioname;
        }
    }
    return true; // All transition names are unique.
}


/*
 * Function to check that the initial place has 0 or more tokens.
*/
private bool checkInitialPlaceTokens(PETRINET petriNet) {
    return toInt(petriNet.iniMark.pl.tk.d) >= 0; // Check that tokens are 0 or more.
}

/*
 * Function to check that it can or cannot have a final marking.
*/
private bool checkFinalMarking(PETRINET petriNet) {
    return true; // Petri net can or cannot have a final marking.
}