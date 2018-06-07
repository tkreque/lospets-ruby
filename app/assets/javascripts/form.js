// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

// (function() {
//   this.App || (this.App = {});
//   $(document).ready(function() {
//     var input = $('input');
     
//      input.on('blur',function(){
//       var that = $(this);
//       if ($(this).val() != "" ){
//          that.addClass('filledIn');
//       } else {
//          that.removeClass('filledIn');
//       }
//      })
//   })

// }).call(this);


$(document).on('ready',function(){
    

(function() {
  this.App || (this.App = {});
  
 
 
 this.App.form = {
     
     init : function () {
        //  console.log('1234')
        //  console.log(document.querySelectorAll("body"))
        //  console.log($('input'))
        //  console.log(document.querySelectorAll("body"))
        var input = $(input);
         this.bindEvents();
         
     },
     
     bindEvents : function(){
         console.log("on bindEvents")
         input.on('blur', this.handleOnBlur);
     },
     
     
    //     var modal_trigger = document.querySelectorAll("[data-modal]");
    //   for (i = 0; i < modal_trigger.length; i++) {
    //     var target = "#" + modal_trigger[i].getAttribute("data-modal");
    //     modal_trigger[i].addEventListener("mousedown", () => module.exports.modal.open ( target ))
    //   }
     
     
     handleOnBlur : function(event) {
         console.log("handleOnBlur")
         console.log(event);
     }
     
    
 }
  
  this.App.form.init();
}).call(this);

})