class CommentsController < ApplicationController
    
    def create
        @pet = Pet.find(params[:pet_id])
        @comment = @pet.comments.new(comment_params)
        
        respond_to do |format|
            if verify_recaptcha(model: @comment) && @comment.save
                if @pet.user.notify_email
                    PetMailer.email(@pet).deliver
                end
                if @pet.user.cellphone && @pet.user.notify_cellphone
                    path = polymorphic_url(@pet)
                    cell = @pet.user.cellphone
                    
                    cell = "55"+cell.tr(' ()-','')
                    
                    sns = Aws::SNS::Client.new(
                        region: 'us-east-1', 
                        access_key_id: ENV['AWS_ACCESS_KEY'], 
                        secret_access_key: ENV['AWS_SECRET_KEY']
                    )
                    sns.publish(
                        phone_number: "#{cell}", 
                        message: "Você tem um novo comentário no seu Pet cadastrado - #{@pet.name}! Acesse o site para verificar! #{path} ")
                end
                format.html { redirect_to @pet, notice: 'Comentário adicionado!' }
                format.json { render :show, status: :created, location: @pet }
            else
                format.html { redirect_to @pet, notice: 'Comentário não adicionado! Verifique o Captcha'  }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:from, :message)
    end
end
