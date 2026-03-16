{% embed "snipplets/metas/manifest_css.tpl" %}
	{% block css_links %}
		{# global styles #}
		<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['global_critical.min.css']) | static_url }}">
		<link rel="stylesheet" href="{{  ('css/' ~ css_manifest['global_async.min.css']) | static_url }}">

		{% set account_templates = ['account.login', 'account.address','account.addresses','account.info','account.newpass','account.order','account.orders','account.register','account.reset'] %}
		{% set grid_templates = ['category','search'] %}
		{% if template == "home" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['home_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{  ('css/' ~ css_manifest['home_async.min.css']) | static_url }}">
		{% elseif template in grid_templates %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['grid_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['grid_async.min.css'])  | static_url }}">
		{% elseif template == "product" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['product_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['product_async.min.css'])  | static_url }}">
		{% elseif template == "page" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['page_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['page_async.min.css'])  | static_url }}">
		{% elseif template == "blog" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['blog_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['blog_async.min.css'])  | static_url }}">
		{% elseif template == "contact" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['contact_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['contact_async.min.css'])  | static_url }}">
		{% elseif template in account_templates %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['account_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['account_async.min.css'])  | static_url }}">
		{% elseif template == "404" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['error-404_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['error-404_async.min.css'])  | static_url }}">
		{% elseif template == "cart" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['cart_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['cart_async.min.css'])  | static_url }}">
		{% elseif template == "password" %}
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['account_critical.min.css']) | static_url }}">
			<link rel="stylesheet" href="{{ ('css/' ~ css_manifest['account_async.min.css'])  | static_url }}">
		{% endif %}
	{% endblock %}
{% endembed %}
