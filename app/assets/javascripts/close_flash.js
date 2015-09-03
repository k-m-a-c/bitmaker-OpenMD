$(document).on('ready', function(){

  // close flash notice on click via fadeToggle
  var flash = $('p.notice');
  var closeFlashBtn = $('span#close-flash');

  closeFlashBtn.on('click', function(){
    flash.fadeToggle('fast', 'linear');
  });
});