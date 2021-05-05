const botonMenu=document.querySelector(".menu_boton_bars");
const menu=document.querySelector(".cabeza-bottom");

botonMenu.addEventListener("click", function(){
  menu.classList.toggle("mostrar")
})

