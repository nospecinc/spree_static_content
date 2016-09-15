
var wymopts = {
        skin: 'compact',
        basePath: "/", 
        wymPath: '/assets/spree/backend/jquery.wymeditor.js', 
        cssSkinPath: '/assets/wymeditor/skins/',
        jsSkinPath: '/assets/wymeditor/skins/',
        iframeBasePath: '/assets/wymeditor/iframe/default/'
      };

var wymeditor_boot_options = $.extend(wymopts);

/*
  Thought wmeditor should be doing this on it's own, but we need to load
  the stylesheet for the configured skin.
*/
var cssFile = wymopts.cssSkinPath + wymopts.skin + '/skin.css';
$(document).ready(function(){
  $('head').append('<link rel="stylesheet" type="text/css" href="'+cssFile+'">');
  $('form.edit_page button[type=submit]').addClass('wymupdate')
  $('#page_body').wymeditor(wymeditor_boot_options);
});