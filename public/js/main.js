window.addEventListener("load", function () {

    var url = "http://proyecto-laravel.com";

    $('.btn-like').css('cursor', 'pointer');
    $('.btn-dislike').css('cursor', 'pointer');

    //Boton de like
    function like() {
        $('.btn-like').off("click").on("click", function () {

            console.log('like');
            $(this).addClass('btn-dislike').removeClass('btn-like');
            $(this).attr('src', url + '/img/heart-red.png');

            $.ajax({
                url: url + '/like/' + $(this).data('id'),
                type: 'GET',
                success: function(response){
                    if(response.like){
                        console.log("Has dado like a la publicación");
                    }else{
                        console.log("Error al dar like");
                    }
                    
                }
            });

            dislike();
        });
    }

    like();

    //Boton de dislike
    function dislike() {
        $('.btn-dislike').off("click").on("click", function () {

            console.log('dislike');
            $(this).addClass('btn-like').removeClass('btn-dislike');
            $(this).attr('src', url + '/img/heart-black.png');

            $.ajax({
                url: url + '/dislike/' + $(this).data('id'),
                type: 'GET',
                success: function(response){
                    if(response.like){
                        console.log("Has quitado el like a la publicación");
                    }else{
                        console.log("Error al quitar like");
                    }
                    
                }
            });

            like();
        });
    }

    dislike();



    //BUSCADOR

    $('#buscador').$submit(function(){
        $(this).attr('action' , url+'/gente/'+$('#buscador #search').val());
    });


});

