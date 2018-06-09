(function() {
    this.App || (this.App = {});

    var input;

    this.App.form = {

        init : function () {
            input = $('input') ;
            form = $(".form");
            this.bindEvents();
            this.checkOnLoad()
        },

        bindEvents : function(){
            input.on('blur', this.handleOnBlur);
            // form.on('submit', this.handleOnSubmit)
        },
        checkOnLoad : function() {
            input.each(function(){
                var that = $(this);
                if (that.val() != "" ){
                  that.addClass('filledIn');
                } else {
                    that.removeClass('filledIn')
                }
                      
            })    
        },
        
        handleOnBlur : function(event) {
            var that  = $(event.target);

            if (that.val() != "" ){
                that.addClass('filledIn');
                that.parent().removeClass('error')

                // Validando se o email é valido
                if (that.attr('id') == 'user_email') {
                    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                    if ( !emailReg.test( that.val() )) {
                        that.siblings('.msg').text("O email informado é inválido")
                        that.parent().addClass('error')         
                    } else {
                        that.parent().removeClass('error')          
                    }
                }
                
                //verificando se a senha tem ao menos 6 caracteres
                if (that.attr('id') == 'user_password') {
                    if (that.val().length < 6) {
                        that.siblings('.msg').text("A senha precisa ter, no mínimo, 6 caractéres")
                        that.parent().addClass('error')         
                    } else {
                        that.parent().removeClass('error')          
                    }

                }
                
                //validando se as senhas são iguais
                if (that.attr('id') == 'user_password_confirmation') {
                    if (that.val() != $('#user_password').val()) {
                        that.siblings('.msg').text("As senhas não conferem")
                        that.parent().addClass('error')     
                    } else {
                        that.parent().removeClass('error')
                    }
                    
                }
                
                
                

            } else {
                that.removeClass('filledIn');
                that.siblings('.msg').text("Este campo é obrigatório")
                that.parent().addClass('error')
            }
        },
        
        handleOnSubmit : function(event) {
            event.preventDefault();
            if ($('.field.error').length < 1) {
                form.submit();
            }
        }
    }
}).call(this);

