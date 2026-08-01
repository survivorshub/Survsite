---
layout: post
title: "Herramientas útiles para publicar con GitHub Pages"
date: 2026-08-03 10:00:00 +0000
author: mario
categories: [devops]
tags: [github-pages, git, deployment]
---

Publicar un sitio con GitHub Pages es una forma muy práctica de dar visibilidad a un proyecto sin depender de servicios complejos. Cuando el objetivo es compartir contenido de forma rápida y con poco mantenimiento, esta opción suele ser una de las más equilibradas.

![Flujo de publicación](https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=80)

## Herramientas que hacen la diferencia

Para trabajar de forma cómoda, conviene tener claro un pequeño conjunto de herramientas:

- Git para gestionar cambios.
- Markdown para escribir contenido.
- Jekyll para generar el sitio.
- GitHub Pages para desplegarlo.

## Un flujo de trabajo limpio

Antes de publicar, es recomendable probar el sitio localmente. Esto permite detectar errores de formato, enlaces rotos o problemas de navegación antes de que lleguen al entorno público.

```bash
git checkout main
git pull origin main
git checkout -b feat/nuevo-post
```

Con un flujo simple de ramas, commits y Pull Requests, mantener el blog en línea se vuelve mucho más ordenado y seguro.
