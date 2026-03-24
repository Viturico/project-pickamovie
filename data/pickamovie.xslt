<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>PICKaMOVIE</title>
                <link rel="icon" type="image/svg+xml" href="../assets/img/favicon.svg" />
                <link rel="apple-touch-icon" sizes="180x180" href="../assets/img/apple-touch-icon.png" />
                <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />
                <link rel="stylesheet" href="../css/global.css" />

            </head>
            <body>
                <header>
                    <div class="container">
                        <logo-movie>
                            <i class="icon-claqueta"></i><h1>PICKaMOVIE</h1>
                        </logo-movie>
                        <nav id="menu" class="menu">
                            <ul>
                                <li><a href="#intro">Inicio</a></li>
                                <li><a href="#explora">Selección</a></li>
                                <li><a href="#generos">Géneros</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
                <main>
                    <section id="intro">
                        <div class="container">
                            <pick-intro class="intro">
                                <h2>Descubre Tu Próxima<br/>Película <span>Favorita</span></h2>
                                <p>
                                    Una selección de recomendaciones cinematográficas para todos lo gustos. Desde joyas del cine independiente hasta grandes éxitos de taquilla.
                                </p>
                                <div class="explora-button"><a href="#explora">Explora</a></div>
                            </pick-intro>
                        </div>
                    </section>
                    <section id="explora" data-aos="fade-up">
                        <div class="container">
                            <h3 id="explora-title">El crítico las vio (algunas contra su voluntad)</h3>
                            <p class="subtitle">Muchas le gustaron y otras desearía no haberlas visto.</p>
                        </div>
                        <div class="container">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <!-- Selección de todas las películas -->
                                    <xsl:for-each select="/movies/movie">
                                        <article class="swiper-slide card">
                                            <nuestra-puntuacion>
                                                <div class="estrella">
                                                    <!-- De esta forma cargo un símbolo svg -->
                                                    <svg>
                                                        <use href="../assets/img/icons.svg#star"></use>
                                                    </svg>
                                                </div>
                                                <p class="puntuacion"><xsl:value-of select="rating"></xsl:value-of></p>
                                            </nuestra-puntuacion>
                                            <div class="poster">
                                                <!-- De esta forma se llama a un atributo XML '@' y a un elemento desde un atributo HTML -->
                                                <img src="{@poster}" alt="{title}" />
                                            </div>
                                            <div class="data">
                                                <div>
                                                    <h4 class="movie-title"><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
                                                    <p class="truncar"><xsl:value-of select="summary"/></p>
                                                </div>
                                                <div class="cast">
                                                    <div>
                                                        <h5>Director</h5>
                                                        <p><span><xsl:value-of select="director"/>.</span></p>
                                                    </div>
                                                    <div>
                                                        <h5>Casting</h5>
                                                        <p>
                                                            <xsl:for-each select="actor">
                                                                <xsl:value-of select="."/>
                                                                <xsl:if test="position() != last()">, </xsl:if>
                                                                <xsl:if test="position() = last()">.</xsl:if>
                                                            </xsl:for-each>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Guión</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="script">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                    <xsl:if test="position() = last()">.</xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Fotografía / Música</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="photo">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                                /
                                                                <xsl:for-each select="music">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <ver-trailer class="play-trailer" data-video-id="{ytId}"><i class="icon-play"></i><span>Play </span>Trailer</ver-trailer>
                                                </div>
                                            </div>
                                        </article>
                                    </xsl:for-each>

                                </div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next">
                                    <svg>
                                        <use href="../assets/img/icons.svg#right"></use>
                                    </svg>
                                </div>
                                <div class="swiper-button-prev">
                                    <svg>
                                        <use href="../assets/img/icons.svg#left"></use>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="obras-maestras" data-aos="fade-up">
                        <div class="container">
                            <h3 id="explora-title">Obras maestras (si lo dice él...)</h3>
                            <p class="subtitle">Las favoritas de nuestro crítico más incorformista.</p>
                        </div>
                        <div class="container">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <!-- Selección de las películas con una puntuación >= 8 + orden descendente -->
                                    <xsl:for-each select="/movies/movie[rating >= 8]">
                                        <xsl:sort select="rating" order="descending" data-type="number" />
                                        <article class="swiper-slide card">
                                            <nuestra-puntuacion>
                                                <div class="estrella">
                                                    <svg>
                                                        <use href="../assets/img/icons.svg#star"></use>
                                                    </svg>
                                                </div>
                                                <p class="puntuacion"><xsl:value-of select="rating"></xsl:value-of></p>
                                            </nuestra-puntuacion>
                                            <div class="poster">
                                                <img src="{@poster}" alt="{title}" />
                                            </div>
                                            <div class="data">
                                                <div>
                                                    <h4 class="movie-title"><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
                                                    <p class="truncar"><xsl:value-of select="summary"/></p>
                                                </div>
                                                <div class="cast">
                                                    <div>
                                                        <h5>Director</h5>
                                                        <p><span><xsl:value-of select="director"/>.</span></p>
                                                    </div>
                                                    <div>
                                                        <h5>Casting</h5>
                                                        <p>
                                                            <xsl:for-each select="actor">
                                                                <xsl:value-of select="."/>
                                                                <!-- Condicionales if para colocar , ó . -->
                                                                <xsl:if test="position() != last()">, </xsl:if>
                                                                <xsl:if test="position() = last()">.</xsl:if>
                                                            </xsl:for-each>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Guión</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="script">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                    <xsl:if test="position() = last()">.</xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Fotografía / Música</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="photo">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                                /
                                                                <xsl:for-each select="music">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <ver-trailer class="play-trailer" data-video-id="{ytId}"><i class="icon-play"></i><span>Play </span>Trailer</ver-trailer>
                                                </div>
                                            </div>
                                        </article>
                                    </xsl:for-each>
                                </div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next">
                                    <svg>
                                        <use href="../assets/img/icons.svg#right"></use>
                                    </svg>
                                </div>
                                <div class="swiper-button-prev">
                                    <svg>
                                        <use href="../assets/img/icons.svg#left"></use>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="novedades" data-aos="fade-up">
                        <div class="container">
                            <h3>Novedades</h3>
                            <p class="subtitle">Las úlitmas novedades en cartelera.</p>
                        </div>
                        <div class="container">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <!-- Selección de las 15 últimas películas mas recientes -->
                                    <xsl:for-each select="/movies/movie">
                                        <xsl:sort select="year" order="descending" data-type="number"/>
                                        <xsl:if test="position() &lt;= 15">
                                            <article class="swiper-slide card">
                                                <nuestra-puntuacion>
                                                    <div class="estrella">
                                                        <svg>
                                                            <use href="../assets/img/icons.svg#star"></use>
                                                        </svg>
                                                    </div>
                                                    <p class="puntuacion"><xsl:value-of select="rating"></xsl:value-of></p>
                                                </nuestra-puntuacion>
                                                <div class="poster">
                                                    <img src="{@poster}" alt="{title}" />
                                                </div>
                                                <div class="data">
                                                    <div>
                                                        <h4 class="movie-title"><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
                                                        <p class="truncar"><xsl:value-of select="summary"/></p>
                                                    </div>
                                                    <div class="cast">
                                                        <div>
                                                            <h5>Director</h5>
                                                            <p><span><xsl:value-of select="director"/>.</span></p>
                                                        </div>
                                                        <div>
                                                            <h5>Casting</h5>
                                                            <p>
                                                                <xsl:for-each select="actor">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                    <xsl:if test="position() = last()">.</xsl:if>
                                                                </xsl:for-each>
                                                            </p>
                                                        </div>
                                                        <div>
                                                            <h5>Guión</h5>
                                                            <p>
                                                                <span>
                                                                    <xsl:for-each select="script">
                                                                        <xsl:value-of select="."/>
                                                                        <xsl:if test="position() != last()">, </xsl:if>
                                                                        <xsl:if test="position() = last()">.</xsl:if>
                                                                    </xsl:for-each>
                                                                </span>
                                                            </p>
                                                        </div>
                                                        <div>
                                                            <h5>Fotografía / Música</h5>
                                                            <p>
                                                                <span>
                                                                    <xsl:for-each select="photo">
                                                                        <xsl:value-of select="."/>
                                                                        <xsl:if test="position() != last()">, </xsl:if>
                                                                    </xsl:for-each>
                                                                    /
                                                                    <xsl:for-each select="music">
                                                                        <xsl:value-of select="."/>
                                                                        <xsl:if test="position() != last()">, </xsl:if>
                                                                    </xsl:for-each>
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <!-- De esta forma se llama a un elemento desde un atributo HTML -->
                                                        <ver-trailer class="play-trailer" data-video-id="{ytId}"><i class="icon-play"></i><span>Play </span>Trailer</ver-trailer>
                                                    </div>
                                                </div>
                                            </article>
                                        </xsl:if>
                                    </xsl:for-each>

                                </div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next">
                                    <svg>
                                        <use href="../assets/img/icons.svg#right"></use>
                                    </svg>
                                </div>
                                <div class="swiper-button-prev">
                                    <svg>
                                        <use href="../assets/img/icons.svg#left"></use>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="generos" data-aos="fade-up">
                        <div class="container">
                            <h3>Explora por Géneros</h3>
                            <p class="subtitle">Encuentra exactamente lo que te apetece ver hoy.</p>

                            <div class="filtros-container" style="margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap;">
                                <button class="btn-filtro" data-cat="Acción">Acción</button>
                                <button class="btn-filtro" data-cat="Comedia">Comedia</button>
                                <button class="btn-filtro" data-cat="Drama">Drama</button>
                                <button class="btn-filtro" data-cat="Terror">Terror</button>
                                <button class="btn-filtro" data-cat="Ciencia Ficción">Ciencia Ficción</button>
                                <button class="btn-filtro" data-cat="Romance">Romance</button>
                                <button class="btn-filtro activo" data-cat="Animación">Animación</button>
                                <button class="btn-filtro" data-cat="Suspense">Suspense</button>
                                <button class="btn-filtro" data-cat="Bélica">Bélica</button>
                            </div>
                        </div>

                        <div class="container">
                            <div class="swiper mySwiperCategorias">
                                <div class="swiper-wrapper">

                                    <xsl:for-each select="/movies/movie">
                                        <article class="swiper-slide card" data-genre="{genre}">
                                            <xsl:attribute name="data-genre">
                                                <xsl:for-each select="genre">
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                </xsl:for-each>
                                            </xsl:attribute>

                                            <nuestra-puntuacion>
                                                <div class="estrella">
                                                    <svg><use href="../assets/img/icons.svg#star"></use></svg>
                                                </div>
                                                <p class="puntuacion"><xsl:value-of select="rating"></xsl:value-of></p>
                                            </nuestra-puntuacion>

                                            <div class="poster">
                                                <img src="{@poster}" alt="{title}" />
                                            </div>
                                            <div class="data">
                                                <div>
                                                    <h4 class="movie-title"><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
                                                    <p class="truncar"><xsl:value-of select="summary"/></p>
                                                </div>
                                                <div class="cast">
                                                    <div>
                                                        <h5>Director</h5>
                                                        <p><span><xsl:value-of select="director"/>.</span></p>
                                                    </div>
                                                    <div>
                                                        <h5>Casting</h5>
                                                        <p>
                                                            <xsl:for-each select="actor">
                                                                <xsl:value-of select="."/>
                                                                <xsl:if test="position() != last()">, </xsl:if>
                                                                <xsl:if test="position() = last()">.</xsl:if>
                                                            </xsl:for-each>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Guión</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="script">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                    <xsl:if test="position() = last()">.</xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <h5>Fotografía / Música</h5>
                                                        <p>
                                                            <span>
                                                                <xsl:for-each select="photo">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                                /
                                                                <xsl:for-each select="music">
                                                                    <xsl:value-of select="."/>
                                                                    <xsl:if test="position() != last()">, </xsl:if>
                                                                </xsl:for-each>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <ver-trailer class="play-trailer" data-video-id="{ytId}"><i class="icon-play"></i><span>Play </span>Trailer</ver-trailer>
                                                </div>
                                            </div>

                                        </article>
                                    </xsl:for-each>

                                </div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next"><svg><use href="../assets/img/icons.svg#right"></use></svg></div>
                                <div class="swiper-button-prev"><svg><use href="../assets/img/icons.svg#left"></use></svg></div>
                            </div>
                        </div>
                    </section>

                    <section id="criterio">
                        <div class="container">
                            <div class="criterio">
                                <div class="title">
                                    <h3>Nuestro criterio (sí, lo tenemos)</h3>
                                    <p>
                                        Reunimos las voces de críticos y espectadores en un mismo espacio, analizamos sus opiniones con detalle y te ofrecemos la puntuación de «interés» más fiable del
                                        momento.
                                    </p>
                                </div>
                                <div>
                                    <media-critica>
                                        <h5>Puntuacion media (Críticos)
                                            <span>
                                                <!-- Redondeo a 2 decimales -->
                                                <xsl:value-of select="round(sum(movies/movie/rating) div count(/movies/movie)*100) div 100"></xsl:value-of>
                                                <xsl:text> </xsl:text>
                                                <svg>
                                                    <use href="../assets/img/icons.svg#star"></use>
                                                </svg>
                                            </span>
                                        </h5>
                                        <div class="bar-container">
                                            <!-- Redondeo a un decimal para el relleno de la barra -->
                                            <div class="bar-relleno" style="width:{round(sum(movies/movie/rating) div count(/movies/movie)*100) div 10}%"></div>
                                        </div>
                                    </media-critica>
                                    <media-audiencia>
                                        <h5>Puntuacion media (Mortales)
                                            <span>
                                                9.5
                                                <svg>
                                                    <use href="../assets/img/icons.svg#star"></use>
                                                </svg>
                                            </span>
                                        </h5>
                                        <div class="bar-container">
                                            <div class="bar-relleno" style="width:95%;"></div>
                                        </div>
                                    </media-audiencia>
                                </div>
                            </div>
                            <div class="numeros">
                                <div>
                                    <numeros-numero>
                                        <!-- De esta forma se cuentan los elementos -->
                                        <xsl:value-of select="count(/movies/movie)"></xsl:value-of>
                                    </numeros-numero>
                                    <span>Películas Analizadas</span>
                                </div>
                                <div>
                                    <numeros-numero>
                                        <!-- De esta forma redondeo a un decimal -->
                                        <xsl:value-of select="round(count(/movies/movie[rating >= 8]) div count(/movies/movie) * 1000) div 10"></xsl:value-of>%
                                    </numeros-numero>
                                    <span>Obras Maestras</span>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div id="container-video">
                        <div id="video"></div>
                        <div id="close" class="open-sans" onclick="volver()">
                            <svg>
                                <use href="../assets/img/icons.svg#close"></use>
                            </svg>
                        </div>
                        <div id="retroceder" class="open-sans">
                            <svg>
                                <use href="../assets/img/icons.svg#rw"></use>
                            </svg>
                        </div>
                        <div id="pausa" class="open-sans">
                            <svg>
                                <use href="../assets/img/icons.svg#pause"></use>
                            </svg>
                        </div>
                        <div id="avanzar" class="open-sans">
                            <svg>
                                <use href="../assets/img/icons.svg#ff"></use>
                            </svg>
                        </div>
                        <div id="mute" class="open-sans">
                            <svg>
                                <use href="../assets/img/icons.svg#mute"></use>
                            </svg>
                        </div>
                        <div id="mi-linea-tiempo">
                            <div id="mi-progreso"></div>
                        </div>
                    </div>
                    <div id="loader-container">
                        <div class="carga" style="transform: translateX(-35px);">
                            <svg class="claqueta" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 575 466">
                                <path d="M175 226v200c0 11 3.92 20.42 11.75 28.25S204 466 215 466h320c11 0 20.42-3.92 28.25-11.75S575 437 575 426V226H175ZM535 426H215V266h320v160Z" fill="#cfffe2"/>
                                <path class="parte-movil" d="M563.25 157.75C571.08 165.58 575 175 575 186v80H175V186c0-11 3.91-20.42 11.75-28.25C194.58 149.92 204 146 215 146l40 80h60l-40-80h40l40 80h60l-40-80h40l40 80h60l-40-80h60c11 0 20.41 3.92 28.25 11.75Z" fill="#cfffe2"/>
                            </svg>
                        </div>
                    </div>
                </main>
                <footer>
                    <div class="container">
                        <div class="nosotros">
                            <logo-movie>
                                <i class="icon-claqueta"></i>
                                <h2>PICKaMOVIE</h2>
                            </logo-movie>
                            <p>
                                Descubre tu próxima película favorita, déjate llevar por nuestras puntuaciones, respaldadas por las opiniones más certeras de la crítica especializada.
                            </p>
                        </div>
                        <div class="menu-footer">
                            <nav id="menu-footer">
                                <h5>Explora</h5>
                                <ul>
                                    <li><a href="#intro">Inicio</a></li>
                                    <li><a href="#explora">Selección</a></li>
                                    <li><a href="#generos">Géneros</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="conecta">
                            <h5>Conecta</h5>
                            <div class="social">
                                <a href="https://www.instagram.com/imdb/"><i class="icon-instagram"></i></a>
                                <a href="https://github.com/Viturico/project-pickamovie"><i class="icon-github-circled"></i></a>
                                <a href="#"><i class="icon-mail"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <p class="copy"><xsl:text>&#169;</xsl:text>2026 PICKaMOVIE Entertainment es una marca Literal WD. Todos los derechos reservados<br/><br/><i class="icon-claqueta"></i>  <i class="icon-plus"></i><i class="icon-l-icon"></i></p>
                    </div>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/motion@latest/dist/motion.js"></script>
                <script>
                    // Cargo la función animate() de Motion
                    const { animate } = Motion;

                    // Selección de los elementos
                    const loaderContainer = document.getElementById("loader-container");
                    const claqueta = document.querySelector(".parte-movil");

                    // Iniciamos la animación de la claqeta
                    const animacionClaqueta = animate(
                    claqueta,
                    {
                    rotate: [-24, 0],
                    transformOrigin: "bottom left"
                    },
                    { duration: .3, ease: "easeInOut" }
                    );

                    // EventListener a la carga de la página
                    window.addEventListener("load", async () => {

                    // El contenedor se desvanece
                    await animate(
                    loaderContainer,
                    { opacity: 0 },
                    { duration: 0.5, ease: "easeIn" }
                    ).finished;

                    // Paro la animación y elimino el contenedor
                    animacionClaqueta.stop();
                    loaderContainer.remove();

                    });
                </script>
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
                <script src="../main.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
