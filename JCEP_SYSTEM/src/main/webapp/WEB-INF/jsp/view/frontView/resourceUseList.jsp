<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>
	<style>
		.hidden { display: none;  }
 	</style>
</head>
<body>
<div id="wrap" class="sub s2">
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="contents">
		<div id="location">
			<div class="layout01 clearfix">
				<span class="home">홈</span>
				<span>시설 및 자원 신청</span>
				<span class="now">자원 사용 신청</span>
			</div>
		</div>
		<div class="layout01">
			<h2 class="">자원 사용 신청 - 전남콘텐츠기업육성센터의 시설과 자원을 신청할 수 있습니다.</h2>
			<div class="cont">
				<h3>자원 사용 신청</h3>
				<div class="continner">
					<div class="tab">
						<ul class="tab01_2 clearfix">
							<li class="on"><a href="#none">자원정보</a></li>
							<li><a href="#none">자원예약</a></li>
						</ul>
					</div>
					<div class="s2list tabBtn">
						<div class="s2sch clearfix">
							<input type="text" />
							<button type="button" class="btnsch">검색</button>
						</div>
						<ul>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<li>
									<div class="img">
										<img src="<c:out value="${result.resourceImg}"/>" width="367" height="245"/>
									</div>
									<table class="table01">
										<colgroup>
											<col width="30%" /><col width="*" />
										</colgroup>
										<tr>
											<th>장비명</th>
											<td>
												<c:out value="${result.resourceNm}"/>  
											</td>
										</tr>
										<tr>
											<th>비용(1일기준)</th>
											<td>
												1일 8시간 이내 90,000 / 1일 4시간 이내 50,000
											</td>
										</tr>
										<tr>
											<th>구성</th>
											<td>
												빔 프로젝터,
											</td>
										</tr>
									</table>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="reserveCalendar">
						<!-- 예약정보 목록 레이어 팝업 -->
						<div class="reserveLayer" id="reserveinfolistPop">
							<div class="top">
								<strong class="title">2020.01.27 월</strong>
								<button type="button" class="btn_close">X</button>
							</div>
							<div class="con">
								<ul class="reserveList">
									<li><a href="javascript:void(0);">(재)전남정보문화산업진흥원/배움터-2</a></li>
									<li><a href="javascript:void(0);">콘텐츠사업단/공유마당</a></li>
									<li><a href="javascript:void(0);">지혜와비전/이야기마당-1</a></li>
									<li><a href="javascript:void(0);">(주)민트토이/이야기마당-1</a></li>
								</ul>
							</div>
						</div>
						<!-- // 예약정보 목록 레이어 팝업 -->						
					<div class="daylist tabBtn hidden">
						<div class="yearw">
							<button type="button" class="prev" onclick="changeReservMonth(-1,'R')">이전</button>
							<span class="current" id="reservMonth">2019.08</span>
							<button type="button" class="next" onclick="changeReservMonth(1,'R')">다음</button>
						</div>
						
					<div class="dcal">
							<table class="table01 week">
							<thead>
									<tr>
										<th>일요일</th>
										<th>월요일</th>
										<th>화요일</th>
										<th>수요일</th>
										<th>목요일</th>
										<th>금요일</th>
										<th>토요일</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>		


						<div class="morew">
							<button type="button" class="btnlist"  id="resourceBtn">예약하기<span></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

