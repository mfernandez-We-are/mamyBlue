{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    <div class="breadcrumbs {{ breadcrumbs_custom_class }}">
        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        <span class="divider">|</span>
        {% if template == 'page' %}
            <span class="crumb font-weight-bold active">{{ page.name|capitalize }}</span>
        {% elseif template == 'cart' %}
            <span class="crumb active">{{ "Carrito de compras" | translate }}</span>
        {% elseif template == 'search' %}
            <span class="crumb font-weight-bold active">{{ "Resultados de búsqueda" | translate }}</span>
        {% elseif template == 'account.order' %}
             <span class="crumb font-weight-bold active">{{ 'Orden {1}' | translate(order.number) }}</span>
        {% elseif template == 'blog' %}
             <span class="crumb font-weight-bold active">{{ 'Blog' | translate }}</span>
        {% elseif template == 'blog-post' %}
             <a href="{{ store.blog_url }}" class="crumb">{{ 'Blog' | translate }}</a>
             <span class="divider">|</span>
             <span class="crumb active">{{ post.title|capitalize }}</span>
        {% else %}
            {% for crumb in breadcrumbs %}
                {% if crumb.last %}
                    <span class="crumb font-weight-bold active">{{ crumb.name|capitalize }}</span>
                {% else %}
                    <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name|capitalize }}</a>
    	            <span class="divider">|</span>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
{% endif %}
