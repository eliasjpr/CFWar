<cfoutput>
<br /><br />
 <section id="content" class="m-t-lg wrapper-md animated fadeInUp no-borders ">

    <div class="row m-n">
      <div class="col-md-3 col-lg-2 col-sm-4 center-block m-t-lg no-borders">
      	
            	
        <section class="panel panel-security bg-black dk ">
        	
          <header class="panel-heading bg-black dk text-center no-borders">
          	<br />
          	<img src="/includes/images/logo.png" align="center" width="180" height="180" alt="coldfusionwards - cfwars.com" >
          	<br />
		  	<h4 style="font-size:1.9em">colfusionwars</h4>
        	
          </header>
          <form action="#event.buildLink('security.dorecover')#" class="panel-body">
            #getPlugin("MessageBox").renderIt()#
            <hr />
            <div class="form-group">
              <label class="control-label">Recover your password</label>
              <input name="email" type="email" placeholder="your@email.com" class="form-control  dker no-borders">
            </div>
            <a href="#event.buildLink('security.login')#" class="pull-right m-t-xs"><small>Sign in</small></a>
            <button type="submit" class="btn btn-primary ">Send me a new password</button>
            <hr />
            <p class="text-muted text-center"><small>Do not have an account?</small></p>
            <a href="#event.buildLink('security.new')#" class="btn btn-default btn-block btn-lg dker no-borders">Create an account</a>
          </form>
        </section>
      </div>
    </div>
  </section>
</cfoutput>