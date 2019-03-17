<%--
  Created by IntelliJ IDEA.
  User: LCX
  Date: 2018/12/13
  Time: 下午 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>upload</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="/1/static/css/upload.css">
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
    <a>&nbsp欢迎:${AdminUser}</a>
    <a href="logout"><button>退出</button></a>
</div>
<%--<div class="frame">--%>
    <%--<form enctype="multipart/form-data" method="post" action="${id}/modifyAdmin_File_data">--%>
        <%--&lt;%&ndash;发表团队&ndash;%&gt;--%>
        <%--<div >--%>
            <%--<label>发表团队:</label>--%>
        <%--</div>--%>
        <%--<select name="teamname">--%>
            <%--<optgroup label="本小组">--%>
                <%--<option value="${teamname}">${teamname}</option>--%>
            <%--</optgroup>--%>
        <%--</select>--%>
        <%--<div >--%>
            <%--<label>文件名:</label>--%>
        <%--</div>--%>
        <%--<input type="text" name="filename" autocomplete="off" value="${filename}" ><br>--%>
        <%--<div >--%>
            <%--<label>发表人:</label>--%>
        <%--</div>--%>
        <%--<select name="uploaduser">--%>
            <%--<optgroup label="本人">--%>
                <%--<option value="${uploaduser}">${uploaduser}</option>--%>
            <%--</optgroup>--%>
        <%--</select>--%>
        <%--<br>--%>
        <%--<div >--%>
            <%--<label>内容简介：</label>--%>
        <%--</div>--%>
        <%--<input type="text" name="summary"  autocomplete="off" value="${summary}"/><br>--%>
        <%--<button  type="submit">立即修改</button>--%>
    <%--</form>--%>
<%--</div>--%>

<div class="container">
    <div class="form row" style="position: relative;left:400px; top: 30px">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">USER UPDATA</h3>
            <div class="col-md-9">
                <form method="post" action="<%=path%>/${id}/modifyAdmin_File_data" enctype="multipart/form-data">
                    <div class="form-group">
                        <div>
                            <label>队伍:</label>
                        </div>
                        <i class="fa fa-briefcase fa-lg"></i>
                        <input class="form-control required" type="text" value="${teamname}" id="teamname" name="teamname"/>
                    </div>

                    <div class="form-group">
                        <div >
                            <label>文件名:</label>
                        </div>
                        <i class="fa fa-file fa-lg"></i>
                        <input class="form-control required" type="text" value="${filename}" id="filename" name="filename"/>
                    </div>

                    <div class="form-group">
                        <div >
                            <label>上传用户:</label>
                        </div>
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text"  value="${uploaduser}" id="uploaduser" name="uploaduser" maxlength="11"/>
                    </div>

                    <div class="form-group">
                        <div >
                            <label>内容简介:</label>
                        </div>
                        <textarea class="form-control" rows="3" name=summary>${summary}</textarea>
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
