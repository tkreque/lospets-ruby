// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});
  
  
  
  $(document).ready(function() {
    var menuBtn = $('.menu-for-mobile, .menu-for-mobile + .overlay');
    var menu = $('.navegationMenu');
    var filterButton = $('.filterButton');
    var filterWrap = $('.mapsFilters');
    var profileAccess = $('.profile-access');
    var userMenu = $(".loginMenu");
    
    menuBtn.on('click',function(){
      menu.toggleClass('menu-open')
    })
    
     filterButton.on('click',function(){
       filterWrap.toggleClass('filter-open')
    })
    
    profileAccess.on('click', function() {
        userMenu.toggleClass('open')
    })
    
    
  })
  

}).call(this);
