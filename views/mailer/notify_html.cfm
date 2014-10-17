<cfoutput>
<div class="alert alert-warning">
    <h1 style="margin:0; padding:5px 0; font-weight:600; color: white">
        <img src="http://#cgi.server_name#/images/envelope-icon.png" alt="Notification" style="float:left" align="absmiddle" height="70" width="70"> Notification <br>
        <small style="font-size:12px !important; color: white">For #args.user.fullname()# on #dateTimeFormat(now(), 'short')#</small>
    </h1>
</div>
<div class="content">
    <table>
        <tr>
            <td>
                <h3 style="margin:0; padding:5px 0;"><span style="font-weight: 600; font-size: 22px !important">#args.media.user.fullname()#</span> has sent you this notification.</h3>

                <p>
                  #args.activity.parse().title#
                </p>

                <a href="http://#cgi.server_name#/security/login" class="btn-primary">Sign in</a>
            </td>
        </tr>
    </table>
</div>
</cfoutput>