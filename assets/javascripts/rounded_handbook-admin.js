(function() {
  jQuery(document).ready(function($) {
    var collection, featured;
    if ($('.type-videos').length) {
      collection = $('.type-videos');
      featured = collection.slice(0, 8);
      featured.addClass("featured-video-row");
      return collection.on('mouseup', function() {
        return setTimeout((function() {
          collection = $('.type-videos');
          collection.removeClass("featured-video-row");
          featured = collection.slice(0, 8);
          return featured.addClass("featured-video-row");
        }), 0);
      });
    }
  });

}).call(this);
