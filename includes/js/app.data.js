$(document).ready(function() {

	 $('#docs pre code').each(function(){
	    var $this = $(this);
	    var t = $this.html();
	    $this.html(t.replace(/</g, '&lt;').replace(/>/g, '&gt;'));
	});



	$(document).on('click', '.the-icons a', function(e){
		e && e.preventDefault();
	});

	$(document).on('change', 'table thead [type="checkbox"]', function(e){
		e && e.preventDefault();
		var $table = $(e.target).closest('table'), $checked = $(e.target).is(':checked');
		$('tbody [type="checkbox"]', $table).prop('checked', $checked);
	});



	function addNotification($notes){
		var $el = $('.nav-msg'), $n = $('.count-n:first', $el), $item = $('.list-group-item:first', $el).clone(), $v = parseInt($n.text());
		$('.count-n', $el).fadeOut().fadeIn().text($v+1);
		$item.attr('href', $notes.link);
		$item.find('.pull-left').html($notes.icon);
		$item.find('.media-body').html($notes.title);
		$item.hide().prependTo($el.find('.list-group')).slideDown().css('display','block');
	}


	// select2
   	if ($.fn.select2) {
        $("#select2-option").select2();
        $("#select2-tags").select2({
          tags:["red", "green", "blue"],
          tokenSeparators: [",", " "]}
        );
    }

	var editor = ace.edit("editor");
    editor.setTheme("ace/theme/tomorrow_night_bright");
    editor.getSession().setMode("ace/mode/coldfusion");
	editor.setAutoScrollEditorIntoView(true);
    editor.setOption("maxLines", 100);
    
    var editor2 = ace.edit("editor2");
    editor2.setTheme("ace/theme/tomorrow_night_bright");
    editor2.getSession().setMode("ace/mode/javascript");
    editor2.setAutoScrollEditorIntoView(true);
    editor2.setOption("maxLines", 30);



	$('#submit').on('click', function(){
		$('.logo').addClass('spin-logo')
		$.post('/reactor/submit',{solution: editor.getSession().getValue(), tests: editor2.getSession().getValue()}, function(data){

		    $('#output').html(data.result).addClass('active');
		    $('#tabs a:last').tab('show');

		     $('.logo').removeClass('spin-logo')
		});
	});

	$('#run_tests').on('click', function(){
		$('.logo').addClass('spin-logo')
		$.post('/reactor/runtests',{solution: editor.getSession().getValue(), tests: editor2.getSession().getValue()}, function(data){
		    console.log(data)
		    $('#output').html(data.result).addClass('active');
		    $('#tabs a:last').tab('show');

		    $('.logo').removeClass('spin-logo')
		});
	});


	window.setInterval('serverstatus()', 300);


});

function serverstatus(){
	$.get('/reactor/serverstatus/',{},function(data){
		$('.cpu-usage').data('easyPieChart').update(parseInt(data.cpuusage));
		$('.memory-usage').data('easyPieChart').update(parseInt(data.usedmemory));
		$('.memory-free').data('easyPieChart').update(parseInt(data.freememory));
	})
}

