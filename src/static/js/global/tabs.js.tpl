{#/*============================================================================
      #Accordions
    ==============================================================================*/ #}
    function toggleAccordion(selector){
        if(jQueryNuvem(selector).hasClass("js-accordion-show-only")){
            jQueryNuvem(selector).hide();
        }else{
            jQueryNuvem(selector).find(".js-accordion-toggle-inactive").toggle();
            jQueryNuvem(selector).find(".js-accordion-toggle-active").toggle();
        }
        jQueryNuvem(selector).closest(".js-accordion-container").find(".js-accordion-content").slideToggle("fast");
    }

    function toggleAccordionExpand(selector) {
        jQueryNuvem(selector).find(".js-accordion-toggle-inactive").toggle();
        jQueryNuvem(selector).find(".js-accordion-toggle-active").toggle();
        console.log(jQueryNuvem(selector).closest(".js-accordion-expand-container").get(0)[0]);
        jQueryNuvem(selector).closest(".js-accordion-expand-container").toggleClass("accordion-expanded");
    }

    jQueryNuvem(document).on("click", ".js-accordion-toggle", function(e) {
        e.preventDefault();
        toggleAccordion(this);
    });
    
    jQueryNuvem(document).on("click", ".js-accordion-expand-toggle", function(e) {
        e.preventDefault();
        toggleAccordionExpand(this);
    });

    if(window.innerWidth < 768) {
        jQueryNuvem(document).on("click", ".js-accordion-toggle-mobile", function(e) {
            e.preventDefault();
            toggleAccordion(this);
        });
        jQueryNuvem(".js-accordion-content-mobile").hide();
    } else {
        jQueryNuvem(".js-accordion-toggle-mobile").css("cursor" , "default").removeAttr('href');
    }
