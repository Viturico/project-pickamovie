<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>PICKaMOVIE</title>
                <link rel="icon" type="image/svg+xml" href="/assets/img/favicon.svg" />
                <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/apple-touch-icon.png" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />
                <link rel="stylesheet" href="/css/global.css" />

            </head>
            <body>
                <header>
                    <div class="container">
                        <logo-movie>
                            <i class="icon-claqueta"></i><h1>PICKaMOVIE</h1>
                        </logo-movie>
                        <nav id="menu" class="menu">
                            <ul>
                                <li><a href="">Inicio</a></li>
                                <li><a href="">Selección</a></li>
                                <li><a href="">Géneros</a></li>
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
                                    Una selección de recomendaciones cinematográficas para todos lo gustos. Desde joyas
                                    del cine independiente hasta grandes éxitos de taquilla.
                                </p>
                                <div class="explora-button">Explora</div>
                            </pick-intro>
                        </div>
                    </section>
                    <section id="explora">
                        <div class="container">
                            <h3 id="explora-title">El crítico recomienda (y no es fácil)</h3>
                            <p class="subtitle">Resulta que hay películas que le gustan.</p>
                        </div>
                        <div class="container">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <xsl:for-each select="/movies/movie">
                                    <article class="swiper-slide card">
                                        <div class="poster">
                                            <img src="{@poster}" alt="{title}" />
                                        </div>
                                        <div class="data">
                                            <div>
                                                <h4 class="movie-title"><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
                                                <p><xsl:value-of select="summary"/></p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span><xsl:value-of select="director"/>.</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><xsl:for-each select="actor"><xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() = last()">.</xsl:if></xsl:for-each></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span><xsl:for-each select="script"><xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() = last()">.</xsl:if></xsl:for-each></span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span><xsl:for-each select="photo"><xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() = last()">.</xsl:if></xsl:for-each> / <xsl:for-each select="music"><xsl:value-of select="."/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() = last()">.</xsl:if></xsl:for-each></span></p>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0.383 0.2796 10.35 20">
                                        <path d="M.383 20.0762c.2712.2712.7108.2712.982 0l9.0691-9.0692c.4018-.4017.4018-1.0531 0-1.4549L1.365.483C1.0938.2118.6541.2118.383.483Z" fill="#cfffe2"/>
                                    </svg>
                                </div>
                                <div class="swiper-button-prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-10.7355 -20.2796 10.35 20">
                                        <path d="M-.383-20.0762c-.2712-.2712-.7108-.2712-.982 0l-9.0691 9.0692c-.4018.4017-.4018 1.0531 0 1.4549L-1.365-.483C-1.0938-.2118-.6541-.2118-.383-.483Z" fill="#cfffe2"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section>
                        <div class="container">
                            <h3>Novedades</h3>
                            <p class="subtitle">Las úlitmas novedades en cartelera.</p>
                        </div>
                        <div class="container">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <article class="swiper-slide card">
                                        <div class="poster"><img src="https://placeholder.pics/svg/320x520" alt="" /></div>
                                        <div class="data">
                                            <div>
                                                <h4>Marty Supreme (2025)</h4>
                                                <p>
                                                    Ambientada en la década de 1950, esta película biográfica narra la vida
                                                    excéntrica y turbulenta de Marty Reisman, una leyenda del tenis de mesa
                                                    estadounidense.
                                                </p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span>Josh Safdie</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><span>Timothée Chalamet</span></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span>Ronald Bronstein</span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span>Darius Khondji / TBC</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <ver-trailer> <span>Play</span><a href="#">Trailer</a> </ver-trailer>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="swiper-slide card">
                                        <div class="poster"><img src="https://placeholder.pics/svg/320x520" alt="" /></div>
                                        <div class="data">
                                            <div>
                                                <h4>Marty Supreme (2025)</h4>
                                                <p>
                                                    Ambientada en la década de 1950, esta película biográfica narra la vida
                                                    excéntrica y turbulenta de Marty Reisman, una leyenda del tenis de mesa
                                                    estadounidense.
                                                </p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span>Josh Safdie</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><span>Timothée Chalamet</span></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span>Ronald Bronstein</span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span>Darius Khondji / TBC</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <ver-trailer> <span>Play</span><a href="#">Trailer</a> </ver-trailer>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="swiper-slide card">
                                        <div class="poster"><img src="https://placeholder.pics/svg/320x520" alt="" /></div>
                                        <div class="data">
                                            <div>
                                                <h4>Marty Supreme (2025)</h4>
                                                <p>
                                                    Ambientada en la década de 1950, esta película biográfica narra la vida
                                                    excéntrica y turbulenta de Marty Reisman, una leyenda del tenis de mesa
                                                    estadounidense.
                                                </p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span>Josh Safdie</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><span>Timothée Chalamet</span></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span>Ronald Bronstein</span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span>Darius Khondji / TBC</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <ver-trailer> <span>Play</span><a href="#">Trailer</a> </ver-trailer>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="swiper-slide card">
                                        <div class="poster"><img src="https://placeholder.pics/svg/320x520" alt="" /></div>
                                        <div class="data">
                                            <div>
                                                <h4>Marty Supreme (2025)</h4>
                                                <p>
                                                    Ambientada en la década de 1950, esta película biográfica narra la vida
                                                    excéntrica y turbulenta de Marty Reisman, una leyenda del tenis de mesa
                                                    estadounidense.
                                                </p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span>Josh Safdie</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><span>Timothée Chalamet</span></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span>Ronald Bronstein</span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span>Darius Khondji / TBC</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <ver-trailer> <span>Play</span><a href="#">Trailer</a> </ver-trailer>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="swiper-slide card">
                                        <div class="poster"><img src="https://placeholder.pics/svg/320x520" alt="" /></div>
                                        <div class="data">
                                            <div>
                                                <h4>Marty Supreme (2025)</h4>
                                                <p>
                                                    Ambientada en la década de 1950, esta película biográfica narra la vida
                                                    excéntrica y turbulenta de Marty Reisman, una leyenda del tenis de mesa
                                                    estadounidense.
                                                </p>
                                            </div>
                                            <div class="cast">
                                                <div>
                                                    <h5>Director</h5>
                                                    <p><span>Josh Safdie</span></p>
                                                </div>
                                                <div>
                                                    <h5>Casting</h5>
                                                    <p><span>Timothée Chalamet</span></p>
                                                </div>
                                                <div>
                                                    <h5>Guión</h5>
                                                    <p><span>Ronald Bronstein</span></p>
                                                </div>
                                                <div>
                                                    <h5>Fotografía / Música</h5>
                                                    <p><span>Darius Khondji / TBC</span></p>
                                                </div>
                                            </div>
                                            <div>
                                                <ver-trailer> <span>Play</span><a href="#">Trailer</a> </ver-trailer>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0.383 0.2796 10.35 20">
                                        <path d="M.383 20.0762c.2712.2712.7108.2712.982 0l9.0691-9.0692c.4018-.4017.4018-1.0531 0-1.4549L1.365.483C1.0938.2118.6541.2118.383.483Z" fill="#cfffe2"/>
                                    </svg>
                                </div>
                                <div class="swiper-button-prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-10.7355 -20.2796 10.35 20">
                                        <path d="M-.383-20.0762c-.2712-.2712-.7108-.2712-.982 0l-9.0691 9.0692c-.4018.4017-.4018 1.0531 0 1.4549L-1.365-.483C-1.0938-.2118-.6541-.2118-.383-.483Z" fill="#cfffe2"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="criterio">
                        <div class="container">
                            <div class="criterio">
                                <div class="title">
                                    <h3>Nuestro critrerio (sí, lo tenemos)</h3>
                                    <p>
                                        Reunimos las voces de críticos y espectadores en un mismo espacio, analizamos sus
                                        opiniones con detalle y te ofrecemos la puntuación de «interés» más fiable del
                                        momento.
                                    </p>
                                </div>
                                <div>
                                    <media-critica>
                                        <h5>Puntuacion media (Críticos)<span>94%</span></h5>
                                        <div class="bar-container">
                                            <div class="bar-relleno"></div>
                                        </div>
                                    </media-critica>
                                    <media-audiencia>
                                        <h5>Puntuacion media (Mortales)<span>70%</span></h5>
                                        <div class="bar-container">
                                            <div class="bar-relleno"></div>
                                        </div>
                                    </media-audiencia>
                                </div>
                            </div>
                            <div class="numeros">
                                <div>
                                    <numeros-numero>12</numeros-numero>
                                    <span>Películas Analizadas</span>
                                </div>
                                <div>
                                    <numeros-numero>95%</numeros-numero>
                                    <span>Películas Buenas</span>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div id="container-video">
                        <div id="video"></div>
                        <div id="close" class="open-sans" onclick="volver()"><svg width="24px" height="24px" stroke-width="1.5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="var(--color-destacado)"><path d="M6.75827 17.2426L12.0009 12M17.2435 6.75736L12.0009 12M12.0009 12L6.75827 6.75736M12.0009 12L17.2435 17.2426" stroke="var(--color-destacado)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg></div>
                        <div id="retroceder" class="open-sans"><svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="var(--color-destacado)" stroke-width="1.5"><path d="M21.0441 5.70436C21.4402 5.41246 22 5.69531 22 6.1874V17.8126C22 18.3047 21.4402 18.5875 21.0441 18.2956L13.1555 12.483C12.8301 12.2432 12.8301 11.7568 13.1555 11.517L21.0441 5.70436Z" fill="var(--color-destacado)" stroke="var(--color-destacado)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M10.0441 5.70436C10.4402 5.41246 11 5.69531 11 6.1874V17.8126C11 18.3047 10.4402 18.5875 10.0441 18.2956L2.15555 12.483C1.8301 12.2432 1.8301 11.7568 2.15555 11.517L10.0441 5.70436Z" fill="var(--color-destacado)" stroke="var(--color-destacado)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg></div>
                        <div id="avanzar" class="open-sans"><svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="var(--color-destacado)" stroke-width="1.5"><path d="M2.95592 5.70436C2.55976 5.41246 2 5.69531 2 6.1874V17.8126C2 18.3047 2.55976 18.5875 2.95592 18.2956L10.8445 12.483C11.1699 12.2432 11.1699 11.7568 10.8445 11.517L2.95592 5.70436Z" fill="var(--color-destacado)" stroke="var(--color-destacado)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M13.9559 5.70436C13.5598 5.41246 13 5.69531 13 6.1874V17.8126C13 18.3047 13.5598 18.5875 13.9559 18.2956L21.8445 12.483C22.1699 12.2432 22.1699 11.7568 21.8445 11.517L13.9559 5.70436Z" fill="var(--color-destacado)" stroke="var(--color-destacado)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg></div>
                        <div id="mi-linea-tiempo">
                            <div id="mi-progreso"></div>
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
                                Descubre tu próxima película favorita con recomendaciones personalizadas, respaldadas
                                por las opiniones más certeras de la crítica especializada.
                            </p>
                        </div>
                        <div class="menu-footer">
                            <nav id="menu-footer">
                                <h5>Explora</h5>
                                <ul>
                                    <li><a href="">Inicio</a></li>
                                    <li><a href="">Seleccion</a></li>
                                    <li><a href="">Géneros</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="conecta">
                            <h5>Conecta</h5>
                            <div class="social">
                                <a href="#"><i class="icon-instagram"></i></a>
                                <a href="#"><i class="icon-github-circled"></i></a>
                                <a href="#"><i class="icon-mail"></i></a>
                            </div>
                        </div>
                    </div>
                    <p class="copy"><xsl:text>&#169;</xsl:text>2026 PICKaMOVIE Entertainment es una marca Literal WD. Todos los derechos reservados<br/><i class="icon-claqueta"></i> <i class="icon-plus"></i><i class="icon-l-icon"></i></p>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/motion@latest/dist/motion.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
                <script src="/main.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
