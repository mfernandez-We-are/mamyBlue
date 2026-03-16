

{# URLs finales (ajustá el tamaño si querés otra variante) #}
{% set hero_bg_desktop = hero_image_desktop
  ? (hero_image_desktop | static_url | settings_image_url('1080p'))
  : false
%}

{% set hero_bg_mobile = hero_image_mobile
  ? (hero_image_mobile | static_url | settings_image_url('1080p'))
  : hero_bg_desktop
%}

{# Textos #}
{% set hero_title      = settings.banner_hero_title | default(false) %}
{% set hero_text_1     = settings.banner_hero_primer_parrafo | default(false) %}
{% set hero_text_2     = settings.banner_hero_segundo_parrafo | default(false) %}

{# Botones #}
{% set hero_btn1_text  = settings.banner_hero_primer_boton_text | default(false) %}
{% set hero_btn1_url   = settings.banner_hero_primer_boton_url  | default(false) %}
{% set hero_btn2_text  = settings.banner_hero_segundo_boton_text | default(false) %}
{% set hero_btn2_url   = settings.banner_hero_segundo_boton_url  | default(false) %}

{# ¿Hay algo para mostrar aunque no haya imagen? #}
{% set has_any_content =
  hero_title or hero_text_1 or hero_text_2 or hero_btn1_text or hero_btn2_text
%}

{% if hero_bg_desktop or has_any_content %}
<section class="home-hero-banner container-fluid p-2 p-md-5 mb-5">
  {# Imagen de fondo con picture + lazyload #}
  <picture class="hero-banner-bg">
    <source
      media="(min-width: 992px)"
      data-srcset="
        {{ 'hero_banner_image_desktop.jpg' | static_url | settings_image_url('1080p') }} 1920w,
        {{ 'hero_banner_image_desktop.jpg' | static_url | settings_image_url('huge') }} 1366w
      ">
    <img
      src="{{ 'images/empty-placeholder.png' | static_url }}"
      data-srcset="
        {{ 'hero_banner_image_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
        {{ 'hero_banner_image_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
      "
      data-sizes="auto"
      class="lazyload lazyautosizes"
      alt=""
      aria-hidden="true">
  </picture>

  <div class="container-fluid">
    <div class="hero-banner-content d-flex flex-column align-items-start">

      {% if hero_title %}
 
      <h1 class="hero-banner-title mt-5 mt-md-2 ">
        {{ hero_title | raw }}
      </h1>
    {% endif %}


      {% if hero_text_1 %}
        <p class="hero-banner-text mt-md-5 mb-md-3">
          {{ hero_text_1 }}
        </p>
      {% endif %}

      {% if hero_text_2 %}
        <p class="hero-banner-text-secondary">
          {{ hero_text_2 }}
        </p>
      {% endif %}
        </div>
      {% if hero_btn1_text or hero_btn2_text %}
        <div class="hero-banner-buttons-container d-flex flex-column flex-md-row mt-md-5">
          {% if hero_btn1_text %}
            <a href="{{ hero_btn1_url }}"
               class="btn hero-banner-button mr-0 mb-2 mr-md-3 mb-md-0">
              {{ hero_btn1_text }}
            </a>
          {% endif %}

          {% if hero_btn2_text %}
            <a href="{{ hero_btn2_url }}"
               class="btn hero-banner-button">
              {{ hero_btn2_text }}
            </a>
          {% endif %}
        </div>
      {% endif %}

    
  </div>
</section>
{% endif %}
