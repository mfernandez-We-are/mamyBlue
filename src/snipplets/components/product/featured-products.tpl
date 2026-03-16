{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set section_list = section_list | default(sections.primary) %}
{% set products_title = products_title | default(false) %}

{% if section_list.products %}
    <section class="section-home section-{{section_list.id}}-home {% if template =='404' %} w-100 {% endif %} my-0" data-store="home-products-featured">
        <div class="container-fluid">
            <div class="row mx-0">
                <div class="col-12 px-0 px-md-3">
                    <div class="js-swiper-{{section_list.id}} swiper-container">
                        <div class="swiper-wrapper">
                            {% for product in section_list.products %}
                                {% include 'snipplets/grid/item.tpl' with {'slide_item': true} %}
                            {% endfor %}

                        </div>
                    </div>
                    <div class="js-swiper-{{section_list.id}}-pagination swiper-pagination"></div>
                    <div class="js-swiper-{{section_list.id}}-prev swiper-button-prev d-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 svg-icon-text"} %}</div>
                    <div class="js-swiper-{{section_list.id}}-next swiper-button-next d-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 svg-icon-text"} %}</div>
                </div>
            </div>
        </div>
    </section>
    {% set section_name = 'primary' %}
{% endif %}