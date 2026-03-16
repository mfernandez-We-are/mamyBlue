{% set desktop_class = desktop_class | default('text-center') %}

<div class="logo-static">
  {{ component('logos/logo', {
    container_classes: {
      logo_img_container: 'w-fit mx-auto ' ~ desktop_class
    },
    logo_img_classes: 'transition-soft-slow',
    logo_text_classes: 'h1 m-0'
  }) }}
</div>
