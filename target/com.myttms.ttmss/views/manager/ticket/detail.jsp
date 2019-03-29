<%@ page import="com.ttms.entity.Play" %>
<%@ page import="com.ttms.entity.Schedule" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ttms.entity.ScheduleDetail" %>
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
        @media screen and (min-width : 1280px){
            .video img{
                margin-top: 10px;
            }
            #weizhi{
                margin-top: 30px;
            }
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
            .rslides img{
                height: 450px;
            }
            .movie_box{
                margin-left: 150px;
            }
            .desc1{
                padding-left: 80px;
            }

            .choice{
                margin-top: 60px;
                width: 100%;
                overflow:hidden;
                margin-bottom: 60px;
            }
            ul,li{
                list-style-type: none;
            }
            .film li{
                width: 920px;
                padding:15px 0px;
                border-radius: 5px;
                border:1px solid #AAAAAA;
                text-align: center;
            }
            .film label{
                margin-left: 45px;
                margin-right: 80px;
            }
            .film a{
                color: #fff;
                padding: 5px 5px;
                background-color: lightslategray;
                border-radius: 6px;
            }
            #tit label{
                margin-left: 80px;
                margin-right: 50px;
            }
        }

        @media screen and (max-width : 1280px){
            .list_4{
                display: none;
            }
            .video img{
                margin-top: 10px;
            }
            #weizhi{
                margin-top: 30px;
            }
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
            .rslides img{
                height: 450px;
            }
            .movie_box{
                margin-left: 150px;
            }
            .desc1{
                padding-left: 80px;
            }

            .choice{
                margin-top: 60px;
                width: 100%;
                overflow:hidden;
                margin-bottom: 60px;
            }
            ul,li{
                list-style-type: none;
            }
            .film{
                position: relative;
                left: 50px;
            }
            .film li{
                width: 750px;
                padding:15px 0px;
                border-radius: 5px;
                border:1px solid #AAAAAA;
            }
            .film label{
                margin-left: 50px;
                margin-right: 62px;
            }
            .film a{
                color: #fff;
                padding: 10px 10px;
                margin-left: 15px;
                background-color: #FC5242;
            }
            #tit label{
                margin-left: 50px;
                margin-right: 60px;
            }
            .down_btn{
                position: relative;
                top: -20px;
            }
        }
    </style>
</head>
<%
    List<ScheduleDetail> lists = (List<ScheduleDetail>) request.getAttribute("scheduledetail");
    Play play = (Play) request.getAttribute("play");
    String[] type = play.getPlay_type().split(",");

%>
                <body>
                        <div class="film">
                            <table class="table table-hover table-striped" style="width: 920px;margin-left: 80px;margin-top: 40px;">
                                <tr>
                                    <th><lable>时间</lable></th>
                                    <th><lable>语言</lable></th>
                                    <th><lable>放映厅</lable></th>
                                    <th><lable>价格</lable></th>
                                    <th><lable>选座预览</lable></th>
                                </tr>
                                <%
                                    for(ScheduleDetail list:lists){

                                        String[] studio = list.getStudio_name().split("\\|");

                                %>
                                <tr>
                                    <td><lable><%=list.getSched_time().substring(0,16)%></lable></td>
                                    <td><lable><%=play.getPlay_lang()%></lable></td>
                                    <td><lable><%=studio[0]%></lable></td>
                                    <td><lable><%=list.getSched_ticket_price()%></lable></td>
                                    <td><lable><a href="/ticket/ticketseats?stu=<%=studio[1]%>&&sche=<%=list.getSched_id()%>" target="_blank">选座订票</a></lable></td>
                                </tr>
                                <%
                                    }
                                %>

                            </table>
                        </div>

            <div class="clearfix"> </div>

</body>
</html>

