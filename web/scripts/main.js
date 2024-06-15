/* Variable para almacenar el formulario de inicio de sesión */
const controlForm = document.querySelector('#form-login');

/* Datos de inicio de sesión enviados por el usuario */
const correoIngresado = document.querySelector('#correoUsuario');
const contraseniaIngresada = document.querySelector('#contraseniaUsuario');

/* Variable para el mensaje de error */
const mensajeError = document.querySelectorAll('.mensaje-error');

/* Expresiones regulares para validar las entradas */
const regexCorreo = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
/* 8 a 12 carácteres con al menos una letra minúscula, una mayúscula, un número y un carácter especial */
const regexContrasenia = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/

/* Validación del formulario */
controlForm.addEventListener('submit', (formulario) => {
  formulario.preventDefault();  /* Detiene el envio del formulario para poder validar */

    console.log("correo " + !regexCorreo.test(correoIngresado.value))
  if(!regexCorreo.test(correoIngresado.value)){
    mostrarError(mensajeError[0], true);
  }else{
    mostrarError(mensajeError[0], false);
  }

    /*console.log("pass " + !regexContrasenia.test(contraseniaIngresada.value))
  if(!regexContrasenia.test(contraseniaIngresada.value)){
    mostrarError(mensajeError[1], true);
  }else{
    mostrarError(mensajeError[1], false);
  }*/
});

/* Función para mostrar el mensaje de error */
function mostrarError(elemento, valor){
  valor == true ? elemento.style.display = 'list-item' : elemento.style.display = 'none';
  return;
}