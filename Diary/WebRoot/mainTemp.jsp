<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>日志</title>
<link href="style/diary.css" rel="stylesheet">
    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap3/css/bootstrap-theme.css" rel="stylesheet">
    <script src="bootstrap3/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap3/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }
    </style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="navbar-brand" href="#">帆爷的日记本</a>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="main?all=true"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;主页</a>
                    </li>
                    <li>
                        <a href="diary?action=preSave"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;写日记</a>
                    </li>
                    <li>
                        <a href="diaryType?action=list"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>&nbsp;日记分类管理</a>
                    </li>
                    <li>
                        <a href="user?action=preSave"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;个人中心</a>
                    </li>
                </ul>
                <form name="myForm" class="navbar-form pull-right" method="post" action="main?all=true">
                    <input class="span2" id="s_title" name="s_title"  type="text" style="margin-top:5px;height:30px;" placeholder="你想知道啥...">
                    <button type="submit" class="btn" onkeydown="if(event.keyCode==13) myForm.submit()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;搜索日志</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
    
        <div class="col-xs-12 col-md-8">
           <jsp:include page="${mainPage }"></jsp:include>
        </div>
        
        <div class="col-xs-6 col-md-4">
        
            <div class="data_list">
                <div class="data_list_title">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    个人中心
                </div>
                <div class="user_image">
                	<img src="${currentUser.imageName }"/>
                </div>
                <div class="nickName">${currentUser.nickName }</div>
                <div class="userSign">(${currentUser.mood })</div>
            </div>
            
            <div class="data_list">
                <div class="data_list_title">
                    <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                    按日志类别
                </div>
                <div class="datas">
                	<ul>
                		<c:forEach var="diaryTypeCount" items="${diaryTypeCountList }">
                		<li><span><a href="main?s_typeId=${diaryTypeCount.diaryTypeId}">${diaryTypeCount.typeName }(${diaryTypeCount.diaryCount })</a></span></li>
                		</c:forEach>
                	</ul>
                </div>
            </div>
            
            <div class="data_list">
                <div class="data_list_title">
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                    按日志日期
                </div>
                <div class="datas">
                	<ul>
                		<c:forEach var="diaryCount" items="${diaryCountList }">
                		<li><span><a href="main?s_releaseDateStr=${diaryCount.releaseDateStr }">${diaryCount.releaseDateStr }(${diaryCount.diaryCount })</a></span></li>
                		</c:forEach>
                	</ul>
                </div>
            </div>
            
        </div>
    </div>
</div>
</body>
</html>