{#     /*============================================================================
	  #Product grid
	==============================================================================*/  #}

    var $category_controls = jQueryNuvem(".js-category-controls");
    var mobile_nav_height = jQueryNuvem(".js-head-main .container-fluid").outerHeight();

	{% if template == 'category' %}

         {# /* // Fixed category controls */ #}

        if (window.innerWidth < 768) {
            {% if settings.head_fix %}
                $category_controls.css("top" , mobile_nav_height.toString() + 'px');
            {% else %}
                jQueryNuvem(".js-category-controls").css("top" , "0px");
            {% endif %}

             {# Detect if category controls are sticky and add css #} 

            var observer = new IntersectionObserver(function(entries) {
                if(entries[0].intersectionRatio === 0)
                    document.querySelector(".js-category-controls").classList.add("is-sticky");
                else if(entries[0].intersectionRatio === 1)
                    document.querySelector(".js-category-controls").classList.remove("is-sticky");
                }, { threshold: [0,1] 
            });

            observer.observe(document.querySelector(".js-category-controls-prev"));
        }

	{% endif %}

    {% if template == 'category' or template == 'search' %}

         {# // Control de grilla PLP  #}
        function updateButtonSelection(selectedButtonId) {
            jQueryNuvem('.text-center button').removeClass('selected');
            jQueryNuvem('#' + selectedButtonId).addClass('selected');
        }

        var winW = jQueryNuvem(window).width();

        if (winW < 768) {
            jQueryNuvem('#btn-1').removeClass('selected');
            jQueryNuvem('#btn-2-mobile').addClass('selected');
        } else {
            jQueryNuvem('#btn-3').removeClass('selected');
            jQueryNuvem('#btn-4').addClass('selected');
        }

         {# // Mobile buttons  #}
        jQueryNuvem('#btn-1').on('click', function () {
            jQueryNuvem('.js-product-table .js-item-product').each(e => { 
                jQueryNuvem(e).addClass('col-12');
                jQueryNuvem(e).removeClass('col-6');
            });
            updateButtonSelection('btn-1');
        });

         {# // Mobile x2 button  #}
        jQueryNuvem('#btn-2-mobile').on('click', function () {
            jQueryNuvem('.js-product-table .js-item-product').each(e => { 
                jQueryNuvem(e).addClass('col-6');
                jQueryNuvem(e).removeClass('col-12');
            });
            updateButtonSelection('btn-2-mobile');
        });

         {# // Desktop x4 button  #}
        jQueryNuvem('#btn-4').on('click', function () {
            jQueryNuvem('.js-product-table .js-item-product').each(e => { 
                jQueryNuvem(e).addClass('col-md-3');
                jQueryNuvem(e).removeClass('col-md-4');
            });
            updateButtonSelection('btn-4');
        });

         {# // Desktop buttons  #}
        jQueryNuvem('#btn-3').on('click', function () {
            jQueryNuvem('.js-product-table .js-item-product').each(e => { 
                jQueryNuvem(e).addClass('col-md-4');
                jQueryNuvem(e).removeClass('col-md-3');
            });
            updateButtonSelection('btn-3');
        });

         {# // Monitor and maintain layout  #}
        function monitorLayout() {
            jQueryNuvem('.cambio-vistas .selected').each(e => {
                let buttonId = jQueryNuvem(e).attr('id');
                let sizes = {'btn-1': true, 'btn-2-mobile': true, 'btn-4': true, 'btn-3': true};

                if (sizes[buttonId]) {
                    jQueryNuvem('#'+buttonId).click();
                }
            });
        }

         {# // Set default selected button based on screen size  #}
        jQueryNuvem('#btn-2-mobile').click();
        jQueryNuvem('#btn-4').click();


        !function() {

            {# /* // Infinite scroll */  #}
            {% if pages.current == 1 and not pages.is_last %}
                LS.hybridScroll({
                    productGridSelector: '.js-product-table',
                    spinnerSelector: '#js-infinite-scroll-spinner',
                    loadMoreButtonSelector: '.js-load-more',
                    hideWhileScrollingSelector: ".js-hide-footer-while-scrolling",
                    productsBeforeLoadMoreButton: 9999,
                    productsPerPage: 12,
                    afterLoaded: function() {
                        monitorLayout();
                    }
                });
            {% endif %}
        }();

        {# /* ========================= * Buffer de filtros (dinámico) * ========================= */ #}
        window.FilterBufferNuvem = (function () {
            function readBase() {
                try {
                if (LS && typeof LS.getUrlParams === 'function') return { ...LS.getUrlParams(false) };
                if (LS && LS.urlParams) return { ...LS.urlParams };
                } catch (e) {}
                const out = {}, qs = new URLSearchParams(window.location.search);
                qs.forEach((v, k) => out[k] = v);
                return out;
            }

            let params = readBase();

            const getList = (k) => (params[k] ? String(params[k]).split('|').filter(Boolean) : []);
            
            const setList = (k, arr) => {
                if (!arr || !arr.length) { delete params[k]; return; }
                params[k] = Array.from(new Set(arr.map(String))).sort().join('|');
            };

            function add(key, value) {
                const list = getList(key);
                if (!list.includes(String(value))) list.push(String(value));
                setList(key, list);
            }

            function remove(key, value) {
                setList(key, getList(key).filter(x => x !== String(value)));
            }

            function setKV(key, value) {
                if (value == null || value === '') delete params[key];
                else params[key] = String(value);
            }

            function clearKeys(keys) {
                (keys || []).forEach(k => { delete params[k]; });
            }

            function getAll() { return { ...params }; }

            function buildEncoded() {
                if (LS && typeof LS.encodeURIParams === 'function') return LS.encodeURIParams(params);
                const enc = {};
                Object.keys(params).forEach(k => {
                enc[encodeURIComponent(k)] = String(params[k]).split('|').map(encodeURIComponent).join('|');
                });
                return enc;
            }

            function apply() {
                if (window.hasFixFilterPaginationTag && typeof LS.resetPaginationIfNeeded === 'function') {
                LS.resetPaginationIfNeeded();
                }
                const encoded = buildEncoded();
                LS.paramsToUrl(encoded);
            }

            return { add, remove, set: setKV, clearKeys, getAll, apply, buildEncoded };
        })();

        {# /* =========================
        * Helpers UI (preview botón)
        * ========================= */ #}
        function updatePreviewHref() {
            var $btn = jQueryNuvem("#boton-send");
            if (!$btn.length) return;
            var enc = window.FilterBufferNuvem.buildEncoded();
            var qs = Object.keys(enc).map(function(k){ return k + "=" + enc[k]; }).join("&");
            $btn.attr("href", qs ? (window.location.pathname + "?" + qs) : window.location.pathname);
        }

        {# /* =========================
        * Chips de filtros (UI)
        * ========================= */ #}
        function rebuildFilterChips() {
            let modalId = window.innerWidth > 767 ? '#nav-filters': '#nav-filters-mobile'
            var $wrap = jQueryNuvem(modalId + ' .filters-to-apply');
            if (!$wrap.length) return;

            $wrap.empty();

            var params = window.FilterBufferNuvem.getAll();
            {# // Excluí claves que no querés mostrar como chips #}
            var EXCLUDE = ['results_only', 'page', 'mpage', 'limit', 'sort_by'];

            Object.keys(params).forEach(function (key) {
                if (EXCLUDE.indexOf(key) !== -1) return;

                let vals = String(params[key]).split('|').filter(Boolean);
                vals.forEach(function (val) {
                let $chip = jQueryNuvem(
                    '<button type="button" class="applied-filters js-remove-current-filter chip"></button>'
                );
                let $icon = jQueryNuvem('<svg class="icon-inline chip-remove-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z"/></svg>');
                {# // data-* para poder deseleccionar desde el chip #}
                $chip.attr('data-filter-name', key)
                    .attr('data-filter-value', val)
                    .text(key + ': ' + val + ' ')
                    .append($icon);

                $wrap.append($chip);
                });
            });
            let $title = jQueryNuvem('.filters-to-apply-title')
            if($wrap.children('.chip').length == 0){
                $wrap.addClass('d-none');
                $title.addClass('d-none');
            } else {
                $wrap.removeClass('d-none');
                $title.removeClass('d-none');
            }
        }

        {# // ---- Init: reflejar filtros aplicados al cargar ---- #}
        jQueryNuvem(function () {
            var params = window.FilterBufferNuvem.getAll();

            jQueryNuvem(".filter-checkbox, .js-filter-apply, .js-filter-remove").each(function () {
                var $el  = jQueryNuvem(this);
                var name = $el.data("filterName");
                var val  = String($el.data("filterValue"));
                if (!name) return;

                var arr = params[name] ? String(params[name]).split("|").filter(Boolean) : [];
                var isOn = arr.indexOf(val) !== -1;

                {# // marcar visualmente y sincronizar clases/checkbox #}
                $el.toggleClass("selected", isOn)
                .toggleClass("js-filter-apply", !isOn)
                .toggleClass("js-filter-remove", isOn);

                $el.find("input[type='checkbox']").prop("checked", isOn);
            });

            {# // actualizar href de "Ver resultados" con el estado actual (sin navegar) #}
            if (typeof updatePreviewHref === "function") {
                updatePreviewHref();
            }
            {# // (Opcional) avisar a otros scripts #}
            document.dispatchEvent(new CustomEvent("filters:initialized"));
        });

        {# /* ==========================================================
        * CLICK en contenedor -> toggle checkbox y delegar a 'change'
        * (sirve para .js-filter-apply / .js-filter-remove y .filter-checkbox)
        * ========================================================== */ #}
        jQueryNuvem(document).on("click", ".js-filter-apply, .js-filter-remove, .filter-checkbox", function (e) {

            {# // No dupliquemos manejo si el click vino del propio input #}
            if (e.target && e.target.matches('input[type="checkbox"]')) return;

            var $wrap = jQueryNuvem(this);
            var $cb = $wrap.find('input[type="checkbox"]').first();
            if (!$cb.length) return;

            {# // Toggle visual del input y dispara la lógica centralizada #}
            $cb.prop('checked', !$cb.prop('checked')).trigger('change');
        });

        {# /* ============================================
        * CHANGE del checkbox -> lógica centralizada
        * ============================================ */ #}
        jQueryNuvem(document).on("change", ".filter-checkbox input[type='checkbox'], .js-filter-apply input[type='checkbox'], .js-filter-remove input[type='checkbox']", function () {
            var $cb  = jQueryNuvem(this);
            var $el  = $cb.closest(".js-filter-apply, .js-filter-remove, .filter-checkbox");
            var name = $el.data("filterName");
            var val  = $el.data("filterValue");
            if (!name) return;

            var applying = $cb.prop('checked');

            if (applying) {
                window.FilterBufferNuvem.add(name, val);
                
                
                {# // métricas opcionales (genéricas) #}
                try {
                    if (typeof ga_send_event === 'function') ga_send_event("products", "insta-filters", name + "=" + val);
                    if (window._ProductFilterEvent && window.metricService) {
                        var ev = new _ProductFilterEvent.ProductFilterEvent("add", { name: name, value: val });
                        window.metricService.dispatch(ev);
                    }
                } catch(e){}
            } else {
                window.FilterBufferNuvem.remove(name, val);
                try {
                if (window._ProductFilterEvent && window.metricService) {
                    var rm = new _ProductFilterEvent.ProductFilterEvent("remove", [{ name: name, value: val }]);
                    window.metricService.dispatch(rm);
                }
                } catch(e){}
            }

            {# // Sincronizar clases legacy (si las usás para estilos) #}
            $el.toggleClass("js-filter-apply", !applying).toggleClass("js-filter-remove", applying);

            {# // Vista previa del href #}
            updatePreviewHref();
            {# actualiza chips en preview #}
            rebuildFilterChips();
        });

        jQueryNuvem(document).on("click", ".applied-filters.js-remove-filter", function(e){
            let name = jQueryNuvem(this).data('filterName');
            var val = jQueryNuvem(this).data('filterValue');

            LS.urlRemoveParam(name,val);
        })

        jQueryNuvem(document).on("click", "#boton-send", function(e){
            e.preventDefault();
            window.FilterBufferNuvem.apply();
        });

        jQueryNuvem(document).on("click", ".js-remove-all-filters", function(e) {
            e.preventDefault();
            LS.urlRemoveAllParams();
        });

        {# Elimina chips de preview #}
        jQueryNuvem(document).on('click', '.js-remove-current-filter', function (e) {
            e.preventDefault();

            var $chip = jQueryNuvem(this);
            var name  = $chip.data('filterName');
            var val   = $chip.data('filterValue');

            // Intentamos encontrar el checkbox correspondiente y disparar su 'change'
            var $box = jQueryNuvem(
                '.filter-checkbox[data-filter-name="' + name + '"][data-filter-value="' + val + '"], ' +
                '.js-filter-remove[data-filter-name="' + name + '"][data-filter-value="' + val + '"], ' +
                '.js-filter-apply[data-filter-name="' + name + '"][data-filter-value="' + val + '"]'
            ).find('input[type="checkbox"]').first();

            if ($box.length) {
                if ($box.prop('checked')) {
                $box.prop('checked', false).trigger('change'); // esto actualiza buffer + UI + chips
                } else {
                // Por si el input no estaba checked pero sí en buffer
                window.FilterBufferNuvem.remove(name, val);
                updatePreviewHref();
                rebuildFilterChips();
                }
            } else {
                // Si el filtro no está en el DOM (p.ej. modal cerrado), actualizamos solo el buffer
                window.FilterBufferNuvem.remove(name, val);
                updatePreviewHref();
                rebuildFilterChips();
            }
        });


		jQueryNuvem(document).on("change", ".js-sort-by", function () {
    var value = jQueryNuvem(this).val();
    if (window.FilterBufferNuvem && typeof window.FilterBufferNuvem.set === 'function') {
        window.FilterBufferNuvem.set('sort_by', value);
    }
    updatePreviewHref(); // opcional, para que el href del botón se actualice
});

   
    // Ver más / Ver menos subcategorías
    jQueryNuvem(document).on("click", ".js-see-more-cats", function (e) {
        e.preventDefault();

        var $btn = jQueryNuvem(this);
        var $container = $btn.closest("#custom-filter-categories");
        var $extras = $container.find(".extra-category");

        var expanded = $btn.hasClass("is-expanded");

        if (!expanded) {
            // Mostrar extras
            $extras.removeClass("d-none");
            $btn.text("Ver menos -");
            $btn.addClass("is-expanded");
        } else {
            // Ocultar extras
            $extras.addClass("d-none");
            $btn.text("Ver más +");
            $btn.removeClass("is-expanded");
        }
    });

    // Ver más / Ver menos valores dentro de cada filtro (marca, talle, etc.)
    jQueryNuvem(document).on("click", ".js-see-more-filter-values", function (e) {
            e.preventDefault();

            var $btn = jQueryNuvem(this);
            // Ahora el contenedor es el div con id="custom-filter-KEY"
            var $container = $btn.closest("[id^='custom-filter-']");
            var $extras = $container.find(".extra-filter-value");

            var expanded = $btn.hasClass("is-expanded");

            if (!expanded) {
                // Mostrar extras
                $extras.removeClass("d-none");
                $btn.text("Ver menos -");
                $btn.addClass("is-expanded");
            } else {
                // Ocultar extras
                $extras.addClass("d-none");
                $btn.text("Ver más +");
                $btn.removeClass("is-expanded");
            }
        });
    // Toggle filtros en mobile
    jQueryNuvem(document).on(
    "click",
    "#filters .checkbox-item, #filters .radio-button-item, #filters .checkbox-item input, #filters .radio-button-item input",
    function (e) {
        var $item = jQueryNuvem(this).closest(".checkbox-item, .radio-button-item");
        $item.toggleClass("selected");
    }
);

	{% endif %}