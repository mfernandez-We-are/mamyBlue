{# 1) Redes que vienen desde store.* (sin twitch/linkedin) #}
{% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
  {% set sn_url = attribute(store, sn) %}
  {% if sn_url %}
    <a class="social-icon" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
      {% include "snipplets/svg/" ~ sn ~ ".tpl" with { svg_custom_class: "icon-inline icon-social" } %}
    </a>
  {% endif %}
{% endfor %}

{# 2) Redes que vienen desde settings.* #}
{% if settings.linkedin_url %}
  <a class="social-icon" href="{{ settings.linkedin_url }}" target="_blank" aria-label="linkedin {{ store.name }}">
    {% include "snipplets/svg/linkedin.tpl" with { svg_custom_class: "icon-inline icon-social" } %}
  </a>
{% endif %}

{% if settings.twitch_url %}
  <a class="social-icon" href="{{ settings.twitch_url }}" target="_blank" aria-label="twitch {{ store.name }}">
    {% include "snipplets/svg/twitch.tpl" with { svg_custom_class: "icon-inline icon-social" } %}
  </a>
{% endif %}
<style>
.icon-social{
  font-size:30px !important;
}
</style>