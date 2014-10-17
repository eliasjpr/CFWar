<cfoutput>
Daily Project Report
=========================================

For #args.user.fullname()# on #dateTimeFormat(now(), 'short')#

What's happing:

<cfloop array="#args.user.medias#" item="media">
<cfif arrayLen(media.activities())>
* #media.number# - Material due: #dateTimeFormat(media.materialby,'short')#
    <cfloop array="#media.activities(15)#" item="activity">
    - #REReplaceNoCase(activity.parse().title,'<[^>]*(?:>|$)','','all')# (#activity.subject#) - #activity.timeago()#
    </cfloop>
</cfif>
</cfloop>
</cfoutput>