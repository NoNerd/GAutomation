// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .

$('.dropdown-toggle').dropdown();

 $(document).ready(function() {
$('#wysiwyg').wysiwyg({
	resizeOptions:{},
	controls:{
		html:{visible:true}
	}
});

$(function() {
    $('#datetimepicker4').datetimepicker({
      pickTime: false,
      format: 'yyyy-MM-dd'
    });
    $('#datetimepicker5').datetimepicker({
    	format: "yyyy-MM-dd hh:mm:ss"
    });

  $('#datetimepicker6').datetimepicker({
    	format: "yyyy-MM-dd hh:mm:ss"
    });
  });
  
    });


$('.best_in_place').best_in_place();


$(document).ready(function(){
	refreshTable();
});



function refreshTable(){
	
	var testcase_id = $('#js_testcase_id').val();
	var task_id = $("#js_task_id").val()	;
	var counter = $("#js_counter").val();
	var url = '/show_func_step_result?testcase_id=' + testcase_id+ '&task_id='+ task_id + '&counter=' + counter;
	$('#ajax').load('/ajax_result',function(){setTimeout(refreshTable, 7000)});
	$('#http_result_ajax').load('/show_ajax_result',function(){setTimeout(refreshTable,3000)});
	$('#func_result_ajax').load(url,function(){setTimeout(refreshTable,5000)});
}

