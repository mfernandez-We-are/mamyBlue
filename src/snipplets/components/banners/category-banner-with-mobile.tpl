{% set image_sizes = ['small', 'large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set current_category = current_category | default(category) %}
{% set has_category_images = current_category.images is not empty %}

<div class="container-fluid row mx-0 px-0 d-md-none">
  {% set no_subcat_images = true %}

  {# Nombre de la categoría actual y del padre, normalizados #}
  {% set cat_name = current_category.name|lower|trim %}
  {% set parent_name = current_category.parent ? current_category.parent.name|lower|trim : '' %}

  {% for image in settings.plp_subcategory_images %}
    {% set title = image.title|lower|trim %}


    {% if parent_name and title == parent_name ~ ' > ' ~ cat_name %}
      <div class="subcategory-banner col px-0 px-md-2">
        <a href="{{ image.link }}">
          <div class="subcategory-nav position-relative mb-2" data-store="subcategory-banner">
            <img
              class="lazyautosizes lazyload blur-up position-relative w-100"
              src="{{ 'images/empty-placeholder.png' | static_url }}"
              data-srcset="
                {{ image.image | static_url | settings_image_url('huge') }} 480w,
                {{ image.image | static_url | settings_image_url('huge') }} 640w,
                {{ image.image | static_url | settings_image_url('original') }} 1024w,
                {{ image.image | static_url | settings_image_url('1080p') }} 1920w
              "
              data-sizes="auto"
              alt="{{ 'Banner de la categoría' | translate }} {{ image.description }}"
            />
          </div>
        </a>
      </div>
      {% set no_subcat_images = false %}
    
    
    {% elseif no_subcat_images and title == cat_name %}
      <div class="subcategory-banner col px-0 px-md-2">
        <a href="{{ image.link }}">
          <div class="subcategory-nav position-relative mb-2" data-store="subcategory-banner">
            <img
              class="lazyautosizes lazyload blur-up position-relative w-100"
              src="{{ 'images/empty-placeholder.png' | static_url }}"
              data-srcset="
                {{ image.image | static_url | settings_image_url('huge') }} 480w,
                {{ image.image | static_url | settings_image_url('huge') }} 640w,
                {{ image.image | static_url | settings_image_url('original') }} 1024w,
                {{ image.image | static_url | settings_image_url('1080p') }} 1920w
              "
              data-sizes="auto"
              alt="{{ 'Banner de la categoría' | translate }} {{ image.description }}"
            />
          </div>
        </a>
      </div>
      {% set no_subcat_images = false %}
    {% endif %}
  {% endfor %}

  {% if no_subcat_images %}
    <div class="col px-0">
      {% include 'snipplets/components/banners/category-banner.tpl' with { current_category: current_category } %}
    </div>
  {% endif %}
</div>

<div class="container-fluid row mx-0 px-0 d-none d-md-block">
	<div class="col px-0">
		{% include 'snipplets/components/banners/category-banner.tpl' with { current_category: current_category } %}
	</div>
</div>
