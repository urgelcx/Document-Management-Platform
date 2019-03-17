<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/12
  Time: 下午 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>upload</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="/1/static/css/File_upload.css" />
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--登录提示--%>
<div class="login">
    <a href="AllFile">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-user"></span>&nbsp欢迎:${loginUser}
        </button>
    </a>
    <a href="logout">
        <button type="button" class="btn btn-info btn-sm" >
            <span class="glyphicon glyphicon-log-out" ></span>&nbsp退出
        </button>
    </a>
</div>
<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">FILE UPLOAD</h3>
            <div class="col-md-9">
                <form   enctype="multipart/form-data" method="post" action="<%=path%>/form.do">
                    <div class="form-group">
                        <div class="name">
                            <label>发表人:</label>
                        </div>
                        <select name="uploaduser" class="selectpicker show-tick form-control">
                            <optgroup label="本人">
                                <option value="${loginUser}">${loginUser}</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label>发表团队:</label>
                        </div>
                        <select name="teamname"  class="selectpicker show-tick form-control">
                            <optgroup label="本小组">
                                <option value="${loginTeam}">${loginTeam}</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label>文件名:</label>
                        </div>
                        <i class="fa fa-file fa-lg"></i>
                        <input class="form-control required" type="text" name="filename" autocomplete="off" ><br>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label>内容简介：</label>
                        </div>
                        <textarea class="form-control" rows="3" name="summary"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="name">
                            <label >上传附件:</label>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <div class="file-container" style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
                                <button class="btn btn-primary fileinput-button" type="button">上传</button>
                                <input type="file" name="file" id="jobData" onchange="loadFile(this.files[0])" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
                            </div>
                            <span id="filename" style="vertical-align: middle"></span>
                        </div>
                        <script>
                            function loadFile(file){
                                $("#filename").html(file.name);
                            }
                        </script>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">立即上传</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
