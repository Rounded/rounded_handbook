jQuery(document).ready ($) ->
  if $('.type-videos').length
    collection = $('.type-videos')
    featured = collection.slice(0,8)
    featured.addClass("featured-video-row")

    collection.on 'mouseup', () ->
      setTimeout (->
        collection = $('.type-videos')
        collection.removeClass("featured-video-row")
        
        featured = collection.slice(0,8)
        featured.addClass("featured-video-row")
      ), 0