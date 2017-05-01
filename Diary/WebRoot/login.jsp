<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.fanye.model.User" %>
<%
	if(request.getAttribute("user")==null){
		String userName=null;
		String password=null;
		
		Cookie[] cookies=request.getCookies();
		for(int i=0;cookies!=null && i<cookies.length;i++){
			if(cookies[i].getName().equals("user")){
				userName=cookies[i].getValue().split("-")[0];
				password=cookies[i].getValue().split("-")[1];
			}
		}
		if(userName==null){
			userName="";
		}
		if(password==null){
			password="";
		}
		
		pageContext.setAttribute("user", new User(userName,password));
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人笔记本登录</title>
    <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css ">
    <link rel="stylesheet" href="bootstrap3/css/bootstrap-theme.css">
    <script src="bootstrap3/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap3/js/bootstrap.min.js"></script>

    <style type="text/css">
        body{
            padding-top:200px;
            padding-bottom: 40px;
            background-image: url("images/star.gif");
           /* background-repeat: no-repeat;
  			background-size: 100% 100%;*/
        }

        .form-group-heading{
            text-align: center;
        }

        .form-group{
            max-width: 300px;
            padding:19px 20px 0px;
            margin: 0 auto 20px;
            background-color:#fff ;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .input-block-level{
            border-radius:5px;
        }
        .form-group .form-group-heading,
        .form-group .checkbox{
            margin-bottom: 10px;
        }

        .checkbox{
            margin-left: 10px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            font-size: 16px;;
            height:auto;
            margin-bottom: 15px;;
            padding:7px 9px;
        }
    </style>
    <script type="text/javascript">
    	function checkForm(){
    		var userName=document.getElementById("userName").value;
    		var password=document.getElementById("password").value;
    		if(userName==null || userName==""){
    			document.getElementById("error").innerHTML="用户名不能为空";
    			return false;
    		}
    		if(password==null || password==""){
    			document.getElementById("error").innerHTML="密码不能为空";
    			return false;
    		}
    		return true;
    	}
    </script>
  </head>
  
  <body>
    <div class="container">
    <form name="myForm" class="form-group" action="login" method="post" onsubmit="return checkForm()">
        <h2 class="form-group-heading">帆爷日记本</h2>
        <input id="userName" name="userName" value="${user.userName }" type="text" class="input-block-level" placeholder="报上名来...">
        <input id="password" name="password" value="${user.password }" type="password" class="input-block-level" placeholder="口号...">
        <label class="checkbox">
            <input id="remember" name="remember" type="checkbox" value="remember-me">记住我 &nbsp;&nbsp;&nbsp;&nbsp;<font id="error" color="red">${error}</font>
        </label>
        <button class="btn btn-large btn-primary" type="submit">登录</button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-large btn-primary" type="button">重置</button>
        <p align="center" style="padding-top:15px">@版权所有帆爷</p>
    </form>
</div>
  </body>
</html>
