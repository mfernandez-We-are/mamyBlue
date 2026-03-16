{% embed "snipplets/page-header.tpl" %}{% endembed %}
   
   
{% set has_contact_info = store.whatsapp or store.phone or store.email or store.address or store.blog %}
{% set is_order_cancellation_without_id = params.order_cancellation_without_id == 'true' %}
<section class="contact-page mb-4">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-4">
				{% if is_order_cancellation %}
					<p data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario. Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }} </p>
					<a class="btn-link" href="{{ status_page_url }}">{{'Ver detalle de la compra >' | translate}}</a>
					{% if has_contact_info %}
						<p class="mt-4 mb-3">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</p>
					{% endif %}
				{% endif %}
				{% if has_contact_info %}
					{% include "snipplets/pages/contact-information.tpl" with { contact_title: 'CONTACTO', location_title: 'VISITANOS' } %}
				{% endif %}
			</div>
			<div class="col-md-8">
				{% if product %}  
					<div> 
						<p>{{ "Usted está consultando por el siguiente producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
						<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
					</div>
				{% endif %}	
				{% if contact %}
					{% if contact.success %}
						{% if is_order_cancellation %}
							<div class="alert alert-success" data-component="order-cancellation-success-message">
								{{ "¡Tu pedido de cancelación fue enviado!" | translate }} 
								<br>
								{{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }}
								<br> 
								<strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong>
							</div>
						{% else %}
							<div class="alert alert-success" data-component="contact-success-message">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
						{% endif %}
					{% else %}
						<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
					{% endif %}
				{% endif %}	

				{% if is_order_cancellation_without_id %}
					<p class="mb-3" data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste de una compra, podés pedir la cancelación enviando este formulario <strong>con tu número de orden.</strong> Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }}</p>
				{% endif %}
				
				{% include 'snipplets/pages/contact-form.tpl' with { is_order_cancellation_without_id: is_order_cancellation_without_id, is_order_cancellation: is_order_cancellation } %}
			</div>
		</div>
	</div>
</section>