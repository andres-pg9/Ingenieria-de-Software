/* Control del formato del archivo a validar */
const controlArchivo = document.querySelector('#archivoValidarEmpresa');
controlArchivo.setAttribute('accept', '.pdf');

   
/* Validación del formulario de registro */
const controlFormulario = document.querySelector('#formulario-empresa');
   
/* Entradas del usuario */
const razon = document.querySelector('#razonSocialEmpresa');
const correo = document.querySelector('#correoEmpresa');
const contrasenia = document.querySelector('#contraseniaEmpresa');
const archivo = document.querySelector('#archivoValidarEmpresa');
   
/* Mensajes de error cuando un campo no cumple con lo esperado. */
const mensajeError = document.querySelectorAll('.mensaje-error');
   
/* Expresiones regulares para validar los campos */
const regexRazon = /^(?=.{1,45}$)[a-zA-ZáéíóúÁÉÍÓÚñÑ.0-9]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚ.0-9]+)*$/
const regexCorreo = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
const regexContrasenia = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/

   
/* Validación de los campos antes de enviar el formulario */
controlFormulario.addEventListener('submit', (formulario) => {
  formulario.preventDefault(); // Cancela el envio del formulario
   
  /* Validación de la razón social */
  if(!regexRazon.test(razon.value)){
    mostrarError(mensajeError[0], true);
  }else {
    mostrarError(mensajeError[0], false);
  }

  /* Validación del correo electrónico */
  if(!regexCorreo.test(correo.value)){
    mostrarError(mensajeError[1], true);
  }else {  
    mostrarError(mensajeError[1], false);
  }
   
  /* Validación de la contraseña */
  if(!regexContrasenia.test(contrasenia.value)){
    mostrarError(mensajeError[2], true);
  }else {    
    mostrarError(mensajeError[2], false);
  }

   
  /* Validación del archivo */
  if(archivo.value == ''){
    mostrarError(mensajeError[3], true);
  }else {  
    mostrarError(mensajeError[3], false);
  }
});
   
/* Función para mostrar el mensaje de error */
function mostrarError(elemento, valor){
  valor == true ? elemento.style.display = 'block' : elemento.style.display = 'none';
  return;
}