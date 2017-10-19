#class Board
	#def initialize
	#	attr_accessor :case1, :case2, :case3, :case4, :case5, :case6, :case7, :case8, :case9
	#end

#	def draw()
#		puts ("___ ___ ___")
#		puts ("   |   |   ")
#		puts ("___|___|___")
#		puts ("   |   |   ")
#		puts ("___|___|___")
#		puts ("   |   |   ")
#		puts ("___|___|___")
#	end
#end



#puts board.draw
class Cell
	attr_accessor :name, :number, :value
	def initialize (name, number, value)
		@name=name
		@number=number
		@value=value
	end

	def change_value (value)
		@value=value
		#puts @value
	end
end

class Player 
	attr_accessor :name, :sign
 def initialize (name, sign)
 	@name=name
 	@sign=sign
 end
end	


#==================================================================================

#Déclaration du plateau
#board = Board.new

#Déclaration des instances joueurs
players = [
  Player.new("PLAYER 1", "X"),
  Player.new("PLAYER 2", "O") 
]
#Déclaration des instances des cases

un = Cell.new("un", 1,1)
deux = Cell.new("deux",2,2)
trois = Cell.new("trois",3,3)
quatre = Cell.new("quatre",4,4)
cinq = Cell.new("cinq",5,5)
six = Cell.new("six",6,6)
sept = Cell.new("sept",7,7)
huit = Cell.new("huit",8,8)
neuf = Cell.new("neuf",9,9)

cells = [un,deux,trois,quatre,cinq,six,sept,huit,neuf]



fin_du_jeu = false
i=0
error_name="nothing"

#Début du tour
5.times do |tour|
	puts "\n------------------ Tour numéro #{tour} ------------------"
  	players.each do |player|
  		i = i+1

	  
		puts "\n             #{player.name}, À TOI DE JOUER!"
		puts "\n         Dans quelle case veux-tu te placer?"
		#On range dans la variable "choix" ce que l'utilisateur renseigne
	  

		cell_choice = gets.chomp.to_i
		
		
		#-----------------------------------------------------------------------------------------------
		cells.each do |cell|
	  		if cell_choice == cell.number
	  			cell.change_value(player.sign)
	  		else
	  			 
	  		
	  		end
	  		
		end
	
	    puts ("_____ _____ _____")
		puts ("     |     |     ")
		puts ("  #{un.value}  |  #{deux.value}  |  #{trois.value}  ")
		puts ("_____|_____|_____")
		puts ("     |     |     ")
		puts ("  #{quatre.value}  |  #{cinq.value}  |  #{six.value}  ")
		puts ("_____|_____|_____")
		puts ("     |     |     ")
		puts ("  #{sept.value}  |  #{huit.value}  |  #{neuf.value}  ")
		puts ("_____|_____|_____")
		puts ("\n\n===========================================================\n\n")
	
		tests = [un.value == deux.value && un.value == trois.value, un.value == cinq.value && un.value == neuf.value, un.value == quatre.value && un.value == sept.value, quatre.value == cinq.value && quatre.value == six.value, trois.value == cinq.value && trois.value == sept.value, deux.value == cinq.value && deux.value == huit.value, sept.value == huit.value && sept.value == neuf.value, trois.value == six.value && trois.value == neuf.value]
		
		if i==9 && tests.index {|obj| obj == true}	== nil
			fin_du_jeu = true
			puts "ÉGALITÉ"
		elsif tests.index {|obj| obj == true}	== nil
		 #puts "on continue"
		else fin_du_jeu= true
			index = tests.index {|obj| obj == true}
			if index<4 && un.value == "O"
				puts "PLAYER 2 a gagné"
			elsif index<7  && cinq.value == "O"
				puts "PLAYER 2 a gagné"
			elsif neuf.value == "O"
				puts "PLAYER 2 a gagné"
			else puts "PLAYER 1 a gagné"

			end
		end
		
		break if fin_du_jeu == true
			
		
	end
	
	break if fin_du_jeu == true

	
	
end

puts "LE JEU EST TERMINÉ"


#a réaliser
#si case deja prise, le dire + reprendre le même tour
#si il y a eu un ou plusieurs cas de cases prises, il faut diminuer le i d'autant pour ne pas arriver au cas de l'égalité trop tôt
#intégrer le chomp dans la boucle pour revenir en arrière
