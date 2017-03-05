require './Extra.rb'
class Equipier
# === Gestion des équipiers de Quick
# === Variables d'instance
# - +nom+		-> (*PRIVATE*) Le nom de l'équipier
# - +prenom+	-> (*PRIVATE*) Le prenom de l'équipier
# - +nbHeure+	-> (*PRIVATE*) Le nombre d'heures de l'équipier
# - +type+ 		-> (*PRIVATE*) La zone de travail de l'équipier
# - +prenom+	-> (*PRIVATE*) L'extra de l'équipier

	attr_accessor :extra
	attr_reader :prenom, :nom, :type

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

=begin
	def getType()
		return @type
	end

	def getExtra()
		return @extra
	end

	def setExtra(extra)
		@extra = extra
	end

	def getprenom()
		return @prenom
	end

	def getnom()
		return @nom
	end
=end

	# Méthode d'affichage d'un équipier
	def to_s()
		"\n#{@nom} #{@prenom}, travaille au poste #{@type} pour #{@nbHeure} heures par semaines, mon extra est #{@extra}"
	end
end