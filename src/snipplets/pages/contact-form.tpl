 {% set is_order_cancellation = is_order_cancellation | default(false) %}
 {% set is_order_cancellation_without_id = is_order_cancellation_without_id | default(false) %}
 {% set contact_form_id = contact_form_id | default('contact-form') %}
 {% set contact_form_custom_class = contact_form_custom_class | default('js-winnie-pooh-form') %}
 {% set contact_form_action = contact_form_action | default('/winnie-pooh') %}
 {% set contact_submit_name = contact_submit_name | default('contact') %}
 {% set contact_submit_text = contact_submit_text | default('ENVIAR CONSULTA') %}
 {% set contact_data_store = contact_data_store | default('contact-form') %}
 {% set submit_custom_class = submit_custom_class | default('form-submit d-block mx-auto mt-4') %}

{% embed "snipplets/components/forms/form.tpl" with{form_id: contact_form_id, form_custom_class: contact_form_custom_class, form_action: contact_form_action, submit_name: contact_submit_name, submit_text: contact_submit_text, data_store: contact_data_store, submit_custom_class: submit_custom_class } %}
					{% block form_body %}

						{# Hidden inputs used to send attributes #}

						<div class="winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>

						<input type="hidden" value="{{ product.id }}" name="product"/>
						{% if is_order_cancellation or is_order_cancellation_without_id %}
							<input type="hidden" name="type" value="order_cancellation" />
						{% else %}
							<input type="hidden" name="type" value="contact" />
						{% endif %}

						{# Name input #}
						{% embed "snipplets/components/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_label_text: 'Nombre' | translate } %}
						{% endembed %}

						{# Email input #}
						{% embed "snipplets/components/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_label_text: 'Email' | translate } %}
						{% endembed %}

						{% if not is_order_cancellation %}
							{# Phone input #}
							{% embed "snipplets/components/forms/form-input.tpl" with{input_for: 'phone', type_tel: true, input_name: 'phone', input_id: 'phone', input_label_text: 'Teléfono' | translate } %}
							{% endembed %}

							{# Message textarea #}
							{% embed "snipplets/components/forms/form-input.tpl" with{text_area: true, input_for: 'message', input_name: 'message', input_id: 'message', input_rows: '7', input_label_text: 'Mensaje' | translate } %}
							{% endembed %}
						{% endif %}
					{% endblock %}
				{% endembed %}