<cfoutput>
 <section class="panel bg-black no-borders">
  <div class="row">
    <div class="col-xs-3">
      <div class="well well-sm bg-dark dker no-borders m col-md-12">
        <h4>
          Server Info
          <hr class="m-n m-t-sm m-b-sm">
        </h4>
         <small>#server.railo.versionName# <br> #server.railo.version# <br> #server.servlet.name#</small>
         <br><br>
      </div>
    </div>
    <div class="col-xs-3 wrapper text-center">
      <div class="inline m-t-sm">
        <div  class="easypiechart cpu-usage"
              data-percent="#round(getcpuusage())#"
              data-line-width="20"
              data-bar-color="##594F8D"
              data-track-Color="##1C1F25"
              data-scale-Color="true"
              data-size="130">
            <span class="h2"></span>%
        </div>
        <p>CPU Usage</p>
      </div>
    </div>
    <div class="col-xs-3 wrapper text-center">
      <div class="inline m-t-sm">
        <div  class="easypiechart memory-usage"
              data-percent="#getSystemMemoryUsage()#"
              data-line-width="20"
              data-bar-color="##594F8D"
              data-track-Color="##1C1F25"
              data-scale-Color="true"
              data-size="130">
            <span class="h2"></span>%
        </div>
        <p>Used Memory</p>
      </div>
    </div>
    <div class="col-xs-3 wrapper text-center">
      <div class="inline m-t-sm">
        <div  class="easypiechart memory-free"
              data-percent="#getSystemMemoryFree()#"
              data-line-width="20"
              data-bar-color="##594F8D"
              data-track-Color="##1C1F25"
              data-scale-Color="true"
              data-size="130">
            <span class="h2"></span>%
        </div>
        <p>Free Memory</p>
      </div>
    </div>
  </div>
</section>
</cfoutput>
<script  type="text/javascript" charset="utf-8">

</script>