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
	@@nomFic = ".save.yaml"
	# Méthode d'initialisations
	def initialize()
		@listeEquipier = Array.new()
		@listeExtraGrill = Array.new()
		@listeExtraCaisse = Array.new()
		@tabFinal = Array.new()
		@nomFic = ".save.yml"
	end

	# Serialize l'engine
	def serialized()
    	File.open(@@nomFic, "w+") do |f|
    		YAML.dump(self, f)
    	end
    	File.close(@@nomFic)
    end

	# Deserialize une planche
	# * *Returns*      :
	#   - le fichier chargé et convertit en langage machine
	def self.unserialized()
    	return YAML.load_file(@@nomFic)
	end

	# Ajoute un équipier à la liste des équipiers
	# * *Arguments*    :
	#   - +equipier+  -> l'équipier à ajouter
	# * *Returns*      :
	#   - l'objet lui même
	def addEquipier(equipier)
		@listeEquipier.push(equipier)
		return self
	end

	# Ajoute un extra à la liste des extras du grill
	# * *Arguments*    :
	#   - +extra+  -> l'extra à ajouter
	# * *Returns*      :
	#   - l'objet lui même
	def addExtraGrill(extra)
		@listeExtraGrill.push(extra)
		return self
	end

	# Ajoute un extra à la liste des extras de la caisse
	# * *Arguments*    :
	#   - +extra+  -> l'extra à ajouter
	# * *Returns*      :
	#   - l'objet lui même
	def addExtraCaisse(extra)
		@listeExtraCaisse.push(extra)
	end

	# Associe un extra à chaque équipier
	def giveExtra() #rendre le fichier de save caché
		equipier = @listeEquipier.dup
		extraGrill = @listeExtraGrill.dup
		extraCaisse = @listeExtraCaisse.dup
		equipier.each{ |a|
			if (a.type == "caisse")
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

	# Méthode d'affichage de la liste des équipiers
	def printEquipier()
		print("\n\n-----------------------La liste des equipier est composé de: ")
		@listeEquipier.each{ |a|
			puts(a)
			if (a.extra() != nil)
				puts("son extra est ")
				puts(a.getExtra.ennonce)
			end
		}
	end

	#Méthode d'affichage des listes d'extras
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

	#Méthode d'affichage de l'engine, affiche les équipiers et leurs extras
	def printFinal()
		@listeEquipier.each { |tmp|
			puts(tmp)
		}
  	end

  	def menu()
  		#TODO pouvoir chercher un extra/equipier pour le modifier ==== vider la liste des équipiers/extras ====
  		puts("Que voulez-vous faire?\n1--Ajouter un équipier\n2--Ajouter un extra grill\n3--Ajouter un extra caisse
  			\n4--Associer les équipiers aux extras\n5--Afficher la liste des extras\n6--Afficher la liste des équipiers
  			\n9--Quitter")
  		#choix = gets.chomp.to_i
  		choix = 1
  		case choix
  		when 1
  			puts("Vous avez choisi d'ajouter un équipier")
  			puts("Merci d'entrer le nom, le prénom, son nombre d'heure, et le type de l'équipier")
=begin		
			nom = gets.chomp
  			prenom = gets.chomp
  			heure = gets.chomp.to_i
  			type = gets.chomp
=end
			nom = "Prout"
			prenom ="caca"
			heure = "16"
			type ="graisse"
  			addEquipier(Equipier.add(nom, prenom, heure, type))
  			menu
  		when 2
  			puts("Vous avez choisi d'ajouter un extra")
  			puts("Merci d'entrer son intitulé")
  			#intitule = gets.chomp
  			intitule = "je suis coucou"
  			addExtraGrill(Extra.create("grill", intitule))
  			menu
  		when 3
  			puts("Vous avez choisi d'ajouter un extra")
  			puts("Merci d'entrer son intitulé")
  			intitule = gets.chomp  			
  			addExtraCaisse(Extra.create("caisse", intitule))
  			menu
  		when 4
  			giveExtra
  			menu
  		when 5
  			printExtra
  			menu
  		when 6
  			printEquipier
  			menu
  		when 9
  			puts("Vous quittez")
  			serialized
  		end  			
  	end
end



######PSEUDO save du vieux progrmame
=begin
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

		# Ajoute un équipier à la liste des équipiers
		# * *Arguments*    :
		#   - +equipier+  -> l'équipier à ajouter
		# * *Returns*      :
		#   - l'objet lui même
		def addEquipier(equipier)
			@listeEquipier.push(equipier)
			return self
		end

		# Ajoute un extra à la liste des extras du grill
		# * *Arguments*    :
		#   - +extra+  -> l'extra à ajouter
		# * *Returns*      :
		#   - l'objet lui même
		def addExtraGrill(extra)
			@listeExtraGrill.push(extra)
			return self
		end

		# Ajoute un extra à la liste des extras de la caisse
		# * *Arguments*    :
		#   - +extra+  -> l'extra à ajouter
		# * *Returns*      :
		#   - l'objet lui même
		def addExtraCaisse(extra)
			@listeExtraCaisse.push(extra)
		end

		# Ajoute un extra à la liste des extras du grill
		def giveExtra() #rendre le ficheir de save caché
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

		# Méthode d'affichage de la liste des équipiers
		def printEquipier()
			print("\n\n-----------------------La liste des equipier est composé de: ")
			@listeEquipier.each{ |a|
				puts(a)
				if (a.extra() != nil)
					puts("mon extra est ")
					puts(a.getExtra.ennonce)
				end
			}
		end
	=begin
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
	=end
		#Méthode d'affichage des listes d'extras
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

		#Méthode d'affichage de l'engine, affiche les équipiers et leurs extras
		def printFinal()
	=begin
			puts("Voici les équipiers et leurs extras:")
			i = 0
			loop {
				if(i < @tabFinal.length)
					puts(@tabFinal[i]+" | "+@tabFinal[i+1]+" | "+@tabFinal[i+2])
				end
				i += 3
			 	break if(i > @tabFinal.length)
			}
	=end
			@listeEquipier.each { |tmp|
				puts(tmp);
			}
	  	end
	end	
=end