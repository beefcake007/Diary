<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<<script type="text/javascript">
	function diaryTypeDelete(diaryTypeId){
		if(confirm("您确定要删除这个日志类别吗?")){
			window.location="diaryType?action=delete&diaryTypeId="+diaryTypeId;
		}
	}
</script>

 <div class="data_list">
     <div class="data_list_title">
         <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                    日记类别列表<span class="diaryType_add"><button type="button" class="btn btn-success btn-sm" onclick="javascript:window.location='diaryType?action=preSave'">添加日志类别</button></span>
     </div>
     	<table class="table table-striped table-hover">
		 <tr>
		 	<th>编号</th>
		 	<th>类别名称</th>
		 	<th>操作</th>
		 </tr>
		 <c:forEach var="diaryType" items="${diaryTypeList }">
		 	<tr>
		 		<td>${diaryType.diaryTypeId }</td>
		 		<td>${diaryType.typeName }</td>
		 		<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='diaryType?action=preSave&diaryTypeId=${diaryType.diaryTypeId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="diaryTypeDelete(${diaryType.diaryTypeId})">删除</button></td>
		 	</tr>
		 </c:forEach>
		</table>
     <div>
     	
     </div>
     <div align="center"><font color="red">${error }</font></div>
</div>
