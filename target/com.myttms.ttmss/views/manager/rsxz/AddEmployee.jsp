
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>人员增加</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <meta charset="utf-8">
    <script type="text/javascript">

        function checkmess(){
            var content = document.getElementsByClassName("mess");
            var i;
            for(i=0; i < content.length; i++){
                if(content[i].value  == null || content[i].value == ""){
                    alert("必填信息为空!");
                    return false;
                }
            }

            var name = document.getElementById("Text1").value;
            var phone = document.getElementById("Text12").value;
            var mail = document.getElementById("Text13").value;

            var regex = /^[0-9a-zA-Z\u4E00-\u9FA5]{2,10}$/;
            var regex1 = /^[1][358][0-9]{9}$/;
            var regex2 = /^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$/;

            if(!name.match(regex)){
                alert("姓名不规范!");
                return false;
            }

            if(!phone.match(regex1)){
                alert("手机号格式不正确!");
                return false;
            }

            if(!mail.match(regex2)){
                alert("邮箱格式不正确!");
                return false;
            }


        }

    </script>
</head>
<body class="mian_bj">
<form class="mian_top_01" action="/employee/addemp" method="post">
    <div class="mian_top_r">
    </div>
    <div class="mian_top_l">
    </div>
    <div class="mian_top_c">
        <ul>
            <li><a href="/employee/showemp">
                <p>
                    用户信息</p>
            </a></li>
            <li><a href="/employee/showtopemp">
                <p>
                    管理员信息</p>
            </a></li>

        </ul>
    </div>
    <div class="mian_b">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mian_b_bg_xz">
            <tr>
                <td width="5%" class="mian_b_bg_lm">&nbsp;

                </td>
                <td colspan="4" class="mian_b_bg_lm">
                    添加员工信息
                </td>
            </tr>
        </table>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" class="mian_b_bg_xz">
            <tr style="background-color: White; height: 30px">
                <td colspan="8">
                    基本信息(有<span style="color:red">*</span>为必填信息)
                </td>
            </tr>
            <tr style="background-color: White; height: 30px">
                <td style="width: 16%" align="center">
                    用户名
                    <span style="color:red">*</span>
                </td>
                <td style="width: 16%;" align="center">
                    姓名
                    <span style="color:red">*</span>
                </td>
                <td style="width: 16%" align="center">
                    性别
                    <span style="color:red">*</span>
                </td>


                <td style="width: 16%" align="center">
                    密码
                    <span style="color:red">*</span>
                </td>
                <td style="width: 16%" align="center">
                    身份
                    <span style="color:red">*</span>
                </td>
                <td style="width: 8%" rowspan="5" align="center" valign="middle">
                    <img src="/images/head_pic.png" width="150" height="200">
                </td>
            </tr>
            <tr style="background-color: White; height: 30px">
                <td>
                    <input id="Text3"  name="loginname" type="text" style="border: 0px; width: 100px">
                </td>
                <td>
                    <input id="Text1" name="truename" type="text" style="border: 0px; width: 100px" class="mess">
                </td>

                <td>
                    <select id="Select1" style="width: 80px" class="mess" name="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>



                <td>
                    <input id="Text4"  name="password" type="text" style="border: 0px; width: 100px">
                </td>
                <td>
                    <input id="Text2" name="type" type="text" style="border: 0px; width: 100px" class="mess" value="0" disabled="disabled">
                </td>

            </tr>
            <tr style="background-color: White; height: 30px">

                <td colspan="2">
                    手机
                    <span style="color:red">*</span>
                </td>
                <td colspan="3">
                    邮箱
                    <span style="color:red">*</span>
                </td>

            </tr>
            <tr style="background-color: White; height: 30px">

                <td colspan="2">
                    <input id="Text12"  name="tel" type="text" style="border: 0px; width: 200px" class="mess">
                </td>
                <td colspan="3">
                    <input id="Text13"  name="mail"  type="text" style="border: 0px; width: 300px" class="mess">
                </td>
            </tr>
            <tr style="background-color: White; height: 30px">
                <td>
                    家庭住址:
                    <span style="color:red">*</span>
                </td>
                <td colspan="4">
                    <input id="Text7"  name="address" type="text" style="border: 0px; width: 300px" class="mess">
                </td>
            </tr>

            <tr style="background-color: White; height: 30px" id="mysub">
                <td align="center" colspan="8">
                    <a href="#mysub"><input type="image" src="/images/bnt_03.gif" name="img" style="margin-top:8px; margin-right: 10px;" width="80" height="22" onclick="return checkmess();" ></a>
                    <img src="/images/bnt_05.gif" alt="" width="80" height="22" style="margin-bottom: 10px;" onclick="javascript:window.history.go(-1);">
                    <span style="color: red">${requestScope.errors}</span>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>


