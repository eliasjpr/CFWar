<cfoutput>
	<script>
	$(document).ready(function() {
		// spec toggler
		$("span.specStatus").click( function(){
			toggleSpecs( $( this ).attr( "data-status" ), $( this ).attr( "data-bundleid" ) );
		});
		// spec toggler
		$("span.reset").click( function(){
			resetSpecs();
		});
	});
	function resetSpecs(){
		$("div.spec").each( function(){
			$(this).show();
		});
		$("div.suite").each( function(){
			$(this).show();
		});
	}
	function toggleSpecs( type, bundleID ){
		$("div.suite").each( function(){
			handleToggle( $( this ), bundleID, type );
		} );
		$("div.spec").each( function(){
			handleToggle( $( this ), bundleID, type );
		} );
	}
	function handleToggle( target, bundleID, type ){
		var $this = target;
		// if bundleid passed and not the same bundle, skip
		if( bundleID != undefined && $this.attr( "data-bundleid" ) != bundleID ){
			return;
		}
		// toggle the opposite type
		if( !$this.hasClass( type ) ){
			$this.fadeOut();
		} else {
			// show the type you sent
			$this.parents().fadeIn();
			$this.fadeIn();
		}
	}
	function toggleDebug( specid ){
		$("div.debugdata").each( function(){
			var $this = $( this );

			// if bundleid passed and not the same bundle
			if( specid != undefined && $this.attr( "data-specid" ) != specid ){
				return;
			}
			// toggle.
			$this.fadeToggle();
		});
	}
	</script>




<!--- Bundle Info --->
<cfloop array="#bundleStats#" index="thisBundle">
	<!--- Skip if not in the includes list --->
	<cfif len( url.testBundles ) and !listFindNoCase( url.testBundles, thisBundle.path )>
		<cfcontinue>
	</cfif>
	<!--- Bundle div --->
	<div class="box" id="bundleStats_#thisBundle.path#">

		<!--- bundle stats --->
		<div>
			<h4 class="text-white">
				Test Duration: (#thisBundle.totalDuration# ms)

				<small class="pull-right">
					<span class="text-success" 	data-status="passed" data-bundleid="#thisBundle.id#">Pass: #thisBundle.totalPass#</span> &nbsp;&nbsp;
					<span class="text-warning" 	data-status="failed" data-bundleid="#thisBundle.id#">Failures: #thisBundle.totalFail#</span> &nbsp;&nbsp;
					<span class="text-danger" 	data-status="error" data-bundleid="#thisBundle.id#">Errors: #thisBundle.totalError#</span> &nbsp;&nbsp;
					<span class="text-info" 	data-status="skipped" data-bundleid="#thisBundle.id#">Skipped: #thisBundle.totalSkipped#</span> &nbsp;&nbsp;
				</small>
			</h4>


			</div>
		<hr>
		<!-- Globa Error --->
		<cfif !isSimpleValue( thisBundle.globalException )>
			<h4>Global Bundle Exception<h4>
			<cfdump var="#thisBundle.globalException#" />
		</cfif>

		<!-- Iterate over bundle suites -->
		<cfloop array="#thisBundle.suiteStats#" index="suiteStats">
			<div class="suite #lcase( suiteStats.status)#" data-bundleid="#thisBundle.id#">
			<ul>
				#genSuiteReport( suiteStats, thisBundle )#
			</ul>
			</div>
		</cfloop>


	</div>
</cfloop>
<hr>
<!-- Header --->
<small>TestBox v#testbox.getVersion()#</small>


<!--- Recursive Output --->
<cffunction name="genSuiteReport" output="false">
	<cfargument name="suiteStats">
	<cfargument name="bundleStats">

	<cfsavecontent variable="local.report">
		<cfoutput>
		<!--- Suite Results --->
		<li>
			<a title="Total: #arguments.suiteStats.totalSpecs# Passed:#arguments.suiteStats.totalPass# Failed:#arguments.suiteStats.totalFail# Errors:#arguments.suiteStats.totalError# Skipped:#arguments.suiteStats.totalSkipped#"
			   href="#baseURL#&testSuites=#URLEncodedFormat( arguments.suiteStats.name )#&testBundles=#URLEncodedFormat( arguments.bundleStats.path )#"
			   class="#lcase( arguments.suiteStats.status )#"><strong>+#arguments.suiteStats.name#</strong></a>
			(#arguments.suiteStats.totalDuration# ms)
		</li>
			<cfloop array="#arguments.suiteStats.specStats#" index="local.thisSpec">

				<!--- Spec Results --->
				<ul>
				<div class="spec #lcase( local.thisSpec.status )#" data-bundleid="#arguments.bundleStats.id#" data-specid="#local.thisSpec.id#">
					<li>
						<a href="##" class="#lcase( local.thisSpec.status )#">#local.thisSpec.name# (#local.thisSpec.totalDuration# ms)</a>

						<cfif local.thisSpec.status eq "failed">
							- <span class="text-warning">#htmlEditFormat( local.thisSpec.failMessage )#</span>
						</cfif>

						<cfif local.thisSpec.status eq "error">
							- <span class="text-danger">#htmlEditFormat( local.thisSpec.error.message )#</span>
						</cfif>
					</li>
				</div>
				</ul>
			</cfloop>

			<!--- Do we have nested suites --->
			<cfif arrayLen( arguments.suiteStats.suiteStats )>
				<cfloop array="#arguments.suiteStats.suiteStats#" index="local.nestedSuite">
					<div class="suite #lcase( arguments.suiteStats.status )#" data-bundleid="#arguments.bundleStats.id#">
						<ul>
						#genSuiteReport( local.nestedSuite, arguments.bundleStats )#
					</ul>
					</div>
				</cfloop>
			</cfif>

		</cfoutput>
	</cfsavecontent>

	<cfreturn local.report>
</cffunction>
</cfoutput>