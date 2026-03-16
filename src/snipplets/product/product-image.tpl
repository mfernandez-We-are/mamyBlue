{% set has_multiple_slides = product.images_count > 1 or product.video_url %}

{% if product.images_count > 0 %}
	<div class="product-image-container col-12 {% if show_thumbs %}col-md-10{% endif %} p-0">
		<div class="row mx-0">
			<div class="col-3 px-0 product-thumbs">
				{# ✅ Thumb carousel embebido justo debajo de la imagen #}
				<div class="swiper-button-prev js-swiper-product-thumbs-prev">
					{% include "snipplets/svg/chevron-up.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-2x svg-icon-text"} %}
				</div>
				<div class="js-swiper-product-thumbs swiper-container d-block">
					<div class="swiper-wrapper">
						{% for media in product.media %}
							<div class="swiper-slide">
								{% include 'snipplets/product/product-image-thumbs.tpl' %}
							</div>
						{% endfor %}
					</div>
				</div>
				<div class="swiper-button-next js-swiper-product-thumbs-next">
					{% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-2x svg-icon-text"} %}
				</div>
			</div>
			<div class="col-8 px-0 mx-md-auto ml-md-0 js-swiper-product{% if settings.scroll_product_images %} product-detail-slider{% endif %} swiper-container" style="visibility:hidden; height:0;" data-product-images-amount="{{ product.images_count }}">
				{% include 'snipplets/components/assets/labels.tpl' with {'product_detail': true, 'is_label_for_product_page': true} %}
				<div class="swiper-wrapper">
					{% for image in product.images %}
						<pre class="d-none">{{image|json_encode}}</pre>
						<div class="swiper-slide js-product-slide slider-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}">
							<a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative">
								<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ image | product_image_url('large') }} 480w, {{ image | product_image_url('huge') }} 640w, {{ image | product_image_url('original') }} 1024w' data-sizes="auto" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %} alt="{{image.alt}}" {% endif %} width="{{image.dimensions.width}}" height="{{image.dimensions.height}}" />
								<img src="{{ image | product_image_url('tiny') }}" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered blur-up" {% if image.alt %} alt="{{image.alt}}" {% endif %} width="{{image.dimensions.width}}" height="{{image.dimensions.height}}" />
							</a>
						</div>
					{% endfor %}
					{% include 'snipplets/product/product-video.tpl' %}
				</div>
				<div class="js-swiper-product-prev swiper-button-prev icon-2x d-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-16 svg-icon-text"} %}</div>
				<div class="js-swiper-product-next swiper-button-next icon-2x d-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-16 svg-icon-text"} %}</div>
			</div>
			{% snipplet 'components/placeholders/product-detail-image-placeholder.tpl' %}
		</div>
	</div>
{% endif %}

<style>
.js-swiper-product-thumbs-next{
	top: 80% !important;
}
</style>