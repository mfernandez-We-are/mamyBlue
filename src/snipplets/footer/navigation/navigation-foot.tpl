{% set footer_menu = footer_menu | default(settings.footer_menu_primary) %}
<ul class="footer-menu m-0 p-0 text-center text-md-left mb-3 mb-md-0">
	{% for item in menus[footer_menu] %}
		<li class="footer-menu-item my-2 px-0">
	        <a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>