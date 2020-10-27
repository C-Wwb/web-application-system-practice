<%--
  Created by IntelliJ IDEA.
  User: Wwb
  Date: 2020/9/21
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style type="text/css">
    *{
      margin: 0;
      padding: 0;
    }
    div{
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -150px 0 0 -150px;
      width: 300px;
      height: 300px;
    }
    input{
      width: 298px;
      height: 30px;
      border: 1px solid black;
      margin-top: 30px;
    }
    button{
      width: 298px;
      height: 30px;
      border: 1px solid black;
      margin-top: 30px;
      box-sizing: content-box;
      border-radius: 10px;
    }
  </style>
  <script language="javascript">
    let t = null, dt;
    t = setTimeout(time,1000);
    function time()
    {
      clearTimeout(t);
      dt = new Date();
      const h = dt.getHours();
      const m = dt.getMinutes();
      const s = dt.getSeconds();
      document.getElementById("timeShow").innerHTML =  "此刻北京时间为："+h+"时"+m+"分"+s+"秒";
      t = setTimeout(time,1000);
    }
  </script>
</head>
<body  background="背景图片.jpg">
<div>
  <form name = "cp" onsubmit="return check()" action="compare.jsp">
    <label>
      <input type="text" name="username" required="required" placeholder="用户名"/>
    </label>
    <label>
      <input type="password" name="password" required="required" placeholder="密码"/>
    </label>
    <button type="submit" onclick="document.cp.submit()">登录</button>
    <button type="sign" onclick="window.location.href='registered.jsp'">注册</button>
  </form>
  <label id="timeShow"></label>
</div>
</body>
</html>

