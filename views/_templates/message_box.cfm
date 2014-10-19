<cfscript>
	
	switch(msgStruct.type ){
		case "info" : {
			title = "Success";
			cssType = " alert-success alert-block";
			iconType = "fa-thumbs-up";
			break;
		}	
		case "error" : {
			title = "Error";
			cssType = " alert-danger alert-block";
			iconType = "fa-thumbs-down";
			break;
		}	
		default : {
			title = "Warning";
			cssType = " alert-warning alert-block";
			iconType = "fa-warning";
		}
	}
</cfscript>
<cfoutput>
<div class="alert#cssType#" style="min-height: 38px">
	<button type="button" class="close" data-dismiss="alert"><i class="fa fa-times"></i></button>
	<h4><i class="fa #iconType#"></i>  #title#</h4>
	<p>#msgStruct.message#</p>
</div>
</cfoutput>