# 📝 Bitácora Tech

> Blog colectivo de tecnología construido con Jekyll, preparado para funcionar en local y publicarse en GitHub Pages.

Bitácora Tech reúne publicaciones de varias personas con intereses distintos dentro del mundo tech: desarrollo web, IA, ciberseguridad, hardware, gaming y más. El proyecto está pensado para que sea sencillo de mantener, fácil de editar y cómodo para colaborar entre varias personas.

## 🎯 Objetivo del proyecto

El objetivo es crear un espacio simple, mantenible y fácil de publicar para compartir contenido técnico en formato de blog. La idea es que cada autor aporte desde su área de experiencia, manteniendo una base común de navegación, estilo y despliegue.

## ✨ Qué incluye este proyecto

- 🌐 Un sitio estático generado con Jekyll.
- 🎨 Un tema base `minima`.
- 📡 Soporte para feeds RSS con `jekyll-feed`.
- 🔎 Metadatos SEO con `jekyll-seo-tag`.
- 📚 Paginación de entradas con `jekyll-paginate`.
- 👤 Configuración de autores desde `_config.yml`.
- 🚀 Un flujo listo para probar localmente y publicar en GitHub Pages.
- 🐳 Una experiencia de desarrollo reproducible con Docker.

## 📁 Estructura del repositorio

```text
Survsite/
├── _config.yml              # Configuración global del sitio
├── README.md                # Esta documentación
├── Dockerfile               # Imagen para ejecutar Jekyll en local
├── docker-compose.yml       # Arranque del sitio con Docker
├── Makefile                 # Comandos rápidos de uso local
├── blog-tech/               # Contenido del blog (páginas, posts, Gemfile)
│   ├── Gemfile
│   ├── about.md
│   ├── index.md
│   └── _posts/
```

### 📌 Archivos clave

- `_config.yml`: configuración principal del sitio, autores, tema, plugins, paginación y rutas.
- `blog-tech/index.md`: página de inicio del blog.
- `blog-tech/about.md`: página de presentación del proyecto y del equipo.
- `blog-tech/Gemfile`: dependencias Ruby/Jekyll necesarias para ejecutar el sitio en local.
- `blog-tech/_posts/`: carpeta donde viven los artículos del blog.

## 🛠️ Requisitos

Para trabajar con este proyecto necesitas:

- Git
- Docker y Docker Compose (recomendado para reproducir el entorno sin instalar Ruby globalmente)
- O bien Ruby + Bundler si prefieres ejecutar Jekyll directamente

> En este entorno ya se dejó preparado un flujo con Docker para que el sitio quede accesible en local sin depender de una instalación manual de Ruby.

## ▶️ Cómo reproducir el proyecto en local

### Opción A: con Docker (recomendada)

Esta es la forma más sencilla y reproducible.

1. Abre una terminal en la raíz del repositorio.
2. Ejecuta:

```bash
cd /ruta/al/proyecto/Survsite
docker compose up -d
```

3. Abre el navegador en:

```text
http://127.0.0.1:4000
```

4. Para detenerlo:

```bash
docker compose down
```

5. Para ver los logs si algo falla:

```bash
docker compose logs -f
```

### Opción B: con Ruby y Bundler

Si prefieres ejecutar Jekyll directamente en tu máquina:

```bash
cd blog-tech
bundle install
bundle exec jekyll serve
```

Y luego visita:

```text
http://localhost:4000
```

### 🔍 Qué hacen los comandos

- `bundle install`: instala las dependencias definidas en el `Gemfile`.
- `bundle exec jekyll serve`: levanta un servidor local y recompila el sitio cuando detecta cambios.
- `docker compose up -d`: construye y levanta el entorno de Jekyll en un contenedor.

## 🌐 Cómo funciona GitHub Pages

GitHub Pages es el servicio de alojamiento estático de GitHub. Permite publicar sitios web sin necesidad de montar un servidor tradicional.

### ¿Cómo se usa aquí?

- El contenido del blog está escrito en Markdown y Jekyll lo transforma en páginas HTML estáticas.
- GitHub Pages publica ese contenido directamente desde el repositorio.
- En este proyecto, la publicación de producción se gestiona desde la rama `main`.

### Conceptos importantes

- `main`: es la única fuente de verdad para producción.
- `develop`: rama de prueba y validación previa al despliegue.
- `feature/*`: ramas de trabajo para cambios concretos.
- `root` o `docs/`: la carpeta desde la que se publicará el contenido.
- Build automático: si el repositorio está configurado para Jekyll, GitHub lo compila automáticamente.

