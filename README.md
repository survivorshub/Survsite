# Bitacora Tech

Bitacora Tech es un blog colectivo de tecnologia construido con [Jekyll](https://jekyllrb.com/) y preparado para publicarse en [GitHub Pages](https://pages.github.com/). El sitio reune publicaciones de varias personas con intereses distintos dentro del mundo tech, como desarrollo web, IA, ciberseguridad, hardware y gaming.

Este repositorio contiene la configuracion del sitio, la pagina de inicio, la pagina de presentacion del equipo y la estructura necesaria para agregar nuevos articulos de blog.

## Objetivo del proyecto

El objetivo es tener un espacio simple, mantenible y facil de publicar para compartir contenido tecnico en formato de blog. La idea del proyecto es que cada autor publique articulos desde su area de experiencia, manteniendo una base comun de navegacion, estilo y despliegue.

## Caracteristicas principales

- Sitio estatico generado con Jekyll.
- Tema base `minima`.
- Soporte para feeds RSS con `jekyll-feed`.
- Metadatos SEO con `jekyll-seo-tag`.
- Paginacion de entradas con `jekyll-paginate`.
- Configuracion de autores en `_config.yml`.
- Estructura pensada para GitHub Pages.

## Estructura del repositorio

```text
Survsite/
├── _config.yml
├── README.md
└── blog-tech/
    ├── Gemfile
    ├── README.md
    ├── about.md
    └── index.md
```

### Archivos clave

- `_config.yml`: configuracion principal del sitio, autores, tema, plugins, paginacion y rutas.
- `blog-tech/index.md`: pagina de inicio del blog.
- `blog-tech/about.md`: pagina de presentacion del proyecto y del equipo.
- `blog-tech/Gemfile`: dependencias Ruby/Jekyll necesarias para ejecutar el sitio en local.

## Requisitos

Para ejecutar el proyecto en tu maquina necesitas:

- Ruby instalado.
- Bundler instalado.
- Git, si vas a clonar o publicar cambios.

Si vas a trabajar localmente con Jekyll, tambien es recomendable tener instaladas las herramientas de compilacion basicas que exija tu sistema operativo para compilar gemas nativas.

## Instalacion local

La forma mas simple de probar el blog en local es desde la carpeta `blog-tech/`.

```bash
cd blog-tech
bundle install
bundle exec jekyll serve
```

Luego abre en el navegador:

```text
http://localhost:4000
```

### Que hace cada comando

- `bundle install`: instala las gemas definidas en el `Gemfile`.
- `bundle exec jekyll serve`: levanta un servidor local y recompila el sitio cuando detecta cambios.

## Publicacion en GitHub Pages

Este proyecto esta pensado para publicarse como un sitio estatico en GitHub Pages.

### Flujo recomendado

1. Crea un repositorio en GitHub para el sitio.
2. Sube el contenido del proyecto a la rama principal.
3. En GitHub, abre la seccion **Settings > Pages**.
4. Selecciona la rama y la carpeta que correspondan a la publicacion del sitio.
5. Espera la compilacion y revisa la URL generada por GitHub Pages.

### Configuracion importante

En `_config.yml` hay dos valores que normalmente debes revisar antes de publicar:

- `url`: la URL final del sitio.
- `baseurl`: el subdirectorio del sitio, si aplica.

Si el blog se publica como repositorio de usuario en GitHub Pages, normalmente `baseurl` queda vacio. Si se publica como proyecto dentro de otro dominio o subruta, puede requerir un valor distinto.

## Configuracion del sitio

El archivo `_config.yml` centraliza la mayor parte de la configuracion global.

### Autores

Los autores se definen dentro de `authors:`. Cada autor tiene una clave unica y metadatos basicos como nombre y biografia.

Ejemplo de estructura:

```yaml
authors:
  juanjo:
    name: "Juanjo Morales"
    bio: "Ingeniero de sistemas"
```

### Tema y plugins

El blog usa:

- `theme: minima`
- `jekyll-feed`
- `jekyll-seo-tag`
- `jekyll-paginate`

### Navegacion

La navegacion principal se define en `header_pages:`. Actualmente apunta a `about.md`.

### Paginacion

La pagina de inicio muestra las entradas paginadas con:

- `paginate: 6`
- `paginate_path: "/page:num/"`

## Como crear una nueva entrada

Cada post debe guardarse en la carpeta `_posts/` con un nombre que siga este formato:

```text
AAAA-MM-DD-titulo-del-post.md
```

### Front matter minimo

Cada entrada debe comenzar con un bloque YAML como este:

```yaml
---
layout: post
title: "Titulo del articulo"
date: 2026-08-01 10:00:00 -0400
author: juanjo
categories: [desarrollo]
tags: [jekyll, github-pages]
---
```

### Reglas recomendadas para los posts

- El valor de `author` debe coincidir con una clave existente en `_config.yml`.
- Usa `categories` para agrupar temas generales.
- Usa `tags` para etiquetas mas especificas.
- Escribe el contenido en Markdown debajo del front matter.

### Ejemplo de post

```markdown
---
layout: post
title: "Primer articulo"
date: 2026-08-01 10:00:00 -0400
author: mauro
categories: [devops]
tags: [jekyll, blog, github-pages]
---

En este articulo explicamos como publicar un blog tecnico con Jekyll.
```

## Como agregar un nuevo autor

1. Abre `_config.yml`.
2. Agrega una nueva entrada dentro de `authors:`.
3. Usa una clave corta y estable, por ejemplo `ana`, `pedro` o `sofia`.
4. Completa `name` y `bio`.
5. Si quieres mostrarlo en la pagina de presentacion, actualiza tambien `blog-tech/about.md`.

## Personalizacion visual

El sitio usa el tema `minima`, asi que la personalizacion puede hacerse de varias formas:

- Sobrescribiendo estilos con archivos propios.
- Creando parciales o ajustes de tema si el proyecto crece.
- Cambiando contenido, orden de paginas o metadatos desde `_config.yml`.

Si el blog necesita una identidad visual mas marcada, se puede migrar a un tema mas completo o extender la apariencia actual con CSS personalizado.

## Contenido incluido hoy

### Pagina de inicio

La pagina principal da la bienvenida y presenta el enfoque del blog como un espacio colectivo de tecnologia.

### Pagina Acerca de

La pagina `about.md` resume la historia del proyecto y presenta a los autores con una descripcion breve de sus areas.

## Mantenimiento recomendado

Para que el proyecto se mantenga ordenado a medida que crece, conviene seguir estas practicas:

- Mantener coherencia en el nombre de los archivos de post.
- Revisar que cada nuevo autor exista en `_config.yml` antes de usarlo en un post.
- Probar el sitio en local antes de publicar.
- Verificar `url` y `baseurl` antes de desplegar.
- Revisar enlaces internos despues de cambios en paginas o rutas.

## Licencia

Si el proyecto va a publicarse de forma abierta, agrega una licencia explicita en el repositorio para dejar claro como se puede reutilizar el contenido y el codigo.

## Proximos pasos sugeridos

- Crear la carpeta `_posts/` si todavia no existe y empezar a publicar articulos.
- Añadir estilos personalizados para darle una identidad propia al blog.
- Completar la informacion real de autores, repositorio y URL final antes de publicar.