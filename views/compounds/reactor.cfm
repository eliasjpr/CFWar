<cfoutput>
 <div class="col-md-12">
    <section class="panel no-borders bg-black dk">
        <header class="panel-heading bg-black dker">
            <ul class="nav nav-tabs"  id="tabs">
            	<li><a href="##code" data-toggle="tab"><i class="fa fa-bolt"></i> Code</a></li>
                <li><a href="##preloaded" data-toggle="tab"><i class="fa fa-code-fork"></i> Preloaded</a></li>
            </ul>
        </header>
        <div class="panel-body m-n no-padder">
        	<div class="tab-content">
        		<div class="tab-pane fade in active" id="code">
        			<textarea 	class="form-control parsley-validated no-borders no-radius padder-v padder block" 
                    			rows="21" 
                    			data-required="true" 
                    			data-editor="javascript" 
                    			name="initialSolution">#rc.compound.initialSolution#</textarea>
        		</div>
        		<div class="tab-pane fade in" id="preloaded">
    				<textarea 	class="form-control parsley-validated no-borders no-radius padder-v padder block" 
                    			rows="21" 
                    			data-required="true" 
                    			data-editor="javascript" 
                    			name="preloaded">#rc.compound.preloaded#</textarea>
        		</div>
        	</div>
        </div>
    </section>
</div>
<div class="col-md-12">
    <section class="panel no-borders bg-black dk">
        <header class="panel-heading bg-black dker">
            <i class="fa fa-flask"></i> Experiments (Test cases):
            <i class="fa fa-arrows-alt fa-2 pull-right"></i>
        </header>
        <div class="panel-body m-n no-padder">
            <textarea 	class="form-control parsley-validated no-borders no-radius padder-v padder block" 
            			rows="21" 
            			data-required="true" 
            			data-editor="javascript" 
            			name="testFixtures">#rc.compound.testFixtures#</textarea>
        </div>
    </section>
</div>
</cfoutput>