### Flujo de publicación

1. Se trabaja en ramas `feature/*` creadas desde `develop`.
2. Cuando un cambio está listo, se abre un Pull Request hacia `develop`.
3. En `develop` se valida el contenido, se revisa el blog localmente y se comprueba que todo está en orden.
4. Cuando la preparación es correcta, se abre un Pull Request desde `develop` hacia `main`.
5. Solo al mergear ese Pull Request hacia `main` se activa el workflow de despliegue.
6. GitHub Pages compila el sitio y lo publica en la URL pública.

> Importante: los merges a `develop` no disparan el despliegue. El workflow solo reacciona cuando el PR de `develop` a `main` se fusiona.

### Configuración recomendada para este proyecto

En GitHub, en la sección Settings → Pages, normalmente se configura:

- Source: Deploy from a branch
- Branch: `main`
- Folder: `/root` o `/docs` según cómo se haya preparado el proyecto

> Para un proyecto como este, la URL suele ser de la forma:
>
> `https://<usuario>.github.io/<nombre-del-repositorio>/`

Si el repositorio es un sitio de usuario o organización, la URL puede ser simplemente:

`https://<usuario>.github.io/`

## � Despliegue con GitHub Actions

Este proyecto incluye un workflow de GitHub Actions para construir y publicar el sitio de Jekyll automáticamente en GitHub Pages.

### Archivo incluido

- [.github/workflows/deploy-pages.yml](.github/workflows/deploy-pages.yml): construye el sitio con Jekyll y lo despliega a GitHub Pages.

### Qué hace el workflow

1. Se activa al cerrar un Pull Request mergeado hacia `main` cuando la fuente es `develop`.
2. Ejecuta una validación previa que incluye:
   - revisión ortográfica con `cspell` sobre los posts,
   - comprobación de dependencias con Bundler,
   - ejecución de `jekyll doctor`,
   - y una compilación completa del sitio con `jekyll build --trace`.
3. Si la validación pasa, genera la carpeta [blog-tech/_site](blog-tech/_site).
4. Publica ese resultado en GitHub Pages con `actions/deploy-pages`.

### Configuración en GitHub

Para que funcione correctamente:

1. Ve a Settings → Pages.
2. Selecciona la opción `GitHub Actions` como fuente de despliegue.
3. Asegúrate de que el workflow haya terminado correctamente en la pestaña Actions.
4. Espera unos minutos y recarga la URL pública.

## 🔄 Flujo de trabajo colaborativo

Para trabajar de forma colaborativa en este proyecto se seguirá este flujo:

1. Cada cambio se desarrolla en una rama `feature/*` creada desde `develop`.
2. Cuando el cambio está listo, se abre un Pull Request hacia `develop`.
3. En `develop` se prueban y revisan los cambios antes de preparar la publicación.
4. Cuando todo está listo, se abre un Pull Request desde `develop` hacia `main`.
5. Solo al mergear ese PR a `main` se despliega el sitio en producción.

Este modelo busca mantener un flujo claro, ordenado y seguro para el desarrollo, la validación y la publicación del blog.

## ⚙️ Configuración del sitio

El archivo `_config.yml` centraliza la mayor parte de la configuración global del blog.

### 👤 Autores

Los autores se definen dentro de `authors:`. Cada autor tiene una clave única y metadatos básicos como nombre y biografía.

Ejemplo:

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

La página de inicio muestra entradas paginadas con:

- `paginate: 6`
- `paginate_path: "/page:num/"`

## ✍️ Cómo crear una nueva entrada

Cada post debe guardarse en la carpeta `blog-tech/_posts/` con un nombre que siga este formato:

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

## 🤝 Cómo trabajaremos colaborativamente

Para mantener el proyecto ordenado y fácil de revisar, usaremos un flujo basado en una sola fuente de verdad y ramas de trabajo temporales.

### 🧭 Idea central

- La rama `main` es la única fuente de verdad para producción.
- La rama `develop` sirve para probar el blog en local y validar el contenido antes de ir a producción.
- Las ramas `feature/*` se crean desde `develop` para trabajar cambios concretos.
- Los cambios se revisan mediante Pull Requests y solo se integran cuando están listos.

### ✅ Reglas de trabajo

1. Siempre partir desde `develop` para crear una rama `feature/*`.
2. Crear ramas cortas y descriptivas, por ejemplo:
   - `feature/nuevo-post`
   - `feature/ajuste-nav`
   - `feature/mejora-readme`
