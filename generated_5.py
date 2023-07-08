from pm4py.objects.petri_net.obj import PetriNet, Marking
net = PetriNet("new_petri_net")
initial_marking = Marking()
final_marking = Marking()
t = PetriNet.Transition("t1")
net.transitions.add(t)
for place_name in ["a", "a"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "a":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t2")
net.transitions.add(t)
for place_name in ["b", "b"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "b":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t3")
net.transitions.add(t)
for place_name in ["a", "b"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "a":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

p = PetriNet.Place("a")
net.places.add(p)
initial_marking[p] = 4
final_marking[p] = 4

p = PetriNet.Place("d")
net.places.add(p)
initial_marking[p] = 1
final_marking[p] = 1

