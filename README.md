# 📝 Bitácora Tech

> Blog colectivo de tecnología construido con Jekyll y preparado para publicarse en GitHub Pages.

Bitácora Tech reúne publicaciones de varias personas con intereses distintos dentro del mundo tech: desarrollo web, IA, ciberseguridad, hardware, gaming y más. Este repositorio contiene la configuración del sitio, la página de inicio, la presentación del equipo y la estructura necesaria para publicar nuevos artículos de forma sencilla.

## 🎯 Objetivo del proyecto

El objetivo es crear un espacio simple, mantenible y fácil de publicar para compartir contenido técnico en formato de blog. La idea es que cada autor aporte desde su área de experiencia, manteniendo una base común de navegación, estilo y despliegue.

## ✨ Características principales

- 🌐 Sitio estático generado con Jekyll.
- 🎨 Tema base `minima`.
- 📡 Soporte para feeds RSS con `jekyll-feed`.
- 🔎 Metadatos SEO con `jekyll-seo-tag`.
- 📚 Paginación de entradas con `jekyll-paginate`.
- 👤 Configuración de autores en `_config.yml`.
- 🚀 Preparado para GitHub Pages.

## 📁 Estructura del repositorio

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

### 📌 Archivos clave

- `_config.yml`: configuración principal del sitio, autores, tema, plugins, paginación y rutas.
- `blog-tech/index.md`: página de inicio del blog.
- `blog-tech/about.md`: página de presentación del proyecto y del equipo.
- `blog-tech/Gemfile`: dependencias Ruby/Jekyll necesarias para ejecutar el sitio en local.

## 🛠️ Requisitos

Para ejecutar el proyecto en tu máquina necesitas:

- Ruby instalado.
- Bundler instalado.
- Git si vas a clonar, colaborar o publicar cambios.

Si vas a trabajar localmente con Jekyll, también es recomendable tener instaladas las herramientas de compilación básicas que exija tu sistema operativo para compilar gemas nativas.

## ▶️ Instalación local

La forma más simple de probar el blog en local es desde la carpeta `blog-tech/`.

```bash
cd blog-tech
bundle install
bundle exec jekyll serve
```

Luego abre el navegador en:

```text
http://localhost:4000
```

### 🔍 Qué hace cada comando

- `bundle install`: instala las gemas definidas en el `Gemfile`.
- `bundle exec jekyll serve`: levanta un servidor local y recompila el sitio cuando detecta cambios.

## 🌐 Publicación en GitHub Pages

Este proyecto está pensado para publicarse como un sitio estático en GitHub Pages.

### ✅ Flujo recomendado

1. Crea un repositorio en GitHub para el sitio.
2. Sube el contenido del proyecto a la rama principal.
3. En GitHub, abre la sección Settings > Pages.
4. Selecciona la rama y la carpeta que correspondan a la publicación del sitio.
5. Espera la compilación y revisa la URL generada.

### ⚠️ Configuración importante

En `_config.yml` conviene revisar estos valores antes de publicar:

- `url`: la URL final del sitio.
- `baseurl`: el subdirectorio del sitio, si aplica.

Si el blog se publica como repositorio de usuario en GitHub Pages, normalmente `baseurl` queda vacío. Si se publica como proyecto dentro de otro dominio o subruta, puede requerir un valor distinto.

## 🤝 Cómo trabajaremos colaborativamente

Para mantener el proyecto ordenado, simple y fácil de revisar, usaremos un enfoque basado en Trunk-Based Development.

### 🧭 Idea central

- La rama `main` es la fuente de verdad.
- Todos los cambios entran a `main` de forma frecuente.
- Las ramas de trabajo son cortas y de vida breve.
- Los cambios pequeños son más fáciles de revisar, probar y desplegar.

### ✅ Reglas de trabajo

1. Siempre partir desde `main`.
2. Crear ramas cortas y descriptivas, por ejemplo:
   - `feat/nuevo-post`
   - `fix/ajuste-nav`
   - `docs/mejora-readme`
3. Hacer cambios pequeños y enfocados.
4. Subir la rama con frecuencia.
5. Abrir un Pull Request para revisar antes de mezclar.
6. No mezclar cambios incompletos ni sin probar.

### 💻 Flujo recomendado

```bash
git checkout main
git pull origin main
git checkout -b feat/nombre-del-cambio

# trabajar en los cambios

git add .
git commit -m "feat: describe el cambio"
git push -u origin feat/nombre-del-cambio
```

