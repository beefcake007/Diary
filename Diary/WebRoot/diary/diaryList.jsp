<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <div class="data_list">
     <div class="data_list_title">
         <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                    日记列表
     </div>
     
     <div class="diary_datas">
     	<ul>
     		<c:forEach var="diary" items="${diaryList }" >
     			<li>『<fmt:formatDate value="${diary.releaseDate }" type="date" pattern="yyyy-MM-dd"/>』<span>&nbsp;<a href="diary?action=show&diaryId=${diary.diaryId }">${diary.title}</a></span></li>
     		</c:forEach>
     	</ul>
     </div>
     
     <nav aria-label="pagepagination">
     	<ul class="pagination">
     		${pageCode }
     	</ul>
     </nav>
     
</div>
