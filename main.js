const { animate, scroll } = Motion;

// Cargar la API de YouTube
var tag = document.createElement("script");
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;

function onYouTubeIframeAPIReady() {
  player = new YT.Player("video", {
    height: "1000",
    // 1. SOLUCIÓN: Pon un ID de video real aquí para que el reproductor se construya bien.
    // Puede ser el ID de tu primer tráiler.
    videoId: "5xH0HfJHsaY",
    playerVars: {
      autoplay: 0, // Empezamos en 0 para que no suene nada al entrar a la web
      mute: 0,
      loop: 1,
      showinfo: 0,
      controls: 0,
      rel: 0,
      modestbranding: 1,
      enablejsapi: 1,
      fs: 1,
    },
  });
}

const botonesPlay = document.querySelectorAll(".play-trailer");
const contenedorVideo = document.getElementById("container-video");

botonesPlay.forEach(function (btn) {
  btn.addEventListener("click", async function () {
    const idDelVideo = btn.getAttribute("data-video-id");

    if (idDelVideo) {
      // 1. Cargamos el vídeo en YouTube (pero en silencio/pausa)
      player.loadVideoById(idDelVideo);
      player.pauseVideo(); // Evitamos que suene antes de que acabe la animación

      // 2. Le añadimos la clase que lo pone en "falsa pantalla completa"
      contenedorVideo.classList.add("video-expandido");

      // 3. ANIMAMOS CON MOTION (ejemplo: aparece escalando y fundido a negro)
      // Usamos await para que JavaScript espere a que Motion termine de animar
      await animate(
        contenedorVideo,
        { opacity: [0, 1], scale: [0.8, 1] },
        { duration: 0.5, easing: "ease-out" },
      ).finished;

      // 4. Una vez que Motion ha terminado su magia, reproducimos el vídeo
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

function iniciarBarraProgreso() {
  // Le decimos que ejecute esta comprobación cada 100 milisegundos (muy rápido)
  actualizadorBarra = setInterval(function () {
    // Comprobamos que el reproductor existe y está reproduciendo (Estado 1)
    if (player && player.getPlayerState() === 1) {
      // Obtenemos el tiempo actual y la duración total
      const tiempoActual = player.getCurrentTime();
      const duracionTotal = player.getDuration();

      // Calculamos el porcentaje (ej: 50%)
      const porcentaje = (tiempoActual / duracionTotal) * 100;

      // Actualizamos el ancho de tu barra roja en el CSS
      document.getElementById("mi-progreso").style.width = porcentaje + "%";
    }
  }, 100);
}

// OJO: Recuerda llamar a esta función cuando el vídeo empiece a reproducirse.
// En tu evento de clic de Motion, justo debajo de player.playVideo(); pones:
// iniciarBarraProgreso();

// Seleccionamos el botón
const retroceder = document.getElementById("retroceder");

// Le añadimos la acción al hacer clic
retroceder.addEventListener("click", function () {
  // Comprobamos que el reproductor de YouTube esté cargado
  if (player) {
    // 1. Averiguamos en qué segundo exacto está el vídeo ahora mismo
    const segundoActual = player.getCurrentTime();

    // 2. Le decimos al reproductor que salte a ese tiempo + 5 segundos.
    // El 'true' final le dice a YouTube que puede cargar más video por adelantado si lo necesita.
    player.seekTo(segundoActual + 5, true);
    player.mute();
  }
});

// Seleccionamos el botón
const avanzar = document.getElementById("avanzar");

// Le añadimos la acción al hacer clic
avanzar.addEventListener("click", function () {
  // Comprobamos que el reproductor de YouTube esté cargado
  if (player) {
    // 1. Averiguamos en qué segundo exacto está el vídeo ahora mismo
    const segundoActual = player.getCurrentTime();

    // 2. Le decimos al reproductor que salte a ese tiempo + 5 segundos.
    // El 'true' final le dice a YouTube que puede cargar más video por adelantado si lo necesita.
    player.seekTo(segundoActual + 5, true);
  }
});

const exploraTitle = document.getElementById("explora-title");
let containerPosX = "";

const swipers = document.querySelectorAll(".swiper");

swipers.forEach((swiperEl) => {
  let containerPosX = exploraTitle.getBoundingClientRect().left - 16;

  new Swiper(swiperEl, {
    slidesPerView: "auto",
    spaceBetween: 30,
    slidesOffsetBefore: containerPosX,
    navigation: {
      nextEl: swiperEl.querySelector(".swiper-button-next"),
      prevEl: swiperEl.querySelector(".swiper-button-prev"),
      addIcons: false,
    },
  });
});

console.log(containerPosX);
