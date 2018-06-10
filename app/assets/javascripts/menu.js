// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});
  var menuBtn, menu, filterButton, filterWrap, profileAcess,userMenu;
  
  this.App.menu = {
    init: function() {
       menuBtn = $('.menu-for-mobile, .menu-for-mobile + .overlay');
       menu = $('.navegationMenu');
       filterButton = $('.filterButton');
       filterWrap = $('.mapsFilters');
       profileAccess = $('.profile-access');
       userMenu = $(".loginMenu");    
       this.bindEvents();
    },
    
    bindEvents : function() {
      menuBtn.on('click',function(){
        menu.toggleClass('menu-open')
      })
    
      filterButton.on('click',function(){
        filterWrap.toggleClass('filter-open')
      })
    
      profileAccess.on('click', function() {
        userMenu.toggleClass('open')
      })
    }
  }
  
}).call(this);
