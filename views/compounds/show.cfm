<cfoutput>
<form id="compound-form" data-validate="parsley" method="post" action="#event.buildLink('compounds.save')#">
<input type="hidden" name="id" value="#rc.compound.id#" />
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

			        <div class="tab-pane fade in active" id="compound" >
			        	<h4>#rc.compound.name#</h4>
			        	<hr>
						<p id="preview-text" class="slim-scroll" data-height="530px">#rc.compound.instructions#</p>
						<p id="tags">#rc.compound.tags#</p>
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