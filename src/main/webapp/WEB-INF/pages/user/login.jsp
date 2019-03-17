<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/4
  Time: 下午 7:22
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
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/login.css">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">LOGIN</h3>
            <div class="col-md-9">
                <form method="post" action="login">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </form>

                <div class="denglu3">
                    <a href="to_register">
                        <div class="form-group col-md-offset-9">
                            <button type="submit" class="btn btn-success pull-right" name="submit">立即注册</button>
                        </div>
                    </a>
                </div>
                <br>
                <a href="to_Admin_login">
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">管理员登录</button>
                    </div>
                </a>
                <br>
                <div class="password">
                    <a href="to_re_password">
                        <div class="form-group col-md-offset-9">
                            <button type="submit" class="btn btn-success pull-right" name="submit">忘记密码</button>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
