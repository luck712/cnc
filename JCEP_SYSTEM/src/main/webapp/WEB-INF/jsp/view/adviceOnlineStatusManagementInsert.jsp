<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<link rel='stylesheet' type='text/css' href='css/reset.css' />
<link rel='stylesheet' type='text/css' href='css/common.css' />
<link rel='stylesheet' type='text/css' href='css/sub.css' />
 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../ckeditor/ckeditor.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">	
	$(document).ready(function () {
		$("#click2").click(function(){
			$("#insert1").css('display','none');	
			$("#insert2").css('display','block');	
			$("#ul_click1").css('display','none');	
			$("#ul_click2").css('display','block');	
		})

		$("#click1").click(function(){
			$("#insert2").css('display','none');	
			$("#insert1").css('display','block');	
			$("#ul_click2").css('display','none');	
			$("#ul_click1").css('display','block');	
		})
        $("#regDt").datepicker({
        	
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
        });
        $("#adviceHopeDt").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "../img/btn_datepicker.png" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트          
        }); 	

        $("#createBtn").click(function(){
   //     	if(checkValue()){
				var formData = new FormData(document.insertFrm);
				   $.ajax({
						type : 'post',
						url:'/db/oneStop/adviceOnlineStatusMagagementInsertOk.do',
						enctype: 'multipart/form-data',
						data: formData,
						dataType: 'json',
						contentType : false,
				        processData : false,  
						success : function(data) {
	                		alert("저장이 완료 되었습니다.");
	                		location.reload();
							return false;							
							
						},  
					    error:function(request,status,error){ //ajax 오류인경우  
				            alert("작업중 에러가 발생했습니다.");      
				            window.event.preventDefault();
				   		} 
				 }); 	        	
//        	}
        })
	
	});
	
	
	//기업찾기 조회
	function goEntprSearch(flag){
		var searchText = "";
		if(flag === "Y"){
			searchText = $("#entprNm").val();			
		}else if(flag ==="N"){
			searchText = $("#searchText").val();			
		}
			 $.ajax({
				type : 'post',
				url:'/db/oneStop/adviceOnlineStatusEntprList.do',
				data: {"searchText"  : searchText},
				dataType: 'html',
				success : function(data) {
					
					$("#entprResultBody").empty().append(data);
					$("#entprModal").modal('show');
					
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            window.event.preventDefault();
		   		} 
		 });  	 		
		
	}	
	
    // 기업찾기 조회- page
	function goEntprSearchPage(pageNo){

    	$("#entprPageIndex").val(pageNo);
    	
		 $.ajax({
				type : 'post',
				url:'/db/oneStop/adviceOnlineStatusEntprList.do',
				data: $("#enptrListForm").serialize(),
				dataType: 'html',
				success : function(data) {
					$("#entprResultBody").empty().append(data);
					$("#entprModal").modal('show');
					
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            window.event.preventDefault();
		            
		   		} 
		 });  			
		
	}			
    
    function enterKey(type){
    	if(window.event.keyCode == 13){
			if(type === 'E'){
    			goEntprSearch('N');
    		}
    		window.event.preventDefault();
		}		
    }
    
	//사업 선택
	function selectEntprNm(memberId,entprNm,entprCeo,largeBussAreaCd,mediumBussAreaCd,entprHeadAddr,entprHeadDetailAddr,entprHeadTel,entprResultEmpCnt){
		
		$("#memberId").val(memberId);
		$("#entprNm").val(entprNm);
		$("#entprCeo").val(entprCeo);
		$("#largeBussAreaCd").val(largeBussAreaCd);
		largeBussAreaCdSelectBox(mediumBussAreaCd);
		$("#entprHeadAddr").val(entprHeadAddr);
		$("#entprHeadDetailAddr").val(entprHeadDetailAddr);
		$("#entprResultEmpCnt").val(entprResultEmpCnt);

		var entprHeadTel = entprHeadTel;
		var entprHeadTel1 = entprHeadTel.substring(0,3);
		var entprHeadTel2 = entprHeadTel.substring(3,7);
		var entprHeadTel3 = entprHeadTel.substring(7);				
		$('#entprHeadTel1').val(entprHeadTel1);
		$('#entprHeadTel2').val(entprHeadTel2);
		$('#entprHeadTel3').val(entprHeadTel3);

		$("#entprModal").modal('hide');
		
	}
	
	function largeBussAreaCdSelectBox(dataOption){
		var selectBoxData = $("#largeBussAreaCd").val();
	    var selectOption = dataOption;
 		$.ajax({
 			type : 'post',
 			url:'/db/selectOnchange.do',
 			data: {
 						"selectBoxData" : selectBoxData
 					},
 			dataType: 'json',
 	 		success: function(data) {
 	 			var htmls = "";
 	 			if(data.length < 1){
 	 			} else {
 	                     $(data.data).each(function(){
 	 	                    htmls +='<option value="' + this.commonCd + '">' + this.commonNm + '</>'; 
 	                 	});	//each end
 	 			};
 	 			//console.log(data.data);
 	 			$("#mediumBussAreaCd").html(htmls);
	 	 			if(selectOption.length > 0){
	 	 				$('#mediumBussAreaCd').val(dataOption).attr('selected', 'selected');
	 	 			}
 	            },  
 			error:function(request,status,error){ //ajax 오류인경우  
 				alert("작업중 에러가 발생했습니다.");      
 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			} 
 		});
	}
	
	function checkValue(){
		var retValue = true;
		
		if($('#regDt').val() == ""){
			alert("신청일을 입력하세요.");
			$('#regDt').focus();
			return;
		}
		
		if($('#compApplNm').val() == ""){
			alert("업체명을 입력하세요.");
			$('#compApplNm').focus();
			return;
		}
		
		if($('#compPosit').val() == ""){
			alert("직위 입력하세요.");
			$('#compPosit').focus();
			return;
		}
		
		if($('#compHpNo2').val() == ""){
			alert("핸드폰번호를  입력하세요.");
			$('#compHpNo2').focus();
			return;
		}
		
		if($('#compHpNo3').val() == ""){
			alert("핸드폰번호를 입력하세요.");
			$('#compHpNo3').focus();
			return;
		}
		
		if($('#compMail1').val() == ""){
			alert("메일을 입력하세요.");
			$('#compMail1').focus();
			return;
		}
		
		if($('#adviceHopeDt').val() == ""){
			alert("희망일자를 선택해 주세요.");
			$('#adviceHopeDt').focus();
			return;
		}
		
		if($('#adviceApplicCont').val() == ""){
			alert("내용을 입력하세요.");
			$('#adviceApplicCont').focus();
			return;
		}
		
		return retValue;
	}
