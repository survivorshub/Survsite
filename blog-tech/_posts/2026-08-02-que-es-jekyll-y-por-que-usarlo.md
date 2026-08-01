---
layout: post
title: "¿Qué es Jekyll y por qué lo usamos?"
date: 2026-08-02 10:00:00 +0000
author: juanjo
categories: [desarrollo]
tags: [jekyll, static-site, github-pages]
---

Jekyll es un generador de sitios estáticos muy popular entre quienes quieren publicar contenido de forma sencilla y rápida.

![Arquitectura de Jekyll](https://images.unsplash.com/photo-1516321497487-e288fb19713f?auto=format&fit=crop&w=1200&q=80)

Una de sus grandes ventajas es que convierte archivos en Markdown y YAML en una web estática lista para desplegar. Esto lo hace ideal para blogs, documentación y sitios pequeños con contenido que no necesita una base de datos compleja.

## ¿Por qué lo elegimos?

- es simple de mantener,
- funciona muy bien con GitHub Pages,
- permite publicar contenido con un flujo claro,
- y reduce la complejidad técnica respecto a sistemas más pesados.

## Un flujo muy productivo

Con Jekyll, el proceso de publicación se vuelve bastante directo: escribes el contenido en Markdown, agregas el front matter y el sitio se genera automáticamente.

```yaml
---
layout: post
title: "Mi artículo"
date: 2026-08-01 10:00:00 +0000
categories: [desarrollo]
---
```

Este enfoque encaja muy bien con un proyecto colaborativo, porque separa el contenido de la lógica de presentación y facilita el mantenimiento a largo plazo.
