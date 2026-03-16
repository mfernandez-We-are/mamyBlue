<style>
    .countdown_end {
        width: 100%;
    }
    #texto_cont {
        width: 50%;
    }
    #boton_cont {
        width: 50%;
    }
</style>


{# calculo cantidad de items encendidos #}
{% set contador = 0 %}
{% if settings.we_countdown_cta %}
    {% set contador = contador + 1 %}
{% endif %}
{% if settings.we_countdown_text %}
    {% set contador = contador + 1 %}
{% endif %}
{% if settings.we_countdown_end %}
    {% set contador = contador + 1 %}
{% endif %}




{% if settings.we_countdown_checkbox %}
    {% if settings.we_countdown_url %}
        {#<a href='{{ settings.we_countdown_url }}' target="_blank">#}
    {% endif %}
    <div class="contenedor_countdown" style="width: 100%; background-color: {{ settings.we_countdown_color_fondo }};  padding: 10px 0;">
        <div class="container">
            <style>
                .countdown_end {
                    display: flex;
                    text-align: center;
                    font-family: Arial, sans-serif;
                }
                .countdown_end div {
                    margin: 0 10px;
                }
                .countdown_end span:first-child {
                    font-weight: bold;
                }
                .countdown div {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                #texto_cont {
                    width:fit-content;
                    height: fit-content;
                }
            </style>
            <div class="row">
                <div class="col-12">
                    <div class="text-center countdown" style="display:flex; flex-direction:{{settings.we_countdown_orientacion}};{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-between; {% else %} justify-content:center; {% endif %} color: {{ settings.we_countdown_color_fondo }}; padding: 10px;">
                        {% if contador == '1' %}
                            <div class="col-12 web">                        
                                {% if settings.we_countdown_orientacion == 'row' %}
                                    {# primero #}
                                    {% if settings.we_countdown_primero == 'texto' %}
                                        {#texto#}
                                        <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'contador' %}
                                        {#contador#}
                                        {% if settings.we_countdown_end_time %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                        {% else %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                        {% endif %}
                                        {% if settings.we_countdown_start_time %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                        {% else %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                        {% endif %}
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'boton' %}
                                        {#boton#}
                                        {% if settings.we_countdown_cta %}
                                            <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                        {% endif %}
                                    {% endif %}      
                                   
                                {% else %}
                                    {# primero #}
                                    {% if settings.we_countdown_primero == 'texto' %}
                                        {#texto#}
                                        <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'contador' %}
                                        {#contador#}
                                        {% if settings.we_countdown_end_time %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                        {% else %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                        {% endif %}
                                        {% if settings.we_countdown_start_time %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                        {% else %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                        {% endif %}
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'boton' %}
                                        {#boton#}
                                        {% if settings.we_countdown_cta %}
                                            <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                        {% endif %}
                                    {% endif %}      
                                {% endif %}
                            </div>
                        {% elseif contador == '2' %}
                                {% if settings.we_countdown_orientacion == 'row' %}
                                    <div class="col-6">                      
                                        {# primero #}
                                        {% if settings.we_countdown_primero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}      
                                    </div>
                                    <div class='col-6'>
                                        {# segundo #}                  
                                        {% if settings.we_countdown_segundo == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                {% else %}
                                    <div class='col-12'>
                                        {# primero #}
                                        {% if settings.we_countdown_primero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}    
                                    </div>
                                    <div class='col-12'>
                                        {# segundo #}                  
                                        {% if settings.we_countdown_segundo == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                {% endif %}
                        {% else %}
                            {% if settings.we_countdown_orientacion == 'row' %}
                                <div class='celu-3'>
                                    <div class='col-12 col-md-4'>
                                        {# primero #}
                                        {% if settings.we_countdown_primero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}  
                                    </div>
                                    <div class='col-12 col-md-4'>    
                                        {# segundo #}                  
                                        {% if settings.we_countdown_segundo == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                    <div class='col-12 col-md-4'>
                                        {# tercero #}
                                        {% if settings.we_countdown_tercero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_tercero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_tercero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>




                                </div>
                                <style>
                                    .celu-3 {
                                        display: flex !important;
                                        flex-direction: column;
                                    }
                                    .pc-3 {
                                        display: none !important;
                                    }


                                    @media (min-width: 768px) {
                                        .celu-3 {
                                            display: none !important;
                                        }
                                        .pc-3 {
                                            display: flex !important;
                                            width: 100%;
                                        }
                                    }


                                </style>
                                <div class='pc-3'>
                                    <div class='col-6 col-md-4'>
                                        {# primero #}
                                        {% if settings.we_countdown_primero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_primero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}      
                                    </div>
                                    <div class='col-6 col-md-4'>
                                        {# segundo #}                  
                                        {% if settings.we_countdown_segundo == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_segundo == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                    <div class='col-12 col-md-4'>
                                        {# tercero #}
                                        {% if settings.we_countdown_tercero == 'texto' %}
                                            {#texto#}
                                            <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                        {% endif %}
                                        {% if settings.we_countdown_tercero == 'contador' %}
                                            {#contador#}
                                            {% if settings.we_countdown_end_time %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                            {% else %}
                                                <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                            {% endif %}
                                            {% if settings.we_countdown_start_time %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                            {% else %}
                                                <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                            {% endif %}
                                        {% endif %}
                                        {% if settings.we_countdown_tercero == 'boton' %}
                                            {#boton#}
                                            {% if settings.we_countdown_cta %}
                                                <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                </div>
                            {% else %}
                                <div class='col-12 '>
                                    {# primero #}
                                    {% if settings.we_countdown_primero == 'texto' %}
                                        {#texto#}
                                        <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'contador' %}
                                        {#contador#}
                                        {% if settings.we_countdown_end_time %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                        {% else %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                        {% endif %}
                                        {% if settings.we_countdown_start_time %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                        {% else %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                        {% endif %}
                                    {% endif %}
                                    {% if settings.we_countdown_primero == 'boton' %}
                                        {#boton#}
                                        {% if settings.we_countdown_cta %}
                                            <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                        {% endif %}
                                    {% endif %}  
                                </div>
                                <div class='col-12 '>    
                                    {# segundo #}                  
                                    {% if settings.we_countdown_segundo == 'texto' %}
                                        {#texto#}
                                        <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                    {% endif %}
                                    {% if settings.we_countdown_segundo == 'contador' %}
                                        {#contador#}
                                        {% if settings.we_countdown_end_time %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                        {% else %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                        {% endif %}
                                        {% if settings.we_countdown_start_time %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                        {% else %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                        {% endif %}
                                    {% endif %}
                                    {% if settings.we_countdown_segundo == 'boton' %}
                                        {#boton#}
                                        {% if settings.we_countdown_cta %}
                                            <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                        {% endif %}
                                    {% endif %}
                                </div>
                                <div class='col-12 '>
                                    {# tercero #}
                                    {% if settings.we_countdown_tercero == 'texto' %}
                                        {#texto#}
                                        <h2 id="texto_cont" style="{% if settings.we_countdown_orientacion == 'row' %}  {% else %} justify-content:center;   {% endif %} font-size:{{settings.we_countdown_text_size}};margin: 0px ; align-items: center; display: flex; color: {{settings.we_countdown_color_texto}};" class="h1    ">{{ settings.we_countdown_text }}</h2>
                                    {% endif %}
                                    {% if settings.we_countdown_tercero == 'contador' %}
                                        {#contador#}
                                        {% if settings.we_countdown_end_time %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}">{{ settings.we_countdown_end }}T{{settings.we_countdown_end_time}}</div>
                                        {% else %}
                                            <div  class="countdown_end" style="{% if settings.we_countdown_orientacion == 'row' %} justify-content:space-around; {% else %} justify-content:center;  {% endif %} font-size:{{settings.we_countdown_cont_size_mobile}};color: {{settings.we_countdown_color_text_contador}} " data-date="{{ settings.we_countdown_end }}">{{ settings.we_countdown_end }}</div>
                                        {% endif %}
                                        {% if settings.we_countdown_start_time %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}">{{ settings.we_countdown_start }}T{{ settings.we_countdown_start_time }}</div>
                                        {% else %}
                                            <div style="display:none;" class="countdown_start" data-date="{{ settings.we_countdown_start }}">{{ settings.we_countdown_start }}</div>
                                        {% endif %}
                                    {% endif %}
                                    {% if settings.we_countdown_tercero == 'boton' %}
                                        {#boton#}
                                        {% if settings.we_countdown_cta %}
                                            <a id="boton_cont" href="{{ settings.we_countdown_cta_url }}" style="{% if settings.we_countdown_orientacion == 'column' %} {% endif %} margin-left: auto !important;margin-right: auto !important;width:fit-content;border-radius: {{settings.we_countdown_button_styles}};margin: auto 0; color: {{settings.we_countdown_color_boton_texto}} !important; background-color: {{settings.we_countdown_color_boton}} !important; height: fit-content;"  class="btn btn-primary btn-lg boton_cta ">{{ settings.we_countdown_cta }}</a>
                                        {% endif %}
                                    {% endif %}
                                </div>
                            {% endif %}
                        {% endif %}






                    </div>
                </div>
            </div>
        </div>
    </div>
    {% if settings.we_countdown_url %}
        {#</a>#}
    {% endif %}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Obtener los elementos
            // Primera iteración
            var countdownEndElements = document.querySelectorAll('.countdown_end');
            var countdownStartElements = document.querySelectorAll('.countdown_start');


            countdownEndElements.forEach((countdownEndElement, index) => {
                if (!countdownEndElement || !countdownStartElements[index]) {
                    console.error("No se encontraron los elementos de cuenta regresiva.");
                    return;
                }


                var countdownContainer = countdownEndElement.closest('.contenedor_countdown');
                if (!countdownContainer) {
                    console.error("El contenedor de cuenta regresiva no se encontró.");
                    return;
                }


                // Parsear las fechas
                var countdownEndDate = new Date(countdownEndElement.getAttribute('data-date')).getTime();
                var countdownStartDate = new Date(countdownStartElements[index].getAttribute('data-date')).getTime();


                function updateCountdown() {
                    var now = new Date().getTime();


                    // Verificar si estamos antes del inicio
                    if (now < countdownStartDate) {
                        countdownContainer.style.display = 'none';
                    } else {
                        countdownContainer.style.display = 'flex'; // Mostrar el contenedor si ya es hora
                        var distance = countdownEndDate - now;


                        if (distance < 0) {
                            countdownContainer.style.display = 'none';
                        } else {
                            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            var seconds = Math.floor((distance % (1000 * 60)) / 1000);


                            // Generar el HTML con formato deseado
                            countdownEndElement.innerHTML = `
                                <div style='display: flex; flex-direction: {{settings.we_countdown_count_direc}};' >
                                    <span>${days}</span><br><span>dias</span>
                                </div>
                                <div style='display: flex; flex-direction: {{settings.we_countdown_count_direc}};' >
                                    <span>${hours}</span><br><span>horas</span>
                                </div>
                                <div style='display: flex; flex-direction: {{settings.we_countdown_count_direc}};'>
                                    <span>${minutes}</span><br><span>min</span>
                                </div>
                                <div style='display: flex; flex-direction: {{settings.we_countdown_count_direc}};'>
                                    <span>${seconds}</span><br><span>segs</span>
                                </div>
                            `;
                            countdownEndElement.style.display = 'flex';
                        }
                    }
                }


                // Actualizar cada segundo
                setInterval(updateCountdown, 1000);


                // Llamar una vez para inicializar
                updateCountdown();
            });


        });
    </script>


    <style>
        .col-12 {
            padding: 0px !important;
        }
        .col-4 {
            padding: 0px !important;
        }
        .col-6 {
            padding: 0px !important;
        }
        .celu-3 {
            width: 100%;
        }
        .countdown {
            padding: 0px !important;
        }


        @media (min-width: 768px) {
            .countdown_end {
                font-size: {{settings.we_countdown_cont_size}};
            }


            .countdown {
                padding: 10px !important;
            }




        }


    </style>
{%endif%}




{% if settings.we_countdown_orientacion == 'column' %}
    <style>
        .countdown {
            gap: 20px;
        }
        .countdown_end {
            width: fit-content;
        }
        .celu-3 {
            height: fit-content;
                        gap: 20px;


        }
    </style>
{%endif%}


{% if settings.we_countdown_orientacion == 'row' %}
    <style>
        .countdown {
            gap: 20px;
        }
        .countdown_end {
            width: fit-content;
        }
        @media (max-width: 768px) {
            .countdown {
                gap: 0px;
            }
        }
        .celu-3 {
            height: fit-content;
            gap: 20px;
        }
    </style>
{%endif%}
