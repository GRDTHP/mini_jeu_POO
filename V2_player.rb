#OK       attribut et inutialisation 


    class User
        attr_accessor :name, :life_points, :damage, :player, :weapon_level
        
        
        def initialize(name)
            @name = name 
            @life_points = 10
            @weapon_level = 1
        end
        
        def show_state
            puts "#{name} a #{life_points} points de vie"
            
        end    
        
        def gets_damage(damage)
            @life_points = @life_points - damage
            if @life_points <= 0
                puts "le joueur #{name} a été tué !"
            end
        end   
        
        def attacks(player)
            def compute_damage
                return rand(1..6) * @weapon_level
            end
            
            puts "le joueur #{name} attaque le joueur #{player.name}"
            damage = compute_damage
            puts "il lui inflige #{damage} points de dommages"
            player.gets_damage(damage)
        end 
    end

#la v2 amélioré 

class HumanPlayer < User
    
    attr_accessor :name, :life_points, :damage, :player, :weapon_level
          
    def initialize(name)
        @name = name 
        @life_points = 100
        @weapon_level = 1
    end
    
    def search_weapon
        search_weapon = rand(1..6)
        puts "tu as trouvé une arme de niveau #{search_weapon}"
        if search_weapon > weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = search_weapon
        else 
           puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end 
    
    def search_health_pack
        search_health_pack = rand(1..6)
        
        if search_health_pack == 1
            puts "Tu n'as rien trouvé... "
        else
            if search_health_pack == 6
                puts "Waow, tu as trouvé un pack de +80 points de vie !"
                @life_points = @life_points + 80
            else #soit les nombres compris entre 2 et 5 inclus.
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
                @life_points = @life_points + 50
            end
        end 
        
        #on régule les points de vie pour éviter que ceux-ci ne dépassent 100. 
        if @life_points > 100
            @life_points = 100
        end 
    end
    
end 


#J1 = HumanPlayer.new("guillaume")

#J1.search_weapon
#J1.weapon_level
#J1.search_weapon
#J1.weapon_level


#l'interface du jeu 
    
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
