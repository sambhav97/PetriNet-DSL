module petrinet::AST

/*
 * This module defines the Abstract Syntax Tree (AST) for PetriNet.
 * An almost one-to-one correspondence with the grammar in Syntax.rsc is maintained.
 */

// A PetriNet is composed of a list of transitions, an initial marking and a final marking.
data PETRINET = petriNet(list[TRANSITIONS] trans, INITIALMARKING iniMark, FINALMARKING finiMark);

// A transition is made up of a source place, a transition name, and a target place.
data TRANSITIONS = tranSitions(SOURCEPLACE sourceName, TRANSITIONNAME transitioname, TARGETPLACE targetName);

// A source place is defined by a string identifier. The loc src parameter is used to track the location of the source place in the source file.
data SOURCEPLACE(loc src = |unknown:///|)
    = sp(str s);
    
// A transition name is defined by a string identifier. The loc src parameter is used to track the location of the transition name in the source file.
data TRANSITIONNAME(loc src = |unknown:///|)
    = tn(str tnn);
    
// A target place is defined by a string identifier. The loc src parameter is used to track the location of the target place in the source file.
data TARGETPLACE(loc src = |unknown:///|)
    = tp(str tr);
    
// Initial marking is defined as a place.
data INITIALMARKING = initialMarking(PLACE pl);

// Final marking is defined as a place.
data FINALMARKING = finalMarking(PLACE pl);

// A place is defined as a tuple of place name and token.
data PLACE = place(PLACENAME pn, TOKEN tk);

// A place name is defined by a string identifier. The loc src parameter is used to track the location of the place name in the source file.
data PLACENAME(loc src = |unknown:///|)
    = bsd(str bs);

// A token is defined by a string identifier. The loc src parameter is used to track the location of the token in the source file.
data TOKEN(loc src = |unknown:///|)
    = k(str d);