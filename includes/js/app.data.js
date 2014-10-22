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

    
    var tests = ace.edit("test-cases");
    tests.setTheme("ace/theme/tomorrow_night_bright");
    tests.getSession().setMode("ace/mode/javascript");
    tests.setAutoScrollEditorIntoView(true);
    tests.setOption("maxLines", 11);
    
    var code = ace.edit("code-editor");
    code.setTheme("ace/theme/tomorrow_night_bright");
    code.getSession().setMode("ace/mode/javascript");
    code.setAutoScrollEditorIntoView(true);
    code.setOption("maxLines", 20);

	var preloaded = ace.edit("preloaded-editor");
    preloaded.setTheme("ace/theme/tomorrow_night_bright");
    preloaded.getSession().setMode("ace/mode/javascript");
    preloaded.setAutoScrollEditorIntoView(true);
    preloaded.setOption("maxLines", 20);
    
    

	$('#submit').on('click', function(){
		$('.logo').addClass('spin-logo');
		$.post('/reactor/submit',{solution: editor.getSession().getValue(), tests: editor2.getSession().getValue()}, function(data){

		    $('#output').html(data.result).addClass('active');
		    $('#tabs a:last').tab('show');

		     $('.logo').removeClass('spin-logo')
		});
	});

	$('#run_tests').on('click', function(){
		$('.logo').addClass('spin-logo')
		$.post('/reactor/runtests',{solution: editor.getSession().getValue(), tests: editor2.getSession().getValue()}, function(data){
		    
		    $('#output').html(data.result).addClass('active');
		    $('#tabs a:last').tab('show');

		    $('.logo').removeClass('spin-logo')
		});
	});


	//window.setInterval('serverstatus()', 300);


});

function serverstatus(){
	$.get('/reactor/serverstatus/',{},function(data){
		$('.cpu-usage').data('easyPieChart').update(parseInt(data.cpuusage));
		$('.memory-usage').data('easyPieChart').update(parseInt(data.usedmemory));
		$('.memory-free').data('easyPieChart').update(parseInt(data.freememory));
	})
}

