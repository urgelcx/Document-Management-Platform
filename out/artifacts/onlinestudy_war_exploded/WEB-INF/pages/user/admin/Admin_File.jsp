<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/17
  Time: 下午 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>Admin_File</title>
    <link href="/1/static/img/file.png" rel="icon">
    <link href="/1/static/css/style.css" rel="stylesheet">
    <link href="/1/static/css/style-responsive.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header class="header black-bg">
    <a href="" class="logo"><b>Urge_Ripe&nbsp;<span>资料管理后台</span></b></a>
    <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a class="logout" href="logout">Logout</a></li>
        </ul>
    </div>
</header>

<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- 头像 -->
        <ul class="sidebar-menu" id="nav-accordion">
            <p class="centered">
                <a href="">
                <c:if test="${AdminUser=='Urge'}">
                    <img src="/1/static/img/lcx1.jpg" class="img-circle" width="80">
                </c:if>
                <c:if test="${AdminUser!='Urge'}">
                    <img src="/1/static/img/htt1.jpg" class="img-circle" width="80">
                </c:if>
                </a>
            </p>
            <h5 class="centered">${AdminUser}</h5>
            <li class="mt">
                <a href="Admin_User">
                    <i class="fa fa-user"></i>
                    <span>用户管理</span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="Admin_index">
                    <i class="fa fa-folder"></i>
                    <span>文件管理</span>
                </a>
            </li>
        </ul>
    </div>
</aside>
<div class="upload" style=" position: absolute;left: 250px;top: 80px;">
    <a href="to_Admin_upload" class="btn btn-info btn-small">
        <span class="glyphicon glyphicon-folder-open"></span> 上传资料
    </a>
</div>
<table class="table table-hover" style="position: absolute;left: 250px;top: 125px;width:1100px; ">
    <caption></caption>
    <thead>
    <tr>
        <td style="font-weight:bold;font-size:20px;">小组名</td>
        <td style="font-weight:bold;font-size:20px;">资料名称</td>
        <td style="font-weight:bold;font-size:20px;">上传人</td>
        <td style="font-weight:bold;font-size:20px;">创建时间</td>
        <td style="font-weight:bold;font-size:20px;">主要内容</td>
        <td style="font-weight:bold;font-size:20px;">操作</td>
    </tr>
    </thead>
    <c:forEach items="${allData }" var="data">
    <tbody>
    <tr>
        <td style="font-weight:bold;">${data.teamname }</td>
        <td style="font-weight:bold;"><a href="${data.fileaddress}">${data.filename }</a></td>
        <td style="font-weight:bold;">${data.uploaduser }</td>
        <td style="font-weight:bold;">${data.datatime }</td>
        <td style="font-weight:bold;">${data.summary }</td>
        <td style="width: 120px;">
            <a href="${data.id }/File_Admin_Updata" rel="external nofollow" >
                <button type="button" class="btn btn-info btn-sm">修改</button>
            </a>
            <a href="${data.id}/File_Admin_delete"  rel="external nofollow" >
                <button type="button" class="btn btn-danger btn-sm">删除</button>
            </a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
