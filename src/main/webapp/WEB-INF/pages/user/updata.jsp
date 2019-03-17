<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/7
  Time: 下午 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改页面</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/File_data.css" />
    <link rel="stylesheet" type="text/css" href="/1/static/css/login.css">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--登录提示--%>
<div class="login">
    <button type="button" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-user"></span>&nbsp欢迎:${loginUser}
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
            <h3 class="form-title">USER UPDATA</h3>
            <div class="col-md-9">
                <form method="post" action="modifyUser" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="name">
                            <label>用户名:</label>
                        </div>
                        <select  class="selectpicker show-tick form-control" name="username">
                            <optgroup label="本人">
                                <option value="${loginUser}">${loginUser}</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label>联系方式:</label>
                        </div>
                        <i class="fa fa-phone fa-lg"></i>
                        <input class="form-control required" type="text"  value="${loginTelnum}" id="telnum" name="telnum" maxlength="11"/>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label>队伍:</label>
                        </div>
                        <i class="fa fa-briefcase fa-lg"></i>
                        <input class="form-control required" type="text" value="${loginTeam}" id="teamname" name="teamname" maxlength="8"/>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

