<cfoutput>

<section class="wrapper ">
    <div class="row">
        <div class="col-lg-3 bg-black dker">
        	Search
        </div>
        <div class="col-lg-9"> 
			<section class="panel bg-black no-borders">
				<header class="panel-heading bg-black">                    
				<span class="label bg-dark">15</span> Inbox
				</header>
				<cfloop array="#rc.compounds#" index="compound">
					<section class="panel-body bg-black dker">
						<article class="media">
						<span class="pull-left thumb-sm">
							<img src="#compound.createdBy.gravatar()#" class="img-circle"></span>
						<div class="media-body">
						<div class="pull-right media-xs text-center text-muted">
							<i class="fa fa-clock"></i>
							<abbr class="timeago" title="#compound.isoCreatedAt()#"></abbr>
						</div>
						<a href="#event.buildLink('compounds.show.#compound.id#')#" class="h4">#compound.name#</a>
						<small class="block padder-v">
							<span class="label label-info">Circle</span>
						</small>
						<small class="block m-t-sm">
							<i class="fa fa-tags"></i>
							<span class="label bg-dark m-md">Algorithms</span>
							#compound.tags#
							</small>
						</div>
						</article>
					</section>  
	            </cfloop>  
			</section>
        </div>
    </div>

</section>

</cfoutput>