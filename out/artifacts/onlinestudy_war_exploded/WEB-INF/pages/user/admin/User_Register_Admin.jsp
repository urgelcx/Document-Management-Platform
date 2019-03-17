<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/7
  Time: 上午 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/register.css">
    <link rel="stylesheet" type="text/css" href="/1/static/css/login.css">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="position: absolute;left: 975px;top: 30px;">
    <button type="button" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-user"></span>&nbsp欢迎:${AdminUser}
    </button>
    <a href="logout">
        <button type="button" class="btn btn-info btn-sm" >
            <span class="glyphicon glyphicon-log-out" ></span>&nbsp退出
        </button>
    </a>
</div>
<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">REGISTER</h3>
            <div class="col-md-9">
                <form method="post" action="Admin_register">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Password" id="password" name="password" />
                    </div>
                    <div class="form-group">
                        <i class="fa fa-phone fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="TelNum" id="telnum" name="telnum" />
                    </div>
                    <div class="form-group">
                        <i class="fa fa-briefcase fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="TeamName" id="teamname" name="teamname"/>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">立即注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
