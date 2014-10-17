<cfoutput>
   <header class="header bg-black dk navbar navbar-inverse pull-in">
      <div class="navbar-header nav-bar aside dk" style="width:70px">
        <a class="btn btn-link visible-xs" data-toggle="class:show" data-target=".nav-primary">
          <i class="fa fa-bars"></i>
        </a>
        <a href="##" class="nav-brand bg-black dker" data-toggle="fullscreen"><img class="logo" src="/includes/images/logo.png" ></a>
        <a class="btn btn-link visible-xs" data-toggle="collapse" data-target=".navbar-collapse">
          <i class="fa fa-comment-o"></i>
        </a>
      </div>
      <div class="collapse navbar-collapse">

        <form class="navbar-form navbar-left m-t-sm" role="search">
          <div class="form-group">
            <div class="input-group input-s">
              <input type="text" class="form-control input-sm no-border dker text-white" placeholder="Search">
              <span class="input-group-btn">
                <button type="submit" class="btn btn-sm btn-primary btn-icon"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </div>
        </form>
        <ul class="nav navbar-nav navbar-right ">
          <li class="hidden-xs">
            <a href="##" class="dropdown-toggle " data-toggle="dropdown">
              <i class="fa fa-bell-o text-white"></i>
              <span class="badge up bg-danger m-l-n-sm">2</span>
            </a>
            <section class="dropdown-menu animated fadeInUp input-s-lg">
              <section class="panel bg-white">
                <header class="panel-heading">
                  <strong>You have <span class="count-n">2</span> notifications</strong>
                </header>
                <div class="list-group">
                  <a href="##" class="media list-group-item">
                    <span class="pull-left thumb-sm">
                      <img src="images/avatar.jpg" alt="John said" class="img-circle">
                    </span>
                    <span class="media-body block m-b-none">
                      Use awesome animate.css<br>
                      <small class="text-muted">28 Aug 13</small>
                    </span>
                  </a>
                  <a href="##" class="media list-group-item">
                    <span class="media-body block m-b-none">
                      1.0 initial released<br>
                      <small class="text-muted">27 Aug 13</small>
                    </span>
                  </a>
                </div>
                <footer class="panel-footer text-sm">
                  <a href="##" class="pull-right"><i class="fa fa-cog"></i></a>
                  <a href="##">See all the notifications</a>
                </footer>
              </section>
            </section>
          </li>
          <li class="dropdown ">
            <a href="##" class="dropdown-toggle aside-sm" data-toggle="dropdown">
              <span class="thumb-sm avatar pull-left m-t-n-xs m-r-xs">
                <img src="images/avatar.jpg">
              </span>
              John.Smith <b class="caret"></b>
            </a>
            <ul class="dropdown-menu animated fadeInLeft dker ">
              <li>
                <a href="##">Settings</a>
              </li>
              <li>
                <a href="profile.html">Profile</a>
              </li>
              <li>
                <a href="##">
                  <span class="badge bg-danger pull-right">3</span>
                  Notifications
                </a>
              </li>
              <li>
                <a href="docs.html">Help</a>
              </li>
              <li>
                <a href="signin.html">Logout</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </header>
</cfoutput>