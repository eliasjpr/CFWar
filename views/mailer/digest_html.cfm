<cfoutput>
<div class="alert alert-info">
 <h1 style="margin:0; padding:5px 0; font-weight:600; color: white">
<img src="http://#cgi.server_name#/images/calendar-icon.png" alt="Daily Project Report" style="float:left" align="absmiddle" height="70" width="70"> Daily Project Report <br>
<small style="font-size:12px !important; color: white">For #args.user.fullname()# on #dateTimeFormat(now(), 'short')#</small>
</h1>
</div>
<div class="content">
    <table>
        <tr>
            <td>
                <cfif args.user.hasMedia()>
                    <h3>What's happing:</h3>
                    <ul class="cbp_tmtimeline">
                        <cfloop array="#args.user.medias#" item="media">
                            <cfif arrayLen(media.activities())>
                            <li>
                                <time class="cbp_tmtime" datetime="#dateTimeFormat(media.materialby,'short')#"><span>Material due</span><span style="color:red">#dateFormat(media.materialby,'short')#</span></time>
                                <div class="cbp_tmlabel">
                                    <h2>#media.number# <span class="badge">#arrayLen(media.activities())#</span></h2>
                                    <cfloop array="#media.activities(15)#" item="activity">

                                    <div>
                                       #activity.parse().icon#
                                       <p>#activity.parse().title#</p>
                                       <p><span class="label label-info">#activity.subject#</span> <span >#activity.timeago()#</span></p>
                                    </div>

                                    </cfloop>
                                </div>
                            </li>
                            </cfif>
                        </cfloop>
                    </ul>
                <cfelse>
                    <h4>You are not assigned to any media</h4>
                </cfif>
            </td>
        </tr>
    </table>
</div>
<div class="footer">
	<cfoutput>
	 <p>This email was sent to <b>#args.user.fullname()#</b>. To unsubscribe from these alerts <a href="http://#cgi.server_name#/security/login">click here</a>.</p>
	</cfoutput>
</div>

</cfoutput>