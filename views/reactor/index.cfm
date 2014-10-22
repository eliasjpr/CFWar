<cfoutput>

<section class="wrapper ">
    <div class="row">
        <div class="col-lg-5 ">
            #renderView('_templates/_server_stats')#

             #renderView('reactor/_instructions')#
        </div>
        <div class="col-lg-7">
            <div class="row">
                <div class="col-md-12">
                    <section class="panel no-borders bg-black dk">
                        <header class="panel-heading bg-black dker">
                            <i class="fa fa-code"></i> Your Solution:
                            <ul class="nav nav-tabs pull-right">			                    
                            	<li><a href="##profile-1" data-toggle="tab"><i class="fa fa-user text-default"></i> CFML</a></li>
			                    <li><a href="##settings-1" data-toggle="tab"><i class="fa fa-cog text-default"></i> CFSCRIPT</a></li>
			                </ul>
                        </header>
                        <div class="panel-body m-n no-padder">
                            <div id="editor"></div>
                        </div>
                    </section>
                </div>
                <div class="col-md-12">
                    <section class="panel no-borders bg-black dk">
                        <header class="panel-heading bg-black dker">
                            <i class="fa fa-coffee"></i> Your Test Cases:
                            <i class="fa fa-arrows-alt fa-2 pull-right"></i>
                        </header>
                        <div class="panel-body m-n no-padder">
                            <div id="editor2"></div>
                        </div>
                    </section>
                </div>
                <div class="col-md-12">
                    <button class="btn btn-default btn-default dker no-borders"><i class="fa fa-forward"></i> Skip</button>
                    <button id="submit" type="submit" class="btn btn-default btn-primary no-borders"><i class="fa fa-forward"></i> Submit</button>
                    <button id="run_tests"  class="btn btn-default btn-primary no-borders "><i class="fa fa-forward"></i> Run Tests</button>
                    <button class="btn btn-default btn-default dker no-borders "><i class="fa fa-forward"></i> Clear</button>
                </div>
            </div>
        </div>

    </div>

</section>

</cfoutput>