<div class="layer" style="display: none;" id="resourcePop">
	<div class="box boxw600" style="height: 860px; margin-top: -430px;">
		<div class="ti">시설 예약하기</div>
		<div class="">
			<div class="sti">신청인</div>
			<form id="insertFrm" name="insertFrm" action="#" method="POST">
			<input type="hidden" id="resourFaciDiviCd" name="resourFaciDiviCd" value="R"/>
			<table class="table01">
				<colgroup>
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td><input type="text" id="compNm" name="compNm" style="width: 100%;" maxlength="30"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input class="extraRoadAddr" id="compAddr1" name="compAddr1"  readonly="readonly" onclick="javascript:openDaumPostcode()" value="" type="text" style="width: 275px; margin-right: 4px;" />
						<button type="button" class="txtbtn" id="postBtn" onclick="javascript:openDaumPostcode()"  style="width: 100px;">우편번호검색</button>
						<input type="text" id="compAddr2" name="compAddr2" style="width: 275px;  margin-right: 4px;" />
					</td>
				</tr>
				<tr>
					<th>담당자성명</th>
					<td>
						<input type="text" id="compApplNm" name="compApplNm" value="" style="width: 150px;" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
							<select style="width: 25%;" id="compTelNo" name="compTelNo">
								<option value="">선택</option>
								<c:forEach var="hpNoList" items="${hpNoList}" varStatus="status">
									<option value="${hpNoList.commonCd}"><c:out value="${hpNoList.commonCd}"/></option>
								</c:forEach>
							</select>
							<em>-</em>
							<input type="text" style="width: 25%;" id="compTelNo2" name="compTelNo2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
							<em>-</em>
							<input type="text" style="width: 25%;" id="compTelNo3" name="compTelNo3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">	
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="compMail1" name="compMail1" value="" style="width: 120px;" maxlength="30"/>
						<em>@</em>
						<input type="text" id="compMail2" name="compMail2" value="" style="width: 120px;" />
						<select id="emailSelect" name="emailSelect" onchange="changeEmail()" style="width: 120px">
							<option value="">선택</option>
							<option value="M">직접 입력</option>
							<option value="N">naver.com</option>
							<option value="D">daum.net</option>
							<option value="H">hotmail.com</option>
							<option value="N">nate.com</option>
							<option value="E">empas.com</option>
							<option value="D">dreamwiz.com</option>
							<option value="G">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>인원수</th>
					<td>
						<input type="text" id="usePersNum" name="usePersNum" value="" onkeydown="javascript:return onlyNumber(event)" maxlength="3"  style="width: 100px;" />
					</td>
				</tr>
			</table>
			<div class="sti">사용자원</div>
			<table class="table01">
				<colgroup>
					<col width="20%" /><col width="*" />
				</colgroup>
				<tr>
					<th>자원명</th>
					<td>
						<select id="facilityNm" name="facilityNm" style="width: 100%;">
							<option value="">선택</option>
						</select>
					</td>
				</tr>
				<tr>
				<tr>
					<th>사용목적</th>
					<td>
						<input type="text" id="useObj" name="useObj" value="" style="width: 100%" />
					</td>
				</tr>
				<tr>
					<th>사용시간</th>
					<td>
						<div class="set">
							<input type="text" data-dateformat="yyyy-mm-dd" id="useFrDt" name="useFrDt" value="" style="width: 110px; margin-right: 4px;" />
							<select name="useFrTm" id="useFrTm" style="width: 100px;">
								<option value="0900">9시</option>
								<option value="1000">10시</option>
								<option value="1100">11시</option>
								<option value="1200">12시</option>
								<option value="1300">13시</option>
								<option value="1400">14시</option>
								<option value="1500">15시</option>
								<option value="1600">16시</option>
								<option value="1700">17시</option>
							</select>
						</div>
						<div class="set">
							<input type="text"  data-dateformat="yyyy-mm-dd" id="useToDt" name="useToDt" style="width: 110px; margin-right: 4px;" />
							<select name="useToTm" id="useToTm" style="width: 100px;">
								<option value="1000">10시</option>
								<option value="1100">11시</option>
								<option value="1200">12시</option>
								<option value="1300">13시</option>
								<option value="1400">14시</option>
								<option value="1500">15시</option>
								<option value="1600">16시</option>
								<option value="1700">17시</option>
								<option value="1800">18시</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			</form>
			<div class="submitbtn">
				<button type="button" class="ok" onclick="javascript:resourceApplSave();">신청하기</button>
				<button type="button" class="closeBtn">취소</button>	

			</div>
			<button type="button" class="btn_close closeBtn">X</button>
		</div>
	</div>
</div>

