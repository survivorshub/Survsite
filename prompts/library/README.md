# Librería de prompts útiles

Esta carpeta reúne prompts reutilizables para trabajar sobre el proyecto de forma segura, verificable y alineada con el flujo de Pull Requests.

## Prompts incluidos

- [change-with-safety.md](change-with-safety.md): para introducir cambios pequeños y seguros.
- [pr-safe-merge.md](pr-safe-merge.md): para llevar un cambio a main mediante PR con validación previa.
- [content-post.md](content-post.md): para añadir o editar contenido sin romper la estructura del blog.
- [docs-and-readme.md](docs-and-readme.md): para actualizar documentación sin introducir inconsistencias.
- [change-theme.md](change-theme.md): para cambiar el tema del sitio pidiendo solo preferencias generales.

## Reglas comunes para todos los prompts

- revisar el estado actual del repositorio antes de cambiar nada;
- no modificar archivos innecesarios;
- validar los cambios con una comprobación real (por ejemplo, build o tests);
- asegurar que el resultado no rompe lo ya existente;
- dejar el cambio preparado para revisión mediante PR.
