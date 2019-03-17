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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数据列表</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="/1/static/img/favicon.png" rel="icon">
    <link href="/1/static/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="/1/static/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/1/static/css/File_data.css" />
    <link href="/1/static/css/style-responsive.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="/1/static/img/back.jpg" style="background-repeat: repeat;">
<header class="header black-bg">
    <a href="" class="logo"><b>Urge_Ripe&nbsp;<span>资料管理平台</span></b></a>
    <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a  class="logout" href="logout">Logout</a></li>
        </ul>
    </div>
    <div class="d1">
        <form enctype="multipart/form-data" method="post" action="getFile">
            <input type="text"  name="filename" placeholder="请输入你想查找的资料名称...">
            <button type="submit"></button>
        </form>
    </div>
    <div class="login">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-user"></span>&nbsp欢迎:${loginUser}
        </button>
        <a href="to_updata">
            <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-list-alt"></span>&nbsp修改个人信息
            </button>
        </a>
    </div>
</header>

<%--选择排序方式--%>
<div class="check">
    <a href="AllFile">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-sort-by-attributes"></span>默认排序
        </button>
    </a>
    <a href="AllFile1">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-sort-by-attributes"></span>按资料名称
        </button>
    </a>
    <a href="AllFile2">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-sort-by-attributes"></span>按小组名称
        </button>
    </a>
</div>

<div class="upload">
    <a href="to_upload" class="btn btn-info btn-small">
        <span class="glyphicon glyphicon-folder-open"></span> 上传资料
    </a>
</div>
<table class="table table-hover" style="position: absolute;left: 150px;top: 125px;width:1100px; ">
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
                <c:if test="${data.uploaduser == loginUser}">
                    <a href="${data.id }/File_updata" rel="external nofollow" >
                        <button type="button" class="btn btn-info btn-sm">修改</button>
                    </a>
                    <a href="${data.id}/File_delete"  rel="external nofollow" >
                        <button type="button" class="btn btn-danger btn-sm">删除</button>
                    </a>
                </c:if>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>