var lien = document.getElementById("github")

lien.addEventListener("mouseover", function() {
    lien.style.color = "red";
});

lien.addEventListener("mouseout", function(){
    lien.style.color = "";
});