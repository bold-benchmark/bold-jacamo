base("http://127.0.1.1:8080/") .

lightStatus(Light, Prop, Status) :-
    rdf(Light, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://buildsys.org/ontologies/Brick#Luminance_Command") &
    rdf(Light, "http://www.w3.org/ns/sosa/actsOnProperty", Prop) &
    rdf(Prop, "http://www.w3.org/1999/02/22-rdf-syntax-ns#value", Status) .

+!start :
    true
    <-
    !run ;
    !crawlBuilding3 ;
    !turnOff ;
  .

+!run :
    base(Base)
    <-
    .concat(Base, "sim", SimURI) ;
    put(SimURI, [
      rdf(SimURI, "http://ti.rw.fau.de/sim#initialTime", "2020-05-21T08:00:00Z"),
      rdf(SimURI, "http://ti.rw.fau.de/sim#iterations", "1440"),
      rdf(SimURI, "http://ti.rw.fau.de/sim#timeslotDuration", "60000")
    ]) ;
  .

+!crawlBuilding3 :
    base(Base)
    <-
    .concat(Base, "Building_B3", EntryPoint) ;
    crawl(EntryPoint) ;
  .

+!printCount :
    true
    <-
    .count(rdf(_, _, _), Count) ;
    .print("found ", Count, " triples.");
  .

+!getCoffeeRoom :
    true
    <-
    .concat(Base, "Room_CoffeeDesk", Room) ;
    get(Room) ;
  .

+!printLights :
    lightStatus(Light, Prop, Status)
    <-
    .print(Light, Prop, Status) ;
  .

+!turnOff :
    .findall(Prop, lightStatus(Light, Prop, Status) & Status \== "off", List) & .length(List, Ln) & Last = Ln - 1
    <-
    !turnOffChain(List, Last) ;
  .

+!turnOffChain(List, 0) :
    true
    <-
    .print("no more light to turn off.") ;
  .

+!turnOffChain(List, Nth) :
    .nth(Nth, List, Prop)
    <-
    put(Prop, [
      rdf(Prop, "http://www.w3.org/1999/02/22-rdf-syntax-ns#value", "off")
    ]) ;
    Next = Nth - 1 ;
    !!turnOffChain(List, Next) ;
  .

{ include("inc/owl-signature.asl") }
{ include("inc/common.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
