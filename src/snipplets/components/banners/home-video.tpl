{% if settings.video_embed %}
    <section class="section-video-home" data-store="home-video">
        <div class="container{% if settings.video_full %}-fluid p-0{% endif %}">
            <div class="row no-gutters">
                <div class="col">
                    {% include 'snipplets/video-item.tpl' with { video_responsive: true, video_type: settings.video_type, video_embed: settings.video_embed, order_position: settings.home_order_position_1, head_transparent: settings.head_transparent, video_title: settings.video_title, video_subtitle: settings.video_subtitle, video_text: settings.video_text, video_button: settings.video_button, video_button_url: settings.video_button_url, video_vertical_mobile: settings.video_vertical_mobile  } %}
                </div>
            </div>
        </div>
    </section>
{% endif %}