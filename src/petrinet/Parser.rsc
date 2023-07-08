module petrinet::Parser

import ParseTree;
import petrinet::Syntax;
import Exception;
import IO;

/*
 * This module defines the parser.
 * It uses the syntax defined in the petrinet::Syntax module.
 * It also handles exceptions that occur during the parsing process.
 */
 
 /*
 * Function parserPetriNet
 * This function receives the path of the file to parse (represented as a loc)
 * and returns a parse tree that represents the parsed program.
 * If a parse error occurs, it will print an error message and attempt to parse again.
 * 
 * @param fileLoc The location of the file to parse.
 * @return A parse tree that represents the parsed program.
 */
  public Tree parserPetriNet(loc fileLoc) {
 //The file is parsed and converted to concrete syntax here
 		try 
 		    // Attempt to parse the PetriNet from the file
 			return parse(#start[PetriNet], fileLoc);
 		catch ParseError(e):  // Catch any parsing errors
 			println("Your input cannot be parsed: <e>");
 			//throw "Parse error";
 			return parse(#start[PetriNet], fileLoc);

 }