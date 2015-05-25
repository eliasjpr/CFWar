
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

var code = ace.edit("code-editor");
	code.setTheme("ace/theme/tomorrow_night_bright");
	code.getSession().setMode("ace/mode/javascript");
	code.setAutoScrollEditorIntoView(true);
	code.setOption("maxLines", 20);	
	
	// select2
		if ($.fn.select2) {
			$('[data-ride="select2-tags"]').select2({
	      tags:[],
	      tokenSeparators: [",", " "]}
	    );
	    $('[data-ride="select2-option"]').select2();
	}
	
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


function serverstatus(){
	$.get('/reactor/serverstatus/',{},function(data){
		$('.cpu-usage').data('easyPieChart').update(parseInt(data.cpuusage));
		$('.memory-usage').data('easyPieChart').update(parseInt(data.usedmemory));
		$('.memory-free').data('easyPieChart').update(parseInt(data.freememory));
	})
}

//window.setInterval('serverstatus()', 300);