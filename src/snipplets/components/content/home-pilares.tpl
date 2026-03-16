{% set has_section_title = settings.titulo_pilar_title %}
{% set has_section_subtitle = settings.subtitulo_pilar_title %}
{% set has_section_text = settings.text_pilar_description %}

{% set pilares = [
  {
    icon: 'img_1_pilar_mobile.png',
    title: settings.text1_pilar_title,
    desc: settings.text1_pilar_description
  },
  {
    icon: 'img_2_pilar_mobile.png',
    title: settings.text2_pilar_title,
    desc: settings.text2_pilar_description
  },
  {
    icon: 'img_3_pilar_mobile.png',
    title: settings.text3_pilar_title,
    desc: settings.text3_pilar_description
  },
  {
    icon: 'img_4_pilar_mobile.png',
    title: settings.text4_pilar_title,
    desc: settings.text4_pilar_description
  },
  {
    icon: 'img_5_pilar_mobile.png',
    title: settings.text5_pilar_title,
    desc: settings.text5_pilar_description
  },
  {
    icon: 'img_6_pilar_mobile.png',
    title: settings.text6_pilar_title,
    desc: settings.text6_pilar_description
  }
] %}

<section class="home-pillars my-3 py-3 my-md-5 py-md-5">
	<div
		class="container">

		{# ---- Encabezado de la sección ---- #}
		{% if has_section_title %}
			<header class="home-pillars-header text-center mb-5">
				{% if has_section_title %}
					<h2 class="home-pillars-title text-uppercase mb-2">
						{{ has_section_title }}
					</h2>
				{% endif %}

				{% if has_section_subtitle %}
					<h3 class="home-pillars-subtitle mb-2">
						{{ has_section_subtitle }}
					</h3>
				{% endif %}

				{% if has_section_text %}
					<p class="home-pillars-text-header m-0">
						{{ has_section_text }}
					</p>
				{% endif %}
			</header>
		{% endif %}


		<div class="home-pillars">
			{% for pilar in pilares %}
				{% if pilar.title or pilar.desc %}
					<article class="home-pillars-item d-flex align-items-center justify-content-start mb-5">
						{% if pilar.icon %}
							<div class="home-pillars-icon mr-4 flex-shrink-0">
								<img src="{{ pilar.icon | static_url }}" alt="{{ pilar.title }}" loading="lazy" class="home-pillars-icon-img">
							</div>
						{% endif %}

						<div class="home-pillars-content">
							{% if pilar.title %}
								<h4 class="home-pillars-item-title text-uppercase fw-bold mb-1 mb-md-2">
									{{ pilar.title }}
								</h4>
							{% endif %}

							{% if pilar.desc %}
								<p class="home-pillars-item-text mb-0">
									{{ pilar.desc }}
								</p>
							{% endif %}
						</div>
					</article>
				{% endif %}
			{% endfor %}
		</div>
	</div>
</section>
