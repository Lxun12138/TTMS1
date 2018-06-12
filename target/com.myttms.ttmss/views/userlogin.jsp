
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Movie_store A Entertainment Category Flat Bootstarp Resposive Website Template | Single :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <!-- start plugins -->
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
    <style type="text/css">
        .col-sm-3 img{
            width: 100px;
        }
        .ulul a{
            margin-top: 15px;
            color: #333;
            padding: 10px 20px;
        }
        .ulul a:hover{
            color: red;
        }
        body{
            overflow: hidden;
            /*background:url(/images/bg13.jpg);*/
        }
        .footer_right{
            overflow: hidden;
            position: relative;
            margin-top: 70px;
            left: 230px;
        }
        .footer_right input.p1{
            width: 255px;
            height: 40px;
            margin: 20px 0 8px 130px;
            border-radius: 5px;
            padding-left: 20px;
            border: 1px solid gray;
            border-radius: 5px;
            background-color: rgba(0,0,0,0);
            color: lightseagreen;
            font-size: 14px;
            font-weight: lighter;
        }


        .footer_right span{
            position: relative;
            left: 100px;

        }
        .submits{
            margin-left: 160px;
            padding-right: 60px;
            padding-left: 37px;
            width: 80px;
            height: 32px;
            border: 1px solid gray;
            border-radius:10px;
        }

        @media screen and (max-width : 1280px){
            .footer_right{
                overflow: hidden;
                position: relative;
                margin-top: 70px;
                left: 150px;
            }
        }
    </style>
    <script language="javascript">

        function register(){
            window.location.href="userregister.jsp";
        }

    </script>

</head>
<body>
<div class="container">
    <div class="container_wrap">
        <div class="header_top">
            <div class="col-sm-3 logo"><a href="show.jsp"><img src="/images/1.png" alt=""/></a></div>
            <div class="col-sm-6 nav">
                <ul class="ulul">
                    <a href="/play/showAllPlay"><li>首页</li></a>
                    <a href="#tt"><li>影片</li></a>
                    <!-- <a href="single.html"><li>信息</li></a> -->
                    <a href="#"><li>订单</li></a>
                </ul>
            </div>
            <div class="col-sm-3 header_right">
                <ul class="header_right_box">
                    <li><img src="/images/1.png" alt=""/></li>
                </ul>
            </div>
            <div class="footer_right">
                <form method="post" action="/user/logins" name="joinForm">
                    <br/>
                    <span>账号</span><label><input type="text" class="p1" name="username" placeholder="请输入您的账号"/></label><br/>
                    <span>密码</span><label><input type="password" class="p1" name="password" placeholder="请输入您的密码"/></label><br/>
                    <br/><br/><br/>
                    <input class="submits" type="submit" value="登录" style="background:rgba(0,0,0,0);"/>
                    <input class="submits" type="button" value="注册" onclick="register()" style="margin-left:53px;background:rgba(0,0,0,0);" />
                </form>
                <span style="color: red">${requestScope.errors}</span>
                <%--<input class="submits" type="submit" value="登录"/>--%>
                <!-- <a href="" id="submit" style="color: black;">注册</a> -->
                <%--<input class="submits" type="button" value="注册" onclick="register()" style="margin-left: 70px;" />--%>
                <br/>
                <br/>

            </div>
        </div>
    </div>
</div>
</body>
</html>
