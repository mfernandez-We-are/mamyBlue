{#/*============================================================================
	  #Social
	==============================================================================*/ #}

{% if (template == 'home' or template == 'page' ) and settings.video_embed %}
        window.addEventListener('ig.feed.loaded', function(){
            let width = window.innerWidth;
            if(width < 768) {
                jQueryNuvem('#instagram-feed > div:nth-last-child(2), #instagram-feed > div:last-child').remove();
            }
        });


        {% set video_url = settings.video_embed %}
        {% if '/watch?v=' in settings.video_embed %}
            {% set video_format = '/watch?v=' %}
        {% elseif '/youtu.be/' in settings.video_embed %}
            {% set video_format = '/youtu.be/' %}
        {% elseif '/shorts/' in settings.video_embed %}
            {% set video_format = '/shorts/' %}
        {% endif %}
        {% set video_id = video_url|split(video_format)|last %}

        {# /* // Youtube video with autoplay */ #}

        function loadVideoFrame() {
            window.youtubeIframeService.executeOnReady(() => { 
                new YT.Player('player', {
                        width: '100%',
                        videoId: '{{video_id}}',
                        playerVars: { 'autoplay': 1, 'playsinline': 1, 'rel': 0, 'loop': 1, 'autopause': 0, 'controls': 0, 'showinfo': 0, 'modestbranding': 1, 'branding': 0, 'fs': 0, 'iv_load_policy': 3 },
                        events: {
                            'onReady': onPlayerReady,
                            'onStateChange':onPlayerStateChange
                        }
                    }
                );
            });
        };

        {% if settings.home_order_position_1 == 'video' and settings.video_type == 'autoplay' %}
            if (window.innerWidth < 768) {
                window.addEventListener("pointerdown", () => {
                    loadVideoFrame();
                }, { once: true });
            } else {
                loadVideoFrame();
            }
        {% else %}
            {% if settings.video_type == 'autoplay' %}
                jQueryNuvem('.js-home-video-container').on('lazyloaded', function(e){
                    loadVideoFrame();
                });
            {% else %}
                jQueryNuvem('.js-play-button').on("click", function(e){
                    e.preventDefault();
                    const $playButton = jQueryNuvem('.js-home-video-container .js-play-button');
                    $playButton.css("opacity" , "0");
                    setTimeout(function(){
                        $playButton.css("height" , "0");
                    },200);
                    jQueryNuvem(".js-home-video-image").hide();
                    loadVideoFrame();
                });
            {% endif %}
        {% endif %}
        

        function onPlayerReady(event) {
            {% if settings.video_type == 'autoplay' %}
                event.target.mute();
            {% endif %}
            event.target.playVideo();
        }

        function onPlayerStateChange(event) {
            {% if settings.home_order_position_1 == 'video' %}
                if (event.data == YT.PlayerState.PLAYING) {
                    jQueryNuvem(".js-home-video-image").addClass("fade-in");
                }
            {% endif %}
            if (event.data == YT.PlayerState.ENDED) {
                event.target.seekTo(0);
                event.target.playVideo();
            }
        }

    {% endif %}

    {% if template == 'product' and product.video_url %}
        {% set video_url = product.video_url %}
        {# /* // Youtube or Vimeo video for home or each product */ #}
        LS.loadVideo('{{ video_url }}');
    {% endif %}