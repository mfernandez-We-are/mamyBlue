{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

<div class="row mx-0">
	<div class="js-newsletter newsletter">
		{% if settings.news_title %}
			<h3 class="newsletter-title mb-md-2">{{ settings.news_title|upper }}</h3>
		{% endif %}
		{% if settings.news_text %}
			<p class="newsletter-description mb-md-5">{{ settings.news_text }}</p>
		{% endif %}

		{% if contact and contact.type == 'newsletter' %}
			{% if contact.success %}
				<div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
			{% else %}
				<div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
			{% endif %}
		{% endif %}

		<form id="newsletter-form"  method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
			<div class="input-append row mx-0">

				{% embed "snipplets/components/forms/form-input.tpl" with { input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Correo electrónico' | translate, input_aria_label: 'Email' | translate, input_group_custom_class: 'mb-0 pl-0 col form-control-newsletter' } %}{% endembed %}

				<div class="winnie-pooh" style="display: none;">
					<label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
					<input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
				</div>
				<input type="hidden" name="name" value="{{ "Sin nombre" | translate }}"/>
				<input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}"/>
				<input type="hidden" name="type" value="newsletter"/>
				<input type="submit" name="contact" class="btn newsletter-btn btn-enviar-newsletter col-auto" value='{{ "Enviar" | translate }}'>
			</div>
		</form>
	</div>
</div>
<style>
.form-control-newsletter input{
	    background-color: #464444 !important;
    color: #fff !important;
    
}
.form-control-newsletter input::placeholder{
	color:#fff !important;
}
.btn-enviar-newsletter{
	background-color: white;
    color: black;
   
    padding: 10px 8px;
}

@media (min-width: 768px) {
	.form-control-newsletter input{
		width: 450px;
	}

	.btn-enviar-newsletter{
	
		width: 200px;

	}

}
</style>