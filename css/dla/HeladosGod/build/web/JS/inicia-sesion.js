function ingresar(){
    var perfil=document.formulario.usuario.value;
    var contra=parseInt(document.formulario.contraseña.value);

    var perfil=perfil.toUpperCase();

    // console.log(perfil);
    // console.log(contra);

    if(perfil=="USUARIO" & contra==1234){
        window.location.href="bienveniso-usuario.html";

    }
        else if(perfil=="ADMIN" & contra==1234){
            window.location.href="bienvenido-admin.html";
        }


}