</script>


<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">
		<!-- RIBBON -->
		<div id="ribbon">		
			<ol class="breadcrumb">
				<li>Home</li><li>원스톱지원실 이용 관리</li><li><b>온라인 현황 관리</b></li>
			</ol>			
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">				
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>온라인상담 신청내용</b></h1>
				</div>
			</div>
			
			<div class="layout01">						
				<section id="widget-grid" class="">
					<form id="insertFrm" name="insertFrm" method="POST" enctype="multipart/form-data">	
						<div class="well well-sm">
							<div class="table-responsive">
								<ul class="tab01_4 clearfix" id="ul_click1" style="display: block;">
									<li class="on"><a  style="cursor: pointer;">지원 신청내용</a></li>
									<li class=""><a id="click2" style="cursor: pointer;">원스톱 업무일지</a></li>						
								</ul>
								<ul class="tab01_4 clearfix" id="ul_click2" style="display: none;">
									<li class=""><a id="click1" style="cursor: pointer;">지원 신청내용</a></li>
									<li class="on"><a  style="cursor: pointer;">원스톱 업무일지</a></li>					
								</ul>

							<!-- 레이아웃 1 -->
							<div id="insert1" style="dispaly:block;">
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%"> 
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">구분 *</th>
												<td>
												<select id="onoffDiviCd" name="onoffDiviCd">
													<c:forEach var="onoffDiviCd" items="${onoffDiviCd}" varStatus="status" >
													 	<option value="${onoffDiviCd.commonCd}">${onoffDiviCd.commonNm}</option>
													 </c:forEach>
												</select>
												</td>
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">신청일 *</th>
												<td><input type="text" id="regDt"name="regDt" readOnly></td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">전문가 *</th>
												<td>
												<select id="proMemberId" name="proMemberId">
													<c:forEach var="proMemberId" items="${proMemberId}" varStatus="status" >
													 	<option value="${proMemberId.memberId}">${proMemberId.memberNm}</option>
													 </c:forEach>
												</select>
												</td>
											</tr>
										</tbody>
									</table>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%"> 
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">업체명 *</th>
												<td>
													<input type="hidden" id="memberId" name="memberId" value="">
													<input type="text" id="entprNm"name="entprNm" maxlength="28" style="width: 40%">
													<button type="button" class="btn btn-default btn-sm" onclick="goEntprSearch('Y')">검색</button>
												</td>

												<th style="text-align:center;background:#eee;vertical-align:middle;">대표자 명 *</th>
												<td><input type="text" name="entprCeo" id="entprCeo" readOnly></td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">사업분야 *</th>
												<td colspan="3">
													<select id="largeBussAreaCd" name="largeBussAreaCd" onchange="largeBussAreaCdSelectBox('')">
														<c:forEach var="largeBussAreaCd" items="${largeBussAreaCd}" varStatus="status" >
														 	<option value="${largeBussAreaCd.commonCd}">${largeBussAreaCd.commonNm}</option>
														 </c:forEach>
													</select>
													<select id="mediumBussAreaCd" name="mediumBussAreaCd">
													</select>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">주소</th>
												<td colspan="3">
													<input type="text" id="entprHeadAddr" name="entprHeadAddr" class="input-sm" style="width:80%" readOnly>
													<input type="text" id="entprHeadDetailAddr" name="entprHeadDetailAddr" class="input-sm" style="width:80%" readOnly>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">대표전화</th>
												<td>
												<select id="entprHeadTel" name="entprHeadTel">
													<option value="02"	>02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="044">044</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
												</select>
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="entprHeadTel2" name="entprHeadTel2" size="4" style="width: 50px; text-align: center"maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" readOnly/>
												<span style="margin-left:5px;margin-right:5px;">-</span>
												<input type="text" id="entprHeadTel3" name="entprHeadTel3" size="4"style="width: 50px; text-align: center"maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" readOnly/>
												</td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">종업원수</th>
												<td>
													<input type="text" id="entprResultEmpCnt" name="entprResultEmpCnt" class="input-sm" maxlength="3" onkeyup="inputTelNumber(this);" style="width:50px" readOnly>명
												</td>
											</tr>
										</tbody>
									</table>
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 신청인 정보</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%"> 
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">신청인 성명 *</th>
												<td><input type="text" id="compApplNm" name="compApplNm" maxlength="30"></td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">직위 *</th>
												<td><input type="text" id="compPosit" name="compPosit" maxlength="15"></td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">전화번호</th>
												<td>
													<select id="compHpNo1" name="compHpNo1">
														<option value="02"	>02</option>
														<option value="031">031</option>
														<option value="032">032</option>
														<option value="033">033</option>
														<option value="041">041</option>
														<option value="042">042</option>
														<option value="043">043</option>
														<option value="044">044</option>
														<option value="051">051</option>
														<option value="052">052</option>
														<option value="053">053</option>
														<option value="054">054</option>
														<option value="055">055</option>
														<option value="061">061</option>
														<option value="062">062</option>
														<option value="063">063</option>
														<option value="064">064</option>
													</select>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compHpNo2" name="compHpNo2" size="4" style="width: 50px; text-align: center"maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compHpNo3" name="compHpNo3" size="4"style="width: 50px; text-align: center" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
												</td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">팩스번호</th>
												<td>
													<select id="compFaxNo1" name="compFaxNo1">
														<option value="02"	>02</option>
														<option value="031">031</option>
														<option value="032">032</option>
														<option value="033">033</option>
														<option value="041">041</option>
														<option value="042">042</option>
														<option value="043">043</option>
														<option value="044">044</option>
														<option value="051">051</option>
														<option value="052">052</option>
														<option value="053">053</option>
														<option value="054">054</option>
														<option value="055">055</option>
														<option value="061">061</option>
														<option value="062">062</option>
														<option value="063">063</option>
														<option value="064">064</option>
													</select>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compFaxNo2" name="compFaxNo2" size="4" style="width: 50px; text-align: center"maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compFaxNo3" name="compFaxNo3" size="4"style="width: 50px; text-align: center" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">핸드폰 *</th>
												<td>
													<select id="compHpNo1" name="compHpNo1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="019">019</option>
													</select>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compHpNo2" name="compHpNo2" size="4" style="width: 50px; text-align: center"maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
													<span style="margin-left:5px;margin-right:5px;">-</span>
													<input type="text" id="compHpNo3" name="compHpNo3" size="4"style="width: 50px; text-align: center" maxlength="4"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
												</td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">이메일 *</th>
												<td>
													<input type="text" id="compMail1" name="compMail1" class="input-sm" MaxLength="30"style="width:20%; height: 23px">
													<select id="compMail2" name="compMail2">
														<option value="naver.com" 	>naver.com</option>
														<option value="google.com" >google.com</option>
														<option value="yahoo.com"  >yahoo.com</option>
														<option value="daum.com"	>daum.com</option>
														<option value="hanmail.net" >hanmail.net</option>
														<option value="nate.com"    >nate.com</option>
													</select>												
											</tr>
										</tbody>
									</table>

									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 자문 신청내용</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="75%">
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:left;background:#eee;vertical-align:middle;" rowspan="5">신청 내용 *</th>
												<th style="text-align:left;background:#eee;vertical-align:middle;">희망일자 *</th>
												<td colspan="3"><input type="text" id="adviceHopeDt" name="adviceHopeDt" style="width: 100px; text-align: center" readOnly></td>
											</tr>
											<tr>
												<th style="text-align:left;background:#eee;vertical-align:middle;">희망장소 *</th>
												<td colspan="3">
													<select id=advicePlaceCd name="advicePlaceCd">
														<c:forEach var="advicePlaceCd" items="${advicePlaceCd}" varStatus="status" >
														 	<option value="${advicePlaceCd.commonCd}">${advicePlaceCd.commonNm}</option>
														 </c:forEach>
													</select>
											</tr>
											<tr>
												<th style="text-align:left;background:#eee;vertical-align:middle;">자문신청분야 *</th>
												<td colspan="3">
													<select id=adviceAreaCd name="adviceAreaCd">
														<c:forEach var="adviceAreaCd" items="${adviceAreaCd}" varStatus="status" >
														 	<option value="${adviceAreaCd.commonCd}">${adviceAreaCd.commonNm}</option>
														 </c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th style="text-align:left;background:#eee;vertical-align:middle;">자문신청내용 *</th>
												<td colspan="3"><textarea rows="5" cols=165 id="adviceApplicCont" name="adviceApplicCont"></textarea><c:out value="${detail.adviceApplicCont}"/></td>
											</tr>
											<tr>
												<th style="text-align:left;background:#eee;vertical-align:middle;">사업자등록증</th>
												<td colspan="3"><input type="file" name="orgFileNm" id="orgFileNm" /></td>
											</tr>
										</tbody>
									</table>	
								</div>						
