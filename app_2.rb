require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#accueil 
    
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#initialisation du joueur
puts "quel est ton nom ?"
user_name = gets.chomp

user = HumanPlayer.new(user_name)

#Initialisation des ennemis
    P1 = User.new("Josiane")
    P2 = User.new("José")
    enemies = [P1, P2]

#le combat 
while user.life_points >0 && (P1.life_points > 0 || P2.life_points >0)
    
    #les options de choix 
    puts "Quelle action veux-tu effectuer ?"
    puts "        "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    
    puts "        "
    puts "attaquer un joueur en vue :"
    puts "0 - #{P1.name} a #{P1.life_points} points de vie"
    puts "1 - #{P2.name} a #{P2.life_points} points de vie"
    
    #les actions déclanché par les options précédentes
    action = gets.chomp
    if action == "a"
        user.search_weapon #on vas chercher une nouvelle arme
    end 
    
     if action == "b"
        user.search_health_pack #on vas chercher de nouvelles vie
     end 
    
     if action == "0"
         user.attacks(P1)
     end 
    
     if action == "1"
         user.attacks(P2)
     end          

    #maintenant c'est aux enemies de pouvoir contre attaquer. 
    enemies.each do |enemies_name|
        if enemies_name.life_points > 0
            enemies_name.attacks(user)
        end
    end 
    
end

puts "Félicitations vous avez gagné !!!"
