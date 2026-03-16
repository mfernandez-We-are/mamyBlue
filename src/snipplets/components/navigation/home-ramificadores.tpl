{# home-ramificadores.tpl #}

{# Solo mobile #}
<div class="d-md-none ramificadores-wrapper py-0 mt-3">
  <div class="container-fluid px-0">
    <div class="ramificadores-list js-swiper-ramificadores swiper-container">
      <div class="swiper-wrapper">

        {# ITEM 1 #}
        {% if settings.text1_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text1_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_1_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_1_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text1_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

        {# ITEM 2 #}
        {% if settings.text2_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text2_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_2_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_2_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text2_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

        {# ITEM 3 #}
        {% if settings.text3_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text3_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_3_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_3_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text3_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

        {# ITEM 4 #}
        {% if settings.text4_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text4_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_4_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_4_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text4_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

        {# ITEM 5 #}
        {% if settings.text5_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text5_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_5_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_5_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text5_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

        {% if settings.text6_url %}
          <div class="swiper-slide">
            <a href="{{ settings.text6_url ?: '#' }}" class="ramificadores-link">
              <img
                src="{{ 'images/empty-placeholder.png' | static_url }}"
                data-srcset="
                  {{ 'img_6_ramifi_mobile.jpg' | static_url | settings_image_url('large') }} 768w,
                  {{ 'img_6_ramifi_mobile.jpg' | static_url | settings_image_url('1080p') }} 1920w
                "
                data-sizes="auto"
                class="lazyload lazyautosizes ramificadores-img"
                alt="{{ settings.text6_title ?: '' }}"
              >
            </a>
          </div>
        {% endif %}

      </div>

      {# Chevrons navegación #}
      <div class="js-swiper-ramificadores-prev swiper-button-prev ramificadores-nav-btn">
        {% include "snipplets/svg/chevron-left.tpl" with { svg_custom_class: "icon-inline icon-w-8 icon-lg" } %}
      </div>
      <div class="js-swiper-ramificadores-next swiper-button-next ramificadores-nav-btn">
        {% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "icon-inline icon-w-8 icon-lg" } %}
      </div>
    </div>
  </div>
</div>

<style>
  @media (max-width: 767.98px) {
    .ramificadores-list {
      position: relative;
      width: 100%;
    }

    .ramificadores-img {
      display: block;
      width: 140px;
      height: 107px;
      aspect-ratio: 140 / 107;
    }

    .ramificadores-nav-btn {
      position: absolute;
      top: 50%;
      transform: translateY(50%);
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background: #fff;
      box-shadow: 0 1px 4px rgba(0,0,0,.35);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 5;
      opacity: 0.5;
    }

    .js-swiper-ramificadores-prev {
      left: 0;
    
    }

    .js-swiper-ramificadores-next {
      right: 0;
    }

    .ramificadores-nav-btn svg {
      width: 14px;
      height: 14px;
    }
  }
</style>
