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
                <a href="#" id="fastlogin_x" class="fastloginicon fastloginicon-x x"></a>
            </div>
            <div class="content">
                <h6>
                    <div class="fastloginicon fastloginicon-sgame sgame"></div>
                    <div class="title">搜狗游戏</div>
                </h6>
                <p class="desc">请选择您已登录的搜狗浏览器账号</p>
                <p class="username" id="fast-user"></p>
                <div>
                    
                    <label for="remeberFast"><input type="checkbox" checked="checked" id="remeberFast"/>下次自动登录</label>
                </div>
                <a href="#" id="fastloginbtn" class="fastloginbtn"></a>
                <p id="fast_err" class="fast_err"></p>
                <div class="otherways">
                    <a href="#" id="fastlogin_other" class="log">使用其他账号登录</a>
                    <a href="#" id="fastlogin_reg" class="reg">注册新账号</a>
                </div>
            </div>
        </div>

    </body>
    {% if sys.debug %}
    <script src="http://passport.ufo.sogou-inc.com/dist/latest/js/passport-core.js"></script>
    {% else %}
    <script src="http://s.account.sogoucdn.com/u/api/0.2.0.141016/js/passport-core.js"></script>
    {% endif %}
    <!--[if IE 6]>
        <script src="http://img.wan.sogou.com/ufo/helper/DD_belatedPNG.js"></script><script>DD_belatedPNG.fix('.daohang-logo, .daohang-icon');</script>
        <![endif]-->

    {% if sys.debug %}
    <script src="{{sys.pcroam_jsurl}}"></script>
    {% else %}
    <script>
        <!--# include file="/static/landing/roam_common.js" -->
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

