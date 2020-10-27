<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Wwb
  Date: 2020/10/11
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站注册</title>

    <style>
        body {
            font-size: 15px;
        }

        fieldset {
            width: 450px;
            margin: auto auto;
            border: 1px solid #ccc;
        }

        legend {
            margin-left: 180px;
        }

        p {
            margin: 20px auto;
        }

        .txt {
            color: black;
            border: 1px solid whitesmoke;
            width: 150px;
            padding-left:5px;
        }

        span {
            color: red;
            font-size: 13px;
        }
        #box1 > p > input {
            margin-left: 100px;
        }

    </style>
    <script>
        function myFunction(x) {
            x.style.background = "white";
        }
        /**
         * @return {boolean}
         */
        function Name() {
            const name = document.getElementById("txtname").value;
            const nameReg = /^[\u4e00-\u9fa5]{2,6}$/;
            if (!nameReg.test(name)) {
                const t = span_name.innerHTML = "错误！请输入2~6个汉字！";
                return false;
            }
            else {
                span_name.innerHTML = "格式正确";
                return true;
            }
        }
        function Password() {
            const pwd = document.getElementById("txtpwd").value;
            const reg = /^[\d\w]{6,12}$/;
            if (!reg.test(pwd)) {
                span_pwd.innerHTML = "错误！请输入6~12以内数字、字母或组合！";
            }
            else {
                span_pwd.innerHTML = "格式正确";
            }
        }

        function Password2() {
            const pwd = document.getElementById("txtpwd").value;
            const pwd2 = document.getElementById("txtpwd2").value;
            if (pwd !== pwd2) {
                span_pwd2.innerHTML = "错误！两次输入不一致！";
            }
            else {
                span_pwd2.innerHTML = "格式正确";
            }
        }

        function bloodType() {
            const xue = document.getElementById("txtxue").value;
            const xueReg = /^A$|^B$|^AB$|^O$/;

            if (!xueReg.test(xue)) {
                span_xue.innerHTML = "错误！请输入A,B,AB或O型血！";
                return false;
            }
            else {
                span_xue.innerHTML = "格式正确";
                return true;
            }
        }

        /**
         * @return {boolean}
         */
        function Area() {
            const area = document.getElementById("txtarea").value;
            const areaReg = /^[\u4e00-\u9fa5]{8,}$/;
            if (!areaReg.test(area)) {
                span_area.innerHTML = "错误！请输入不少于8个汉字！";
                return false;
            }
            else {
                span_area.innerHTML = "格式正确";
                return true;
            }
        }
        function Email() {
            const email = document.getElementById("txtemail").value;
            const reg1 = /^[\w\d]{1,9}@[\w\d]{1,9}\.[\w]{2,3}$/;
            if (!reg1.test(email)) {
                span_email.innerHTML = "错误!如:abcdefg@163.com";
            }
            else {
                span_email.innerHTML = "格式正确";
            }
        }
    </script>

    <style>
        .code
        {
            font-family: Arial, serif;
            font-style:italic;
            color:black;
            font-size:30px;
            border:0;
            padding:2px 3px;
            letter-spacing:3px;
            font-weight:bolder;
            float:left;
            cursor:pointer;
            width:150px;
            height:50px;
            line-height:60px;
            text-align:center;
            vertical-align:middle;
            background-color:whitesmoke;
        }
        span {
            text-decoration:none;
            font-size:12px;
            color:whitesmoke;
            padding-left:10px;
        }

        span:hover {
            text-decoration:underline;
            cursor:pointer;
        }

    </style>
</head>
<script  language="javascript">
    window.onload=function(){
        createCode(4);
    }

    function createCode(length) {
        let code = "";
        const codeLength = parseInt(length);
        const checkCode = document.getElementById("checkCode");
        const codeChars = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        for (let i = 0; i < codeLength; i++)
        {
            const charNum = Math.floor(Math.random() * 62);
            code += codeChars[charNum];
        }
        if (checkCode)
        {

            checkCode.className = "code";
            checkCode.innerHTML = code;
        }
    }

    function validateCode()
    {
        const checkCode = document.getElementById("checkCode").innerHTML;
        const inputCode = document.getElementById("inputCode").value;
        console.log(checkCode);
        console.log(inputCode);
        if (inputCode.length <= 0)
        {
            alert("请输入验证码！");
        }
        else if (inputCode.toUpperCase() !== checkCode.toUpperCase())
        {
            alert("验证码输入有误！");
            createCode(4);
        }
        else
        {
            alert("验证码输入正确!");
        }
    }
