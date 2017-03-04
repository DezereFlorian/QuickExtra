require './Engine.rb'
require './Extra.rb'
require './Equipier.rb'

main = Engine.new()

#main = Engine.unserialized()

main.addEquipier(Equipier.add("Bourgeois","Maëlle",16, "caisse"))
main.addEquipier(Equipier.add("Charron","Géraldine",24, "caisse"))
main.addEquipier(Equipier.add("Chauveteau","Lauralee",16, "caisse"))
main.addEquipier(Equipier.add("Cruchet","Sandrine",28, "caisse"))
main.addEquipier(Equipier.add("Debonne","Ludivine",24, "caisse"))
main.addEquipier(Equipier.add("Dezere", "Florian", 20, "grill"))
main.addEquipier(Equipier.add("Dezere","Jérémy",10, "grill"))
main.addEquipier(Equipier.add("Dumont","Théophile",16, "grill"))
main.addEquipier(Equipier.add("Etienne","Léa",24, "caisse"))
main.addEquipier(Equipier.add("Gasse","Benjamin",24, "grill"))
main.addEquipier(Equipier.add("Gohier","Stéphanie",20, "caisse"))
main.addEquipier(Equipier.add("Gouesse","Camille",10, "caisse"))
main.addEquipier(Equipier.add("Guillaume","Quentin",28, "grill"))
main.addEquipier(Equipier.add("Hocine","Lucas",18, "grill"))
main.addEquipier(Equipier.add("Lasseaux","Anaïs",16, "caisse"))
main.addEquipier(Equipier.add("Leblanc","Marine",16, "caisse"))
main.addEquipier(Equipier.add("Léguillon","Florian",18, "grill"))
main.addEquipier(Equipier.add("Maheu","Laurianne",28, "caisse"))
main.addEquipier(Equipier.add("Poirier","Virginie",30, "grill"))
main.addEquipier(Equipier.add("Berthelot","Mélaine",24, "grill"))

main.addExtraGrill(Extra.create("grill", "Nettoyer la hotte (extérieur)"))
main.addExtraGrill(Extra.create("grill", "Nettoyer la carosserie du frigo transition"))
main.addExtraCaisse(Extra.create("caisse", "Nettoyer les chaises bébés intégralement"))
main.addExtraCaisse(Extra.create("caisse", "Nettoyer les dessous des tables"))

#main.printEquipier()
#main.printExtra()

main.giveExtra()

main.ConcatInTab()

main.printFinal()

#main.serialized()

