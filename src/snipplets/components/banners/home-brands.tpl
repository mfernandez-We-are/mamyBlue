{% set brands_container_classes = 'swiper-slide slide-container' %}
{% if settings.category_brands_images and settings.category_brands_images is not empty %}
{% set brands = settings.category_brands_images %}
{% set brands = brands|merge(settings.category_brands_images) %}

{% set texto_en_marcas = settings.titulo_en_marcas | default(false) %}
{% set brand_title = settings.brand_title %}
{% set brand_text = settings.brand_text %}


	<section class="section-home section-brands-home my-3 py-3 my-md-5 py-md-5" data-store="home-brands">
		<div class="container-fluid px-0">
			<div class="row mx-0">
			{% if texto_en_marcas %}
				<div class="col-12 text-center mb-4">
					<h2 class="home-pillars-title">{{ brand_title }}</h2>
					<p class="home-pillars-text-header" >{{ brand_text }}</p>
				</div>
			{% endif %}
				<div class="col-12 px-0">
					<div class="js-swiper-brands swiper-container">
						<div class="js-swiper-brands-wrapper swiper-wrapper">
							{% for slide in brands %}
								<div class="{{ brands_container_classes }} brand-image-container text-center">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" title="{{slide.title}}" aria-label="{{slide.title}}">
										{% endif %}
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class=" img-fluid w-100 lazyload brand-image" alt="{{slide.title}}">
										{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
