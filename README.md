## Using the PetriNet DSL

The PetriNet DSL (Domain-Specific Language) is a user-friendly and intuitive tool designed to simplify the process of creating Petri nets. This guide provides an overview of how to use the PetriNet DSL to create and analyze Petri nets.

### PetriNet Definition

1. **Define the PetriNet:** Start by defining the PetriNet, which serves as the root syntax of the language. The PetriNet is enclosed within curly braces `{}` and square brackets `[]`. Within the curly braces, list the transitions separated by commas, and within the square brackets, specify the initial and final markings.

2. **Specify the Transitions:** Transitions represent events that can cause changes in the system state. Each transition should be defined with a source place, transition name, and target place. These entities should adhere to the language's syntax rules.

3. **Set the Initial and Final Markings:** Define the initial and final markings, which represent the starting and ending states of the system. The initial and final markings should correspond to a place that has been initialized in the PetriNet. Place the initial and final markings within square brackets `[]`.

4. **Check the Well-formedness:** Verify the well-formedness of the Petri net configuration using the provided well-formedness checker. This step ensures the correctness of the Petri net configuration and provides confidence in the output.

5. **Generate Code:** Once the PetriNet is defined and its well-formedness is confirmed, the DSL can generate Python code from the abstract syntax tree (AST) of the Petri net. This generated code can be used to create a Petri net using the PM4PY Python package.

By following these steps, users can easily create and analyze Petri nets using the PetriNet DSL. The simplicity and readability of the language make it a powerful tool for various applications. For a sample input program demonstrating the usage of the PetriNet DSL, please refer below.

### Sample Input Program

```python
PetriNet {
    transitions {
        Place1 -> Transition1 -> Place2,
        Place2 -> Transition2 -> Place3
    }
    markings [
        Place1 -> 1,
        Place3 -> 1
    ]
}
