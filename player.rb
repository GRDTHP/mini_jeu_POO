#OK       attribut et inutialisation 

#require "pry"


    class User
        attr_accessor :name, :life_points, :damage, :player
        
        
        def initialize(name)
            @name = name 
            @life_points = 10
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
                return rand(1..6)
            end
            
            puts "le joueur #{name} attaque le joueur #{player.name}"
            damage = compute_damage
            puts "il lui inflige #{damage} points de dommages"
            player.gets_damage(damage)
        end 
    end

#la partie combat 
    P1 = User.new("Josiane")
    P2 = User.new("José")

    while (P1.life_points >= 0) && (P2.life_points >= 0)
        puts "Voici l'état de chaque joueur :"
        puts P1.show_state
        puts P2.show_state

        puts "Passons à la phase d'attaque :"
        puts P1.attacks(P2)
        if P2.life_points >= 0
            puts P2.attacks(P1)
        end
    end






#binding.pry
