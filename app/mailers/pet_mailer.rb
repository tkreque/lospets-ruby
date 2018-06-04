class PetMailer < ApplicationMailer
    default from: "noreply@los-pets.com"
    
    def email(pet)
        @user = pet.user
        @pet = pet
        @url = pet_url(@pet)
        mail(to: @user.email, subject: 'LosPets - Notificação de Comentário')
    end
end
