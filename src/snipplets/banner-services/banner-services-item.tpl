<div class="service-item-container col-md swiper-slide p-0 px-md-3">
    <div class="service-item mx-auto mx-md-auto row w-fit align-items-start justify-content-start text-left">
        <div class="col-auto px-0">
            {% if banner_services_icon == 'shipping' %}
                {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline icon-w-20 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'card' %}
                {% include "snipplets/svg/credit-card-blank.tpl" with {svg_custom_class: "icon-inline icon-w-18 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'security' %}
                {% include "snipplets/svg/lock.tpl" with {svg_custom_class: "icon-inline icon-w-14 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'returns' %}
                {% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-w-16 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'whatsapp' %}
                {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-w-16 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'promotions' %}
                {% include "snipplets/svg/tag.tpl" with {svg_custom_class: "icon-inline icon-w-16 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'cash' %}
                {% include "snipplets/svg/dollar-sign.tpl" with {svg_custom_class: "icon-inline icon-w-16 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'branches' %}
                {% include "snipplets/svg/store.tpl" with {svg_custom_class: "icon-inline icon-w-18 service-icon m-0 mt-1"} %}
            {% elseif banner_services_icon == 'quality' %}
                {% include "snipplets/svg/workspace-premium.tpl" with {svg_custom_class: "icon-inline icon-w-20 service-icon m-0"} %}
            {% elseif banner_services_icon == 'world' %}
                {% include "snipplets/svg/world.tpl" with {svg_custom_class: "icon-inline icon-w-20 service-icon m-0"} %}
            {% endif %}
        </div>
        <div class="col-auto ml-2 px-0">
            {% if banner_services_url %}
                <a href="{{ banner_services_url | setting_url }}">
            {% endif %}
            <h3 class="service-title mb-0">{{ banner_services_title }}</h3>
            <p class="service-description mb-0" >{{ banner_services_description }}</p>
            {% if banner_services_url %}
                </a>
            {% endif %}
        </div>
    </div>
</div>
