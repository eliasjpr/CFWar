<cfoutput>
<br /><br />
 <section id="content" class="m-t-lg wrapper-md animated fadeInUp no-borders ">
    <div class="row m-n">
      <div class="col-md-3 col-lg-3 col-sm-3  center-block m-t-lg no-borders">
        <section class="panel panel-security bg-black dk ">
          <header class="panel-heading bg-black dk text-center no-borders">
          	<br />
          	<img class="img-responsive center-block" src="/includes/images/logo.png" align="center" width="180" height="180" alt="coldfusionwards - cfwars.com" >
          	<br />
		  	<h4 style="font-size:1.9em">colfusionwars</h4>
          </header>
          <form action="#event.buildLink('security.register')#" class="panel-body" method="post" data-validate="parsley">
            #getPlugin("MessageBox").renderIt()#
            <div class="h4 text-center text-white">Create Account</div>
            <hr />
            <div class="form-group">
               <input type="text" name="firstname" placeholder="First name" class="form-control dker no-borders" data-required="true">
            </div>
            <div class="form-group">
               <input type="text" name="lastname" placeholder="Last name" class="form-control dker no-borders" data-required="true">
            </div>
            <div class="form-group">
               <input type="text" name="username" placeholder="Username" class="form-control dker no-borders" data-required="true">
            </div>
            <div class="form-group">
              <input type="email" name="emailaddress" placeholder="test@example.com" class="form-control dker no-borders" data-required="true" data-parsley-type="email">
            </div>
            <div class="form-group">
              <input type="password" name="password" id="password" placeholder="Password" class="form-control dker no-borders" data-required="true" data-parsley-minlength="6">
              <br>
              <input type="password" name="confirmpassword" data-parsley-equalto="##password" placeholder="Confirm Password" class="form-control dker no-borders" data-required="true" data-parsley-minlength="6">
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