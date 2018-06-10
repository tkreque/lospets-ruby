class StaticPagesController < ApplicationController
    
    def home
       @petsTemp = Pet.where("ok" => false).all
       @petsFilter = []
       
       @statuses = StatusModel.all
       @animals = AnimalModel.all
       @tags = TagModel.all
       @categories = @tags.uniq{|x| x.category}
       
       @pets = Gmaps4rails.build_markers @petsTemp do |pet, marker|
            if !pet.address['coordinates'].nil?
                @petsFilter.push(pet)
                marker.lat pet.address['coordinates'][1]
                marker.lng pet.address['coordinates'][0]
                marker.title pet.name
                marker.picture ({
                    :url => "/images/icons/#{pet.status['icon']}/#{pet.breed['type']['icon']}",
                    :width => 32,
                    :height => 37
                })
                marker.infowindow "<div class='pet'>"+
                                      "<div class='petName'>Nome: #{pet.name} </div>"+
                                      "<div class='petWrapper'>"+
                                         "<div class='petImage'>"+
                                           "<img src= '#{pet.image}' style='border-radius: 50%; height:80px; width:80px;' />" +
                                         "</div>" +
                                         "<div class='petDescriptor map'>"+
                                            "<div class='petBreed'>" +
                                               "<span> Raça </span>  #{pet.breed['name']} - #{pet.breed['type']['name']} " +
                                            "</div>" +
                                            
                                            "<div class='petStatus'>" +
                                               "<span> Status </span> #{pet.status['name']} " +
                                            "</div>" +
                                            
                                            "<div class='petAddress'>" +
                                               "<span> Endereço </span> #{pet.address['address']} " +
                                            "</div>" +
                                            
                                            "<div class='petCharacteristics'>" +
                                               "<span> Características </span>  #{pet.tag.map{ |t| t['name'] }} " +
                                            "</div>" +
                                         "</div>"+
                                      "</div>"+
                                      "<a href='javascript:void(0) onclick=#{pet._id}' class='btn3'>visualizar perfil </a>"
                                  "</div>";
            end
        end
    end
    
    def about
    end
    
    def contact
    end
    
    def help
    end
    
end
