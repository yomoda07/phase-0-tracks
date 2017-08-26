console.log("The script is running!");

function addBrownBorder(event) {
  console.log(event);
  event.target.style.border = "2px dotted brown";
  event.target.style.padding = "3px";
}

var photo = document.getElementById('Latte');
photo.addEventListener("click", addBrownBorder);

var para = document.createElement("p");
var node = document.createTextNode("The worst type of criminal is he who mugs other people's coffee.");
para.appendChild(node);
para.style.textAlign = "center";

var element = document.getElementById("content");
element.appendChild(para);
