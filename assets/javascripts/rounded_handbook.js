(function() {
  $(document).ready(function() {
    window.transparentShown = false;
    $(".toggle-transparent").click(function() {
      if (window.transparentShown === false) {
        $(".transparent").fadeIn(400);
        window.transparentShown = true;
      } else {
        $(".transparent").fadeOut(400);
        window.transparentShown = false;
      }
    });
  });

}).call(this);