<!-- Layout 2 -->
								<div id ="insert2" style="display: none;">
<%-- 									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%"> 
										</colgroup>
										<tbody>
											<tr>
												<th style="text-align:center;background:#eee;vertical-align:middle;">신청일</th>
												<td><c:out value="${detail.applicatDt}"/></td>
												<th style="text-align:center;background:#eee;vertical-align:middle;">전문가</th>
												<td><c:out value="${detail.proMemberId}"/></td>
											</tr>
										</tbody>
									</table>		 --%>					
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 자문 계획서</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
										</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">자문 계획서</th>
											<td>
												<input type="file" name="fileName1" id="fileName1" size=100>
											</td>
										</tr>
									</tbody>
									</table>
									
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 업무보고서(회의록,주간보고서,월간보고서 등)</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
										</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">업무보고서<br>(주간보고,회의록,<br>업무보고 등)</th>
											<td>
												<input type="file" name="fileName2" id="fileName2" size=100>
											</td>
										</tr>
									</tbody>
									</table>
										
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 완료보고서</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
										</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">완료 보고서</th>
											<td>
												<input type="file" name="fileName3" id="fileName3" size=100>
											</td>
		
										</tr>
									</tbody>
									</table>
									
									<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
										&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 산출물</b></h5>
									</div>
									<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
										<colgroup>
											<col width="10%">
										</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">산출물</th>
											<td>
												<input type="file" name="fileName4" id="fileName4" size=100>
											</td>
		
										</tr>
									</tbody>
									</table>

								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/oneStop/adviceOnlineStatusManagementList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a  id="createBtn" class="btn btn-primary" ><b>지원완료</b></a>
								</div>

								</div>
									<!-- 목록 -->
								</div>				
							</div>
				</form>
			</section>
		</div>
		<!-- END MAIN CONTENT -->		
	</div>
	 
		<form role="form" id="memberDetailFrm" action="#" class="form-horizontal" method="post">

	    </form>

<%-- 	<!-- 검색조건 유지 -->
	 <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
	 <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
	 <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>  --%>
    </div>
    
   			<!-- Modal -->
		<div class="modal fade" id="entprModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
						 <b>업체명 검색</b>
						</h4>
					</div>
					<div id="entprResultBody">	</div>
					<footer>
						<div class="modal-footer modify" style="align-items: center;">
					        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
			            </div>
					</footer>
					<!-- 검색조건 유지 -->
				
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->	
    
</body>
</html>


