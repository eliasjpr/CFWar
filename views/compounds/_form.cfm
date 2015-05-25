<cfoutput>
<form id="compound-form" data-validate="parsley" method="post" action="#event.buildLink('compounds.save')#">
<input type="hidden" name="id" value="#rc.compound.id#" />

<section class="wrapper ">
    <div class="row">
        <div class="col-lg-6 ">
            <section class="panel no-borders bg-black dker">

			    <header class="panel-heading text-right bg-black">
			      <ul class="nav nav-tabs  bg-black" id="doc-tabs">
			        <li class="active"><a href="##compound" data-toggle="tab"><i class="fa fa-bookmark"></i> Compound</a></li>
			        <li><a href="##output"  data-toggle="tab"> <i class="fa fa-recycle"></i> Reaction </a></li>
			      </ul>
			    </header>

			    <div class="panel-body">
			      <div class="tab-content">
			        <div class="tab-pane fade in active" id="compound">
			        	
	                        <div class="form-group">
	                          	<label>Title</label>
	                          	<input type="text" name="name" class="form-control parsley-validated bg-black dk no-borders" 
	                          			value="#rc.compound.name#" 
	                          			data-required="true">
	                        </div>

	                        <div class="form-group">
	                          	<label>Instructions</label>
	                          	<br>
	                          	<section class="panel no-borders bg-black dker">
		                          	<div class="panel-heading bg-black">
			                          	<ul class="nav nav-tabs  bg-black" id="tabs">
						                    <li class="active"><a href="##instructions" data-toggle="tab"><i class="fa fa-pencil"></i></a></li>
						                    <li><a href="##preview" data-toggle="tab"><i class="fa fa-eye"></i></a></li>
						                </ul>
		                          	</div>
								  	<div class="panel-body no-padder">
									  	<div class="tab-content">
						                    <div class="tab-pane fade in active" id="instructions">
						                    	<textarea 	class="form-control parsley-validated no-borders no-radius padder-v padder " 
							                    			rows="21" 
							                    			data-required="true" 
							                    			data-editor="markdown"
							                    			id="markdown_field" 
							                    			name="instructions">#rc.compound.instructions#</textarea>
						                    </div>
						                    <div class="tab-pane fade" id="preview">
						                    	<p id="preview-text" class="slim-scroll" data-height="330px"></p>
						                    </div>
						                </div>
								  	</div>
	                          	</section>
	                        </div>

	                        <div class="form-group">
	                            <label>Tags <small>( comma separated )</small>	</label>
	                            <input name="tags" id="tags" type="hidden" style="width:100%;background-color: ##24282f;" class="bg-black dk no-borders" value="" data-ride="select2-tags"/>
	                        </div>

	                        <div class="checkbox">
	                          <label>
	                            <input type="checkbox" name="check" checked="" data-required="true" class="parsley-validated">  Keep this a secret?
	                          </label>
	                        </div>
			        </div>

			        <div class="tab-pane fade  in" id="output">
			        	<i class="fa fa-info-circle"></i> Here is were your output will be rendered
			        </div>

			      </div>
			    </div>
			</section>

        </div>
        <div class="col-lg-6">
            <div class="row">
                #renderView('compounds/reactor')#
                <div class="col-md-12">
                    <button id="save_btn" 	 type="submit" class="btn btn-default dker no-borders"><i class="fa fa-database"></i> Save</button>
                    <button id="publish_btn" type="submit" class="btn btn-default dker no-borders"><i class="fa fa-globe"></i> Publish</button>
                    <button id="fuse_btn" 	 type="button" class="btn btn-default dker no-borders pull-right"><i class="fa fa-fire"></i> Fuse</button>
                </div>
            </div>
        </div>

    </div>
</section>
</form>
</cfoutput>