3. Hacer cambios pequeños y enfocados.
4. Subir la rama con frecuencia.
5. Abrir un Pull Request hacia `develop` para revisar y probar.
6. Cuando todo esté validado, abrir un Pull Request desde `develop` hacia `main`.
7. No mezclar cambios incompletos ni sin probar.

### 💻 Flujo recomendado

```bash
git checkout develop
git pull origin develop
git checkout -b feature/nombre-del-cambio

# trabajar en los cambios

git add .
git commit -m "feat: describe el cambio"
git push -u origin feature/nombre-del-cambio
```

Luego abrir un Pull Request hacia `develop`. Cuando el cambio esté listo para producción, abrir otro Pull Request desde `develop` hacia `main`.

### 📝 Buenas prácticas

- Usa mensajes de commit claros y cortos.
- Mantén los PR pequeños y con contexto.
- Evita trabajar directamente sobre `main` o `develop`.
- Prueba el sitio localmente antes de pedir merge a `develop`.
- Si algo no está listo, no lo mezcles.
- Recuerda que el despliegue en producción solo ocurre cuando el merge llega a `main`.

## 🎨 Personalización visual

El sitio usa el tema `minima`, así que la personalización puede hacerse de varias formas:

- Sobrescribiendo estilos con archivos propios.
- Creando parciales o ajustes de tema si el proyecto crece.
- Cambiando contenido, orden de páginas o metadatos desde `_config.yml`.

Si el blog necesita una identidad visual más marcada, se puede migrar a un tema más completo o extender la apariencia actual con CSS personalizado.

## 🧱 Contenido incluido hoy

### 🏠 Página de inicio

La página principal da la bienvenida y presenta el enfoque del blog como un espacio colectivo de tecnología. Ahora incluye un tono más editorial y una estructura visual más cuidada.

### ℹ️ Página Acerca de

La página `about.md` resume la historia del proyecto y presenta a los autores con una descripción breve de sus áreas.

### 📰 Posts de ejemplo

El blog ya incluye tres artículos listos para ver:

- [blog-tech/_posts/2026-08-01-bienvenida-bitacora-tech.md](blog-tech/_posts/2026-08-01-bienvenida-bitacora-tech.md)
- [blog-tech/_posts/2026-08-02-que-es-jekyll-y-por-que-usarlo.md](blog-tech/_posts/2026-08-02-que-es-jekyll-y-por-que-usarlo.md)
- [blog-tech/_posts/2026-08-03-herramientas-para-publicar-con-github-pages.md](blog-tech/_posts/2026-08-03-herramientas-para-publicar-con-github-pages.md)

## 🔧 Mantenimiento recomendado

Para que el proyecto se mantenga ordenado a medida que crece, conviene seguir estas prácticas:

- Mantener coherencia en el nombre de los archivos de post.
- Revisar que cada nuevo autor exista en `_config.yml` antes de usarlo en un post.
- Probar el sitio en local antes de publicar.
- Verificar `url` y `baseurl` antes de desplegar.
- Revisar enlaces internos después de cambios en páginas o rutas.

## 🧪 Solución de problemas frecuentes

### El sitio no se abre en `http://localhost:4000`

- Verifica que Jekyll siga corriendo.
- Comprueba que no haya otro proceso usando el puerto 4000.
- Revisa los logs con `docker compose logs -f` si usas Docker.

### Un post no aparece

- Asegúrate de que el archivo esté dentro de `blog-tech/_posts/`.
- Revisa que el nombre del archivo siga el formato `AAAA-MM-DD-titulo.md`.
- Comprueba que el front matter esté bien cerrado y que no falten comillas.

### El diseño se ve distinto al esperado

- Revisa que `_config.yml` contenga los valores correctos.
- Comprueba que no haya errores de sintaxis en el YAML.
- Prueba regenerar el sitio con `bundle exec jekyll build` o `docker compose up --build`.

## 📜 Licencia

Si el proyecto va a publicarse de forma abierta, conviene agregar una licencia explícita en el repositorio para dejar claro cómo se puede reutilizar el contenido y el código.

## 🚀 Próximos pasos sugeridos

- Añadir más artículos y autores.
- Mejorar la identidad visual con estilos propios.
- Configurar un dominio personalizado en GitHub Pages.
- Preparar una rama de despliegue y un flujo de revisión más formal si el proyecto crece.