<%@ page import="com.ttms.entity.Studio" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ttms.entity.Play" %>
<%@ page import="com.ttms.entity.Page" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>退票管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="/css/index.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <style type="text/css">
        #pagenum{

            margin-left: 380px;
            margin-top:450px;
        }
        .pagenum a{
            display: inline-block;
            height: 22px;
            margin:0 2px;
            padding: 0 8px;
            border:solid 1px #dbe5ee;
            border-radius: 2px;
            background: #fff;
            color: #333;
            font:normal 12px Arial, Helvetica,Sans-Serif;
            cursor: pointer;
        }
        .movie_top{
            background-color: lavender;
            padding-top: 15px;
            font-size:14px;
        }
        .movie_top span{
            display: inline-block;
            width: 60px;
            margin-left:10px;
        }
        .movie_top select{
            width: 110px;
            height: 30px;
            border: 1px solid lightgray;
            border-radius: 3px;
            margin-right: 20px;
            margin-bottom: 20px;
            padding-left: 5px;
        }
        .t1 a{
            color: #0a6ebd;
            text-decoration: none;
        }
        .t1 a:hover{
            text-decoration: underline;
        }
        .movie_top table tr td{
            text-align: center;
        }
    </style>
</head>
<body class="mian_bj" onload="getType()">
<div class="mian_top_01">
    <div class="mian_top_r">
    </div>
    <div class="mian_top_l">
    </div>
    <div class="mian_top_c">
        <ul>
            <li>
                <a href="/ticket/BackTicket">
                    <p style="font-size: 14px;">订单一览</p>
                </a>
            </li>
        </ul>
    </div>
    <div class="mian_b">
        <div class="content">
            <div class="movie_top">
                <span>影片名：</span>
                <select id="select" onchange="selectSchedule(this)">
                    <option>请选择</option>
                    <%--<option>你的名字</option>--%>
                    <%--<option>星球大战</option>--%>
                </select>
                <span>场次：</span>
                <select id="select1">
                    <option id="1">请选择</option>
                    <option>1</option>
                    <option>2</option>
                </select>
                <table class="table table-hover table-striped">
                    <tr>
                        <th width="8%"><lable>影片名称</lable></th>
                        <th width="10%"><lable>场次</lable></th>
                        <th width="10%"><lable>座位</lable></th>
                        <th width="10%"><lable>价格</lable></th>
                        <th width="10%"><lable>操作</lable></th>
                    </tr>
                    <tr>
                        <td>你的名字</td>
                        <td>3</td>
                        <td>6排7座</td>
                        <td>45</td>
                        <td class="t1"><a href="#">退票</a></td>
                    </tr>
                    <tr>
                        <td>你的名字</td>
                        <td>3</td>
                        <td>6排7座</td>
                        <td>45</td>
                        <td class="t1"><a href="#">退票</a></td>
                    </tr>
                    <tr>
                        <td>你的名字</td>
                        <td>3</td>
                        <td>6排7座</td>
                        <td>45</td>
                        <td class="t1"><a href="#">退票</a></td>
                    </tr>
                    <%--<%--%>
                        <%--for(User_sale list:lists){--%>
                    <%--%>--%>
                    <%--<tr>--%>
                        <%--<td><lable><%=list.getPlay_name()%></lable></td>--%>
                        <%--<td><lable><%=list.getSced_time().substring(0,16)%></lable></td>--%>
                        <%--<td><lable><%=list.getStudio_name()%>号厅 <%=list.getRow()%>排<%=list.getCol()%>列</lable></td>--%>
                        <%--<td><lable><%=list.getPrices()%></lable></td>--%>
                        <%--<td><lable><a href="/ticket/backticket?sale=<%=list.getSale_id()%>">退票</a></lable></td>--%>
                    <%--</tr>--%>
                    <%--<%--%>
                        <%--}--%>
                    <%--%>--%>
                </table>
            </div>
        </div>
    </div>
</div>
<div>

    <%--<%--%>
        <%--Page pages = (Page)request.getAttribute("pages");--%>
        <%--int pagenow = pages.getPageNow();--%>
    <%--%>--%>

    <div id="pagenum" class="pagenum">

        <a href="#">首页</a>
        <a href="#">上一页</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">下一页</a>
        <a href="#">末页</a>
        <%--<strong style="color:black;padding-right: 8px;">第<%=pagenow%>页</strong>--%>

        <%--<a href="/play/showplay?pageNow=1">首页</a>--%>

        <%--<% if(pagenow - 1 > 0){ %>--%>

        <%--<a href="/play/showplay?pageNow=<%=pagenow - 1%>">上一页</a>--%>
        <%--<% } %>--%>

        <%--<% if(pagenow - 1 <= 0){ %>--%>
        <%--<a href="/play/showplay?pageNow=1">上一页</a>--%>
        <%--<% } %>--%>

        <%--<%--%>
            <%--int pagecount = pages.getTotalPageCount();--%>
            <%--for(int i = 1; i <= pagecount; i++ ){--%>

        <%--%>--%>
        <%--<a href="/play/showplay?pageNow=<%=i%>"><%=i%></a>--%>

        <%--<%}%>--%>
        <%--<%--%>
            <%--if(pagecount == 0){--%>
        <%--%>--%>
        <%--<a href="/play/showplay?pageNow=<%=pagenow%>">下一页</a>--%>
        <%--<%--%>
            <%--}--%>
            <%--if(pagenow + 1 < pagecount){--%>
        <%--%>--%>
        <%--<a href="/play/showplay?pageNow=<%=pagenow + 1%>">下一页</a>--%>
        <%--<%--%>
            <%--}--%>
            <%--if(pagenow + 1 >= pagecount){--%>
        <%--%>--%>
        <%--<a href="/play/showplay?pageNow=<%=pagecount%>">下一页</a>--%>
        <%--<% } %>--%>
        <%--<a href="/play/showplay?pageNow=<%=pagecount%>">尾页</a>--%>

    </div>
</div>
<script>
    function getType(){
        $.ajax({
            type: "Get", //提交方式，也可以是get
            url: "/play/selectPlay",    //请求的url地址
            dataType: "json",   //返回格式为json,也可以不添加这个属性，也可以是（xml、json、script 或 html）。
            success: function(data) {
                for (var i = 0; i < data.length; i++) {
                    $("#select").append( "<option id="+data[i].play_id+">"+data[i].play_name+"</option>" );
                }
            }
        });
    }
    function selectSchedule(tar){
        alert($("#select  option:selected").attr("id"));
        var play_name = tar.value;
        alert(play_name);
        $("#select1").empty();
        $.ajax({
            type: "Get", //提交方式，也可以是get
            url: "/schedule/selectSched?play_name="+play_name,    //请求的url地址
            dataType: "json",   //返回格式为json,也可以不添加这个属性，也可以是（xml、json、script 或 html）。
            success: function(data) {
                for (var i = 0; i < data.length; i++) {
                    $("#select1").append( "<option>"+data[i].sched_time.substring(0,19)+"</option>" );
                }
            }
        });
    }
</script>
</body>
</html>

