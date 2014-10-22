<cfoutput>

<section class="wrapper ">
    <div class="row">
        <div class="col-lg-6 ">
            <section class="panel no-borders bg-black dker">
			    <header class="panel-heading text-right bg-black">
			      <ul class="nav nav-tabs  bg-black" id="tabs">
			        <li class="active"><a href="##compound " data-toggle="tab"><i class="fa fa-bolt"></i> Compound</a></li>
			        <li><a href="##output"  data-toggle="tab"> <i class="fa fa-play"></i> Output </a></li>
			      </ul>
			    </header>
			    <div class="panel-body">
			      <div class="tab-content">
			        <div class="tab-pane fade in active" id="compound">
			        	<form data-validate="parsley">
	                        <div class="form-group">
	                          	<label>Title</label>
	                          	<input type="text" class="form-control parsley-validated bg-black dk no-borders " data-required="true">
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
						                    	<div id="markdown" class="form-control parsley-validated no-borders no-radius padder-v padder" rows="21" data-required="true">Some text here</div>
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
	                            <input type="text" class="form-control parsley-validated dk  no-borders" data-required="true" id="pwd">
	                        </div>

	                        <div class="checkbox">
	                          <label>
	                            <input type="checkbox" name="check" checked="" data-required="true" class="parsley-validated">  Keep this a secret?
	                          </label>
	                        </div>
		                </form>
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
                <div class="col-md-12">
                    <section class="panel no-borders bg-black dk">
                        <header class="panel-heading bg-black dker">
                            <ul class="nav nav-tabs"  id="tabs">
                            	<li><a href="##code" data-toggle="tab">Code</a></li>
			                    <li><a href="##preloaded" data-toggle="tab">Preloaded</a></li>
			                </ul>
                        </header>
                        <div class="panel-body m-n no-padder">
                        	<div class="tab-content">
                        		<div class="tab-pane fade in active" id="code"><div id="code-editor">// CODE: CFScript only: Start writing code starts here</div></div>
                        		<div class="tab-pane fade in" id="preloaded"><div id="preloaded-editor">// PRELOADED: CFScript only: Write your preload code here</div></div>
                        	</div>
                        </div>
                    </section>
                </div>
                <div class="col-md-12">
                    <section class="panel no-borders bg-black dk">
                        <header class="panel-heading bg-black dker">
                            <i class="fa fa-coffee"></i> Test Cases:
                            <i class="fa fa-arrows-alt fa-2 pull-right"></i>
                        </header>
                        <div class="panel-body m-n no-padder">
                            <div id="test-cases">// CFScript only
// Write your test cases using TestBox BDD</div>
                        </div>
                    </section>
                </div>
                <div class="col-md-12">
                    <button class="btn btn-default dker no-borders"><i class="fa fa-database"></i> Save</button>
                    <button id="submit" type="submit" class="btn btn-default dker no-borders"><i class="fa fa-globe"></i> Publish</button>
                    <button id="run_tests"  class="btn btn-default dker no-borders pull-right"><i class="fa fa-play"></i> Run</button>
                </div>
            </div>
        </div>

    </div>

</section>


</cfoutput>