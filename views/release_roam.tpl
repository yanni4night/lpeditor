<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>{{title}}-搜狗游戏</title>
        {% if sys.debug %}
        <link rel="stylesheet" href="{{sys.cssurl}}" />
        {% else %}
        <style>
            <!--# include file="/static/landing/common.css" -->
        </style>
        {% endif %}
        {% if navbar %}
        {% if sys.debug %}
        <link rel="stylesheet" href="{{sys.navcssurl}}" />
        {% else %}
        <style>
        {{ sys.navcss|raw }}
        </style>
        {% endif %}
        {% endif %}

        <style>
         {{css|raw}}
         body{background:{{backgroundColor}};}
        </style>
        <style>
.fastloginicon {
    background-image: url(http://p3.wan.sogoucdn.com/cdn/image/2014/09/11/20140911143234_188.png);
    background-repeat: no-repeat;
    display: block;
}

.fastloginicon-sg {
    width: 16px;
    height: 16px;
    background-position: -10px -10px;
}

.fastloginicon-sgame {
    width: 18px;
    height: 17px;
    background-position: -10px -46px;
}

.fastloginicon-x {
    width: 8px;
    height: 8px;
    background-position: -10px -83px;
}
.fastlogin{
    width: 334px;
    height: 377px;
    position: absolute;
    top:50%;
    left: 50%;
    margin-top: -189px;
    margin-left: -167px;
    border:1px solid #ccc;
    background: #fff;
    display: none;
}
.fastlogin .yahei{
    font-family:'Microsoft YAHEI',arial,sans-serif;
}
.fastlogin .header{
    width: 100%;
    background: #e2eefb;
    height: 31px;
    position: relative;
}
.fastlogin .header .sg{
    left:9px;
    position: absolute;
    top:7px;
}
.fastlogin .header .title{
    height: 100%;
    color: #4a6985;
    left: 30px;
    top:0;
    position: absolute;
    font: 12px/31px 'simsun',arial,sans-serif;
}
.fastlogin .header .x{
    position: absolute;
    right: 14px;
    top: 9px;
}
.fastlogin .content{
    width: 285px;
    margin: 28px auto 0;
    position: relative;
}
.fastlogin .content h6{
    position: relative;
    display: block;
    height: 20px;
}
.fastlogin .content h6 .sgame{
    position: absolute;
    left: 0;
    top:0;
}
.fastlogin .content h6 .title{
    position: absolute;
    left: 20px;
    top:0;
    font: 14px/20px 'Microsoft YAHEI',arial,sans-serif;
    font-weight: 700;
    color: #666;
}
.fastlogin .content .desc{
    font: 12px/1.5 'Microsoft YAHEI',arial,sans-serif;
    color: #999;
    margin: 15px 0;
}
.fastlogin .content .username{
    font:14px/2 'Microsoft YAHEI',arial,sans-serif;
    color:#2d9be0;
    margin: 15px 0;
    text-decoration: underline;
}
.fastlogin .content .fastloginbtn{
    background: url(http://p0.wan.sogoucdn.com/cdn/image/2014/09/12/20140912133130_403.jpg) no-repeat;
    width: 283px;
    height: 46px;
    display: block;
    text-decoration: none;
    margin-top: 20px;
}
.fastlogin .content .otherways{
    margin-top: 80px;
    height: 20px;
    text-align: right;
}
.fastlogin .content .otherways .reg{
    color: #2d9be0;
}
        </style>

        <script>
         {{sys.pbjs|raw}}
        </script>
    </head>
    <body {%if twoInOne%}data-type="1"{%endif%}>
        <!-- flash -->
        <div id="Flash_Wrp" class="flash-wrp flash-{%if navbar%}nav{%else%}unnav{%endif%}-{{fwidth}}">
            <script>
                {% if flashLoading %}
                {{ sys.flashloadingjs|raw }}
                {% else %}
                {{ sys.flashjs|raw }}
                {% endif %}
            </script>
            
        </div>
        <!-- flash end -->
        <!-- nav bar -->
        {% if navbar %}
        {% include './nav_header.tpl' %}
        {% endif %}
        <!-- nav bar end -->
        
        {% if mask %}
        <div id="Mask" class="mask" style="display:none;"></div>
        {% endif %}

        {{html|raw}}

        <div class="fastlogin" id="fastlogin">
            <div class="header">
                <div class="fastloginicon fastloginicon-sg sg"></div>
                <div class="title">网络帐号登录</div>
                <a href="#" class="fastloginicon fastloginicon-x x"></a>
            </div>
            <div class="content">
                <h6>
                    <div class="fastloginicon fastloginicon-sgame sgame"></div>
                    <div class="title">搜狗游戏</div>
                </h6>
                <p class="desc">请选择您已登录的搜狗浏览器账号</p>
                <p class="username" id="fast-user">Nightingale.Y</p>
                <div>
                    <input type="checkbox" checked="checked" id="remeberFast"/>
                    <label for="remeberFast">下次自动登录</label>
                </div>
                <a href="#" class="fastloginbtn"></a>
                <div class="otherways">
                    <a href="#" class="log">使用其他账号登录</a>
                    <a href="#" class="reg">注册新账号</a>
                </div>
            </div>
        </div>

    </body>
    {% if sys.debug %}
    <script src="http://passport.ufo.sogou-inc.com/dist/latest/js/passport-core.js"></script>
    {% else %}
    <script src="http://s.account.sogoucdn.com/u/api/latest/js/passport-core.js"></script>
    {% endif %}
    <!--[if IE 6]>
        <script src="http://img.wan.sogou.com/ufo/helper/DD_belatedPNG.js"></script><script>DD_belatedPNG.fix('.daohang-logo, .daohang-icon');</script>
        <![endif]-->

    {% if sys.debug %}
    <script src="{{sys.pcroam_jsurl}}"></script>
    {% else %}
    <script>
        <!--# include file="/static/landing/common.js" -->
    </script>
    {% endif %}
    {% if navbar %}
    {% if sys.debug %}
    <script src="{{sys.navjsurl}}"></script>
    {% else %}
    <script>
     {{ sys.navjs|raw }}
    </script>
    {% endif %}
    {% endif %}
    <script>
     {% if showDialog %}
     //utils.pb.cl( utils.merge( utils.clone(STATS_CONFIG),{module:'autoshow'}));
     //showreg();

     {% endif %}
    </script>
</html>