Luego abrir un Pull Request en GitHub y esperar revisión.

### 📝 Buenas prácticas

- Usa mensajes de commit claros y cortos.
- Mantén los PR pequeños.
- Evita trabajar directamente sobre `main`.
- Prueba el sitio localmente antes de pedir merge.
- Si algo no está listo, no lo mezcles.

## ⚙️ Configuración del sitio

El archivo `_config.yml` centraliza la mayor parte de la configuración global.

### 👤 Autores

Los autores se definen dentro de `authors:`. Cada autor tiene una clave única y metadatos básicos como nombre y biografía.

Ejemplo de estructura:

```yaml
authors:
  juanjo:
    name: "Juanjo Morales"
    bio: "Ingeniero de sistemas"
```

### 🎨 Tema y plugins

El blog usa:

- `theme: minima`
- `jekyll-feed`
- `jekyll-seo-tag`
- `jekyll-paginate`

### 🧭 Navegación

La navegación principal se define en `header_pages:`. Actualmente apunta a `about.md`.

### 📄 Paginación

La página de inicio muestra las entradas paginadas con:

- `paginate: 6`
- `paginate_path: "/page:num/"`

## ✍️ Cómo crear una nueva entrada

Cada post debe guardarse en la carpeta `_posts/` con un nombre que siga este formato:

```text
AAAA-MM-DD-titulo-del-post.md
```

### 🧩 Front matter mínimo

Cada entrada debe comenzar con un bloque YAML como este:

```yaml
---
layout: post
title: "Título del artículo"
date: 2026-08-01 10:00:00 -0400
author: juanjo
categories: [desarrollo]
tags: [jekyll, github-pages]
---
```

### 📏 Reglas recomendadas para los posts

- El valor de `author` debe coincidir con una clave existente en `_config.yml`.
- Usa `categories` para agrupar temas generales.
- Usa `tags` para etiquetas más específicas.
- Escribe el contenido en Markdown debajo del front matter.

### 📝 Ejemplo de post

```markdown
---
layout: post
title: "Primer artículo"
date: 2026-08-01 10:00:00 -0400
author: mauro
categories: [devops]
tags: [jekyll, blog, github-pages]
---

En este artículo explicamos cómo publicar un blog técnico con Jekyll.
```

## 👤 Cómo agregar un nuevo autor

1. Abre `_config.yml`.
2. Agrega una nueva entrada dentro de `authors:`.
3. Usa una clave corta y estable, por ejemplo `ana`, `pedro` o `sofia`.
4. Completa `name` y `bio`.
5. Si quieres mostrarlo en la página de presentación, actualiza también `blog-tech/about.md`.

## 🎨 Personalización visual

El sitio usa el tema `minima`, así que la personalización puede hacerse de varias formas:

- Sobrescribiendo estilos con archivos propios.
- Creando parciales o ajustes de tema si el proyecto crece.
- Cambiando contenido, orden de páginas o metadatos desde `_config.yml`.

Si el blog necesita una identidad visual más marcada, se puede migrar a un tema más completo o extender la apariencia actual con CSS personalizado.

## 🧱 Contenido incluido hoy

### 🏠 Página de inicio

La página principal da la bienvenida y presenta el enfoque del blog como un espacio colectivo de tecnología.

### ℹ️ Página Acerca de

La página `about.md` resume la historia del proyecto y presenta a los autores con una descripción breve de sus áreas.

## 🔧 Mantenimiento recomendado

Para que el proyecto se mantenga ordenado a medida que crece, conviene seguir estas prácticas:

- Mantener coherencia en el nombre de los archivos de post.
- Revisar que cada nuevo autor exista en `_config.yml` antes de usarlo en un post.
- Probar el sitio en local antes de publicar.
- Verificar `url` y `baseurl` antes de desplegar.
- Revisar enlaces internos después de cambios en páginas o rutas.

## 📜 Licencia

Si el proyecto va a publicarse de forma abierta, conviene agregar una licencia explícita en el repositorio para dejar claro cómo se puede reutilizar el contenido y el código.

## 🚀 Próximos pasos sugeridos

- Crear la carpeta `_posts/` si todavía no existe y empezar a publicar artículos.
- Añadir estilos personalizados para darle una identidad propia al blog.
- Completar la información real de autores, repositorio y URL final antes de publicar.