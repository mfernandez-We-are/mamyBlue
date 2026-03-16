{% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
	{% block page_header_text %}
		{{ page.name | upper }}
	{% endblock page_header_text %}
{% endembed %}

{# Institutional page #}

<section class="user-content">
	{% if "Centro de instalación" in page.name %}
		{% include 'snipplets/pages/instalaciones.tpl' %}
	{% elseif "Sobre nosotros" in page.name %}
		{% include 'snipplets/pages/sobre-nosotros.tpl' %}
	{% elseif "Preguntas Frecuentes" in page.name %}
		{% include 'snipplets/pages/landing-preguntas-frecuentes.tpl' %}
	{% else %}  
		<div class="page-content container mb-4">
			<div class="row justify-content-md-center" > 
				<div class="col-md-10" > 
					{{ page.content }}
				</div>
			</div>
		</div>
	{% endif %}
</section>
