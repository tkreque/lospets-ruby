class CommentsController < ApplicationController
    
    def create
        @pet = Pet.find(params[:pet_id])
        @comment = @pet.comments.create!(comment_params)
        
        
        if @pet.user.notify_email
            PetMailer.email(@pet).deliver
        end
        if @pet.user.cellphone && @pet.user.notify_cellphone
            path = polymorphic_url(@pet)
            sns = Aws::SNS::Client.new(
                region: 'us-east-1', 
                access_key_id: ENV['AWS_ACCESS_KEY'], 
                secret_access_key: ENV['AWS_SECRET_KEY']
            )
            sns.publish(
                phone_number: "#{@pet.user.cellphone}", 
                message: "Você tem um novo comentário no seu Pet cadastrado - #{@pet.name}! Acesse o site para verificar! #{path} ")
        end
    
        
        redirect_to @pet, :notice => "Comentário criado!"
    end

    private

    def comment_params
        params.require(:comment).permit(:from, :message)
    end
end
