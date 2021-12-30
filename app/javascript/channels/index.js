// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.onload=function(){
  var scroll = document.querySelectorAll('.up');
   
  var Animation = function() {
    for(var i = 0; i < scroll.length; i++) {
    var triggerMargin = 80;
    if (window.innerHeight > scroll[i].getBoundingClientRect().top + triggerMargin) {
    scroll[i].classList.add('show');
    }
    }
    }
    window.addEventListener('scroll', Animation);
  
}  