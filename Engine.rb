require './Extra.rb'
require './Equipier.rb'
require 'yaml'

class Engine
# === Gestion des équipiers de Quick
# === Variables d'instance
# - +listeExtraGrill+	-> (*PRIVATE*) La liste des extras du grill
# - +listeExtraCaisse+	-> (*PRIVATE*) La liste des extras de la caisse
# - +listeEquipier+	    -> (*PRIVATE*) La liste des équipiers
# - +tabFinal+ 		    -> (*PRIVATE*) Le tableau des équipiers et de leurs extras
# - +nomFic+            -> (*PRIVATE*) Le nom du fichier de sauvegarde

	# Méthode d'initialisations
	def initialize()
		@listeEquipier = Array.new()
		@listeExtraGrill = Array.new()
		@listeExtraCaisse = Array.new()
		@tabFinal = Array.new()
		@nomFic = ".save.yml"
	end

	# Serialize une planche
  	# * *Arguments*    :
  	#   - +nameFic+  -> le nom du fichier pour la sauvegarde
	def serialized()
    	File.open(@@nomFic, "w+") do |f|
    	YAML.dump(self, f)
    	end
    end

	# Deserialize une planche
	# * *Arguments*    :
	#   - +nameFic+  -> le nom du fichier pour la sauvegarde
	# * *Returns*      :
	#   - le fichier chargé et convertit en langage machine
	def self.unserialized()
  		File.open(@@nomFic, "r")
    	return YAML.load_file(@@nomFic)
	end

	
	def addEquipier(equipier)
		@listeEquipier.push(equipier)
		return @listeEquipier
	end

	def rmEquipier(equipier)
		#pouvoir enlever un equipier de la liste
	end

	def addExtraGrill(extra)
		@listeExtraGrill.push(extra)
	end

	def addExtraCaisse(extra)
		@listeExtraCaisse.push(extra)
	end

	def getListeEquipier()
		return (@listeEquipier)
	end

	def giveExtra() #créer une array liste tmp qui contienne tout les équipiers pour les enlever petit a petit
		#rendre le ficheir de save caché
		equipier = @listeEquipier
		extraGrill = @listeExtraGrill
		extraCaisse = @listeExtraCaisse
		equipier.each{ |a|
			if (a.getType == "caisse")
				if(extraCaisse.length != 0)
					i = Random.new.rand(0...extraCaisse.length)
					a.setExtra(extraCaisse[i])
					extraCaisse.delete_at(i)
					equipier.delete_at(equipier.index(a))
				end
			else 
				if(extraGrill.length != 0)
					i = Random.new.rand(0...extraGrill.length)
					a.setExtra(extraGrill[i])
					extraGrill.delete_at(i)
					equipier.delete_at(equipier.index(a))
				end
			end
		}
	end

	def printEquipier()
		print("\n\n-----------------------La liste des equipier est composé de: ")
		@listeEquipier.each{ |a|
			puts(a)
			if (a.getExtra() != nil)
				puts("mon extra est ")
				puts(a.getExtra.ennonce)
			end
		}
	end

	#####REFAIRE CETTE FONCTION POUR QUE L'AFFICHAGE SE PASSE DE CE TABLEAU, UTILISER EXTRAS DANS EQUIPIER
	def ConcatInTab()
		@listeEquipier.each{ |var|
			@tabFinal.push(var.getNom())
			@tabFinal.push(var.getPrenom())
			if(var.getExtra != nil)
				@tabFinal.push(var.getExtra.getEnnonce())
			else 
				@tabFinal.push("coucou, pas assez d'extra")
			end
		}
	end

	def printExtra()
		print("\n\n-----------------------La liste des extras grill se compose de: ")
		@listeExtraGrill.each{ |a|
			puts(a)
		}
		print("\n\n-----------------------La liste des extras caisse se compose de: ")
		@listeExtraCaisse.each{ |a|
			puts(a)
		}
	end

	def printFinal()
		puts("Voici les équipiers et leurs extras:")
		i = 0
		loop {
			if(i < @tabFinal.length)
				puts(@tabFinal[i]+" | "+@tabFinal[i+1]+" | "+@tabFinal[i+2])
			end
			i += 3
		 	break if(i > @tabFinal.length)
		}
  	end

  	def seekEquipier(nom, prenom)
  		#permet de faire une recherche d'un equipier, qui renverra un équipier et qui du coup permettra de le supprimer de la liste
  	end
end