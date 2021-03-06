<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script type="text/javaScript" >
		
        function enterKey(){
        	
        	if(window.event.keyCode == 13){
        		goSearch();
    		}
		}
	
		//검색버튼 클릭시
		function goSearch() {
			var datepicker1 = $('#datepicker1').val();
			var datepicker2 = $('#datepicker2').val();
			var totCnt = $('#totCnt').val();
			$('#searchFrm').attr('action', "/db/businessList.do").submit();
		}
		/*  달력함수*/
		$(function() {
	           $("#datepicker1").datepicker({
	                dateFormat: 'yy-mm-dd' //Input Display Format 변경
	                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	                ,changeYear: true //콤보박스에서 년 선택 가능
	                ,changeMonth: true //콤보박스에서 월 선택 가능                
	                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	            });                    
	            
	            //초기값을 오늘 날짜로 설정
	            $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	        });

		
		$(function(){
			//input을 datepicker로 선언
            $("#datepicker2").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
            
            $('#test').click(function(){
            	alert("testetetet");
            })
            
        });

		//캘릭더 클리
		$(function(){

			$("#preYear").click(function(){
				var preYear = parseInt($("#presentYear").text()) - 1 ;
				$("#presentYear").text(preYear);
			})
			
			$("#nextYear").click(function(){
				var nextYear = parseInt($("#presentYear").text()) + 1 ;
				$("#presentYear").text(nextYear);
			})
			
			$(".month").click(function(e){
				$(".monthw").find("a").removeAttr("class", "on");
				$(e.target).attr("class", "on");
			})
			
			
			//첫 렌더링시에 더보기 데이터가 없을 경우 더보기 버튼 hidden 처리
			var totalCnt =$('#totCnt').val();
			var liCnt = parseInt( $(".ing").length );
			if( totalCnt <= liCnt ){
				$('#moreBtn').css('display','none');
			}

			
		});
		
		//더보기 버튼 클릭시
		function moreContent(){
			$('input[name=listCnt]').remove();
			$('input[name=year]').remove();
			$('input[name=month]').remove();

			var totalCnt =$('#totCnt').val();
			var liCnt = parseInt( $(".ing").length );
			
			if( totalCnt <= liCnt ){
				return false;
			}
			
			var listCnt = $("<input>").attr("type", "hidden").attr("name", "listCnt").val( liCnt );
			var year = $("<input>").attr("type", "hidden").attr("name", "year").val( $("#presentYear").text() );
			var month = $("<input>").attr("type", "hidden").attr("name", "month").val( $('div.monthw').find('a.on').text() );
			
			$('#searchFrm').append(listCnt);
			$('#searchFrm').append(year);
			$('#searchFrm').append(month);
			var searchFormData = $('#searchFrm').serialize();
			
			$.ajax({
					type : "post"
					,url : "/db/businessMoreList.do"
					,data : searchFormData
					,dataType : "json"
					,success : function(result) {
	
						var result = result.resultList;
						
						for(var i = 0; i < result.length; i++) {
							
							var html = "";
							
							html += '<ul>';
							html += '<li class="ing">';
							html += '	<div class="mon">';
							html += '		<strong>' + result[i].bussFrDt.substring(5,7) + '</strong>';
							html += 		result[i].bussFrDt.substring(0,4);
							html += '	</div>';
							html += '	<div class="textw">';
							html += '		<p class="txt1"> ' + result[i].business_bus_area + '</p>';
							html += '		<p class="txt2">';
							html += '			<a href="javascript:moveDetailView(' + result[i].bussAnncemntNm +','+result[i].memberId +');">';
							html += 				result[i].bussAnncemntNm + ' ㅣ 전문분야 : ' + "result[i].business_bus_area" + ' ㅣ 관심분야: ' + "result[i].business_site";
							html += '			</a>';
							html += '		</p>';
							html += '		<p class="txt3">' + result[i].bussFrDt.substring(0,10) + ' ~ ' + result[i].bussToDt.substring(0,10) + '</p>';
							html += '	</div>';
							html += '	<div class="state state1">'+result[i].processCd+'</div>';
							html += '</li>';
							html += '</ul>';
							
							$("#dlist").append(html);
							
						}
						
						var reliCnt = parseInt( $(".ing").length );
						
						if( totalCnt <= reliCnt ){
							$('#moreBtn').css('display','none');
						}	
						
					}
					, error : function(request, status, error) {
						console.log("code = " + request.status + " message = "+ request.responseText + " error = " + error);
					}
				});

		}

		function goSearchDate(that) {
			var input_year = $("<input>").attr("type", "hidden").attr("name", "year").val($("#presentYear").text());
			var input_month = $("<input>").attr("type", "hidden").attr("name","month").val($(that).text());
			$('#searchDate').append(input_year);
			$('#searchDate').append(input_month);
			$('#searchDate').attr('action', "/db/businessList.do").submit();
		}

		//상세보기 클릭
		function moveDetailView(bussAnncemntNo, memberId) {
			$('#bussAnncemntNo').val(bussAnncemntNo);
			$('#memberId').val(memberId);
			$('#memberDetailFrm').attr('action', "/db/businessDetail.do?").submit();
		}
	</script>
    
<body>
<div id="wrap" class="sub s1">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>시장정보</span>
				<span class="now">사업공고</span>
			</div>
		</div>
		<div class="layout01">
			<div class="cont">
				<h3>사업공고</h3>
				
				<div class="continner">
				
				<form role="form" id="searchFrm" class="form-horizontal" method="post">
					<div class="publicsch clearfix">
						<div class="ti">사업공고 검색하기</div>
						<div class="cal" id="searchType1">
							<input type="text" id="datepicker1" name="datepicker1" value="" />
