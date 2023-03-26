//copyright
var lien = document.getElementById("github")

lien.addEventListener("mouseover", function() {
    lien.style.color = "red";
});

lien.addEventListener("mouseout", function(){
    lien.style.color = "";
});
//audio
$(document).keydown(function(e) {
  if (e.keyCode == 32) { // Si la touche appuyée est la barre d'espace
      $('#myAudio').get(0).pause(); // Arrêter la musique
  }
});

var audio = document.getElementsByTagName("audio")[0];
audio.volume = 0.3;