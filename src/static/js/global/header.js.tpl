{#/*============================================================================
      #Header and nav
    ==============================================================================*/ #}

    {# /* // Header */ #}

            var $swiper_height = window.innerHeight - 100;
            var $logo_scroll_height = 150;
            document.addEventListener("scroll", function() {
                {% if template == 'home' and settings.head_transparent %}
                    {% if settings.slider and settings.slider is not empty %}        
                        if (document.documentElement.scrollTop > $swiper_height ) {
                            jQueryNuvem(".js-head-main").removeClass("head-transparent");
                        } else {
                            jQueryNuvem(".js-head-main").addClass("head-transparent");
                        }
                    {% endif %}
                {% endif %}
                {% if 'head_logo_on_scroll.jpg' | has_custom_image %}
                    if (document.documentElement.scrollTop < $logo_scroll_height ) {
                            jQueryNuvem(".js-head-main").removeClass("head-scrolled");
                        } else {
                            jQueryNuvem(".js-head-main").addClass("head-scrolled");
                        }
                {% endif %}
            });


    {# /* // Nav offset */ #}
    function applyOffset(selector){

        // Get nav height on load
        if (window.innerWidth > 768) {
            var head_height = jQueryNuvem(".js-head-main").height();
            if( head_height > 500) {
                setTimeout(() => {
                    applyOffset(selector);
                },500)
            } else {
                jQueryNuvem(selector).css("paddingTop", head_height.toString() + 'px');
            }
        }else{
            {# On mobile there is no top padding due to position sticky CSS #}
            var head_height = 0;
        }

        // Apply offset nav height on load

        window.addEventListener("resize", function() {

            // Get nav height on resize
            var head_height = jQueryNuvem(".js-head-main").height();

            // Apply offset on resize
            if (window.innerWidth > 768) {
                jQueryNuvem(selector).css("paddingTop", head_height.toString() + 'px');
            }else{

                {# On mobile there is no top padding due to position sticky CSS #}
                jQueryNuvem(selector).css("paddingTop", "0px");
            }
        });
    }

    {% if settings.head_fix and ((settings.head_transparent and template != 'home') or (not settings.head_transparent)) %}
        applyOffset(".js-head-offset");
    {% endif %}

    {# /* // Nav */ #}

        var $top_nav = jQueryNuvem(".js-mobile-nav");
        var $page_main_content = jQueryNuvem(".js-main-content");
        var $search_backdrop = jQueryNuvem(".js-search-backdrop");

        $top_nav.addClass("move-down").removeClass("move-up");

		{% set image_url = false %}
        {% for image in settings.header_subcategory_images %}
			{% if 'productos > mujer' in image.title|lower %}
			{% set image_url = image.image | static_url %}
			{% endif %}
		{% endfor %}
        var $categoryDefaultImage = '{{image_url ? image_url:""}}';


        {# Nav subitems #}
        jQueryNuvem(".js-toggle-page-accordion").on("click", function (e) {
            e.preventDefault();
            let currentToggle = jQueryNuvem(e.currentTarget)
            currentToggle.toggleClass("active");
            let currentAccordion = jQueryNuvem(e.currentTarget).closest('.item-with-subitems');
            currentAccordion.siblings().find('.active').first().removeClass('active');
            let currentAcc = jQueryNuvem(e.currentTarget).closest(".js-nav-list-toggle-accordion").next(".js-pages-accordion");
            {# contempla niveles de profundidad para cerrar submenues #}
            let depthLevel = '';
            if(currentAcc.hasClass('subitems-menu-depth-3')){
                depthLevel = '.subitems-menu-depth-3';
            } else if(currentAcc.hasClass('subitems-menu-depth-2')) {
                depthLevel = '.subitems-menu-depth-2';
            }

            jQueryNuvem(".item-with-subitems .js-pages-accordion"+depthLevel).each(acc => {
              if(jQueryNuvem(acc).get(0)[0] == currentAcc.get(0)[0]){
                jQueryNuvem(acc).slideToggle(150);
              } else {
                jQueryNuvem(acc).hide();  

              }
            });

            {# renderiza la imagen de categoria por url #}
            let categoryImgUrl = currentToggle.data('categoryImage');
            if(categoryImgUrl != undefined ) {
                jQueryNuvem('.modal-body .js-header-desktop-image-container img.category-image').attr('src', categoryImgUrl);
            } else {
                jQueryNuvem('.modal-body .js-header-desktop-image-container img.category-image').attr('src', $categoryDefaultImage);
            }
        });

        jQueryNuvem('#nav-hamburger .js-modal-close').on("click", function (e) {
            jQueryNuvem('.modal-body .js-header-desktop-image-container img.category-image').attr('src', $categoryDefaultImage);
        });

        jQueryNuvem('.js-subitems-overlay').on("click", function (e) {
            jQueryNuvem(e.currentTarget).closest(".item-with-subitems").find(".js-toggle-page-accordion").click();
        });

        {# Focus search #}
        jQueryNuvem(".js-toggle-search").click(function (e) {
            e.preventDefault;
            jQueryNuvem(".js-search-input").each(el => el.focus());
        });


    {# /* // Search suggestions */ #}

        LS.search(jQueryNuvem(".js-search-input"), function (html, count) {
            $search_suggests = jQueryNuvem(this).closest(".js-search-container").next(".js-search-suggest");
            if (count > 0) {
                $search_suggests.html(html).show();
            } else {
                $search_suggests.hide();
            }
            if (jQueryNuvem(this).val().length == 0) {
                $search_suggests.hide();
            }
        }, {
            snipplet: 'header/header-search-results.tpl'
        });

        if (window.innerWidth > 768) {

            {# Hide search suggestions if user click outside results #}

            jQueryNuvem("body").on("click", function () {
                jQueryNuvem(".js-search-suggest").hide();
            });

            {# Maintain search suggestions visibility if user click on links inside #}

            jQueryNuvem(document).on("click", ".js-search-suggest a", function () {
                jQueryNuvem(".js-search-suggest").show();
            });
        }

        jQueryNuvem(".js-search-suggest").on("click", ".js-search-suggest-all-link", function (e) {
            e.preventDefault();
            $this_closest_form = jQueryNuvem(this).closest(".js-search-suggest").prev(".js-search-form");
            $this_closest_form.submit();
        });

    {# /* // Lang select */ #}


    changeLang = function(element) {
        var selected_country_url = element.find("option").filter((el) => el.selected).attr("data-country-url");
        location.href = selected_country_url;
    };

    jQueryNuvem('.js-lang-select').on("change", function (e) {
        lang_select_option = jQueryNuvem(this);

        changeLang(lang_select_option);
    });

    (function () {
    var panel   = document.getElementById('desktop-cats-panel');
    var chevron = document.querySelector('.menu-desktop-chevron'); // puede ser null
    var header  = document.querySelector('.js-head-main');

    if (!panel) return;

    var btnChevron = chevron ? chevron.querySelector('.js-accordion-toggle') : null;
    var iconOff    = chevron ? chevron.querySelector('.js-accordion-toggle-inactive') : null;
    var iconOn     = chevron ? chevron.querySelector('.js-accordion-toggle-active') : null;

    function isOpen() {
        var aria = panel.getAttribute('aria-hidden');
        return aria === 'false' || panel.style.display !== 'none';
    }

    function syncChevron() {
        var open = isOpen();
        if (iconOff) iconOff.style.display = open ? 'none' : '';
        if (iconOn)  iconOn.style.display  = open ? '' : 'none';
        if (btnChevron) btnChevron.setAttribute('aria-expanded', open ? 'true' : 'false');
    }

    function closePanel() {
        panel.setAttribute('aria-hidden', 'true');
        panel.style.display = 'none';

        var activeToggles = document.querySelectorAll(
            '.item-with-subitems .js-accordion-toggle.active, ' +
            '.item-with-subitems .js-accordion-toggle.is-active'
        );
        activeToggles.forEach(function (el) {
            el.classList.remove('active', 'is-active');
        });

        syncChevron();
    }
     function openPanel() {
        panel.setAttribute('aria-hidden', 'false');
        panel.style.display = '';
        syncChevron();
    }

    var closeBtn = panel.querySelector('.js-cats-panel-close');
    if (closeBtn) {
        closeBtn.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            closePanel();
        });
    }
        var catsBar = document.querySelector('.head-cats-bar');

    if (catsBar) {
        catsBar.addEventListener('click', function (e) {
            // Solo desktop
            if (window.innerWidth <= 768) return;

            var link = e.target.closest('a');

            if (!isOpen()) {
                
                if (link) {
                    e.preventDefault();
                    
                }else{
                    openPanel()
                }
                
                
            } else {
             
                if (!link) {
                    
                    e.preventDefault();
                    closePanel();
                }
                
            }
        });
    }
    var mo = new MutationObserver(syncChevron);
    mo.observe(panel, { attributes: true, attributeFilter: ['aria-hidden', 'style', 'class'] });

    document.addEventListener('click', function (e) {
        var target  = e.target;
        var toggler = target.closest('.js-accordion-toggle');

        if (toggler) {
            if (chevron && toggler.closest('.menu-desktop-chevron')) e.preventDefault();
            setTimeout(syncChevron, 0);
            return;
        }

        if (window.innerWidth <= 768) return;

        if ((header && header.contains(target)) || panel.contains(target)) return;

        if (isOpen()) {
            closePanel();
        }
    });

    syncChevron();
})();