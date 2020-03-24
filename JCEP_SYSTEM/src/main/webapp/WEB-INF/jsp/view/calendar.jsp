<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<!DOCTYPE html>
<html>
<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사이트 관리</li><li><b>일정 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>일정 관리</b></h1>
				</div>
			</div>
		
	
<form method="post" action="calendar.do" name="change">
<br/><br/>
<table width="100%" border=0 style=font-size:30px> 
   <tr>
    <td align=left width=400 > <!-- 년 도-->
    <a href="calendar.do?year=${year-1}&month=${month}" style=color:gray>◀</a>
    ${year}년
    <a href="calendar.do?year=${year+1}&month=${month}" style=color:gray>▶</a>
    </td>
    <td align=center width=600> <!-- 월 -->
    <a href="calendar.do?year=${year}&month=${month-1}" style=color:gray>◀</a> 
    ${month+1}월
    <a href="calendar.do?year=${year}&month=${month+1}" style=color:gray>▶</a>
    </td>
    <!-- getMonth() : 월을 알아내는 메소드이다. 이 메소드의 반환값을 0부터 11까지이므로 정확한 현재 월을 알려면 getMonth()의 반환값에 1을 더해야한다 -->
    <td align=right width=400 ><a href="/db/site/calendar.do" style=color:gray><b>${currentYear}-${(currentMonth+1)}-${currentDate}</b></a></td> <!-- 현재날짜-->
   </tr>
  </table>

  <table width="100%" align=center border=1 cellspacing=0> <!-- 달력 부분 -->
   <tr style='font-size:20px; text-align:center;' height=50;>
    <td width=200 style=color:red>일</td> <!-- 일=1 -->
    <td width=200>월</td> <!-- 월=2 -->
    <td width=200>화</td> <!-- 화=3 -->
    <td width=200>수</td> <!-- 수=4 -->
    <td width=200>목</td> <!-- 목=5 -->
    <td width=200>금</td> <!-- 금=6 -->
    <td width=200>토</td> <!-- 토=7 -->
   </tr>
   <tr height=100 style=text-align:left>
	<c:set var="newLine" value="0"/>
	<!-- 전달 보여주는부분 -->
   		<c:forEach begin="1" end="${startDay-1}" var="newLine">
	      <td style=color:gray>${bfrEnd}</td>
<%-- 	      <c:set var="i" value="${newLine}"/> --%>
	      <c:set var="newLine">${newLine+1}</c:set> 
     	</c:forEach>
     	
     <!-- 이번달 보여주는곳 -->
     	<c:forEach begin="1" end="${end}" var="a">
     		<c:choose>
     			<c:when test="${((startDay-1+a)%7)==1}">
     				<td style='color:red; font-weight:bold'>${a}</td>
     			</c:when>
     			<c:otherwise>
					<td style=font-weight:bold>${a}</td>
     			</c:otherwise>
     		</c:choose>
     		<c:if test="${((startDay-1+a)%7)==0 && (startDay-1+a)!=end}">
     				</tr><tr height=100>
     		</c:if>
     	</c:forEach>	
     	
     	<!-- 다음달 보여주는 부분 -->
     	<c:set var="nextDate" value="0"/>
		<c:forEach begin="1" end="${end}" var="a">
		<c:choose>
			<c:when test="${((startDay-1+a)%7)!=0}">
     				<td style=color:gray>${a}</td>
<%--      				<c:set var="i" value="${nextDate}"/> --%>
	    			  <c:set var="nextDate">${nextDate+1}</c:set> 
     		</c:when>
     		</c:choose>
     	
  		</c:forEach>	
<!--    for(int i=1; i<=end; i++) { //현재 날짜 출력 -->
<!--     if((br%7)==0){  //달력에 있는 날과 내 컴퓨터의 로컬 날이 같으면, 배경색을 노랑색으로 -->
<!--     	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){ -->
<!--     		out.println("<td style='background-color:#FAF58C; color:red; font-weight:bold'>"+i+"</td>"); -->
<!--         	}else{ -->
<!--    			 	out.println("<td style='color:red; font-weight:bold'>" + i + "</td>"); -->
<!--         	} -->
<!--     }else { -->
<!--     	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){ -->
<!--     		out.println("<td style='background-color:#FAF58C; font-weight:bold'>"+i+"</td>"); -->
<!--     		}else{ -->
<!--     			out.println("<td style=font-weight:bold>" + i + "</td>"); -->
<!--     	} -->
<!--     } -->
<!--     br++; -->
<!--     if((br%7)==0 && i!=end) { -->
<!--      out.println("</tr><tr height=100>"); -->
<!--     }///7h -->
<!--    } -->
   
<!--    int nextDate = 1; -->
<!--    while((br++)%7!=0){ //다음달 날짜 출력 -->
<!-- 	    out.println("<td style=color:gray>"+ String.valueOf(nextDate++) +"</td>"); -->
<!--    } -->
   


   </tr>
  </table>
</form>
</div>
	</div>	
 </body>
</html>