<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function diaryDelete(diaryId){
		if(confirm("��ȷ��Ҫɾ�������־��")){
			window.location="diary?action=delete&diaryId="+diaryId;
		}
	}
</script>
<div class="data_list">
		<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/images/diary_show_icon.png"/>
		�ռ���Ϣ</div>
		<div>
			<div class="diary_title"><h3>${diary.title}</h3></div>
			<div class="diary_info">
				����ʱ��:��<fmt:formatDate value="${diary.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;��־���:${diary.typeName} ��
			</div>
			<div class="diary_content">
				${diary.content }
			</div>
			<div class="diary_action">
					<button class="btn btn-primary" type="button" onclick="javascript:window.location='diary?action=preSave&diaryId=${diary.diaryId}'">�޸���־</button>
					<button class="btn btn-primary" type="button" onclick="javascript:history.back()">����</button>
					<button class="btn btn-danger" type="button" onclick="diaryDelete(${diary.diaryId})">ɾ����־</button>
				</div>
		</div>
</div>