</script>
<body  background="背景图片.jpg">
<div id="box">
    <form name = "sm" onsubmit="return check()" action="showDetails.jsp">
        <form name = "udd" onsubmit="return check()" action="updateData.jsp">
        <fieldset>
            <legend>用户注册表</legend>
            <p>
                <label>用户名：</label>
                <label for="txtname"></label><input type="text" name = "userName" id="txtname" class="txt" onblur="Name()" onfocus="myFunction(this)"/>
                <span id="span_name">由2~-6个汉字组成</span>
            </p>
            <p>
                <label>密码：</label>
                <label for="txtpwd"></label><input type="password" name = "userPassword" id="txtpwd" class="txt" onblur="Password()" onfocus="myFunction(this)"/>
                <span id="span_pwd">请输入6~8个字符</span>
            </p>
            <p>
                <label>确认密码：</label>
                <label for="txtpwd2"></label><input type="password" id="txtpwd2" class="txt" onblur="Password2()" onfocus="myFunction(this)"/>
                <span id="span_pwd2">再次确认密码</span>
            </p>
            <tr>
                <td width="13%" align="right">出生日期：</td>
                <td colspan="3"><label>
                    <select name="select2" onfocus="myFunction(this)">
                        <option selected="selected">1990</option>
                        <option>1991</option>
                        <option>1992</option>
                        <option>1993</option>
                        <option>1994</option>
                        <option>1995</option>
                        <option>1996</option>
                        <option>1997</option>
                        <option>1998</option>
                        <option>1999</option>
                        <option>2000</option>
                        <option>2001</option>
                        <option>2002</option>
                    </select>
                    年
                </label>
                    <label>
                        <select name="select3" onfocus="myFunction(this)">
                            <option selected="selected">1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        月
                    </label>
                    <label>
                        <select name="select4" onfocus="myFunction(this)">
                            <option selected="selected">1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                            <option>25</option>
                            <option>26</option>
                            <option>27</option>
                            <option>28</option>
                            <option>29</option>
                            <option>30</option>
                            <option>31</option>
                        </select>
                        日
                    </label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td width="13%" align="right">性别：</td>
                <td colspan="3"><label>
                    <input type="radio" name="sex" checked="checked" />
                </label>男
                    <label>
                        <input type="radio" name="sex" />
                    </label>女</td>
                <td>&nbsp;</td>
            </tr>

            <p>
                <label>血型：</label>
                <label for="txtxue"></label><input type="text" name = "bloodType" id="txtxue" class="txt" onblur="bloodType()" onfocus="myFunction(this)"/>
                <span id="span_xue">填A、B、AB或O型血</span>
            </p>

            <p>
                <label>地址：</label>
                <label for="txtarea"></label><input type="text" name = "address" id="txtarea" class="txt" onblur="Area()" onfocus="myFunction(this)"/>
                <span id="span_area">不少于8个汉字</span>
            </p>
            <p>
                <label>邮箱：</label>
                <label for="txtemail"></label><input type="text" name = "email" id="txtemail" class="txt" onblur="Email()" onfocus="myFunction(this)"/>
                <span id="span_email">如abcdfeg@163.com</span>
            </p>
            <p>
                <label>验证码：</label>
                <tr>
                    <td> <div id="checkCode" class="code"  onclick="createCode(4)" ></div></td>
                    <td> <span onclick="createCode(4)">看不清换一张</span></td>
                </tr>
                <tr>
                    <td><label for="inputCode"></label><input type="text" id="inputCode" style="float:left;" onfocus="myFunction(this)"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" onclick="validateCode()"  value="确定" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            <pre>

                <hr/>
            </pre>
            <div id="box1">
                <p id="sub">
                    <input type="button" value="提交" onclick='document.sm.submit()' />
                    <input type="button" value="取消" onclick='window.open("main.jsp")'/>
                </p>
            </div>
        </fieldset>
        </form>
    </form>
    </div>
</body>
</html>
