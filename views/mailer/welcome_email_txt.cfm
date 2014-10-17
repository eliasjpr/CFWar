<cfoutput>
Welcome to Meedia Manager, #args.user.fullname()#.

Your account creation has been a success!.
Now you can enjoy the entire site and amazing features to manage your media lists online.

URL: http://#cgi.server_name#/dashboard/index/
Username: #args.user.getUsername()#
Password: #args.user.getPassword()#

If you need any help getting started contact our support team at support@imtechgraphics.com

Cheers,
Imtech Graphics Team
</cfoutput>