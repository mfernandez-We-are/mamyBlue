<section class="section-advertising">
    <div class="container-fluid mx-md-0">
        <div class="row mx-0">
            <div class="col-12 px-0">
                {% if settings.ad_bar and (settings.ad_01_text or settings.ad_02_text or settings.ad_03_text) %}
                    {% set messages_array = [
                        { 'ad_url': settings.ad_01_url, 'ad_text': settings.ad_01_text }, 
                        { 'ad_url': settings.ad_02_url, 'ad_text': settings.ad_02_text }, 
                        { 'ad_url': settings.ad_03_url, 'ad_text': settings.ad_03_text }
                    ] %}
                    {% for i in 0..3 %}
                        {% set messages_array = messages_array|merge(messages_array) %}
                    {% endfor %}
                    
                    {% set array_legth = messages_array|length %}
                    <div class="js-swiper-advertising swiper-container ">
                        <div class="swiper-wrapper">
                            {% for message in messages_array %}
                                <div class="swiper-slide px-0 text-center" style="white-space: nowrap">
                                    {% if message.ad_url %}
                                        <a class="link-contrast" href="{{ message.ad_url | setting_url }}">
                                        {% endif %}
                                        {% if message.ad_text %}
                                            {{ message.ad_text }}
                                        {% endif %}
                                        {% if message.ad_url %}
                                        </a>
                                    {% endif %}
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
</section>