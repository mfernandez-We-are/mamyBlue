{#/*============================================================================
      #Footer
==============================================================================*/ #}

    {% if store.afip %}
        {# Add alt attribute to external AFIP logo to improve SEO #}
        jQueryNuvem('img[src*="www.afip.gob.ar"]').attr('alt', '{{ "Logo de AFIP" | translate }}');
    {% endif %}
