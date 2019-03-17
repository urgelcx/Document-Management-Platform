<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/13
  Time: 下午 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>upload</title>
    <link rel="stylesheet" type="text/css" href="/1/static/css/upload.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
    <a href="/1/AllFile">
        <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-user"></span>&nbsp欢迎:${loginUser}
        </button>
    </a>
    <a href="/1/logout">
        <button type="button" class="btn btn-info btn-sm" >
            <span class="glyphicon glyphicon-log-out" ></span>&nbsp退出
        </button>
    </a>
</div>

<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">FILE UPDATA</h3>
            <div class="col-md-9">
                <form   enctype="multipart/form-data" action="<%=path%>/${id}/modifyFile_data" method="post" >
                    <div class="form-group">
                        <div>
                            <label>发表团队:</label>
                        </div>
                        <select name="teamname"  class="selectpicker show-tick form-control">
                            <optgroup label="本小组">
                                <option value="${loginTeam}">${loginTeam}</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <div>
                            <label>文件名:</label>
                        </div>
                        <i class="fa fa-file fa-lg"></i>
                        <input class="form-control required" type="text" name="filename" autocomplete="off" value="${filename}">
                    </div>
                    <div class="form-group">
                        <div>
                            <label>发表人:</label>
                        </div>
                        <select name="uploaduser" class="selectpicker show-tick form-control">
                            <optgroup label="本人">
                                <option value="${loginUser}">${loginUser}</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <div>
                            <label>内容简介：</label>
                        </div>
                        <textarea class="form-control" rows="3" name=summary>${summary}</textarea>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right">立即修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
