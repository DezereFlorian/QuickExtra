require './Extra.rb'
class Equipier
# === Gestion des équipiers de Quick
# === Variables d'instance
# - +nom+		-> (*PRIVATE*) Le nom de l'équipier
# - +prenom+	-> (*PRIVATE*) Le prenom de l'équipier
# - +nbHeure+	-> (*PRIVATE*) Le nombre d'heures de l'équipier
# - +type+ 		-> (*PRIVATE*) La zone de travail de l'équipier
# - +prenom+	-> (*PRIVATE*) L'extra de l'équipier

	attr_accessor :extra#:nodoc:
	attr_reader :prenom, :nom, :type#:nodoc:

	# Création d'un equipier
	# * *Arguments*		:
	# 	- +nom+		-> le nom de l'equipier
	# 	- +prenom+	-> le prenom de l'equipier
	# 	- +nbHeure+	-> le nombre d'heure que fait l'equipier par semaine
	# 	- +type+ 	-> la zone dans laquelle l'équipier travaille
	def Equipier.add(nom, prenom, nbHeure, type)
		new(nom, prenom, nbHeure, type)
	end

	def initialize(nom, prenom, nbHeure, type)
		@nom, @prenom, @nbHeure, @type, @extra = nom, prenom, nbHeure, type, nil
	end

	# Attribution d'un extra à l'équipier
	# * *Arguments*		:
	# 	- +extra+	-> l'extra à ajouter
	def setExtra(extra)
		@extra = extra
	end

	# Méthode d'affichage d'un équipier
	def to_s()
		if @extra == nil
			"\n#{@nom} #{@prenom}, travaille au poste #{@type} pour #{@nbHeure} heures par semaines, il n'a pas d'extra pour le moment."
		else
			"\n#{@nom} #{@prenom}, travaille au poste #{@type} pour #{@nbHeure} heures par semaines, son extra est #{@extra}."	
		end
	end
end