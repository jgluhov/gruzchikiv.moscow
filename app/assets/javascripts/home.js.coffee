$(document).ready ->
  options = {
    circle_radius: 220,
    normal_feature_size: 100,
    highlighted_feature_size: 150,
    top_margin: 100,
    bottom_margin: 50,
    spacing: 40,
    min_padding: 10,
    type: 'image',
    automaticAnimation: false,
    automaticAnimationInterval: 5,
    animation_mode: 'js',
    text_position: 'right'
  };

  settings = []

  $.getJSON 'ajax/thumbnails', (data,status) ->
    data.forEach (thumbnail) ->
      settings.push({image: thumbnail.image.url, heading: thumbnail.title, description: thumbnail.text })

    enquire
      .register "screen and (min-width: 960px)", [
        setup: ->
          options.text_position = "top"
          options.top_margin = 30
          fp = new FeaturePresenter $("#presenter"), settings, options
        match: ->
          options.top_margin = 100
          options.text_position = "right"
          fp = new FeaturePresenter $("#presenter"), settings, options
        unmatch: ->
          options.top_margin = 30
          options.text_position = "top"
          fp = new FeaturePresenter $("#presenter"), settings, options
  ]