<!-- 예약 정보 레이어 팝업 -->
<div class="layer" id="reserveinfodetailPop" style="display:none;">
	<div class="box boxw600" style="height:418px; margin-top:-209px;">
		<div class="ti">예약정보</div>
		<table class="table01 mgt30">
			<colgroup>
				<col style="width:30%;">
				<col style="width:70%;">
			</colgroup>
			<tr>
				<th>행사주관</th>
				<td id="detailCompNm">전남정보문화산업진흥원</td>
			</tr>
			<tr>
				<th>장소</th>
				<td id="detailFacilityNm">지식나눔터</td>
			</tr>
			<tr>
				<th>일자</th>
				<td id="detailUseDate">2020-01-14 09시 ~ 18시</td>
			</tr>
			<tr>
				<th>일정내용</th>
				<td id="detailUseObj">유통활동가 사전직무교육</td>
			</tr>
		</table>
		<div class="submitbtn">
			<button type="button" class="ok">확인</button>	
		</div>
		<button type="button" class="btn_close">X</button>
	</div>
</div>
<!-- // 예약 정보 레이어 팝업 -->

	<script type="text/javaScript" >
		$(document).ready(function () {
			
			betweenPicker("useFrDt","useToDt","front");
			
			// calendar 호출
			setReservMonth(new Date(),'R'); // F: 시설 , R : 자원
			
			 $(".tab > ul li").click(function(){
				   var now_tab = $(this).index();
				   $(this).parent().find("li").removeClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").addClass("hidden");
				   $(this).parent().find("li").eq(now_tab).addClass("on");
				   $(this).parent().parent().parent().find(".tabBtn").eq(now_tab).removeClass("hidden"); 
			 });
			 
			 $("#resourceBtn").click(function(){
				 $.ajax({
						type : 'post',
						url:'/db/front/resourceUseList2.do',
						dataType: 'json',
						success : function(data) {
							var rData = data.resultList;
							var rDataLength = rData.length;
							for(var i=0;i < rDataLength;i++){
								document.insertFrm.facilityNm.options[i+1] = new Option(rData[i].resourceNm,rData[i].resourceId);
							}
							resetResrv();
							$("#resourcePop").show();
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		}				 
				 });	

			});
			 
			 $(".closeBtn").click(function(){
					$("#resourcePop").hide();
			 });	

				//예약정보 상세 레이어 팝업 호출
				$(document).on('click', '.reg a', function(){
					resourceUseDetailList($(this).attr("value"));				
				});			 
			 
				//예약정보 목록 레이어 팝업 호출
				$(document).on('click', '.num2 a', function(){
					var currentTd = $(this).parents('td');
					var tdIndex = currentTd.index();
					var trIndex = currentTd.parent().index();

					if (tdIndex >= 3) {
						var popupTop = currentTd.position().top;
						var popupRight = currentTd.outerWidth()  * (7 - tdIndex);
						$('#reserveinfolistPop').css({ top: popupTop, left: 'auto', right: popupRight });
					} else {
						var popupTop = currentTd.position().top;
						var popupLeft = currentTd.outerWidth() * (tdIndex + 1);
						$('#reserveinfolistPop').css({ top: popupTop, left: popupLeft, right: 'auto' });
					}
					
			  		var parent = $(this).closest('div');
			  		
					var weekend = new Array('일', '월', '화', '수', '목', '금', '토');
					var date = $('#reservMonth').text() + '.' + parent.find('.day').attr('value') + ' ' + weekend[parent.find('.day').attr('day')];
					var html="";
					$('#layer_popup_date').text(date);
					parent.find('.reserve_info').each(function() {
						var info = $(this).text().substring(2, $(this).text().length);
						var appliNo = $(this).find('a').attr('value');
						html += '<li class="reserve_info"><a href="javascript:resourceUseDetailList(\'' + appliNo +'\');">' + info + '</a></li>';
					});
					$('#layer_popup_info').empty().append(html);
					$('#reserveinfolistPop').show();							

					
				});	
				
				//예약정보 목록 레이어 팝업에서 상세 레이어 팝업 호출
				$(document).on('click', '#reserveinfolistPop a', function(){
					facilityUsedetailList($(this).attr("value"));
				});

				//예약정보 상세 레이어 팝업 닫기
				$(document).on('click', '#reserveinfolistPop .btn_close', function(){
					$("#reserveinfolistPop").hide();
				});

				//예약정보 목록 레이어 팝업 닫기
				$(document).on('click', '#reserveinfodetailPop .ok, #reserveinfodetailPop .btn_close', function(){
					$("#reserveinfodetailPop").hide();
				});						 
			 
		});	
		
		//예약신청 상세팝업호출 
		function resourceUseDetailList(appliNo){
			 $.ajax({
					type : 'post',
					url:'/db/front/resourceUseDetailList.do',
					dataType: 'json',
					data : {"appliNo" : appliNo},
					success : function(data) {
						$("#detailCompNm").empty().text(data.resultList[0].compNm);
						$("#detailFacilityNm").empty().text(data.resultList[0].facilityNm);
						$("#detailUseDate").empty().text(data.resultList[0].useFrDt+" "+data.resultList[0].useFrTm+"시 ~"+data.resultList[0].useToDt+" "+data.resultList[0].useToTm+"시" );
						$("#detailUseObj").empty().text(data.resultList[0].useObj);
						
						$('#reserveinfodetailPop').show();
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			   		} 
			 });				
			
		}		
		
		function resourceApplSave(){
			if(checkValue()){
				 $.ajax({
						type : 'post',
						url:'/db/front/resourFacilityApplInsert.do',
						data: $('#insertFrm').serialize(),
						dataType: 'json',
						success : function(data) {
		                		alert("등록이 완료 되었습니다.");
		                		location.reload();
								return false;
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   		} 
				 });				
				
			}
			
		}
		
		function checkValue(){
			var retValue = true;
			
			if($('#compNm').val() == ""){
				alert("업체(기관)명을 입력하세요.");
				$('#compNm').focus();
				return;
			}
			
			if($('#compAddr1').val() == ""){
				alert("주소를 입력하세요.");
				openDaumPostcode();
				return;
			}
			
			if($('#compAddr2').val() == ""){
				alert("상세주소를 입력하세요.");
				$('#compAddr2').focus();
				return;
			}
			
			if($('#compApplNm').val() == ""){
				alert("담당자성명을 입력하세요.");
				$('#compApplNm').focus();
				return;
			}			

			if($('#compTelNo').val() == ""){
				alert("연락처를 입력하세요.");
				$('#compTelNo').focus();
				return;
			}	
			
			if($('#compMail1').val() == ""){
				alert("이메일 아이디를 입력하세요.");
				$('#compMail1').focus();
				return;
			}			
			
			if($('#compMail2').val() == ""){
				alert("이메일 도메인을 입력하세요.");
				$('#compMail2').focus();
				return;
			}		
			
			if($('#usePersNum').val() == ""){
				alert("인원수를 입력하세요.");
				$('#usePersNum').focus();
				return;
			}	
			
			if($('#facilityNm').val() == ""){
				alert("자원명을 입력하세요.");
				$('#facilityNm').focus();
				return;
			}				
			if($('#useObj').val() == ""){
				alert("사용목적을 입력하세요.");
				$('#useObj').focus();
				return;
			}	
			
			if($('#useFrDt').val() == ""){
				alert("사용시작일을 입력하세요.");
				$('#useFrDt').focus();
				return;
			}	
			
			if($('#useFrTm').val() == ""){
				alert("사용시작시간을 입력하세요.");
				$('#useFrTm').focus();
				return;
			}			
			
			if($('#useToDt').val() == ""){
				alert("사용종료일을 입력하세요.");
				$('#useToDt').focus();
				return;
			}		
			
			if($('#useToTm').val() == ""){
				alert("사용종료시간을 입력하세요.");
				$('#useToTm').focus();
				return;
			}				
			
			return retValue;
		}
		

	  	function changeEmail() {
	  		var obj = $('#emailSelect').find('option:selected');
	  		
	  		if(obj.val() == '') {
	  			//nothing
	  		} else if(obj.val() == 'M') {
	  			$('#compMail2').val('');
	  		} else {
		  		$('#compMail2').val(obj.text());
	  		}
	  	}				
	
		
	  	function resetResrv(){
	  		$("#insertFrm input").val('');
	  		$("#resourFaciDiviCd").val('R');
	  		
	  	}	  	
    </script>
</body>
</html>