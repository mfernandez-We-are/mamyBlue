{% set mostrar_titulo_landing = settings.mostrar_titulo_landing | default(false) %}
{% set mostrar_texto_landing = settings.mostrar_texto_landing | default(false) %}
{% set landing_title = settings.landing_title %}
{% set landing_text = settings.landing_texto %}
{% set landing_slides = settings.slider_landing %}
{% set landing_slides_mobile = settings.slider_landing_mobile %}
{% set has_mobile_slides = landing_slides_mobile and landing_slides_mobile is not empty %}

{% if landing_slides and landing_slides is not empty %}
<section class="section-home my-3 py-3 my-md-5 py-md-5 section-landing-home{% if settings.main_landing_colors or has_landing_background_image or has_landing_mobile_background_image %} section-home-color{% endif %} position-relative mt-1 mt-md-4"
         data-store="home-landing-featured"
         data-transition="fade-in">

  <div class="container-fluid px-0 px-md-2">

    {% if mostrar_titulo_landing  %}
      <div class="row mx-0">
        <div class="col-12 text-center">
          <h2 class="home-pillars-title mb-4">
            {{ landing_title|upper }}
          </h2>
            {% if mostrar_texto_landing  %}
              <p class="home-pillars-text-header mb-4">
                {{ landing_text }}
              </p>
          {% endif %} 
        </div>
      </div>
    {% endif %}

  

    {# --- MOBILs --- #}
    {% if has_mobile_slides %}
      <div class="row mx-0 d-md-none">
        {% for slide in landing_slides_mobile %}
            <div class="col-12 px-1 mb-2">

            {% if slide.link %}
              <a href="{{ slide.link | setting_url }}" class="d-block landing-item" aria-label="Landing mobile {{ loop.index }}">
            {% else %}
              <div class="d-block landing-item" aria-label="Landing mobile {{ loop.index }}">
            {% endif %}

              <div class="landing-card position-relative">

                {% if slide.title %}
                  <div class="landing-card-top">
                    {{ slide.title }}
                  </div>
                {% endif %}

                <img
                  src="{{ 'images/empty-placeholder.png' | static_url }}"
                  data-src="{{ slide.image | static_url | settings_image_url('large') }}"
                  class="lazyload img-fluid w-100 d-block"
                  alt="{% if slide.alt is defined and slide.alt %}{{ slide.alt }}{% elseif slide.title %}{{ slide.title }}{% else %}{{ landing_title ?: 'Landing mobile' }} {{ loop.index }}{% endif %}"
                >

                {% if slide.button %}
                  <div class="landing-card-bottom">
                    <span class="landing-card-btn">
                      {{ slide.button }}
                    </span>
                  </div>
                {% endif %}

              </div>

            {% if slide.link %}
              </a>
            {% else %}
              </div>
            {% endif %}

          </div>
        {% endfor %}
      </div>
    {% endif %}

    {# --- DESKTOP --- #}
    <div class="row mx-0 {% if has_mobile_slides %}d-none d-md-flex{% endif %}">
      {% for slide in landing_slides %}
        <div class="col-12 col-md-3 px-1 px-md-2 mb-3">

          {% if slide.link %}
            <a href="{{ slide.link | setting_url }}" class="d-block landing-item" aria-label="Landing {{ loop.index }}">
          {% else %}
            <div class="d-block landing-item" aria-label="Landing {{ loop.index }}">
          {% endif %}

            <div class="landing-card position-relative">

              {% if slide.title %}
                <div class="landing-card-top">
                  {{ slide.title }}
                </div>
              {% endif %}

              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-src="{{ slide.image | static_url | settings_image_url('large') }}"
                class="lazyload img-fluid w-100 d-block"
                alt="{% if slide.alt is defined and slide.alt %}{{ slide.alt }}{% elseif slide.title %}{{ slide.title }}{% else %}{{ landing_title ?: 'Landing' }} {{ loop.index }}{% endif %}"
              >

              {% if slide.button %}
                <div class="landing-card-bottom">
                  <span class="landing-card-btn">
                    {{ slide.button }}
                  </span>
                </div>
              {% endif %}

            </div>

          {% if slide.link %}
            </a>
          {% else %}
            </div>
          {% endif %}

        </div>
      {% endfor %}
    </div>

  </div>
</section>
{% endif %}
