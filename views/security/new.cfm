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
          <form action="#event.buildLink('security.register')#" class="panel-body" method="post">
            #getPlugin("MessageBox").renderIt()#
            <div class="h4 text-center text-white">Recover your password</div>
            <hr />
            <div class="form-group">
               <input type="text" name="firstname" placeholder="First name" class="form-control dker no-borders">
            </div>
            <div class="form-group">
               <input type="text" name="lastname" placeholder="Last name" class="form-control dker no-borders">
            </div>
            <div class="form-group">
              <input type="email" name="emailaddress" placeholder="test@example.com" class="form-control dker no-borders">
            </div>
            <div class="form-group">
              <input type="text" name="username" placeholder="Your username" class="form-control dker no-borders">
            </div>
            <div class="form-group">
              <input type="password" name="password"  placeholder="Password" class="form-control dker no-borders">
              <br>
              <input type="password" name="confirmpassword" placeholder="Confirm Password" class="form-control dker no-borders">
            </div>
            <button type="submit" class="btn btn-primary">Sign up</button>
             <hr />
            <p class="text-muted text-center"><small>Already have an account?</small></p>
            <a href="#event.buildLink('security.login')#" class="btn btn-success btn-block btn-lg dker no-borders">Sign in</a>
          </form>
        </section>
      </div>
    </div>
  </section>
</cfoutput>