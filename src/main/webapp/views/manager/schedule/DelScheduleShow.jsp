<%@ page import="com.ttms.entity.Studio" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ttms.entity.ScheduleDetail" %>
<%@ page import="com.ttms.entity.Page" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>删除影厅</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/index.css">

    <style type="text/css">

        #pagenum{

            margin-left: 380px;
            margin-top:100%;
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
        .mian_b_bg_lm {
            background: #e6e6e6;
            color: #000;
            padding-left: 5px;
            border: 1px solid #dfe2e6;
            color: #7c7c7c;
            font-size: 13px;
            width: 0;
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
    <form action="/schedule/delsched" method="post">
        <div class="mian_b">
            <div class="mian_b1">

                <input type="submit" name="submit" class="mian_b1_a2" value="x 删除"/>
                <%--<p class="mian_b1_sousuo">--%>
                    <%--<input name="" type="text"></p>--%>
                <%--<a href="#" title="搜索">--%>
                    <%--<p class="mian_b1_a3">--%>
                    <%--</p>--%>
                <%--</a>--%>
            </div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mian_b_bg">
                <%--<tr>--%>
                    <%--<td width="3%" class="mian_b_bg_lm">&nbsp;--%>

                    <%--</td>--%>
                    <%--<td width="87%" class="mian_b_bg_lm">--%>
                        <%--演出计划列表--%>
                    <%--</td>--%>
                    <%--<td width="10%" class="mian_b_bg_lm">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<%--%>
                    <%--List<ScheduleDetail> lists= (List<ScheduleDetail>)request.getAttribute("list");--%>
                    <%--for(ScheduleDetail list : lists){--%>
                <%--%>--%>
                <tr>

                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mian_b_lb"
                               style="text-align: center;">
                            <tr>
                                <td width="3%"  style="  " class="mian_b_bg_lm">
                                </td>
                                <td width="20%" valign="top" class="mian_b_bg_lm">
                                    影厅名称
                                </td>
                                <td width="20%" valign="top" class="mian_b_bg_lm">
                                    影片名称
                                </td>
                                <td width="20%" valign="top" class="mian_b_bg_lm">
                                    演出时间
                                </td>
                                <td width="20%" valign="top" class="mian_b_bg_lm">
                                    电影票价
                                </td>
                            </tr>
                            <%
                                List<ScheduleDetail> lists= (List<ScheduleDetail>)request.getAttribute("list");
                                for(ScheduleDetail list : lists){
                            %>
                            <tr>
                                <td width="3%">
                                    <input  name="type" type="checkbox" value="<%=list.getSched_id()%>" style="width: 20px; height: 17px;"/>
                                </td>
                                <td width="20%" valign="top">
                                    <%=list.getStudio_name()%>
                                </td>
                                <td width="20%" valign="top">
                                    <%=list.getPlay_name()%>
                                </td>
                                <td width="20%" valign="top">
                                    <%=list.getSched_time().substring(0,19)%>
                                </td>
                                <td width="20%" valign="top">
                                    <%=list.getSched_ticket_price()%>
                                </td>
                            </tr>
                            <% } %>
                        </table>
                    </td>
                    <td>

                    </td>
                </tr>

            </table>

        </div>
    </form>
</div>
<div>

    <%
        Page pages = (Page)request.getAttribute("pages");
        int pagenow = pages.getPageNow();
    %>

    <div id="pagenum" class="pagenum">


        <strong style="color:black;padding-right: 8px;">第<%=pagenow%>页</strong>

        <a href="/schedule/delschedshow?pageNow=1">首页</a>

        <% if(pagenow - 1 > 0){ %>

        <a href="/schedule/delschedshow?pageNow=<%=pagenow - 1%>">上一页</a>
        <% } %>

        <% if(pagenow - 1 <= 0){ %>
        <a href="/schedule/delschedshow?pageNow=1">上一页</a>
        <% } %>

        <%
            int pagecount = pages.getTotalPageCount();
            for(int i = 1; i <= pagecount; i++ ){

        %>
        <a href="/schedule/delschedshow?pageNow=<%=i%>"><%=i%></a>

        <%}%>
        <%
            if(pagecount == 0){
        %>
        <a href="/schedule/delschedshow?pageNow=<%=pagenow%>">下一页</a>
        <%
            }
            if(pagenow + 1 < pagecount){
        %>
        <a href="/schedule/delschedshow?pageNow=<%=pagenow + 1%>">下一页</a>
        <%
            }
            if(pagenow + 1 >= pagecount){
        %>
        <a href="/schedule/delschedshow?pageNow=<%=pagecount%>">下一页</a>
        <% } %>
        <a href="/schedule/delschedshow?pageNow=<%=pagecount%>">尾页</a>



    </div>
</div>
</body>
</html>
