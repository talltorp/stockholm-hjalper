$(document).ready(function() {
  var menuToggle = $('#js-mobile-menu').unbind();
  $('#js-navigation-menu').removeClass("show");

  menuToggle.on('click', function(e) {
    var jsNavigationMenu = $('#js-navigation-menu');
    e.preventDefault();

    jsNavigationMenu.slideToggle(function(){
      if(jsNavigationMenu.is(':hidden')) {
        jsNavigationMenu.removeAttr('style');
      }
    });
  });
});
