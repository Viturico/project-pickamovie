# 🎬 PICKaMOVIE

> Práctica de **Lenguajes de Marcas** · Transformación XML → HTML mediante XSLT

![HTML](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)
![XML](https://img.shields.io/badge/XML-FF6600?style=flat)
![XSLT](https://img.shields.io/badge/XSLT-1.0-009900?style=flat)

---

## 📋 Descripción

**PICKaMOVIE** es una web de recomendaciones cinematográficas desarrollada como práctica de la asignatura de **Lenguajes de Marcas**. El proyecto tiene como eje central la **transformación de un documento XML a HTML mediante XSLT 1.0**, generando una interfaz vistosa y funcional a partir de datos estructurados.

El prototipo del diseño fue reañizado en **Figma** antes de su implementación.

---

## 🎯 Objetivo de la práctica

El foco principal es demostrar el dominio de:

- **Estructuración de datos en XML** y su validación mediante **DTD**
- **Transformación XSLT** para generar HTML dinámico a partir del XML
- Uso de expresiones **XPath** para navegación, filtrado y cálculos sobre los datos
- Presentación visual del resultado con **CSS moderno** y **JavaScript**

---

## 🗂️ Estructura del proyecto

```
src/
├── assets/
│   ├── fonts/          # Tipografía Be Vietnam Pro + iconos propios (pickamovie)
│   └── img/            # Favicon, apple-touch-icon, fondo, sprite SVG de iconos
├── css/
│   ├── global.css      # Estilos globales con variables CSS
│   └── josh-reset.css  # Reset CSS
├── data/
│   ├── pickamovie.dtd  # Definición de tipo de documento (validación)
│   ├── pickamovie.xml  # Base de datos de películas
│   └── pickamovie.xslt # Hoja de transformación XSLT principal
├── index.html          # Punto de entrada
└── main.js             # Lógica del cliente (Swiper, YouTube API, filtros)
```

---

## ⚙️ Tecnologías utilizadas

| Tecnología             | Uso                                                 |
| ---------------------- | --------------------------------------------------- |
| **XML**                | Almacén de datos estructurado de películas          |
| **DTD**                | Validación de la estructura del XML                 |
| **XSLT 1.0**           | Transformación del XML en HTML                      |
| **XPath**              | Navegación y expresiones sobre el árbol XML         |
| **CSS3**               | Diseño visual con custom properties, grid, flexbox  |
| **JavaScript**         | Interactividad, carruseles, reproductor de trailers |
| **Swiper.js**          | Carruseles responsivos de películas                 |
| **Motion.js**          | Animaciones de entrada                              |
| **YouTube IFrame API** | Reproducción de trailers embebidos                  |
| **Figma**              | Diseño visual previo                                |

---

## ✨ Funcionalidades

- **Sección "El crítico recomienda"** → listado completo de películas del XML renderizado mediante XSLT
- **Sección "Novedades"** → las 10 películas más recientes, ordenadas por año con `xsl:sort`
- **Sección "Géneros"** → filtrado interactivo por categoría mediante botones + JS
- **Reproductor de trailers** en pseudo-pantalla completa con controles personalizados (play, mute, avance/retroceso, barra de progreso)
- **Carteles TMDB**: se muestran los carteles originales directamente desde The Movie Database
- **Estadísticas calculadas con XPath**: puntuación media, total de películas analizadas, porcentaje de películas con nota > 8
- Diseño **responsive** adaptado a móvil y tablet
- Fuente tipográfica de Google Fonts **Be Vietnam Pro** e iconos propios mediante `@font-face`

---

## 🔑 Fragmentos XSLT destacados

### Iteración y renderizado de tarjetas

```xml
<xsl:for-each select="/movies/movie">
    <article class="swiper-slide card">
        <h4><xsl:value-of select="title"/> (<xsl:value-of select="year"/>)</h4>
        ...
    </article>
</xsl:for-each>
```

### Ordenación por año (Novedades)

```xml
<xsl:for-each select="/movies/movie">
    <xsl:sort select="year" order="descending" data-type="number"/>
    <xsl:if test="position() &lt;= 10">
        ...
    </xsl:if>
</xsl:for-each>
```

### Cálculo de puntuación media

```xml
<xsl:value-of select="round(sum(movies/movie/rating) div count(/movies/movie)*100) div 100"/>
```

### Porcentaje de películas con nota > 8

```xml
<xsl:value-of select="round(count(/movies/movie[rating > 8]) div count(/movies/movie) * 1000) div 10"/>%
```

### Atributo dinámico para filtrado por género

```xml
<xsl:attribute name="data-genre">
    <xsl:for-each select="genre">
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:for-each>
</xsl:attribute>
```

---

## 📐 Diseño

El diseño fue creado en **Figma** antes de la implementación, siguiendo una estética oscura con acento en verde menta (`#cfffe2`). Se emplean variables CSS para mantener consistencia cromática y tipográfica en todo el proyecto.

---

## 👤 Autor

Desarrollado por **[Viturico](https://github.com/Viturico)** como práctica de Lenguajes de Marcas.

---

<p align="center">
  🎬 &nbsp;<strong>PICKaMOVIE</strong> · una marca <em>Literal WD</em>&nbsp; 😁
</p>
