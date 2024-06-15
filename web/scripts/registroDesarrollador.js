/* Control del calendario a mostrar cuando el usuario seleccionará su fecha de nacimiento.
   El dia actual debe ser la máxima fecha posible */
const controlFecha = document.querySelector('#fechaNacimientoUsuario');

/* Obtiene la fecha local (mx) en el formato 'AAAA/MM/DD' */
let fechaActual = new Date().toLocaleDateString('es-MX', {year: 'numeric', month: '2-digit', day: '2-digit'});

/* Crea al atriburo 'max' para un 'input[type="date"]' y permite fijar la fecha de nacimiento
   máxima que puede seleccionar un usuario */
controlFecha.setAttribute('max', formatoFecha(fechaActual));

/* Dada una fecha, la formatea */
function formatoFecha(fecha){
  /* Divide la fecha recibida cada que encuentra el delimitador '/' */
  let fechaDividida = fecha.split('/');

  /* Crea una cadena con la fecha en el formato 'AAAA-MM-DD' y la retorna */
  let fechaConFormato = `${fechaDividida[2]}-${fechaDividida[1]}-${fechaDividida[0]}`;
  return fechaConFormato;
}

/* Validación del formulario de registro */
const controlFormulario = document.querySelector('#formulario-desarrollador');

/* Entradas del usuario */
const nombre = document.querySelector('#nombreUsuario');
const apellidos = document.querySelector('#apellidosUsuario');
const correo = document.querySelector('#correoUsuario');
const contrasenia = document.querySelector('#contraseniaUsuario');
const nacimiento = document.querySelector('#fechaNacimientoUsuario');
const nickname = document.querySelector('#nicknameUsuario');

/* Mensajes de error cuando un campo no cumple con lo esperado. */
const mensajeError = document.querySelectorAll('.mensaje-error');

/* Expresiones regulares para validar los campos */
/* ^(?=.{1,50}$): Condición que la cadena final debe cumplir (máximo 50 carácteres sin cadenas vacias).
   [a-zA-Z]+(?:\s[a-zA-Z]+)*$: La cadena debe iniciar con una o más letras seguidas de un grupo de no
     captura (no se toma en cuenta para el resultado) que indica que puede haber un espacio seguido de
     más letras (al menos una) y esto se puede repetir 0 o más veces siempre que la cadena termine
     con un carácter y no con un espacio. */
const regexNombre = /^(?=.{1,60}$)[a-zA-ZáéíóúÁÉÍÓÚñÑ]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚ]+)*$/
const regexApellidos = /^(?=.{1,60}$)[a-zA-ZáéíóúÁÉÍÓÚñÑ]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚ]+)*$/
const regexCorreo = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
const regexContrasenia = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/
/* Letras seguidas de guiones bajos y/o números */
const regexNickname = /^(?=.{1,45}$)[a-zA-ZáéíóúÁÉÍÓÚñÑ_0-9]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚ_0-9]+)*$/

/* Validación de los campos antes de enviar el formulario */
controlFormulario.addEventListener('submit', (formulario) => {
  formulario.preventDefault(); // Cancela el envio del formulario

  /* Validación del nombre */
  if(!regexNombre.test(nombre.value)){
    mostrarError(mensajeError[0], true);
  }else {
    mostrarError(mensajeError[0], false);
  }

  /* Validación de los apellidos */
  if(!regexApellidos.test(apellidos.value)){
    mostrarError(mensajeError[1], true);
  }else { 
    mostrarError(mensajeError[1], false);
  }

  /* Validación del correo electrónico */
  if(!regexCorreo.test(correo.value)){
    mostrarError(mensajeError[2], true);
  }else {
    
    mostrarError(mensajeError[2], false);
  }

  /* Validación de la contraseña */
  if(!regexContrasenia.test(contrasenia.value)){
    mostrarError(mensajeError[3], true);
  }else {    
    mostrarError(mensajeError[3], false);
  }

  /* Validación de la fecha de nacimiento */
  if(nacimiento.value === ''){
    mostrarError(mensajeError[4], true);
  }else {  
    mostrarError(mensajeError[4], false);
  }

  /* Validación del nombre de usuario (nickname) */
  if(!regexNickname.test(nickname.value)){
    mostrarError(mensajeError[5], true);
  }else {  
    mostrarError(mensajeError[5], false);
  }
});

/* Función para mostrar el mensaje de error */
function mostrarError(elemento, valor){
  valor == true ? elemento.style.display = 'block' : elemento.style.display = 'none';
  return;
}