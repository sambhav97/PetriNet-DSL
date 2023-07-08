from pm4py.objects.petri_net.obj import PetriNet, Marking
net = PetriNet("new_petri_net")
initial_marking = Marking()
final_marking = Marking()
t = PetriNet.Transition("t1")
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

t = PetriNet.Transition("t2")
net.transitions.add(t)
for place_name in ["b", "c"]:
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
for place_name in ["c", "d"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "c":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t4")
net.transitions.add(t)
for place_name in ["d", "e"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "d":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t5")
net.transitions.add(t)
for place_name in ["e", "f"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "e":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t6")
net.transitions.add(t)
for place_name in ["f", "g"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "f":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t7")
net.transitions.add(t)
for place_name in ["g", "h"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "g":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t8")
net.transitions.add(t)
for place_name in ["d", "a"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "d":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t9")
net.transitions.add(t)
for place_name in ["f", "a"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "f":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

t = PetriNet.Transition("t10")
net.transitions.add(t)
for place_name in ["h", "a"]:
	if place_name not in [p.name for p in net.places]:
		p = PetriNet.Place(place_name)
		net.places.add(p)
	else:
		p = [p for p in net.places if p.name == place_name][0]
	if place_name == "h":
		net.arcs.add(PetriNet.Arc(p, t))
	else:
		net.arcs.add(PetriNet.Arc(t, p))

p = PetriNet.Place("a")
net.places.add(p)
initial_marking[p] = 8
final_marking[p] = 8

p = PetriNet.Place("h")
net.places.add(p)
initial_marking[p] = 1
final_marking[p] = 1

