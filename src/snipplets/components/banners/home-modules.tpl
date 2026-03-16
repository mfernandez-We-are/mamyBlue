{% set module_img =  module_img | default(false) %}
{% set module_hover_img =  module_hover_img | default(false) %}
{% set module_url = module_url | default(false) %}

{% set module_img_mobile =  module_img_mobile | default(false) %}
{% set module_hover_img_mobile =  module_hover_img_mobile | default(false) %}
{% set module_url_mobile = module_url_mobile | default(false) %}

{% set has_image = module_img and (module_img | has_custom_image)  %}
{% set has_hover_image = module_hover_img and (module_hover_img | has_custom_image)  %}

{% set has_image_mobile = module_img_mobile and (module_img_mobile | has_custom_image)  %}
{% set has_hover_image_mobile = module_hover_img_mobile and (module_hover_img_mobile | has_custom_image)  %}

<section class="section-home-modules" data-store="home-image-text-module">
	{% if has_image %}
		<div class="{% if has_image_mobile %}d-none d-md-block {% endif %}container-fluid p-0">
			{% if module_url %}
				<a class="module-with-text-link w-100" href="{{ module_url | setting_url }}" title="{{ 'Módulo de' | translate }} {{ store.name }}" aria-label="{{ 'Módulo de' | translate }} {{ store.name }}">
				{% endif %}
				<div class="row no-gutters align-items-center">
					<div class="col-12">
						<div class="textbanner mb-0">
							<div {% if has_hover_image %} class="textbanner-image-with-hover" {% endif %}>
								<img class="{% if has_hover_image %}textbanner-image-primary {% endif %} w-100 img-fluid lazyautosizes lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" srcset='{{ module_img | static_url | settings_image_url('large') }} 480w, {{ module_img | static_url | settings_image_url('huge') }} 640w, {{ module_img | static_url | settings_image_url('1080p') }} 1200w' data-sizes="auto" alt="{{ 'Módulo de' | translate }} {{ store.name }}" data-expand="-10"/>
								{% if has_hover_image %}
									<img class="textbanner-image-secondary w-100 img-fluid lazyautosizes lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" srcset='{{ module_hover_img | static_url | settings_image_url('large') }} 480w, {{ module_hover_img | static_url | settings_image_url('huge') }} 640w, {{ module_hover_img | static_url | settings_image_url('1080p') }} 1200w' data-sizes="auto" alt="{{ 'Módulo de' | translate }} {{ store.name }}" data-expand="-10"/>
								{% endif %}
							</div>
						</div>
					</div>
					{% if module_url %}
					</div>
					
				</a>
			{% endif %}
		</div>
	{% endif %}
	{% if has_image_mobile %}
		<div class="d-md-none container-fluid p-0">
			{% if module_url_mobile %}
				<a class="module-with-text-link w-100" href="{{ module_url_mobile | setting_url }}" title="{{ 'Módulo de' | translate }} {{ store.name }}" aria-label="{{ 'Módulo de' | translate }} {{ store.name }}">
				{% endif %}
				<div class="row no-gutters align-items-center">
					<div class="col-12">
						<div class="textbanner mb-0">
							<div {% if has_hover_image_mobile %} class="textbanner-image-with-hover" {% endif %}>
								<img class="{% if has_hover_image_mobile %}textbanner-image-primary {% endif %} w-100 img-fluid lazyautosizes lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" srcset='{{ module_img_mobile | static_url | settings_image_url('large') }} 480w' data-sizes="auto" alt="{{ 'Módulo de' | translate }} {{ store.name }}" data-expand="-10"/>
								{% if has_hover_image_mobile %}
									<img class="textbanner-image-secondary w-100 img-fluid lazyautosizes lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" srcset='{{ module_hover_img_mobile | static_url | settings_image_url('large') }} 480w' data-sizes="auto" alt="{{ 'Módulo de' | translate }} {{ store.name }}" data-expand="-10"/>
								{% endif %}
							</div>
						</div>
					</div>
					{% if module_url_mobile %}
					</div>
				</a>
			{% endif %}
		</div>
	{% endif %}
</section>
