document.addEventListener('DOMContentLoaded', () => {
    const publicaciones = [
        {
            logo: '../images/logo.jpg',
            titulo: 'Desarrollador front-end',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipisicing.',
            ubicacion: 'Ciudad de México, México',
            fecha: '12/06/2024',
            etiquetas: ['SQL', 'JavaScript', 'CSS', 'HTML', 'Python', 'React']
        },
        {
            logo: '../images/logo.jpg',
            titulo: 'Proyecto de análisis de datos',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipisicing.',
            ubicacion: 'Ciudad de México, México',
            fecha: '08/06/2024',
            etiquetas: ['Python', 'PowerBI', 'AWS', 'Matlab', 'R', 'Excel']
        },
        {
            logo: '../images/logo.jpg',
            titulo: 'Desarrollador Android Studio',
            descripcion: 'Lorem ipsum dolor sit amet, consectetur adipisicing.',
            ubicacion: 'Ciudad de México, México',
            fecha: '05/06/2024',
            etiquetas: ['Java', 'Android Studio', 'SQL', 'Kotlin']
        }
        
        
    ];

    const calcularDiasTranscurridos = (fecha) => {
        const [dia, mes, año] = fecha.split('/').map(Number);
        const fechaPublicacion = new Date(año, mes - 1, dia);
        const fechaActual = new Date();
        const diferenciaMilisegundos = fechaActual - fechaPublicacion;
        const diasTranscurridos = Math.floor(diferenciaMilisegundos / (1000 * 60 * 60 * 24));
        return diasTranscurridos;
    };

    const contenedorPublicaciones = document.getElementById('publicaciones');
    const plantillaPublicacion = document.getElementById('plantilla-publicacion').content;

    publicaciones.forEach(pub => {
        const clon = plantillaPublicacion.cloneNode(true);

        clon.querySelector('img').src = pub.logo;
        clon.querySelector('.card-title').textContent = pub.titulo;
        clon.querySelector('.card-text').textContent = pub.descripcion;
        clon.querySelector('.d-flex.align-items-center p').textContent = pub.ubicacion;

        const diasTranscurridos = calcularDiasTranscurridos(pub.fecha);
        clon.querySelector('.d-flex.align-items-center span').textContent = `Publicado hace ${diasTranscurridos} día(s)`;

        const etiquetasContenedor = clon.querySelector('.mt-3');
        pub.etiquetas.forEach(etiqueta => {
            const span = document.createElement('span');
            span.className = 'badge bg-secondary me-1';
            span.textContent = etiqueta;
            etiquetasContenedor.appendChild(span);
        });

        const botonSolicitar = clon.querySelector('.solicitar-colaborar');
        botonSolicitar.addEventListener('click', () => {
            alert(`La solicitud al proyecto ${pub.titulo} se realizó correctamente.`);
        });

        contenedorPublicaciones.appendChild(clon);
    });
});
