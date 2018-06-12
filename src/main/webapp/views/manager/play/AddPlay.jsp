

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加影片</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); }
    </script>

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
        .footer_right{
            overflow: hidden;
            position: relative;
            margin-top: 37px;
        }
        .footer_right input{
            border: 1px solid gray;
            background-color: rgba(0,0,0,0);
            width: 250px;
            height: 40px;
            margin: 10px 8px;
            border-radius: 5px;
            padding-left: 20px;
            color: GrayText;
            font-weight: 100;
        }
        .footer_right span{
            display: inline-block;
            width: 60px;
        }
        label {
            display: inline-block;
            margin-bottom: 0px;
            font-weight: 100;
            margin-left: 15px;
        }
        .foot_left{
            overflow: hidden;
            position: relative;
            left: 145px;
            margin-right: 130px;
        }
        .foot_left input{
            border: none;
            background-color: #ededee;
            width: 320px;
            height: 40px;
            border-radius: 5px;
        }
        .foot_left textarea{
            background-color: #ededee;
            border: none;
            border-radius: 5px;
            padding:10px;
            width: 790px;
            overflow: hidden;
        }
        .foot_left textarea:hover{
            box-shadow: 1px 1px 3px #E74F4D;
        }
        #submit{
            width: 750px;
        }
        .foot_left input:hover{
            box-shadow: 1px 1px 3px #E74F4D;
        }


        .box1
        {
            position: relative;
            width: 250px;
            height: 300px;
            background-color: #ededee;
            background-repeat: no-repeat;
            background-position: 0 0;
            background-attachment: scroll;
            line-height: 300px;
            text-align: center;
            color: #AAA;
            font-size: 22px;
            font-family: "微软雅黑";
            cursor: pointer;
            overflow: hidden;
            z-index: 1;
            left: -180px;
            top: 50px;
            float: left;
        }
        .box1 input
        {
            position: absolute;
            width: 250px;
            height: 300px;
            line-height: 40px;
            font-size: 23px;
            opacity: 0;
            filter: "alpha(opacity=0)";
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            left: -5px;
            top: -2px;
            cursor: pointer;
            z-index: 2;
        }

        @media screen and (max-width : 1280px){
            .foot_left{
                overflow: hidden;
                position: relative;
                left:145px;
                margin-right: 130px;
            }
            .foot_left input{
                border: none;
                background-color: #ededee;
                width: 320px;
                height: 40px;
                border-radius: 5px;
            }
            .foot_left textarea{
                background-color: #ededee;
                border: none;
                border-radius: 5px;
                padding:10px;
                width: 790px;
                overflow: hidden;
            }
            .foot_left textarea:hover{
                box-shadow: 1px 1px 3px #E74F4D;
            }
            #submit{
                width: 750px;
            }
            .foot_left input:hover{
                box-shadow: 1px 1px 3px #E74F4D;
            }
            .footer_right lable{
                width: 450px;
            }
            /*.footer_right .myspan1{*/
                /*margin-left: 23px;*/
                /*fot-weight: 100;*/
            /*}*/
            .myspan{
                background-color: rgba(0,0,0,0);
                height: 40px;
                margin:10px 8px;
                border: 1px solid grey;
                border-radius: 5px;
                padding-left: 15px;
                display: inline-block;
                width: 250px;
            }
            #mybody{
                background-color: #3c3c3c;
            }

        }
    </style>
</head>
<body class="mian_bj" id="mybody">
<div class="mian_top_r"></div>
<div class="mian_top_l"></div>
<div class="mian_top_c">
    <ul>
        <li><a href="/play/showplay">
            <p>
                影片一览</p>
        </a></li>
        <li><a href="/play/addplayshow">
            <p>
                修改影片</p>
        </a></li>
        <li><a href="/play/delplayshow">
            <p>
                删除影片</p>
        </a></li>
    </ul>
</div>
<div class="mian_b">
    <div class="mian_b1" style="height: 3px;">

        <%--<p class="mian_b1_sousuo">--%>
            <%--<input name="" type="text" id="searchcontent"></p>--%>
        <%--<a href="#" title="搜索" onclick="checkcontent();">--%>
            <%--<p class="mian_b1_a3">--%>
            <%--</p>--%>
        <%--</a>--%>
    </div>
    <form method="post" action="/play/addplay" name="joinForm" enctype="multipart/form-data">
        <div class="header_top">
            <div class="col-sm-3 header_right">
            </div>
            <div class="box1">
                <input type="file" name="play_image">
                选择图片
            </div>
            <div class="footer_right">
                <span>名字:</span><label><input type="text" name="play_name" placeholder="请输入电影的名字"/></label><br/>
                <span>类别:</span>
                    <label>
                        <select  name="play_type" class="myspan">
                            <option value="喜剧">喜剧</option>
                            <option value="悬疑">悬疑</option>
                            <option value="动漫">动漫</option>
                            <option value="爱情">爱情</option>
                            <option value="动作">动作</option>
                        </select>
                    </label><br/>
                <span>语言:</span>
                    <lable>
                        <select  name="play_lang" class="myspan" style="margin-left:23px;">
                            <option value="中文">中文</option>
                            <option value="英文">英文</option>
                            <option value="韩语">韩语</option>
                            <option value="日语">日语</option>
                            <option value="泰语">泰语</option>
                        </select>
                    </lable><br/>
                <span>时长:</span><label><input type="text" name="play_length" placeholder="请输入电影的时长"/></label><br/>
                <span>价格:</span><label><input type="text" name="play_price" placeholder="请输入电影的价格"/></label><br/>
                <span>上映时间:</span><label><input type="date" name="play_up_time" class="date1"/></label><br/>
                <span>下架时间:</span><label><input type="date" name="play_down_time" class="date1" /></label><br/>
                <span>状态:</span><label>
                    <select  name="play_status" class="myspan">
                        <option value="0">未上映</option>
                        <option value="1">上映中</option>
                        <option value="-1">下架</option>
                    </select>
                </label><br/>
            </div>
            <div class="foot_left">
                <textarea cols="8" rows="8"  name ="play_introduction"  placeholder="请输入电影的内容信息"></textarea><br/>
            </div>
            &nbsp;
            &nbsp;
            &nbsp;

            <div style="margin-left:400px;">
                <input type="image" src="/images/bnt_03.gif" style="margin-right:10px;" width="80" height="22">
                <img src="/images/bnt_05.gif" alt="" width="80" height="22" style="margin-bottom: 10px;" onclick="javascript:window.history.go(-1);">

            </div>
            <div>
                <span style="color: red">${requestScope.errors}</span>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script src="/js/common.js"></script>