<!-- 							<button type="button">달력보기</button> -->
						</div>						
						<div class="cal" id="searchType2">
							<input type="text" id="datepicker2" name="datepicker2" value="" />
<!-- 							<button type="button">달력보기</button> -->
						</div>
						<div>
							<select name="searchType" id="searchType" style="width: 120px;">
								<option value="">전체</option>
								<option value="bussAnncemntNm" ${searchVO.bussAnncemntNm eq 1 ? 'selected="selected"' : '' }>제목</option>
								<option value="bussAnncemntNo" ${searchVO.bussAnncemntNo eq 2 ? 'selected="selected"' : '' }>공고번호</option>
							</select>
						</div>
						<div class="intxt">
							<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력해주세요." onKeyDown="enterKey()";style="width: 300px;" />
						</div>
						<button type="button" class="btnSch" name="searchText" id="searchBtn" value="${searchVO.searchText}" onclick="javascript:goSearch();"></button>
					</div>
					</form>
					
					<div class="daylist">
						<%-- 20191028 년도 관련 이벤트 확인 하지 못해서 우선 주석--%>
						<div class="yearw">
							<button type="button" id="preYear" class="prev"></button>
								<span id="presentYear"><c:out value="${sysYear}"/></span>
							<button type="button" id="nextYear" class="next"></button>
						</div>
						<form id="searchDate" action="/db/businessList.do" method="post">
							<div class="monthw">
								<c:forEach var="i" begin="1" end="12" >
									<c:choose>
										<c:when test="${sysMonth eq i }"> 
											<a href="javascript:void(0)" onclick="goSearchDate(this);" class="on month"><c:out value="${i}" /></a>
										</c:when>
										<c:when test="${sysMonth ne i }">
											<a href="javascript:void(0)" onclick="goSearchDate(this);" class="month"><c:out value="${i}" /></a>
										</c:when>
									</c:choose>
								</c:forEach>
							</div> 
						</form>
						<div class="dlist" id="dlist">
							<div class="col888">총 게시글 : <fmt:formatNumber value="${totCnt}"  pattern="#,###" /> 건</div>
							
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<ul>
								<li class="ing">
									<div class="mon">									
										<strong><c:out value="${result.bussFrDt.substring(5,7)}"/></strong>
										<c:out value="${result.bussFrDt.substring(0,4)}"/>
									</div>
									<div class="textw">
										<p class="txt1"><%-- <c:out value="${result.business_bus_area}"></c:out> --%></p>
										<p class="txt2" >
											<!-- <a href="/db/businessDetail.do"> -->
											<a href="javascript:moveDetailView('${result.bussAnncemntNo}', '${result.memberId}');">
												<c:out  value="${result.bussAnncemntNm}"/> ㅣ 전문분야 : <%-- <c:out value="${result.business_bus_area}"/> --%> ㅣ 관심분야: <%-- <c:out value="${result.business_site} --%>"/>
											</a>
										</p>
										<p class="txt3"><c:out value="${result.bussFrDt.substring(0,10)}"/> ~ <c:out value="${result.bussToDt.substring(0,10)}"/></p>
									</div>
									<div class="state state1"><c:out value="${result.processCd}"/></div>
								</li>								
							</ul>
							</c:forEach>
							
						</div>
						<div class="morew">
							<button type="button" id="moreBtn" class="btnmore" onclick="moreContent('${totCnt}');">더보기<span></span></button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</div>
	
	
	<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">
	   <input type="hidden" name="business_id" id="business_id" value="">
	   <input type="hidden" name="business_nm" id="business_nm" value="">
	   <input type="hidden" name="business_ceo" id="business_ceo" value="">
	   <input type="hidden" name="business_com_reg_num" id="business_com_reg_num" value="">
	   <input type="hidden" name="business_ceo_email" id="business_ceo_email" value="">
	   <input type="hidden" name="business_bus_area" id="business_bus_area" value="">
	   <input type="hidden" name="business_site" id="business_site" value="">
	   <input type="hidden" name="business_head_addr" id="business_head_addr" value="">
	   <input type="hidden" name="business_head_detail_addr" id="business_head_detail_addr" value="">
	   <input type="hidden" name="business_head_tel" id="business_head_tel" value="">
	   <input type="hidden" name="business_head_fax" id="business_head_fax" value="">
	   <input type="hidden" name="business_branch_addr" id="business_branch_addr" value="">
	   <input type="hidden" name="business_branch_detail_addr" id="business_branch_detail_addr" value="">
	   <input type="hidden" name="business_branch_tel" id=business_branch_tel value="">
	   <input type="hidden" name="business_branch_fax" id="business_branch_fax" value="">
	   <input type="hidden" name="business_est_dt" id="business_est_dt" value="">
	   <input type="hidden" name="business_capital" id="business_capital" value="">
	   <input type="hidden" name="business_reg_dt" id="business_reg_dt" value="">
	   <input type="hidden" name="business_reg_id" id="business_reg_id" value="">
	   <input type="hidden" name="business_hist_nm" id="business_hist_nm" value="">
	   <input type="hidden" name="business_hist_spec" id="business_hist_spec" value="">
	   <input type="hidden" name="business_hist_content" id="business_hist_content" value="">
	   <input type="hidden" name="datepicker" id="datepicker" value="">
	   <input type="hidden" name="datepicker1" id="datepicker1" value="">
	   <input type="hidden" name="totCnt" id="totCnt" value="${totCnt}">
	   <input type="hidden" name="memberId" id="memberId" value="">
	   <input type="hidden" name="bussAnncemntNo" id="bussAnncemntNo" value="">
    </form>
	
	
</body>
</html>