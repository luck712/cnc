<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<%@ page import= "java.util.Calendar"  %>
 <%
  Calendar cal = Calendar.getInstance(); 		 //Calendar객체 cal생성
  Calendar bfrCal = Calendar.getInstance();		 //이전달 생성
  Calendar nextCal = Calendar.getInstance();	 //다음달 생성
  
  int currentYear=cal.get(Calendar.YEAR);		 //현재 연도 기억
  int currentMonth=cal.get(Calendar.MONTH);	 //현재 달 기억
  int currentDate=cal.get(Calendar.DATE);		 // 현재 일 기억
  
  String Year=request.getParameter("year"); 		//나타내고자 하는 날짜, Year변수에 값을 전송 받음
  String Month=request.getParameter("month");
  String Date=request.getParameter("date");
  
  int year, month, date;
  if(Year == null && Month == null){   //처음 호출할 때
  year=currentYear;  //현재 연도
  month=currentMonth; //현재 월로 셋팅!!
  }
  else { //나타내고자 하는 날짜를 숫자(정수)로 변환
   year=Integer.parseInt(Year);
   month=Integer.parseInt(Month);
   if(month<0) { month=11; year=year-1; } //1월부터 12월까지만 범위 지정.(13월 14월... 이란 없으니깐)
   if(month>11) { month=0; year=year+1; }// 13월이면 1월로 돌아가고 년도는 1년 추가
  }
  %>
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
 

  <table border=0 style=font-size:30px> 
   <tr>
    <td align=left width=400 > <!-- 년 도-->
    <a href="calendar3.do?year=<%out.print(year-1);%>&month=<%out.print(month);%>" style=color:gray>◀</a>
    <% out.print(year); %>년
    <a href="calendar3.do?year=<%out.print(year+1);%>&month=<%out.print(month);%>" style=color:gray>▶</a>
    </td>
    <td align=center width=600> <!-- 월 -->
    <a href="calendar3.do?year=<%out.print(year);%>&month=<%out.print(month-1);%>" style=color:gray>◀</a> 
    <% out.print(month+1); %>월
    <a href="calendar3.do?year=<%out.print(year);%>&month=<%out.print(month+1);%>" style=color:gray>▶</a>
    </td>
    <!-- getMonth() : 월을 알아내는 메소드이다. 이 메소드의 반환값을 0부터 11까지이므로 정확한 현재 월을 알려면 getMonth()의 반환값에 1을 더해야한다 -->
    <td align=right width=400 ><a href="/db/site/calendar3.do" style=color:gray><b><% out.print(currentYear + "-" + (currentMonth+1) + "-" + currentDate); %></b></a></td> <!-- 현재날짜-->
   </tr>
  </table>

  <table border=1 cellspacing=0> <!-- 달력 부분 -->
   <tr style='font-size:20px; text-align:center;' height=50;>
    <td width=200>일</td> <!-- 일=1 -->
    <td width=200>월</td> <!-- 월=2 -->
    <td width=200>화</td> <!-- 화=3 -->
    <td width=200>수</td> <!-- 수=4 -->
    <td width=200>목</td> <!-- 목=5 -->
    <td width=200>금</td> <!-- 금=6 -->
    <td width=200>토</td> <!-- 토=7 -->
   </tr>
   <tr height=100 style=text-align:left>
   <%
    cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
    bfrCal.set(year, month, 1); 
	bfrCal.add(month, - 1);
	nextCal.set(year, month, 1); 
    nextCal.add(month, +1);
   int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
   int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
   int bfrEnd=bfrCal.getActualMaximum(Calendar.DAY_OF_MONTH); //전 달의 끝나는 날
   int nextStart=nextCal.get(Calendar.DAY_OF_WEEK); //다음 달의 시작하는 요일 
   System.out.println("startDay"+startDay);
   System.out.println("end"+end);
   System.out.println("bfrEnd"+bfrEnd);
   System.out.println("nextStart"+nextStart);
   
   int br=0; //7일마다 줄 바꾸기
   for(int i=0; i<(startDay-1); i++) { //전달 날짜 출력
    out.println("<td style=color:gray>"+ String.valueOf(bfrEnd-(startDay-i-2)) +"</td>");
    System.out.println("bfrEnd-(startDay-i-2)"+String.valueOf(bfrEnd-(startDay-i-2)));
    	br++;
    	
   }
  
   for(int i=1; i<=end; i++) { //현재 날짜 출력
    if((br%7)==0){  //달력에 있는 날과 내 컴퓨터의 로컬 날이 같으면, 배경색을 노랑색으로
    	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){
    		out.println("<td style='background-color:#FAF58C; color:red; font-weight:bold'>"+i+"</td>");
        	}else{
   			 	out.println("<td style='color:red; font-weight:bold'>" + i + "</td>");
        	}
    }else {
    	if(i==currentDate&&(currentMonth+1)==(month+1)&&currentYear==year){
    		out.println("<td style='background-color:#FAF58C; font-weight:bold'>"+i+"</td>");
    		}else{
    			out.println("<td style=font-weight:bold>" + i + "</td>");
    	}
    }
    br++;
    if((br%7)==0 && i!=end) {
     out.println("</tr><tr height=100>");
     
    }
   }
   
   int nextDate = 1;
   while((br++)%7!=0){ //다음달 날짜 출력
	    out.println("<td style=color:gray>"+ String.valueOf(nextDate++) +"</td>");
   }
   
   %>

   </tr>
  </table>

 </body>
</html>