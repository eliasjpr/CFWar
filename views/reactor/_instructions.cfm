<cfoutput>
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
            <div class="markdown"  id="description">
                
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
        <div class="tab-pane fade  in" id="output"> 
        	<i class="fa fa-info-circle"></i> Here is were your output will be rendered
        </div>
      </div>
    </div>
</section>
</cfoutput>