$(document).ready(function(){
	
	$('textarea[data-editor]').each(function () {
	    var textarea = $(this);

	    var mode = textarea.data('editor');

	    var editDiv = $('<div>', {
	        position: 'absolute',
	        width: textarea.width(),
	        height: textarea.height(),
	        id: 'editor_' + mode,
	        'class': textarea.attr('class'),
	        style: 'width:100%; height:300px !important;'
	    }).insertBefore(textarea);

	    textarea.css('display', 'none');

	    var editor = ace.edit(editDiv[0]);
		    editor.renderer.setShowGutter(true);
		    editor.setAutoScrollEditorIntoView(true);
			editor.setOption("maxLines", 20);
			editor.setShowPrintMargin(false);
			editor.getSession().setUseSoftTabs(false);
			editor.getSession().setUseWrapMode(true);
		    editor.getSession().setValue(textarea.val());
		    editor.getSession().setMode("ace/mode/" + mode);
		    editor.setTheme("ace/theme/tomorrow_night_bright");
	    
	    // copy back to textarea on form submit...
	    textarea.closest('form').submit(function () {
	        textarea.val(editor.getSession().getValue());
	    })

	    editor.getSession().on('change', function(e) {
	    	console.log(e)
		    textarea.val(editor.getSession().getValue());
		});

	    if(mode === 'markdown'){

	    	$(editor.renderer.$gutter).hide();

	    	var converter = new Showdown.converter({ extensions:['github','table']});

			var convert = function() {
				$('#preview-text').html(converter.makeHtml(editor.getValue()));

				hljs.configure({
					useBR: false,
					tabReplace: '    ' // 4 spaces
				});

				$('#preview-text code').each(function(i, block) {
				  hljs.highlightBlock(block);
				});
			};

	    	$('#editor_markdown').on('keyup', convert);	
	    }
	});

	
	var converter = new Showdown.converter({ extensions:['github','table']});

	var convert = function() {
		var text = $('#preview-text').html();
		$('#preview-text').html(converter.makeHtml(text));

		hljs.configure({
			useBR: false,
			tabReplace: '    ' // 4 spaces
		});

		$('#preview-text code').each(function(i, block) {
		  hljs.highlightBlock(block);
		});
	};

	convert();

	// select2
	if ($.fn.select2) {
			$('[data-ride="select2-tags"]').select2({
	      tags:[],
	      tokenSeparators: [",", " "]}
	    );
	    $('[data-ride="select2-option"]').select2();
	}

	// Fuse
	$('#fuse_btn').on('click', function(){
		$('.logo').addClass('spin-logo');

		$.post('/compounds/fusion', $('#compound-form').serialize(), function(data){

		    $('#output').html(data.result).addClass('active');

		    $('#doc-tabs a:last').tab('show');

		     $('.logo').removeClass('spin-logo')
		});
	});



})