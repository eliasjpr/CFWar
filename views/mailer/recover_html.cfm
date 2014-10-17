<cfoutput>
<div class="alert alert-warning">
    <h1 style="margin:0; padding:5px 0; font-weight:600; color: white">
        Recover password <br>
        <small style="font-size:12px !important; color: white">For #args.user.fullname()# on #dateTimeFormat(now(), 'short')#</small>
    </h1>
</div>
<div class="content">
    <table>
        <tr>
            <td>
                <h3 style="margin:0; padding:5px 0;">Recover password, #args.user.fullname()#.</h3>
                <p>
                    We have generated a new password for your convenience.
                </p>
                <p>
                    <b>New Password: </b> #args.password# <br>
                </p>
                <a href="http://#cgi.server_name#/security/login" class="btn-primary">Sign in</a>
                <p>
                    If you need any help getting started contact our support team at <a href="mailto:support@imtechgraphics.com">support@imtechgraphics.com</a>
                </p>
            </td>
        </tr>
    </table>
</div>
</cfoutput>