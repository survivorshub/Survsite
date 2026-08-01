# Prompt: llevar un cambio a main vía PR de forma segura

Usa este prompt cuando quieras que un cambio llegue a main a través de un Pull Request, con validación previa y sin romper el comportamiento actual.

## Prompt

Lleva este cambio a main mediante un Pull Request, siguiendo el flujo habitual del repositorio.

Requisitos:
- crea una rama de trabajo desde main;
- implementa el cambio de forma incremental y limitada;
- ejecuta una comprobación real antes de abrir el PR;
- asegúrate de que el cambio no rompe la compilación ni el contenido existente;
- sube la rama al remoto y abre un PR hacia main;
- deja el cambio listo para revisión.

## Resultado esperado

- un branch con el cambio;
- un PR abierto contra main;
- comprobación previa realizada y sin regresiones evidentes.
