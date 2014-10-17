<cfoutput>

<section class="wrapper ">
    <div class="row">
        <div class="col-lg-5 ">
            #renderView('_templates/_server_stats')#

            <section class="panel no-borders bg-black dker">
                <header class="panel-heading text-right bg-black dk">
                  <ul class="nav nav-tabs" id="tabs">
                    <li class="active"><a href="##instructions " class="bg-black " data-toggle="tab">Instructions</a></li>
                    <li><a href="##output" class="bg-black" data-toggle="tab"> <i class="fa fa-terminal"></i> Output </a></li>
                  </ul>
                </header>
                <div class="panel-body">
                  <div class="tab-content">
                    <div class="tab-pane fade in active" id="instructions">
                        <div class="markdowne"  id="description">
                            <p>Implement <label class="label bg-primary">pluck</label>, which takes an array of objects and a property name, and returns an array containing the named property of each object.</p>
                            <p>For example:</p>
                            <pre class=" bg-black no-borders"><code>pluck([{a:1}, {a:2}], 'a') // -&gt; [1,2]</code></pre>
                            <p>If an object is missing the property, you should just leave it as <code>undefined</code> in the output array.</p>
                        </div>
                        <hr>
                        <div class="mtm">
                            <span><i class="fa fa-tag "></i></span>
                            <label class="label bg-primary">Fundamentals</label>
                            <label class="label bg-primary">Functional Programming</label>
                            <label class="label bg-primary">Declarative Programming</label>
                            <label class="label bg-primary">Utilities</label>
                            <label class="label bg-primary">Arrays</label>
                        </div>
                    </div>
                    <div class="tab-pane fade  in" id="output"> <i class="fa fa-info-circle"></i> Here is were your output will be rendered</div>
                  </div>
                </div>
            </section>
        </div>
        <div class="col-lg-7">
            <div class="row">
                <div class="col-md-12">
                    <section class="panel no-borders bg-black dk">
                        <header class="panel-heading bg-black dker">
                            <i class="fa fa-code"></i> Your Solution:
                            <i class="fa fa-arrows-alt fa-2 pull-right"></i>
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