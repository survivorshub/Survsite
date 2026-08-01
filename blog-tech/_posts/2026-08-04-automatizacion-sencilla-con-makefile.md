---
layout: post
title: "Automatización sencilla con Makefile"
date: 2026-08-04 10:00:00 +0000
author: mauro
categories: [devops]
tags: [make, automatizacion, productividad]
---

Cuando un proyecto tiene varios pasos repetitivos, una pequeña automatización puede ahorrar mucho tiempo. En este tipo de casos, un Makefile suele ser una solución ligera, clara y muy práctica.

No hace falta montar una infraestructura compleja para empezar. Con unas pocas reglas definidas, puedes centralizar tareas como instalar dependencias, ejecutar pruebas o construir el sitio.

## ¿Por qué usar Make?

Un Makefile ayuda a:

- reducir errores humanos al repetir comandos;
- facilitar la ejecución de tareas comunes;
- mantener un flujo consistente entre personas del equipo;
- simplificar la documentación del proceso.

## Ejemplo breve

```make
run:
	bundle exec jekyll serve
```

Con una sola orden, el entorno queda listo para trabajar. A veces, la mejor automatización es la más sencilla.
