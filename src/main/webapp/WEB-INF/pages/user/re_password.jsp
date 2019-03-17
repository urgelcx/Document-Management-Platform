<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/14
  Time: 下午 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改页面</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/upload.css">
</head>
<body background="/1/static/img/img1.jpg">
<div class="frame">
    <h4 style="color: black;left: 270px;position: relative;">找回密码</h4>
<form enctype="multipart/form-data" method="post" action="modifyPassword">
    <%--发表团队--%>
    <div class="name">
        <label>用户名:</label>
    </div>
    <input type="text" name="username"  autocomplete="off"/><br>
    <div class="name">
        <label>联系方式:</label>
    </div>
    <input type="text" name="telnum"  autocomplete="off"/><br>
    <div class="name">
        <label>队伍：</label>
    </div>
    <input type="text" name="teamname"   autocomplete="off"/><br>
    <div class="name">
        <label>新密码：</label>
    </div>
    <input type="text" name="newpassword"   autocomplete="off"/><br>
    <button   type="submit">立即重置</button>
</form>
</form>
</div>
</body>
</html>
