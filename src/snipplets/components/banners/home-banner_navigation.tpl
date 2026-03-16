{% set has_home_banner_navigations = false %}
{% set num_banner_navigations = 0 %}

{% set banner_ramificador_title = settings.banner_ramificador_title %}
{% set banner_ramificador_subtitle = settings.banner_ramificador_subtitle %}

{% for banner_navigation in ['banner_navigation_01', 'banner_navigation_02', 'banner_navigation_03'] %}

	{% set banner_navigation_image = "#{banner_navigation}.jpg" | has_custom_image %}
	{% set banner_navigation_url = attribute(settings,"#{banner_navigation}_url") %}
	{% set has_banner_navigation = banner_navigation_url or banner_navigation_image %}
	{% if has_banner_navigation %}
		{% set has_home_banner_navigations = true %}
	{% endif %}
{% endfor %}

{% if has_home_banner_navigations or params.preview %}
	<section class="section-banner_navigation pb-5{% if not settings.banner_navigations_title %} pt-5{% endif %}">
		{% if banner_ramificador_title %}
        <div class="col-12 text-center">
          <h3 class="home-banner-title">{{ banner_ramificador_title|upper }}</h3>
		  
      		{% if banner_ramificador_subtitle %}
				<h4 class="home-banner-subtitle mb-3 mb-md-5">{{ banner_ramificador_subtitle }}</h4>
			{% endif %}
        </div>
      {% endif %}
		<div class="row mx-auto">
			<div class="js-swiper-banner-navigation swiper-container">
				<div class="swiper-wrapper">
					{% for banner_navigation in ['banner_navigation_01', 'banner_navigation_02', 'banner_navigation_03'] %}
						{% set banner_navigation_image = "#{banner_navigation}.jpg" | has_custom_image %}
						{% set banner_navigation_url = attribute(settings,"#{banner_navigation}_url") %}
						{% set banner_navigation_button = attribute(settings,"#{banner_navigation}_button") %}
						{% set has_banner_navigation = banner_navigation_url or banner_navigation_image %}
						<div class="swiper-slide col-md-4 p-0" {% if not has_banner_navigation %} style="display: none;" {% endif %}>
							{# <a href="{{banner_navigation_url ? banner_navigation_url:''}}" class="button "> #}
								<div class="position-relative banner_navigation-img-container banner_navigation-image mb-3" {% if not banner_navigation_image %} style="display: none" {% endif %}>
									<img class="img-fluid banner_navigation-img banner_navigation-img-{{ loop.index }} lazyload" {% if banner_navigation_image %} src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{banner_navigation}.jpg" | static_url | settings_image_url("big") }}' {% endif %} alt="{{banner_navigation_button ? banner_navigation_button : 'Banner ramificador de'|translate ~' '~store.name}}"/>
									<div class="placeholder-fade"></div>
								</div>
							{# </a> #}
						</div>
					{% endfor %}
				</div>
			</div>
		</div>
	</section>
{% endif %}

<style>
/* ====== Banner ramificador – base ====== */
.section-banner_navigation .js-swiper-banner-navigation {
 
  margin: 0 auto;
}

.section-banner_navigation .swiper-slide {
  display: flex;
  justify-content: center;
}


.section-banner_navigation .banner_navigation-img-container {
  
	cursor: default;
}

.section-banner_navigation .banner_navigation-img {
  display: block;
  width: 100%;
  height: auto;
}

.home-banner-title {
	font-size: 16px;
	font-weight: 600;
	font-family: var(--heading-font);
	text-transform: uppercase !important;
}
.home-banner-subtitle {
	font-size: 12px;
	font-family: var(--body-font);
	color: #606060;
	font-weight: 400;
}

/* ====== Desktop ====== */
@media (min-width: 992px) {

			.home-banner-title {
				font-size: 28px;
				font-weight: 600;
				font-family: var(--heading-font);
				text-transform: uppercase;
			}
			.home-banner-subtitle {
				font-size: 20px;
				font-family: var(--body-font);
				color: #606060;
				font-weight: 300;
			}

  .section-banner_navigation .js-swiper-banner-navigation {
    
    padding: 0 20px;     
    margin: 0 auto;
  }

 
  .section-banner_navigation .swiper-slide {
    padding: 0 15px;    
  }

  .section-banner_navigation .banner_navigation-img-container {
    max-width: 340px;    
  }

  
	.section-banner_navigation .swiper-wrapper > .swiper-slide:nth-child(2) {
		position: relative;
	}

	
	.section-banner_navigation .swiper-wrapper > .swiper-slide:nth-child(2)::before,
	.section-banner_navigation .swiper-wrapper > .swiper-slide:nth-child(2)::after {
		content: "";
		position: absolute;
		top: 12%;          
		bottom: 12%;      
		width: 1.5px;
		background: #9E9E9E;
	}

	.section-banner_navigation .swiper-wrapper > .swiper-slide:nth-child(2)::before {
		left: 0;
	}

	.section-banner_navigation .swiper-wrapper > .swiper-slide:nth-child(2)::after {
		right: 0;
	}

}
</style>