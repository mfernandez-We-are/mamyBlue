{% set categories_title = settings.categories_title %}
{% set categories_subtitle = settings.categories_subtitle %}
{% if settings.slider_categories and settings.slider_categories is not empty %}
	<section class="section-home section-categories-home{% if settings.main_categories_colors or has_categories_background_image or has_categories_mobile_background_image %} section-home-color{% endif %} position-relative overflow-none" data-store="home-categories-featured" data-transition="fade-in">
		<div class="container-fluid px-0 px-md-2 py-3">
			<div class="row mx-0">

				{% if categories_title %}
					<div class="col-12 text-center">
						<h3 class="home-categories-title">{{ categories_title|upper }}</h3>

						{% if categories_subtitle %}
							<h4 class="home-categories-subtitle">{{ categories_subtitle }}</h4>
						{% endif %}
					</div>
				{% endif %}

				<div class="col-12 px-0 px-md-4">
					<div class="js-swiper-categories swiper-container">
						<div class="swiper-wrapper">

							{% for slide in settings.slider_categories %}
								{% set has_description = slide.description is defined and slide.description %}
								{# Texto del botón con fallback #}
								
								<div class="swiper-slide">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}"
										   class="home-category-card js-home-category d-flex flex-column align-items-center text-center{% if has_description %} has-description{% endif %}"
										   aria-label="{{ slide.title ?: ('Categoría ' ~ loop.index) }}">
									{% else %}
										<div class="home-category-card d-flex flex-column align-items-center text-center{% if has_description %} has-description{% endif %}">
									{% endif %}

											<div class="home-category-card-inner">

												{# IMAGEN base #}
												<div class="home-category-card-image">
													<img
														src="{{ 'images/empty-placeholder.png' | static_url }}"
														data-src="{{ slide.image | static_url | settings_image_url('medium') }}"
														class="lazyload img-fluid"
														alt="{{ slide.title ?: ('Categoría ' ~ loop.index) }}">
													<div class="placeholder-fade"></div>
												</div>

												{# CARA DEL FRENTE: título + botón sobre la imagen #}
												{% if slide.title or slide.link %}
													<div class="home-category-card-front">
														{% if slide.title %}
															<h3 class="home-category-card-title mb-2">
																{{ slide.title }}
															</h3>
														{% endif %}
														{% if has_description %}
															<p class="home-category-card-description mb-3 d-md-none">
																{{ slide.description }}
															</p>
														{% endif %}

														{% if slide.link %}
															<span class="btn btn-primary home-category-card-btn">
																{{ slide.button }}
															</span>
														{% endif %}
													</div>
												{% endif %}

												{# CARA TRASERA: fondo gris oscuro con descripción + mismo botón #}
												{% if has_description or slide.link %}
													<div class="home-category-card-overlay">
														{% if has_description %}
															<p class="home-category-card-description mb-3">
																{{ slide.description }}
															</p>
														{% endif %}

														{% if slide.link %}
															<span class="btn btn-primary home-category-card-btn">
																{{ slide.button }}
															</span>
														{% endif %}
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
				</div>

				<div class="swiper-buttons py-0">
					<div class="js-swiper-categories-control js-swiper-categories-prev swiper-button-prev">
						{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-sm "} %}
					</div>
					<div class="js-swiper-categories-control js-swiper-categories-next swiper-button-next">
						{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-sm "} %}
					</div>
				</div>

				{# <div class="swiper-pagination js-swiper-categories-pagination"></div> #}
			</div>
		</div>
	</section>
{% endif %}

