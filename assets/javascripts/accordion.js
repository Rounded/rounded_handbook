<script type="text/javascript">
        $('document').ready(function(){
            
            $('#myToolTip').tooltip();
            
            $('#myPopOver').popover();

            $('#d1').contenthover({
                overlay_background:'#000',
                overlay_opacity:0.8
            });

            $('#d2').contenthover({
                effect:'slide',
                slide_speed:300,
                overlay_background:'#000',
                overlay_opacity:0.8
            });
                
        });
    </script>