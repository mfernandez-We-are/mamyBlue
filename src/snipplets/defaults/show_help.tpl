{# Only remove this if you want to take away the theme onboarding advices #}

{% if not params.preview %}
	{% if is_theme_draft %}
		{% set admin_link = '/admin/themes/settings/draft/' %}
	{% else %}
		{% set admin_link = '/admin/themes/settings/active/' %}
	{% endif %}
{% endif %}

{% include "snipplets/svg/empty-placeholders.tpl" %}

{# Slider that work as example #}

{% snipplet 'defaults/home/slider_help.tpl' %}

{# Products featured that work as examples #}

{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Destacados' | translate, data_store: 'home-products-featured' } %}

{# Categories banners that work as examples #}

{% include 'snipplets/defaults/home/banners_help.tpl' with { banner_title: 'Categoría' | translate, data_store: 'home-banner-categories', banner_edit_description: 'Podés destacar categorías de tu tienda desde' | translate, banner_edit_section: 'Banners de categorías' | translate } %}

{# Products featured that work as examples #}

{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Novedades' | translate, data_store: 'home-products-new', slider: true } %}

{# Video that work as examples #}

{% snipplet 'defaults/home/video_help.tpl' %}

{# Products featured that work as examples #}

{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Ofertas' | translate, data_store: 'home-products-sale' } %}

{# Promotional banners that work as examples #}

{% include 'snipplets/defaults/home/banners_help.tpl' with { banner_title: 'Promoción' | translate, data_store: 'home-banner-promotional', banner_edit_description: 'Podés mostrar tus promociones desde' | translate, banner_edit_section: 'Banners promocionales' | translate } %}

{# Instagram feed that work as examples #}

{% snipplet 'defaults/home/instafeed_help.tpl' %}
