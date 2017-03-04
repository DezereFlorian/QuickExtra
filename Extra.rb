class Extra
# === Gestion des extras de Quick
# === Variables d'instance
# - +type+		-> (*PRIVATE*) Pour le grill ou pour la caisse
# - +ennonce+	-> (*PRIVATE*) La descrption de l'extra

	attr_reader :ennonce#:nodoc:

	# Création d'un extra
	# * *Arguments*		:
	# 	- +type+	-> le type de l'extra
	# 	- +ennonce+	-> l'ennonce de l'extra
	def Extra.create(type, ennonce)
		new(type, ennonce)
	end

	def initialize(type, ennonce)
		@type, @ennonce = type, ennonce
	end


	def getEnnonce()
		return @ennonce
	end

	# Méthode d'affichage d'un extra
	def to_s()
		"\nJe suis #{@ennonce} et à faire par #{@type}."
	end
end


# Serialize une planche.
	# * *Arguments*    :
	#   - +nameFic+  -> le nom du fichier pour la sauvegarde
	# * *Returns*      :
	#   - le fichier chargé et convertit en langage machine
	#   
	#   
	#   
# === Gestion de cases dans une planche de Sudoku
# === Variables d'instance
# - +rows+	  -> (*PRIVATE*) Hash des lignes<br>
# - +columns+ -> (*PRIVATE*) Hash des colonnes<br>
# - +boxes+		-> (*PRIVATE*) Hash des "familles" des boxes<br>
# - +cells+	  -> (*PRIVATE*) Tableau des valeurs des Cell
#