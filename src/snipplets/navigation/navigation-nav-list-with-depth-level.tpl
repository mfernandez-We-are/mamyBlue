{% set megamenu = megamenu | default(false) %}
{% set subitem = subitem | default(false) %}
{% set menu_items = menu_items | default(settings.header_menu) %}
{% set menu_array = menu_array | default(menus[menu_items|lower]) %}
{% set menu_depth_level = menu_depth_level | default(1) %}
{% set all_categories = all_categories | default(categories) %}

{% for item in menu_array %}
	{% set matched = all_categories| filter(c => c.name|lower == item.name|lower) | first %}
	{% set all_subcategories = matched ? matched.subcategories : [] %}
	{% set category_image_url = false %}
	{% set icon_color = 'icon-inline svg-icon-text' %}
	{% set text_color ='' %}

	{% if item.name|lower == 'ofertas'%}
		{% set icon_color = 'icon-inline svg-icon-accent' %}
		{% set text_color ='text-accent' %}
	{% endif %}

	{% if (item.subitems or item.subcategories) and menu_depth_level < 3 %}
		{% if matched %}
			{% for image in settings.header_subcategory_images %}
				{% if ((cat.parent.name|lower)~' > '~(item.name|lower)) in image.title|lower %}
					{% set category_image_url = image.image | static_url %}
				{% endif %}
			{% endfor %}
		{% endif %}
		<li class="item-with-subitems {% if menu_depth_level == 2 %}row mx-0{% endif %}" data-component="menu.item">
			<div class="js-nav-list-toggle-accordion {% if menu_depth_level == 2 %}col-6 px-0{% endif %}">
				<a class="js-toggle-page-accordion nav-list-link {{highlight_item}} nav-link-depth-{{menu_depth_level}} {{text_color}}" href="#" {% if category_image_url %} data-category-image="{{category_image_url}}" {% endif %}>
					{% if menu_depth_level == 1 %}

						<span class="nav-arrow mr-2 d-none d-md-inline-block">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: icon_color} %}
						</span>
					{% endif %}

					{{ item.name }}
					{% if menu_depth_level == 2 %}
						<span class="nav-arrow ml-2 d-inline-block">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: icon_color} %}
						</span>
					{% endif %}

					{% if menu_depth_level == 1 %}
						<span class="nav-arrow nav-list-arrow d-inline-block float-right transition-soft d-md-none">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: icon_color} %}
						</span>
					{% endif %}
				</a>
			</div>
			<div class="js-pages-accordion {% if menu_depth_level == 2 %}col-6 subitems-menu-depth-3 {% elseif menu_depth_level == 1 %}subitems-menu-depth-2{% endif %}" style="display:none;">
				<ul class="list-subitems nav-list-accordion flex-md-wrap px-0">
					
					{% include "snipplets/navigation/navigation-nav-list-with-depth-level.tpl" with {'menu_items': item.name, menu_array: item.subitems, 'subitem': true, 'all_categories': all_subcategories, menu_depth_level: (menu_depth_level + 1) } %}
					<li class="col-auto {% if menu_depth_level == 1 %}col-6{% endif %} px-0" data-component="menu.item">
						<a class="nav-list-link nav-link-depth-{{menu_depth_level + 1}}text-highlighted" href="{{matched.url}}">
							<span class="nav-see-all">VER TODOS</span>
						</a>
					</li>
				</ul>
				<div class="js-subitems-overlay subitems-overlay"></div>
			</div>
		</li>
	{% else %}
		{% set cat = all_categories | filter(c => (c.id == item.id) and (c.name|lower == item.name|lower ) ) | first %}
		{% set itemURL = item.url ? item.url:'' %}

		<li {% if subitem %} class="col-auto px-0" {% endif %} data-component="menu.item">
			<a class="nav-list-link nav-link-depth-{{menu_depth_level}} {{text_color}}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">
				{% if menu_depth_level == 1 %}
					<span class="nav-arrow mr-2 d-none d-md-inline-block">
						{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: icon_color } %}
					</span>
				{% endif %}
				<span>{{ item.name }}</span>
			</a>
		</li>
	{% endif %}
{% endfor %}