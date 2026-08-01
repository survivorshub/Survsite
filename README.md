# 📝 Bitácora Tech

> Blog colectivo de tecnología construido con Jekyll, preparado para funcionar en local y publicarse en GitHub Pages.

Bitácora Tech reúne publicaciones de varias personas con intereses distintos dentro del mundo tech: desarrollo web, IA, ciberseguridad, hardware, gaming y más. El proyecto está pensado para ser fácil de mantener, claro de editar y cómodo para trabajar en equipo.

## 🧭 Índice rápido

- [Objetivo del proyecto](#-objetivo-del-proyecto)
- [Resumen del estado actual](#-resumen-del-estado-actual)
- [Requisitos e inicio rápido](#️-requisitos)
- [Configuración del sitio](#️-configuración-del-sitio)
- [Flujo real de trabajo](#-flujo-real-de-trabajo)
- [Publicar un nuevo post](#-publicar-un-nuevo-post-paso-a-paso)
- [GitHub Pages y despliegue](#-github-pages-y-despliegue)
- [Workflow de GitHub Actions](#-workflow-de-github-actions)
- [Lecciones aprendidas](#-lecciones-aprendidas)
- [Buenas prácticas](#-buenas-prácticas-para-mantener-el-proyecto)

## 🎯 Objetivo del proyecto

El objetivo es crear un espacio simple, mantenible y fácil de publicar para compartir contenido técnico en formato de blog. La idea es que cada autor aporte desde su área de experiencia, manteniendo una base común de navegación, estilo y despliegue.

## ✨ Qué incluye este proyecto

- 🌐 Un sitio estático generado con Jekyll.
- 🎨 Un tema base `minima`.
- 📡 Soporte para feeds RSS con `jekyll-feed`.
- 🔎 Metadatos SEO con `jekyll-seo-tag`.
- 📚 Paginación de entradas con `jekyll-paginate`.
- 👤 Configuración de autores desde `_config.yml`.
- 🐳 Un entorno reproducible con Docker y Docker Compose.
- 🚀 Un flujo de despliegue automático a GitHub Pages mediante GitHub Actions.
- ✅ Validaciones automáticas de contenido, dependencias y compilación.
- � Protección de rama para evitar pushes directos a `main`.
- 🔁 El despliegue solo ocurre cuando el cambio llega a `main` por PR y el workflow confirma que el commit está asociado a un PR.

## 📁 Estructura del repositorio

```text
Survsite/
├── .github/
│   └── workflows/
│       └── deploy-pages.yml
├── _config.yml
├── README.md
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── blog-tech/
│   ├── Gemfile
│   ├── Gemfile.lock
│   ├── _config.yml
│   ├── _includes/
│   ├── _layouts/
│   ├── _posts/
│   ├── about.md
│   ├── index.md
│   └── assets/
└── .cspell.json
```

### Archivos clave

- `_config.yml`: configuración global del sitio y del blog.
- `blog-tech/_config.yml`: configuración específica del contenido del blog.
- `blog-tech/index.md`: página de inicio.
- `blog-tech/about.md`: página de presentación del proyecto y del equipo.
- `blog-tech/Gemfile`: dependencias Ruby y Jekyll.
- `blog-tech/_posts/`: carpeta donde viven los artículos.
- `.github/workflows/deploy-pages.yml`: workflow de validación y despliegue.
- `.github/workflows/require-pr-for-main.yml`: guardado adicional para reforzar la política de ramas.

## 🛠️ Requisitos

Para trabajar con este proyecto necesitas:

- Git
- Docker y Docker Compose (recomendado)
- O bien Ruby + Bundler si prefieres trabajar sin contenedor

### Versión recomendada

- Ruby 3.2
- Bundler 2.x
- Node.js 22 para las tareas de validación ortográfica

## ▶️ Inicio rápido

### Opción A: con Docker (recomendada)

La forma más sencilla y reproducible para levantar el sitio localmente es esta:

```bash
cd /ruta/al/proyecto/Survsite
docker compose up --build
```

Después abre el navegador en:

```text
http://127.0.0.1:4000
```

Para detenerlo:

```bash
docker compose down
```

Para ver los logs:

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

Y visita:

```text
http://localhost:4000
```

### Comandos útiles

- `bundle install`: instala las dependencias del proyecto.
- `bundle exec jekyll serve`: levanta el sitio en modo desarrollo.
- `bundle exec jekyll build`: genera una compilación estática en `_site`.
- `docker compose up --build`: levanta el entorno completo con Docker.
- `make`: ejecuta la tarea de arranque definida en el Makefile.

## ⚙️ Configuración del sitio

El archivo `_config.yml` centraliza la mayoría de los valores globales. El contenido del blog vive bajo `blog-tech/` y usa su propia configuración en `blog-tech/_config.yml`.

### Autores

Los autores se definen en la sección `authors:`. Cada entrada debe incluir al menos:

- `name`
- `bio`

Ejemplo:

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

## ✍️ Cómo crear contenido

### Crear una nueva entrada

Cada post debe guardarse dentro de `blog-tech/_posts/` con este formato:

```text
AAAA-MM-DD-titulo-del-post.md
```

### Front matter mínimo

Cada entrada debe empezar con un bloque YAML como este:

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

### Reglas recomendadas

- El valor de `author` debe coincidir con una clave existente en `_config.yml`.
- Usa `categories` para agrupar temas generales.
- Usa `tags` para etiquetas más específicas.
- Mantén el contenido en Markdown y revisa enlaces internos antes de publicar.

### Ejemplo de post

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

## 🌟 Resumen del estado actual

Este repositorio ya está preparado para trabajar de forma segura y reproducible:

- el sitio se publica desde `main`;
- los cambios llegan por Pull Request;
- la rama `main` está protegida para evitar pushes directos;
- el workflow de despliegue comprueba que el commit de `main` esté asociado a un PR antes de seguir con la validación, el build y la publicación.

## 🔄 Flujo real de trabajo

Este proyecto usa un flujo claro, seguro y alineado con la configuración actual de GitHub.

### Ramas del proyecto

- `main`: rama de producción. Es la fuente de verdad para el sitio publicado.
- `feature/*`: ramas temporales para trabajar cambios concretos.

### Proceso recomendado

1. Crear una rama `feature/*` desde `main`.
2. Trabajar cambios pequeños y bien delimitados.
3. Hacer commits claros y descriptivos.
4. Abrir un Pull Request hacia `main`.
5. Esperar revisión, aprobación y que los checks del workflow pasen.
6. Fusionar el PR en `main`.
7. El workflow despliega automáticamente el sitio en GitHub Pages.

### Protección de rama

En GitHub conviene activar estas reglas sobre `main`:

- Require a pull request before merging.
- Require status checks to pass before merging.
- Do not allow bypassing the above settings.

Esto añade una capa adicional de seguridad frente a errores humanos o cambios directos sobre producción.

### Ejemplo de flujo local

```bash
git checkout main
git pull origin main
git checkout -b feature/nombre-del-cambio

# trabajar en los cambios

git add .
git commit -m "feat: describe el cambio"
git push -u origin feature/nombre-del-cambio
```

Después, abre un PR hacia `main` y sigue el flujo estándar de revisión.

## 🧭 Guía rápida para contribuir

Si vas a participar en el proyecto, sigue este flujo para que los cambios lleguen de forma ordenada:

1. Crear una rama `feature/*` desde `main`.
2. Trabajar cambios pequeños y bien delimitados.
3. Probar el sitio localmente antes de abrir el PR.
4. Abrir un Pull Request hacia `main`.
5. Esperar revisión y resolver comentarios si los hay.
6. Cuando todo esté listo, hacer merge del PR en `main`.

### Checklist antes de pedir revisión

- [ ] El sitio compila correctamente en local.
- [ ] Los cambios no han roto enlaces ni rutas.
- [ ] El contenido está bien redactado y sin errores obvios.
- [ ] El PR tiene título y descripción claros.
- [ ] Si se cambiaron posts, se han revisado los front matter y la ortografía.

### Diagrama del flujo de publicación

```text
Crear rama feature/*
        ↓
Abrir PR hacia main
        ↓
Revisión y aprobación
        ↓
Merge a main
        ↓
Workflow validate/build/deploy
```

### Plantilla recomendada para un PR

```text
## Qué cambia
- Describe brevemente los cambios introducidos.

## Por qué
- Explica el problema o la mejora que resuelve.

## Cómo se ha validado
- Indica si has probado el sitio localmente.
- Menciona comandos ejecutados o resultados obtenidos.
```

## 📝 Publicar un nuevo post paso a paso

Si quieres añadir una entrada nueva al blog, sigue este proceso:

1. Crear una rama `feature/*` desde `main`.
2. Crear un archivo nuevo en `blog-tech/_posts/` con el nombre `AAAA-MM-DD-titulo-del-post.md`.
3. Añadir el front matter mínimo con `layout`, `title`, `date`, `author`, `categories` y `tags`.
4. Escribir el contenido en Markdown.
5. Comprobar que el autor existe en `_config.yml`.
6. Probar el sitio localmente con `bundle exec jekyll build` o `docker compose up --build`.
7. Abrir un PR hacia `main` y, si todo está bien, fusionarlo para publicar.

### Ejemplo de publicación

```bash
cd /ruta/al/proyecto/Survsite
git checkout main
git pull origin main
git checkout -b feature/nuevo-post
cp blog-tech/_posts/2026-08-01-bienvenida-bitacora-tech.md blog-tech/_posts/2026-08-02-mi-nuevo-post.md
```

Luego editas el archivo nuevo con el contenido deseado y sigues el flujo habitual: commit, push, PR hacia main y merge una vez validado.

### Plantilla de front matter recomendada

```yaml
---
layout: post
title: "Título del post"
date: 2026-08-01 12:00:00 +0000
author: nombre-del-autor
categories: [general]
tags: [jekyll, github-pages]
---
```

### Checklist antes de publicar

- [ ] el archivo está en `blog-tech/_posts/` con el formato correcto;
- [ ] el front matter está bien cerrado y sin errores de sintaxis;
- [ ] el author existe en `_config.yml`;
- [ ] el contenido se ve bien en local;
- [ ] no hay errores visibles en la construcción del sitio;
- [ ] el PR describe claramente qué se publica y por qué.

## 🌐 GitHub Pages y despliegue

GitHub Pages sirve el sitio como contenido estático. En este proyecto, el contenido se compila con Jekyll y se publica automáticamente desde GitHub Actions cuando el cambio llega a `main` por Pull Request.

### Configuración recomendada en GitHub

En la sección Settings → Pages del repositorio:

- selecciona la opción `GitHub Actions` como fuente de despliegue;
- mantén `main` como rama de publicación;
- activa la protección de rama para que los cambios entren por PR y no por push directo.

### URL típica

Para un repositorio público, la URL suele tener este patrón:

```text
https://<usuario>.github.io/<nombre-del-repositorio>/
```

## 🚀 Workflow de GitHub Actions

El pipeline de despliegue está definido en [.github/workflows/deploy-pages.yml](.github/workflows/deploy-pages.yml) y reforzado con [.github/workflows/require-pr-for-main.yml](.github/workflows/require-pr-for-main.yml).

### Qué hace hoy el workflow

1. `verify-pr-context`
   - se ejecuta primero sobre `main`;
   - comprueba con la API de GitHub si el commit está asociado a un PR;
   - si no lo está, el workflow falla antes de continuar.

2. `validate`
   - instala Node.js 22;
   - ejecuta `cspell` sobre los posts en español;
   - instala las dependencias de Ruby/Bundler;
   - ejecuta `bundle exec jekyll doctor`;
   - compila el sitio con `bundle exec jekyll build --trace`.

3. `build`
   - prepara el artefacto estático para publicación en Pages.

4. `deploy`
   - publica el contenido generado en GitHub Pages mediante `actions/deploy-pages`.

### Permisos del workflow

El workflow usa estos permisos:

- `contents: read`
- `pages: write`
- `id-token: write`
- `pull-requests: read`

### Concurrencia

El workflow usa `concurrency` para evitar ejecuciones simultáneas innecesarias:

- `group: pages`
- `cancel-in-progress: true`

## 🧠 Lecciones aprendidas

Durante la configuración final del despliegue hemos aprendido varias cosas valiosas:

- el trigger más fiable para este flujo es el push real a `main`;
- es recomendable comprobar dentro del mismo workflow si el commit de `main` vino de un PR;
- la protección de rama en GitHub añade una barrera adicional muy útil frente a errores humanos;
- mantener los checks y la validación en el mismo run ayuda a detectar problemas antes de publicar.

## 🧪 Validación local recomendada antes de abrir un PR

Antes de pedir revisión, conviene comprobar al menos estas cosas:

```bash
cd blog-tech
bundle exec jekyll build
```

Y si quieres una verificación rápida del contenido:

```bash
npx cspell --config ../.cspell.json --no-progress --words-only --locale es "_posts/**/*.md"
```

## 🧰 Solución de problemas frecuentes

### El sitio no se abre en `http://localhost:4000`

- verifica que Jekyll siga corriendo;
- comprueba que no haya otro proceso usando el puerto 4000;
- revisa los logs con `docker compose logs -f` si usas Docker;
- prueba a reconstruir el contenedor con `docker compose up --build`.

### Un post no aparece

- asegúrate de que el archivo esté dentro de `blog-tech/_posts/`;
- revisa que el nombre del archivo siga el formato `AAAA-MM-DD-titulo.md`;
- comprueba que el front matter esté bien cerrado y que no falten comillas;
- verifica que el valor de `author` exista en `_config.yml`.

### El despliegue no funciona

- revisa la pestaña Actions del repositorio;
- comprueba que el workflow haya pasado en `main`;
- confirma que en GitHub Pages la fuente sea `GitHub Actions`;
- verifica que el workflow tenga permisos adecuados para Pages;
- revisa si el merge se hizo realmente sobre `main` y si el push asociado llegó correctamente.

### El workflow falla en `cspell`

- comprueba que los archivos de post estén en la ruta esperada;
- revisa si hay palabras no reconocidas y, si procede, añádelas a `.cspell.json`;
- vuelve a ejecutar el comando localmente para ver el detalle exacto.

## 🧭 Buenas prácticas para mantener el proyecto

- mantener mensajes de commit claros;
- abrir PR pequeños y bien descritos;
- probar el sitio antes de fusionar a `main`;
- no trabajar directamente sobre `main`;
- revisar ortografía y enlaces antes de publicar;
- usar PRs para cualquier cambio que afecte al despliegue o la publicación.

## 🚀 Próximos pasos sugeridos

- añadir más artículos y autores;
- mejorar la identidad visual con estilos propios;
- configurar un dominio personalizado en GitHub Pages;
- ampliar la validación con enlaces rotos o previews automáticas.
