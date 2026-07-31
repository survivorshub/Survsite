# Bitácora Tech 🚀

Blog colectivo de tecnología escrito por un grupo de amigos, cada uno desde su especialidad: frontend, ciberseguridad, IA y hardware/gaming.

## 📂 Estructura

```
blog-tech/
├── _config.yml       # Configuración del sitio y lista de autores
├── Gemfile            # Dependencias de Ruby/Jekyll
├── index.md           # Página de inicio
├── about.md            # Página "Acerca de" con los autores
└── _posts/             # Artículos del blog (uno por archivo)
```

## 🛠 Instalación local (opcional, para probar antes de subir)

1. Instala Ruby y Bundler.
2. Dentro de la carpeta del proyecto, ejecuta:
   ```
   bundle install
   bundle exec jekyll serve
   ```
3. Abre `http://localhost:4000` en tu navegador.

## 🌐 Publicar en GitHub Pages (gratis)

1. Crea un repositorio en GitHub llamado `tu-usuario.github.io`.
2. Sube todo el contenido de esta carpeta a la raíz del repositorio.
3. Ve a **Settings → Pages** y selecciona la rama `main` (carpeta raíz) como fuente.
4. En unos minutos tu blog estará en `https://tu-usuario.github.io`.

## ✍️ Cómo agregar un nuevo post

1. Crea un archivo en `_posts/` con el formato: `AAAA-MM-DD-titulo-del-post.md`
2. Usa este encabezado (front matter) al inicio del archivo:
   ```yaml
   ---
   layout: post
   title: "Tu título aquí"
   date: 2026-08-01 10:00:00 -0400
   author: tu_clave_de_autor   # debe existir en _config.yml
   categories: [categoria1, categoria2]
   tags: [tag1, tag2]
   ---
   ```
3. Escribe el contenido en Markdown debajo del encabezado.

## 👥 Cómo agregar un nuevo autor/amigo

Edita `_config.yml` y añade una nueva entrada dentro de `authors:` con su nombre y bio. Luego actualiza `about.md` con su sección.

## 🎨 Personalización

El tema base es **Minima**. Puedes cambiar colores, tipografía y layout creando archivos en una carpeta `_sass/` o sobrescribiendo el tema. Si quieres algo más visual, considera temas como `jekyll-theme-chirpy` (orientado a blogs técnicos).
