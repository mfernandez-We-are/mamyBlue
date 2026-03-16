{% set cash_payment = product.payment_methods_config['Pagos Personalizados'] %}
{% set container_class = container_class | default(false) %}
{% if cash_payment %}
	<div {% if container_class %}class="{{container_class}}" {% endif %} {% if hideDiscountContainer %} style="display: none;" {% endif %}>
		<span>{{ cash_payment.max_discount }}% off transferencia de {{ ((product.price * (100 - cash_payment.max_discount)) / 100) | money | replace(',00','')}}</span>
	</div>
{% endif %}
