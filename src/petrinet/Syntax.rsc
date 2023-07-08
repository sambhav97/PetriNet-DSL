module petrinet::Syntax

/*
 * This module defines the concrete syntax for PetriNet.
 */

// Define the start syntax rule for PetriNet. It includes transitions, initial marking and final marking.
start syntax PetriNet = petriNet:"{" {Transitions ","}* trans"}" "[""[" InitialMarking iniMark"]" "," "[" FinalMarking finiMark"]" "]";

// Transitions are defined as a tuple of source place, transition name, and target place.
syntax Transitions = tranSitions: SourcePlace sourceName ":" TransitionName transitioname ":" TargetPlace targetName;

// Lexical definition for source place identifiers.
lexical SourcePlace = sp: [a-zA-Z][a-zA-Z0-9_]*;

// Lexical definition for target place identifiers.
lexical TargetPlace = tp: [a-zA-Z][a-zA-Z0-9_]*;

// Lexical definition for transition name identifiers.
lexical TransitionName = tn: [a-zA-Z][a-zA-Z0-9_]*;

// Initial marking is defined as a place.
syntax InitialMarking = initialMarking: Place pl;

// Final marking is defined as a place.
syntax FinalMarking = finalMarking: Place pl;
 
// A place is defined as a tuple of place name and token.
syntax Place = place: PlaceName pn ":" Token tk;

// Lexical definition for place name identifiers.
lexical PlaceName = bsd: [a-zA-Z][a-zA-Z0-9_]*;

// Lexical definition for tokens. They are natural numbers greater than zero.
lexical Token = k: [1-9][0-9]*;

// Whitespaces including spaces, tabs, new lines and carriage returns.
layout Whitespace = WS: [\ \t\n\r]*;
