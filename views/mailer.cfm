
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="http://#cgi.server_name#/" target="_blank">
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>CFWars.com | Play hard, Train hard - Improve your Coldfusion skills with challenges </title>
<style>
* {
    margin:0;
    padding:0;
    font-family: "Source Sans Pro","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    color: #58666e;
    line-height: 1.6;
}

img.avatar{
    border-radius: 2em;
    background-color: rgba(50,50,50,0.3);
    border: 1px solid rgba(255,255,255,0.2);
    display: block;
    border-radius: 500px;
    white-space: nowrap;
    width:25px;
    height:25px;
    margin-right: 10px;
    float:left;
}
hr {
    border: 0;
    height: 0;
    margin:0;
    padding:0;
    border-top: 2px solid rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}

/* -------------------------------------
    Alerts
------------------------------------- */
.alert {
  font-size: 16px;
  color: #fff;
  font-weight: 500;
  padding: 20px;
  border-radius: 3px 3px 0 0;
}
.alert a {
  color: #fff;
  text-decoration: none;
  font-weight: 500;
  font-size: 16px;
}
.alert.alert-warning {
  background: #ff9f00;
}
.alert.alert-bad {
  background: #d0021b;
}
.alert.alert-good {
  background: #68b90f;
}
.alert.alert-info {
  background: #3594cb;
}

/* -------------------------------------
    RESPONSIVE AND MOBILE FRIENDLY STYLES
------------------------------------- */

@media only screen and (max-width: 640px) {
  h1, h2, h3, h4 {
    font-weight: 600 !important;
    margin: 20px 0 5px !important;
  }

  h1 {
    font-size: 22px !important;
  }

  h2 {
    font-size: 18px !important;
  }

  h3 {
    font-size: 16px !important;
  }

  .container {
    width: 100% !important;
  }

  .content, .content-wrapper {
    padding: 10px !important;
  }

  .invoice {
    width: 100% !important;
  }
}


small{ font-size: 60% !important}

img {
    max-width: 100%;
}

body {
    -webkit-font-smoothing:antialiased;
    -webkit-text-size-adjust:none;
    width: 100%!important;
    height: 100%;
}
a {
    color: #348eda;
}

.line{
    border-bottom: 1px solid #dedede;
}

.btn-primary, .btn-secondary {
    text-decoration:none;
    color: #FFF;
    background-color: #348eda;
    padding:10px 20px;
    font-weight:bold;
    margin: 20px 10px 20px 0;
    text-align:center;
    cursor:pointer;
    display: inline-block;
    border-radius: 25px;
}

.btn-secondary{
    background: #aaa;
}

.last {
    margin-bottom: 0;
}

.first{
    margin-top: 0;
}
table.body-wrap {
    width: 100%;
    padding: 20px;
}

table.body-wrap .container{
    border: 1px solid #f0f0f0;
}
table.footer-wrap {
    width: 100%;
    clear:both!important;
}

.footer-wrap .container p {
    font-size:12px;
    color:#666;
}

.pull-left{
    float:left;
}

table.footer-wrap a{
    color: #999;
}
h1,h2,h3{
    font-family: "Source Sans Pro","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    color: #58666e;
    line-height: 1.1; margin-bottom:15px;
    margin: 40px 0 10px;
    line-height: 1.2;
    font-weight:200;
}

h1 {
    font-size: 36px;
}
h2 {
    font-size: 28px;
}
h3 {
    font-size: 22px;
}

p, ul {
    margin-bottom: 10px;
    font-weight: normal;
    font-size:14px;
}

ul li {
    list-style-position: inside;
    display: block;
}
.pull-right{
    float: right;
}

.title{
    margin           :0;
    padding          : 3px 5px;
    background-color : #e7e7e7;
    border-bottom    :1px solid #ccc;
    background-color : #d9edf7;
    border-color     : #bce8f1;
    font-weight: 600
}

.label{
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}
.label-info{
    background-color:#5bc0de
}
.badge {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color: #777;
    border-radius: 10px
}

.badge:empty {
    display: none
}


