---
layout: home
---

<div class="hero-card">
  <p class="eyebrow">Blog colectivo de tecnología</p>
  <h1>Una bitácora más viva, más elegante y más útil para explorar el mundo tech.</h1>
  <p>Somos un grupo de personas compartiendo lo que aprendemos sobre desarrollo, IA, ciberseguridad, hardware, gaming y nuevas herramientas. Cada entrada está pensada para ser clara, práctica y cercana.</p>
  <div class="hero-actions">
    <a class="button primary" href="#posts">Leer artículos</a>
    <a class="button secondary" href="{{ '/about/' | relative_url }}">Conocer el proyecto</a>
  </div>
</div>

<div class="feature-grid">
  <div class="feature-card">
    <h3>✍️ Contenido práctico</h3>
    <p>Artículos con enfoque claro, ejemplos reales y una lectura ágil.</p>
  </div>
  <div class="feature-card">
    <h3>🧠 Miradas diversas</h3>
    <p>Cada autor aporta una perspectiva distinta: desarrollo, datos, seguridad y más.</p>
  </div>
  <div class="feature-card">
    <h3>🚀 Listo para publicar</h3>
    <p>El blog está preparado para funcionar localmente y para publicarse con GitHub Pages.</p>
  </div>
</div>

<div class="section-card">
  <h2>🧭 Temas destacados</h2>
  <div class="topics-grid">
    <span>Desarrollo web</span>
    <span>Inteligencia artificial</span>
    <span>DevOps</span>
    <span>Seguridad</span>
    <span>Hardware</span>
    <span>Gaming</span>
  </div>
</div>

<div class="section-card" id="posts">
  <h2>📰 Últimos posts</h2>
  <div class="post-grid">
    {% assign recent_posts = site.posts | slice: 0, 3 %}
    {% for post in recent_posts %}
      <article class="post-card">
        <p class="post-card-meta">{{ post.date | date: "%d %b %Y" }}</p>
        <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
        <p>{{ post.excerpt | strip_html | truncatewords: 24 }}</p>
      </article>
    {% endfor %}
  </div>
</div>
