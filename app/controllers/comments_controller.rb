class CommentsController < ApplicationController
    
    def create
        @pet = Pet.find(params[:pet_id])
        @comment = @pet.comments.new(comment_params)
        
        respond_to do |format|
            if verify_recaptcha(model: @comment) && @comment.save
                if @pet.user.notify_email
                    ses = Aws::SES::Client.new(
                        region: 'us-east-1', 
                        access_key_id: ENV['AWS_ACCESS_KEY'], 
                        secret_access_key: ENV['AWS_SECRET_KEY']
                    )
                    
                    html = 
                        "<img src='https://s3.amazonaws.com/lospets-files/img/lospets_logo.png' class='roundedImage' />"\
                        "<h1>Olá #{@pet.user.name}</h1>"\
                        "<br />"\
                        "<p>"\
                        "Você tem um novo comentário no seu Pet cadastrado - #{@pet.name}!<br />"\
                        "Vá até o site para verificar!<br />"\
                        "<a href='#{pet_url(@pet)}'>LosPets - Meu Pet</a>"\
                        "<\p>"
                        
                    txt =
                        "Olá #{@pet.user.name},"\
                        ""\
                        "Você tem um novo comentário no seu Pet cadastrado - #{@pet.name}!"\
                        "Vá até o site para verificar!"\
                        "#{pet_url(@pet)}"
                        
                   ses.send_email({
                        destination: { to_addresses: ["#{@pet.user.email}"], cc_addresses: [], bcc_addresses: [], },
                        message: {
                            subject: { charset: "UTF-8", data: "LosPets - Notificação de Comentário"},
                            body: {
                                text: {charset: "UTF-8", data: txt },
                                html: {charset: "UTF-8", data: html },
                            },
                        },
                        source: "noreply@los-pets.com",
                        
                    })
                    # PetMailer.email(@pet).deliver //old
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