.container {
    display:block!important;
    max-width:600px!important;
    margin:0 auto!important; /* makes it centered */
    clear:both!important;
}
.content {
    padding:20px;
    max-width:600px;
    margin:0 auto;
    display:block;
}
.content table {
    width: 100%;
}
@font-face {
    font-family: 'ecoico';
    src:url('../fonts/timelineicons/ecoico.eot');
    src:url('../fonts/timelineicons/ecoico.eot?#iefix') format('embedded-opentype'),
        url('../fonts/timelineicons/ecoico.woff') format('woff'),
        url('../fonts/timelineicons/ecoico.ttf') format('truetype'),
        url('../fonts/timelineicons/ecoico.svg#ecoico') format('svg');
    font-weight: normal;
    font-style: normal;
} /* Made with http://icomoon.io/ */

.cbp_tmtimeline {
    margin: 0 0 0;
    padding: 0;
    list-style: none;
    position: relative;
}

/* The line */
.cbp_tmtimeline:before {
    content     : '';
    position    : absolute;
    top         : 0;
    bottom      : 0;
    width       : 10px;
    background  : #afdcf8;
    left        : 15%;
    margin-left : -20px;
}

/* The date/time */
.cbp_tmtimeline > li .cbp_tmtime {
    display       : block;
    width         : 10%;
    padding-right : 100px;
    position      : absolute;
}

.cbp_tmtimeline > li .cbp_tmtime span {
      display     : block;
      text-align  : right;
      font-size   : 14px;
      color       : #3594cb;
      font-weight : bold;
}



/* Right content */
.cbp_tmtimeline > li .cbp_tmlabel {
    margin        : 0 0 8px 13%;
    background    : #3594cb;
    color         : #fff;
    padding       : 0.5em;
    font-size     : 80%;
    line-height   : 1.2;
    position      : relative;
    border-radius : 5px;
}

.cbp_tmtimeline > li .cbp_tmlabel {
    background: #f7f7f7;
}

.cbp_tmtimeline > li .cbp_tmlabel h2 {
    margin        : 0 0 10px 0;
    padding       : 3px 5px;
    font-size     : 180%;
    font-weight   : 700
}
.cbp_tmtimeline > li .cbp_tmlabel div{
    display    : block;
    width      : 100%;
    border-top : 1px solid #fff;
    margin     : 3px;
}
.cbp_tmtimeline > li .cbp_tmlabel div p{
    margin-left: 38px
}

/* The triangle */
.cbp_tmtimeline > li .cbp_tmlabel:after {
    right: 100%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-right-color: #f7f7f7;
    border-width: 10px;
    top: 10px;

}


/* Example Media Queries */
@media screen and (max-width: 65.375em) {

    .cbp_tmtimeline > li .cbp_tmtime span:last-child {
        font-size: 1.5em;
    }
}

@media screen and (max-width: 47.2em) {
    .cbp_tmtimeline:before {
        display: none;
    }

    .cbp_tmtimeline > li .cbp_tmtime {
        width: 100%;
        position: relative;
        padding: 0 0 20px 0;
    }

    .cbp_tmtimeline > li .cbp_tmtime span {
        text-align: left;
    }

    .cbp_tmtimeline > li .cbp_tmlabel {
        margin: 0 0 30px 0;
        padding: 1em;
        font-weight: 400;
        font-size: 95%;
    }

    .cbp_tmtimeline > li .cbp_tmlabel:after {
        right: auto;
        left: 20px;
        border-right-color: transparent;
        border-bottom-color: #3594cb;
        top: -20px;
    }

    .cbp_tmtimeline > li:nth-child(odd) .cbp_tmlabel:after {
        border-right-color: transparent;
        border-bottom-color: #6cbfee;
    }

    .cbp_tmtimeline > li .cbp_tmicon {
        position: relative;
        float: right;
        left: auto;
        margin: -55px 5px 0 0px;
    }
}


</style>
</head>


<body bgcolor="#f6f6f6">

<!-- body -->
<table class="body-wrap">
    <tr>
       <td></td>
        <td align="center">
         <table>
                <tr>
                    <td width="60" align="left" >
                    <cfoutput>
                      <img src="http://#cgi.server_name#/images/app-icon.png" width="50" height="50" hspace="10" alt="">
                    </cfoutput>
                   </td>
                    <td align="left" valign="top"><h1 style="padding:0; margin:0; font-size:48px">#getSetting('appName')#</h1></td>
                </tr>
            </table>
        </td>
       <td></td>
    </tr>
    <tr>
        <td>
        </td>
        <td class="container" bgcolor="#FFFFFF">

            <!-- content -->
            <cfoutput>
            #renderView(args=arguments.args)#
            </cfoutput>

            <!-- /content -->
        </td>
        <td></td>
    </tr>
</table>
<!-- /body -->
</body>
</html>