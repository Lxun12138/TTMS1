
<%@ page import="com.ttms.entity.Studio" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ttms.entity.Play" %>
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
    <form action="/play/delplay" method="post">
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
                <tr>
                    <td width="3%" class="mian_b_bg_lm">&nbsp;

                    </td>
                    <td width="87%" class="mian_b_bg_lm">
                        影片列表
                    </td>
                    <td width="10%" class="mian_b_bg_lm">
                    </td>
                </tr>
                <%
                   List<Play> lists = (List<Play>)request.getAttribute("list");
                    for(Play list : lists){
                %>
                <tr>
                    <td>
                        <input  name="type" type="checkbox" value="<%=list.getPlay_id()%>"/>
                    </td>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mian_b_lb">
                            <tr>
                                <td rowspan="6" width="10%">
                                    <img src="<%=list.getPlay_image()%>" width="110" height="160"
                                         style="margin-right: 15px; display:block;padding: 3px; border: 1px solid gray;
                                      vertical-align: top;">
                                </td>
                                <td width="30%" valign="top">
                                    影片名称：<%=list.getPlay_name()%>
                                </td>
                                <td valign="top">
                                    影片类别：<%=list.getPlay_type()%>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    影片语言：<%=list.getPlay_lang()%>
                                </td>
                                <td valign="top">
                                    影片时长：<%=list.getPlay_length()%>
                                </td>
                            </tr>

                            <tr>
                                <td valign="top">
                                    影片价格：<%=list.getPlay_ticket_price()%>
                                </td>
                                <td valign="top">
                                    上映时间： <%=list.getPlay_up_time()%>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    下架时间：<%=list.getPlay_down_time()%>
                                </td>
                                <td valign="top">
                                    影片状态：
                                    <%
                                        if (list.getPlay_status() == 0) {
                                    %>
                                    未上映
                                    <%}%>
                                    <%
                                        if (list.getPlay_status() == 1) {
                                    %>
                                    正上映
                                    <%}%>
                                    <%
                                        if (list.getPlay_status() == -1) {
                                    %>
                                    已下架
                                    <%}%>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    影片介绍： <%=list.getPlay_introduction()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>

                    </td>

                </tr>
                <% } %>

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

        <a href="/play/delplayshow?pageNow=1">首页</a>

        <% if(pagenow - 1 > 0){ %>

        <a href="/play/delplayshow?pageNow=<%=pagenow - 1%>">上一页</a>
        <% } %>

        <% if(pagenow - 1 <= 0){ %>
        <a href="/play/delplayshow?pageNow=1">上一页</a>
        <% } %>

        <%
            int pagecount = pages.getTotalPageCount();
            for(int i = 1; i <= pagecount; i++ ){

        %>
        <a href="/play/delplayshow?pageNow=<%=i%>"><%=i%></a>

        <%}%>
        <%
            if(pagecount == 0){
        %>
        <a href="/play/delplayshow?pageNow=<%=pagenow%>">下一页</a>
        <%
            }
            if(pagenow + 1 < pagecount){
        %>
        <a href="/play/delplayshow?pageNow=<%=pagenow + 1%>">下一页</a>
        <%
            }
            if(pagenow + 1 >= pagecount){
        %>
        <a href="/play/delplayshow?pageNow=<%=pagecount%>">下一页</a>
        <% } %>
        <a href="/play/delplayshow?pageNow=<%=pagecount%>">尾页</a>



    </div>
</div>
</body>
</html>
