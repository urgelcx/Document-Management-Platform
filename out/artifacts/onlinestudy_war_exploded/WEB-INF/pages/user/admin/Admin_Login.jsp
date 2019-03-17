<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/7
  Time: 上午 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>管理员登录页面</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/loginadmin.css">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--<h3>${msg}</h3>--%>
<%--<div class="denglukuang">--%>
    <%--<h4 style="color: black;left: 170px;position: relative;">管理员登录</h4>--%>
    <%--<div class="shurukuang">--%>
    <%--<form action="Adminlogin" method="post">--%>
        <%--<p>用户名&nbsp<input type="text" name="username"></p>--%>
        <%--<p>密码&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" name="password"></p>--%>
        <%--<p><input type="submit" value="登录" class="denglu"></p>--%>
    <%--</form>--%>
<%--</div>--%>
<%--</div>--%>


<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">ADMIN LOGIN</h3>
            <div class="col-md-9">
                <form method="post" action="Adminlogin">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="password" name="password" />
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>