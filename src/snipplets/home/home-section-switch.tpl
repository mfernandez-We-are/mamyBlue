{% if section_select == 'slider' %}

	{#  **** Home slider ****  #}
	<section data-store="home-slider">
		{% if show_help or (show_component_help and not (has_main_slider or has_mobile_slider)) %}
			{% snipplet 'defaults/home/slider_help.tpl' %}
		{% else %}
			{% include 'snipplets/components/banners/home-slider.tpl' %}
			{% if has_mobile_slider %}
				{% include 'snipplets/components/banners/home-slider.tpl' with {mobile: true} %}
			{% endif %}
		{% endif %}
	</section>
{% elseif section_select == 'banner_hero' %}

  {% include 'snipplets/components/banners/hero-banner.tpl' %}

{% elseif section_select == 'pilares' %}

  {% include 'snipplets/components/content/home-pilares.tpl' %}

{% elseif section_select == 'cotizador' %}

  {% include 'snipplets/components/forms/form-cotizador.tpl' %}
  
{% elseif section_select == 'featured' %}



  {# Featured / Destacados con banner #}
  {% include 'snipplets/components/product/product-slider-with-banner.tpl' with {
    section_list: sections.featured,
    section_name: sections.featured.id,
	section_url: settings.featured_product_url,
    products_title: settings.featured_product_title,
    show_title: settings.featured_product_title_desktop,
	products_title_mobile: settings.featured_product_title_mobile,
	section_banner: 'featured_product_image.jpg',
	banner_enabled: settings.featured_banner_enabled,
	banner_end: settings.featured_product_banner_end
  } %}

{% elseif section_select == 'new' %}

  {# Nuevos ingresos con banner #}
  {% include 'snipplets/components/product/product-slider-with-banner.tpl' with {
    section_list: sections.new,
    section_name: sections.new.id,
	section_url: settings.new_product_url,
    products_title: settings.new_product_title,
    show_title: settings.new_product_title_desktop,
	products_title_mobile: settings.new_product_title_mobile,
	section_banner: 'new_product_image.jpg',
	banner_enabled: settings.new_banner_enabled,
	banner_end: settings.new_product_banner_end
  } %}

{% elseif section_select == 'sale' %}

  {# Ofertas con banner #}
  {% include 'snipplets/components/product/product-slider-with-banner.tpl' with {
    section_list: sections.sale,
    section_name: section.sale.id,
	section_url: settings.sale_product_url,
    products_title: settings.sale_product_title,
    show_title: settings.sale_product_title_desktop,
	products_title_mobile: settings.sale_product_title_mobile,
	section_banner: 'sale_product_image.jpg',
	banner_enabled: settings.sale_banner_enabled,
	banner_end: settings.sale_product_banner_end
  } %}

{% elseif section_select == 'bestSelling' %}

  {# Más vendidos con banner #}
  {% include 'snipplets/components/product/product-slider-with-banner.tpl' with {
    section_list: sections.bestSelling, 
    section_name: section.bestSelling.id,
	section_url: settings.best_selling_product_url,
    products_title: settings.best_selling_product_title,
    show_title: settings.best_selling_product_title_desktop,
	products_title_mobile: settings.best_selling_product_title_mobile,
	section_banner: 'best_seller_product_image.jpg',
	banner_enabled: settings.best_selling_banner_enabled,
	banner_end: settings.best_selling_product_banner_end
  } %}

{% elseif section_select == 'informatives' %}
	{#  **** Informative banners ****  #}
	{% if show_help or (show_component_help and not has_informative_banners) %}
		{% snipplet 'defaults/home/informative_banners_help.tpl' %}
	{% else %}
		{% include 'snipplets/banner-services/banner-services.tpl' %}
	{% endif %}

{% elseif section_select == 'categories' %}

	{#  **** Categories banners ****  #}
	{% if show_help or (show_component_help and not has_category_banners) %}
		{% include 'snipplets/components/banners/home-categories.tpl' %}
	{% else %}
		{% include 'snipplets/components/banners/home-categories.tpl' %}
	{% endif %}

{% elseif section_select == 'ramificadores' %}


		{% include 'snipplets/components/navigation/home-ramificadores.tpl' %}

{% elseif section_select == 'landing' %}


		{% include 'snipplets/components/banners/home-landings.tpl' %}
	

{% elseif section_select == 'welcome' %}

	{#  **** Welcome message ****  #}
	{% if show_help or (show_component_help and not has_welcome_message) %}
		{% include 'snipplets/defaults/home/welcome_message_help.tpl' %}
	{% else %}
		{% include 'snipplets/components/content/home-welcome-message.tpl' %}
	{% endif %}

{% elseif section_select == 'module_1' %}
		{% include 'snipplets/components/banners/home-modules.tpl' with { module_img: 'module_01.jpg', module_hover_img: 'module_hover_01.jpg', module_url: settings.module_01_url, module_img_mobile: 'module_01_mobile.jpg', module_hover_img_mobile: 'module_hover_01_mobile.jpg', module_url_mobile: settings.module_01_url_mobile } %}

{% elseif section_select == 'module_2' %}
		{% include 'snipplets/components/banners/home-modules.tpl' with { module_img: 'module_02.jpg', module_hover_img: 'module_hover_02.jpg', module_url: settings.module_02_url, module_img_mobile: 'module_02_mobile.jpg', module_hover_img_mobile: 'module_hover_02_mobile.jpg', module_url_mobile: settings.module_02_url_mobile } %}

{% elseif section_select == 'video' %}

	{#  **** Video embed ****  #}
	{% if show_help or (show_component_help and not has_video) %}
		{% include 'snipplets/defaults/home/video_help.tpl' %}
	{% else %}
		{% include 'snipplets/components/banners/home-video.tpl' %}
	{% endif %}

{% elseif section_select == 'instafeed' %}

	{#  **** Instafeed ****  #}
	{% if show_help or (show_component_help and not has_instafeed) %}
		{% include 'snipplets/components/content/instafeed.tpl' %}
	{% else %}
		{% include 'snipplets/components/content/instafeed.tpl' %}
	{% endif %}

{% elseif section_select == 'banner_navigation' %}

	{% include 'snipplets/components/banners/home-banner_navigation.tpl' %}

{% elseif section_select == 'brands' %}
	{% include 'snipplets/components/banners/home-brands.tpl' %}

{% endif %}
