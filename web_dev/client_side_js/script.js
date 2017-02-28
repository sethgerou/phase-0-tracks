var h2els = document.getElementsByTagName("h2")

for (i=0; i < h2els.length; i++) {h2els[i].style.border="3px solid red"};

function changeFont(event) {
  event.target.style.fontFamily="Courier";
  event.target.style.fontSize="3em";
}

var pEls = document.getElementsByTagName("p");
pEls[0].addEventListener("click", changeFont);
