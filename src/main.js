const { animate } = Motion;

// Cargar la API de YouTube
var tag = document.createElement("script");
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;

function onYouTubeIframeAPIReady() {
  player = new YT.Player("video", {
    height: "1000",
    // Este primer ID es para la correcta construcción del reproductor
    videoId: "5xH0HfJHsaY",
    playerVars: {
      autoplay: 0,
      loop: 1,
      showinfo: 0,
      controls: 0,
      rel: 0,
      modestbranding: 1,
      enablejsapi: 1,
      fs: 1,
    },
    // Evento con la API para llamar a la función final(event) y cerrar el video cuando finalice
    events: {
      onStateChange: final,
    },
  });
}

const botonesPlay = document.querySelectorAll(".play-trailer");
const contenedorVideo = document.getElementById("container-video");

botonesPlay.forEach(function (btn) {
  btn.addEventListener("click", async function () {
    const idDelVideo = btn.getAttribute("data-video-id");

    if (idDelVideo) {
      // Se carga el video en silencio
      player.loadVideoById(idDelVideo);
      player.pauseVideo(); // Se evita que se reproduzca antes de verse a pantalla completa

      // Se le añade la clase que lo pone en "falsa pantalla completa"
      contenedorVideo.classList.add("video-expandido");

      // MOTION
      // Se usa await para que JavaScript espere a que Motion termine de animar
      await animate(
        contenedorVideo,
        { opacity: [0, 1], scale: [0.8, 1] },
        { duration: 0.5, easing: "ease-out" },
      ).finished;

      // Cuando ha acabado la animacion de MOTION empieza el video
      player.playVideo();
      iniciarBarraProgreso();
      document.body.style.overflow = "hidden";
    }
  });
});

function volver() {
  contenedorVideo.classList.remove("video-expandido");
  player.pauseVideo();
  document.getElementById("mi-progreso").style.width = 0;
  document.body.style.overflow = "scroll";
}

function final(event) {
  if (event.data == YT.PlayerState.ENDED) {
    volver();
  }
}

function iniciarBarraProgreso() {
  // Se comprueba la barra cada 100mls
  actualizadorBarra = setInterval(function () {
    // Se comprueba que el reproductor existe y está reproduciendo (Estado 1)
    if (player && player.getPlayerState() === 1) {
      // Obtenemos el tiempo actual y la duración total
      const tiempoActual = player.getCurrentTime();
      const duracionTotal = player.getDuration();

      // Se calcula el porcentaje (ej: 50%)
      const porcentaje = (tiempoActual / duracionTotal) * 100;

      // Se actualiza el ancho de la barra de progreso
      document.getElementById("mi-progreso").style.width = porcentaje + "%";
    }
  }, 100);
}

// Llamar a la funcion iniciarBarraProgreso() cuando se repoduzca el video

// Selecciono el botón
const retroceder = document.getElementById("retroceder");

// Añado acción al hacer clic
retroceder.addEventListener("click", function () {
  // El repoductor de YT está cargando?
  if (player) {
    // 1. Segundo exacto del video
    const segundoActual = player.getCurrentTime();

    // 2. Ordenamos al reproductor que avance 5 segundos
    // El 'true' final le dice a YT que puede cargar más video por adelantado si lo necesita
    player.seekTo(segundoActual - 5, true);
  }
});

const avanzar = document.getElementById("avanzar");

avanzar.addEventListener("click", function () {
  if (player) {
    const segundoActual = player.getCurrentTime();
    player.seekTo(segundoActual + 5, true);
  }
});

function toggleMute() {
  if (player.isMuted()) {
    player.unMute();
    mute.style.color = "var(--color-destacado)";
  } else {
    player.mute();
    mute.style.color = "red";
  }
}

const mute = document.getElementById("mute");

mute.addEventListener("click", function () {
  if (player) {
    toggleMute();
  }
});

const exploraTitle = document.getElementById("explora-title");
let containerPosX = "";

let offsetCalculado = exploraTitle ? exploraTitle.getBoundingClientRect().left - 16 : 0;

const swipers = document.querySelectorAll(".swiper:not(.mySwiperCategorias)");

swipers.forEach((swiperEl) => {
  new Swiper(swiperEl, {
    slidesPerView: "auto",
    spaceBetween: 30,
    slidesOffsetBefore: offsetCalculado,
    navigation: {
      nextEl: swiperEl.querySelector(".swiper-button-next"),
      prevEl: swiperEl.querySelector(".swiper-button-prev"),
      addIcons: false,
    },
    freeMode: {
      enabled: true,
      sticky: true,
    },
  });
});

console.log(containerPosX);

document.addEventListener("DOMContentLoaded", () => {
  // Se inicia el nuevo Swiper de categorías
  const swiperCategorias = new Swiper(".mySwiperCategorias", {
    slidesPerView: "auto",
    spaceBetween: 30,
    slidesOffsetBefore: offsetCalculado,
    navigation: {
      nextEl: ".mySwiperCategorias .swiper-button-next",
      prevEl: ".mySwiperCategorias .swiper-button-prev",
      addIcons: false,
    },
    freeMode: {
      enabled: true,
      sticky: true,
    },
    // Estas dos opciones son vitales para que Swiper no se rompa al ocultar elementos con JS
    observer: true,
    observeParents: true,
  });

  // Botones de categorias
  const botones = document.querySelectorAll(".btn-filtro");
  const slides = document.querySelectorAll(".mySwiperCategorias .swiper-slide");

  botones.forEach((boton) => {
    boton.addEventListener("click", () => {
      // Se le quita la clase "activo" a todos los botones y se le pone al que se le hace click
      botones.forEach((b) => b.classList.remove("activo"));
      boton.classList.add("activo");

      // Qué categoría quiere ver el usuario?
      const categoriaSeleccionada = boton.getAttribute("data-cat");

      // Se recorren todas las tarjetas de esta sección
      slides.forEach((slide) => {
        const generoTarjeta = slide.getAttribute("data-genre");

        if (generoTarjeta === categoriaSeleccionada) {
          slide.style.display = ""; // Se muestra
        } else {
          slide.style.display = "none"; // Se oculta
        }
      });

      // Que Swiper que recalcule sus espacios se quitaron/pusieron elementos
      swiperCategorias.update();
      swiperCategorias.slideTo(0); // Volver al inicio del carrusel
    });
  });
});
