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
=begin
	def getEnnonce()
		return @ennonce
	end
=end
	# Méthode d'affichage d'un extra
	def to_s()
		 "#{@ennonce}"
	end

	# Méthode d'affichage d'un extra pour coller avec un bel affichage
	def printExtra()
		return "\nExtra #{@type}: #{@ennonce}"
	end
end