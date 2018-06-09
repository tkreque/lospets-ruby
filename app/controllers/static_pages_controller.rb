class StaticPagesController < ApplicationController
    
    def home
       @petsTemp = Pet.all
       
       @statuses = StatusModel.all
       @animals = AnimalModel.all
       
       @pets = Gmaps4rails.build_markers @petsTemp do |pet, marker|
            if !pet.address['coordinates'].nil?
                marker.lat pet.address['coordinates'][1]
                marker.lng pet.address['coordinates'][0]
                marker.title pet.name
                marker.picture ({
                    :url => "/images/icons/#{pet.status['icon']}/#{pet.breed['type']['icon']}",
                    :width => 32,
                    :height => 37
                })
                marker.infowindow "<table><tr><td><img src= '#{pet.image}' style='border-radius: 50%; height:80px; width:80px;' /><br /></td>"+
                    "<td>Nome: #{pet.name} <br />"+
                    "Raça: #{pet.breed['name']} - #{pet.breed['type']['name']} <br />"+
                    "Situação: #{pet.status['name']} <br />"+
                    "Endereço: #{pet.address['address']} <br />"+
                    "Tags: #{pet.tag.map{ |t| t['name'] }} <br /></td></tr>"+
                    "<tr><td><input type='button' value='Visualizar perfil' name='btn_perfil' onclick='redirectPet(`#{pet._id}`)'  /></td></tr></table>"
            end
        end
    end
    
end
