$(function () {
    function display(bool) {
        if (bool) {// Doublox#9803
            $("#container").slideDown(400);
            $("#startscreen ").slideDown(400);
            $("#info").hide()
            $(".buttonsopen").hide()// Doublox#9803
            $("#warn").hide()

            $("#done").hide()



            

            // Doublox#9803
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)// Doublox#9803
            } else {
                display(false)
            }
        }// Doublox#9803
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return
        }
    };
    $("#start").click(function () {
        
       $("#startscreen").fadeOut(400)
       $(".buttonsopen").show(500)
    
       $("#warn").hide()

       document.getElementById('firstname').value = ''
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''
       document.getElementById('gender').value = ''







    })


    var first = document.getElementById('firstname')
    var last = document.getElementById('lastname')
    var age = document.getElementById('age')// Doublox#9803
    var why = document.getElementById('why')
    var gender = document.getElementById('gender')


        $(".sumbit").click(function() {
                if($(first , last , age , why , gender).val() === '') {
                    $("#warn").fadeIn(400)
                    return// Doublox#9803
                    
                } else{
                $("#warn").fadeOut(400)
                $("#info").fadeOut(400)
                $("#done").fadeIn(400)
                $.post(
                    `http://${GetParentResourceName()}/name`,
                  JSON.stringify({
                    plate: $("#firstname").val(),     // Doublox#9803
                    lastname: $("#lastname").val(),
                    age: $("#age").val(),
                    why: $("#why").val(),// Doublox#9803
                    gender: $("#gender").val(),
                  })
                );
            }
        
    })
    $("#sumbit2").click(function() {
        var ft = document.getElementById('ft')// Doublox#9803
        var ln = document.getElementById('ln')
        var reason = document.getElementById('reason')
        var date = document.getElementById('date')

        
        if($(ft , ln , reason , date).val() === '') {
            $("#warn1").fadeIn(400)
            return
            
        } else{

  
      
    
        $("#warn").fadeOut(400)
        // $("#complaintinfo").fadeOut(400)
// Doublox#9803
        $("#done").fadeIn(400)
        $.post(
            // `http://${GetParentResourceName()}/complaintinfo`,
          JSON.stringify({
            ft: $("#ft").val(),     
            ln: $("#ln").val(),
            reason: $("#reason").val(),// Doublox#9803
            date: $("#date").val(),

            myImg: $("#myImg").val(),


          })
        );
    }

})


    $(".exit").click(function() {
// Doublox#9803
        $("#container").fadeOut();
        setTimeout(function(){
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));

        },400);

// Doublox#9803
        return
    })
    
    $("#Form").click(function() {
        $("#warn").hide()
// Doublox#9803
        $("#info").fadeIn(400)
        $(".buttonsopen").hide()
        return
    })
    $("#back").click(function(){
        $("#info").toggle("slow")
        
        $("#warn1").hide()// Doublox#9803
        $(".buttonsopen").show()
        
       document.getElementById('firstname').value = ''// Doublox#9803
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''
       document.getElementById('gender').value = ''

    })
    $("#back2").click(function(){// Doublox#9803
        // $("#complaintinfo").toggle("slow")
        $("#warn").hide()

        $("#container").fadeOut();
        setTimeout(function(){
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));

        },400);

// Doublox#9803
        return

    })
    
// Doublox#9803
    // $("#complaint").click(function(){
    //     document.getElementById('ft').value = ''
    //     document.getElementById('ln').value = ''
    //     document.getElementById('date').value = ''
        
    //     document.getElementById('reason').value = ''
    //     document.getElementById('myImg').value = ''

    //     $(".buttonsopen").hide()
    //     $("#complaintinfo").show()
    //     $("#warn").hide()


    // })


        
    

        
    

})
