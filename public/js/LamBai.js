// alert(0);
var currenQuestion = 0;
var responsiveMode = false;

$(document).ready(function(){
	$(window).resize(function(){
	 
	    // Lấy thông số
	    var width = $(window).width();
	    var height = $(window).height();
	    console.log(width+" "+height);
	    if(width<=980)
	    {	
	    	//console.log("true");
	    	$(".question-num-list").addClass("pagination");
	    	$(".question-num-list").addClass("justify-content-center");
	    	paginationQButton(currenQuestion);
			responsiveMode = true;
	    }else{
	    	$(".question-num-list").removeClass("pagination");
	    	$(".question-num-list").removeClass("justify-content-center");
	    	$(".q_btn").show();
	    	responsiveMode = false;
	    }
	     
	});

	var li = "<li class='col col-2'><input type='button' id='q_btn_"+ 1 +"' class='btn btn-outline-info active boder6 q_btn' value=' "+"Câu 0"+ 1 +"'></li>";	
	$('.question-num-list').append(li);
	for (var i = 2; i <= 50; i++) 
	{
		if (i<10) 
		{
			li = "<li class='col col-2'><input type='button' id='q_btn_"+ i +"' class='btn btn-outline-info boder6 q_btn' value=' "+"Câu 0"+ i +"'></li>";
		}
		else
		{
			li = "<li class='col col-2'><input type='button' id='q_btn_"+ i +"' class='btn btn-outline-info boder6 q_btn' value=' "+"Câu "+ i +"'></li>";		
		}
		
		
		$('.question-num-list').append(li);
	}
	

	$('.question-num-list').on('click','li',function()
		{
			//$('.question-num-list li input.active').removeClass('active');
			//$(this).find('input').addClass('active');
			currenQuestion = $(this).index();
			activeQuestion(currenQuestion);
		});
});


// data of question
$(document).ready(function createQuestion() {
	for (var i = 1; i <= 50; i++) {
		$('#question-content').append('<div class="question-content-item"><h4>Câu hỏi số ' + i+ '</h4><p>Question content ' + i +'</p></div>');
		$('#answer-select-container').append("<ul class='answer-select-list_" + i +"'></ul>");
		for(var j = 1; j<=4; j++)
		{
		 	$(".answer-select-list_"+i).append("<li>  <div class='custom-control custom-radio'><input type='radio' class='custom-control-input' id='customRadio_"+j+"_"+i+"' name='answerOfQuestion_"+i+"' value='selectAns_"+j+"'><label class='custom-control-label' for='customRadio_"+j+"_"+i+"'>answer of question "+ i+"</label></div></li>");
		}
	}
		
	activeQuestion(0);


	$('.pre').click(function() {
		
		if (currenQuestion > 0) {currenQuestion = currenQuestion -1;}
		if ((currenQuestion+1) % 5 == 0 && responsiveMode == true) { paginationQButton(currenQuestion - 4); }
		activeQuestion(currenQuestion);
	});

	$('.next').click(function() {
		
		if (currenQuestion <49 ) {currenQuestion = currenQuestion +1;}
		if (currenQuestion % 5 == 0 && responsiveMode == true) { paginationQButton(currenQuestion); }	
		activeQuestion(currenQuestion);
	});

	$("#answer-select-container").on("click","li", function () {
		 completeQuestion($(this).parent().index());
		// alert($(this).parent().index());
	});

	
});

//=============================================================function of clock

$( document ).ready(function() {
	var seconds = 0;
    var minutes = 90;
    var hours = 0;
    refreshClock();
    countdown();
	function countdown() {
        hasStarted = true
        interval = setInterval(() => {
            // if(hasEnded == false) {
            if (seconds <= 11 && minutes == 0 && hours == 0) {
              $(timer).find('span').addClass('red')
            }

            if(seconds == 0 && minutes == 0 || (hours > 0  && minutes == 0 && seconds == 0)) {
                hours--
                minutes = 59
                seconds = 60
                refreshClock()
            }

            if(seconds > 0) {
                seconds--
                refreshClock()
            }
            else if (seconds == 0) {
                minutes--
                seconds = 59
                refreshClock()
            }
        // }
        //     else {
        //         //restartClock()
        //     }

        }, 1000)
    }
    function pad(d) {
        return (d < 10) ? '0' + d.toString() : d.toString()
    }

    function refreshClock()
    {
    	jQuery('#countdown #hour').html(pad(hours));
		jQuery('#countdown #min').html(pad(minutes));
		jQuery('#countdown #sec').html(pad(seconds));
		if (hours == 0 && minutes == 0 && seconds == 0 && hasStarted == true) {
            location.reload();
        }
    }
});


//===========================================================================================

function activeQuestion(numQuestion)
{
	for (var i = 0; i < $('.question-content-item').length; i++) {
		$('.question-content-item')[i].style.display = "none";
		$('.answer-select-list_'+(i+1)).hide();
	}
	$('.question-num-list li input.active').removeClass('active');
	$('.question-content-item')[numQuestion].style.display = "block";
	$('.answer-select-list_'+(numQuestion+1)).show();
	//alert($('.q_btn')[numQuestion].value);
	$('.q_btn')[numQuestion].className += " "+"active";
}

function completeQuestion(numQuestion) {
	$(".q_btn")[numQuestion].classList.remove("btn-outline-info");
	$(".q_btn")[numQuestion].className += " " + "btn btn-success";
}

function paginationQButton(numQuestion)
{
	$(".q_btn").hide();
	for (var i = 1; i <=5; i++) {
		$(".q_btn")[numQuestion].style.display = "block";
		numQuestion++;
	}
}


		



