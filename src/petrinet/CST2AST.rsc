module petrinet::CST2AST

import petrinet::AST;
import petrinet::Syntax;
import petrinet::Parser;

/*
 * This module implements the mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * It utilizes switch cases for pattern matching with concrete patterns.
 */

/*
 * Function cst2ast for PetriNet
 * Maps a PetriNet concrete syntax tree to its equivalent abstract syntax tree.
 *
 * @param net The PetriNet in concrete syntax tree form.
 * @return The equivalent PetriNet in abstract syntax tree form.
 */
public PETRINET cst2ast(start[PetriNet] net) {
    switch(net.top) {
        case (PetriNet) `{ <{Transitions ","}* trans> } [ [ <InitialMarking iniMark> ] , [ <FinalMarking finiMark> ] ]`:
            return petriNet([cst2ast(transitions) | transitions <- trans], cst2ast(iniMark), cst2ast(finiMark));
        default: throw "Unsupported PetriNet from cst2ast";
    }
}

/*
 * Function cst2ast for Transitions
 * Maps a Transitions concrete syntax tree to its equivalent abstract syntax tree.
 *
 * @param transitions The Transitions in concrete syntax tree form.
 * @return The equivalent Transitions in abstract syntax tree form.
 */
public TRANSITIONS cst2ast(Transitions transitions) {
    switch(transitions) {
        case (Transitions) `<SourcePlace sourceName> : <TransitionName transitioname> : <TargetPlace targetName>`:
            return tranSitions(sp("<sourceName>"), tn("<transitioname>"), tp("<targetName>"));
        default: throw "Unsupported Transitions Type from cst2ast";
    }
}

/*
 * Function cst2ast for InitialMarking
 * Maps an InitialMarking concrete syntax tree to its equivalent abstract syntax tree.
 *
 * @param iniMark The InitialMarking in concrete syntax tree form.
 * @return The equivalent InitialMarking in abstract syntax tree form.
 */
public INITIALMARKING cst2ast(InitialMarking iniMark) {
    switch(iniMark) {
        case (InitialMarking) `<Place pl>`:
            return initialMarking(cst2ast(pl));
        default: throw "Unsupported InitialMarking Type from cst2ast";
    }
}

/*
 * Function cst2ast for FinalMarking
 * Maps a FinalMarking concrete syntax tree to its equivalent abstract syntax tree.
 *
 * @param finiMark The FinalMarking in concrete syntax tree form.
 * @return The equivalent FinalMarking in abstract syntax tree form.
 */
public FINALMARKING cst2ast(FinalMarking finiMark) {
    switch(finiMark) {
        case (FinalMarking) `<Place pl>`:
            return finalMarking(cst2ast(pl));
        default: throw "Unsupported FinalMarking Type from cst2ast";
    }
}

/*
 * Function cst2ast for Place
 * Maps a Place concrete syntax tree to its equivalent abstract syntax tree.
 *
 * @param pl The Place in concrete syntax tree form.
 * @return The equivalent Place in abstract syntax tree form.
 */
public PLACE cst2ast(Place pl) {
    switch(pl) {
        case (Place) `<PlaceName pn> : <Token tk>`:
            return place(bsd("<pn>"), k("<tk>"));
        default: throw "Unsupported Place Type from cst2ast";
    }
}