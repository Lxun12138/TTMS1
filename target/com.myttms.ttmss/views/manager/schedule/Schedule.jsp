
<%@ page import="java.util.List" %>
<%@ page import="com.ttms.entity.ScheduleDetail" %>
<%@ page import="com.ttms.entity.Page" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>影厅管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <script type="text/javascript">

        function checkcontent(){
            var content = document.getElementById("searchcontent").value;
            var regex = /^\w+$/;

            if(!content.match(regex)){
                alert("搜索内容格式不合法!");
                return false;
            }
        }

    </script>

    <style type="text/css">

        #pagenum{

            margin-left:400px;
            margin-top:550px;
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
        .mian_top_c ul li a p{
            font-size: 12px;
        }
        .table1 td{
            line-height: 30px;
            width: 25%;
        }

    </style>
</head>
<body class="mian_bj">
<div class="mian_top_01">
    <div class="mian_top_r">
    </div>
    <div class="mian_top_l">
    </div>
    <div class="mian_top_c">
            <ul>

                <li><a href="/schedule/showsched">
                    <p>
                        演出计划一览</p>
                </a></li>
                <li><a href="/schedule/addschedshow">
                    <p>
                        修改演出计划</p>
                </a></li>
                <li><a href="/schedule/delschedshow">
                    <p>
                        删除演出计划</p>
                </a></li>
            </ul>
    </div>
    <div class="mian_b">
        <div class="mian_b1" style="height: 3px;">
            <%--<p class="mian_b1_sousuo">--%>
                <%--<input name="" type="text"></p>--%>
            <%--<a href="#" title="搜索">--%>
                <%--<p class="mian_b1_a3">--%>
                <%--</p>--%>
            <%--</a>--%>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mian_b_bg">
            <tr>
                <%--<td width="3%" class="mian_b_bg_lm">--%>

                <%--</td>--%>
                <td width="87%" class="mian_b_bg_lm" >
                    演出计划列表
                </td>
                <%--<td width="10%" class="mian_b_bg_lm">--%>
                <%--</td>--%>
            </tr>
            <%--<%--%>
                <%--List<ScheduleDetail> lists= (List<ScheduleDetail>)request.getAttribute("list");--%>
                <%--for(ScheduleDetail list : lists){--%>
            <%--%>--%>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1"
                           style="font-size: 13px;  text-align: center; ">
                        <tr style=" padding: 5px; line-height: 25px; background-color:#e6e6e6;">
                            <td  valign="top" width="25%" >
                                影厅名称
                            </td>
                            <td  valign="top" width="25%" >
                                影片名称
                            </td>
                            <td width="25%"  valign="top">
                                演出时间
                            </td>
                            <td width="25%"  valign="top">
                                电影票价
                            </td>
                        </tr>
                        <%
                            List<ScheduleDetail> lists= (List<ScheduleDetail>)request.getAttribute("list");
                            for(ScheduleDetail list : lists){
                        %>
                        <tr style=" line-height: 25px; background-color:#fff;">
                            <td><%=list.getStudio_name()%></td>
                            <td><%=list.getPlay_name()%></td>
                            <td><%=list.getSched_time().substring(0,19)%></td>
                            <td><%=list.getSched_ticket_price()%></td>
                        <% } %>
                    </table>
                </td>
                <td>

                </td>

            </tr>

        </table>
    </div>

</div>
<div>

    <%
        Page pages = (Page)request.getAttribute("pages");
        int pagenow = pages.getPageNow();
    %>

    <div id="pagenum" class="pagenum">


        <strong style="color:black;padding-right: 8px;">第<%=pagenow%>页</strong>

        <a href="/schedule/showsched?pageNow=1">首页</a>

        <% if(pagenow - 1 > 0){ %>

        <a href="/schedule/showsched?pageNow=<%=pagenow - 1%>">上一页</a>
        <% } %>

        <% if(pagenow - 1 <= 0){ %>
        <a href="/schedule/showsched?pageNow=1">上一页</a>
        <% } %>

        <%
            int pagecount = pages.getTotalPageCount();
            for(int i = 1; i <= pagecount; i++ ){

        %>
        <a href="/schedule/showsched?pageNow=<%=i%>"><%=i%></a>

        <%}%>
        <%
            if(pagecount == 0){
        %>
        <a href="/schedule/showsched?pageNow=<%=pagenow%>">下一页</a>
        <%
            }
            if(pagenow + 1 < pagecount){
        %>
        <a href="/schedule/showsched?pageNow=<%=pagenow + 1%>">下一页</a>
        <%
            }
            if(pagenow + 1 >= pagecount){
        %>
        <a href="/schedule/showsched?pageNow=<%=pagecount%>">下一页</a>
        <% } %>
        <a href="/schedule/showsched?pageNow=<%=pagecount%>">尾页</a>



    </div>
</div>
</body>
</html>
