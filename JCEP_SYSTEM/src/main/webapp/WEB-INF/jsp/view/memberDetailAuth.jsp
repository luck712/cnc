<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function () {
		var mngId = $('#mngId').val();
		/* alert(memberId); */
		
		$("#idChkBtn").click(function(){
			if($('#mngId').val() == ''){
				alert('아이디를 입력하세요.');
				$('#mngId').focus();
				return;
			}else{
				$.ajax({
					type : 'post',
					url:'/db/member/mngIdChk.do',
					data: {mngId : $('#mngId').val()},
					dataType: 'json',
					success : function(data) {
						if(data.idCnt != 0){
							$("#chkYn").val("N");
							$("#able").hide();
							$("#enable").show();
						}else{
							$("#chkYn").val("Y");
							$("#able").show();
							$("#enable").hide();
						}
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
			}
			 
		});
		
		$("#saveBtn").click(function(){
			 $.ajax({
					type : 'post',
					url:'/db/member/managerDetailAuthUpdate.do',
					data: $('#updateFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("저장을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("저장이 완료 되었습니다.");
							//location.reload();
							location.href="/db/member/authList.do";
							return false;
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 });
		});
		
		function checkValue(){
			var retValue = true;
			
			if($('#mngId').val() == ""){
				alert("아이디를 입력하세요.");
				$('#mngId').focus();
				return;
			}
			
			if($('#chkYn').val() != "Y"){
				alert("아이디를 중복체크 하세요.");
				return;
			}
			
			if($('#mngPw').val() == ""){
				alert("비밀번호를 입력하세요.");
				$('#memberPw').focus();
				return;
			}
			
			if($('#memPwdChk').val() == ""){
				alert("비밀번호 확인을 입력하세요.");
				$('#memPwdChk').focus();
				return;
			}
			
			if($('#mngPw').val() != $('#memPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if($('#mngrNm').val() == ""){
				alert("이름을 입력하세요.");
				$('#mngNm').focus();
				return;
			}
			
			if($('#mngHp').val() == ""){
				alert("휴대폰번호를 입력하세요.");
				$('#mngHp').focus();
				return;
			}

			return retValue;
		}
		
		$("#createBtn").click(function(){
			if(checkValue()){
				$.ajax({
					type : 'post',
					url:'/db/member/memberDetailAuthInsert.do',
					data: $('#insertFrm').serialize(),
					dataType: 'json',
					success : function(data) {
						if(data.returnCode == 0){
		                    alert("등록을 실패 하였습니다.");
		                    return;
		                }else{
		                	alert("등록이 완료 되었습니다.");
							/* location.reload(); */
							location.href="/db/member/authList.do";
							return false;
		                }
					},  
				    error:function(request,status,error){ //ajax 오류인경우  
			            alert("작업중 에러가 발생했습니다.");      
			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   		} 
			 	});
			} 
		});
		
	});
	
	function openDaumPostcode(){
		
		new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('mngAddr').value = "(" + data.zonecode + ")" + " " + fullRoadAddr;
			  }
		}).open();
	}
   </script>


<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>회원 관리</li><li><b>관리자 관리</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<c:if test="${viewType eq 'create'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>관리자정보 등록</b></h1>
					</div>
				</div>
			</c:if>
			<c:if test="${viewType eq 'modify'}">
				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>관리자정보 수정</b></h1>
					</div>
				</div>
			</c:if>
			
			<!-- 관리자정보 수정 form S -->
			<c:if test="${viewType eq 'modify'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="updateFrm" name="updateFrm" action="#" method="POST">
							<input type="hidden" name="memberIdx" id="memberIdx" value="<c:out value="${detail.memberIdx}"/>"/>
							<input type="hidden" name="mngId" id="mngId" value="<c:out value="${detail.mngId}"/>"/>
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td>
												<c:out value="${detail.mngId}"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input">
													<input type="password" id="mngPw" name="mngPw" class="input-sm" value="<c:out value="${detail.mngPw}"/>" maxlength="20" style="width:300px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td>
												<c:out value="${detail.mngNm}"/>
											</td>
										</tr>
										<%-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속</th>
											<td>
												<label class="input">
													<input type="text" id="joinTypeCdNm" name="joinTypeCdNm" class="input-sm" value="<c:out value="${detail.joinTypeCdNm}"/>" maxlength="40" style="width:300px;">
												</label>
											</td>
										</tr> --%>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">주소</th>
											<td colspan="3">
												<label class="input">
													<input type="text" id="mngAddr" name="mngAddr" class="input-sm" value="<c:out value="${detail.mngAddr}"/>" maxlength="50" style="width:330%;">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일</th>
											<td>
												<label class="input">
													<input type="text" id="mngEmail" name="mngEmail" class="input-sm" value="<c:out value="${detail.mngEmail}"/>" maxlength="30" style="width:300px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전화번호</th>
											<td>
												<label class="input">
													<input type="text" id="mngTel" name="mngTel" class="input-sm" value="<c:out value="${detail.mngTel}"/>" maxlength="13" onkeyup="inputTelNumber(this);" style="width:300px;">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 *</th>
											<td>
												<label class="input">
													<input type="text" id="mngHp" name="mngHp" class="input-sm" value="<c:out value="${detail.mngHp}"/>" maxlength="13" onkeyup="inputPhoneNumber(this);" style="width:300px;">
												</label>
											</td>
										</tr>
										<%-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속 *</th>
											<td>
												<label class="input">
													<input type="text" id="mngFlag" name="mngFlag" class="input-sm" value="<c:out value="${detail.mngFlag}"/>" maxlength="13" style="width:300px;">
												</label>
											</td>
										</tr> --%>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">부서 *</th>
											<td>
												<label class="input">
													<%-- <input type="text" id="mngBelong" name="mngBelong" class="input-sm" value="<c:out value="${detail.mngBelong}"/>" maxlength="13" style="width:300px;"> --%>
													<select id="mngBelong" name="mngBelong" style="width: 300px; height: 30px;">	
														<option value="000001" ${detail.mngBelong eq '경영지원팀' ? 'selected="selected"' : '' }>경영지원팀</option>
														<option value="000002" ${detail.mngBelong eq '콘텐츠산업진흥단' ? 'selected="selected"' : '' }>콘텐츠산업진흥단</option>
														<option value="000003" ${detail.mngBelong eq 'ICT산업진흥단' ? 'selected="selected"' : '' }>ICT산업진흥단</option>
														<option value="000004" ${detail.mngBelong eq '4차산업혁명대응TF' ? 'selected="selected"' : '' }>4차산업혁명대응TF</option>
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입일</th>
											<td>
												<c:out value="${detail.regDt}"/>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td>
												<select id="authTpCd" name="authTpCd" style="width: 300px; height: 30px;">
													<option value="000001" ${detail.authTpCd eq '마스터' ? 'selected="selected"' : '' }>마스터</option>
													<option value="000002" ${detail.authTpCd eq '사업담당자' ? 'selected="selected"' : '' }>사업담당자</option>
													<option value="000003" ${detail.authTpCd eq '시설담당자' ? 'selected="selected"' : '' }>시설담당자</option>
													<option value="000004" ${detail.authTpCd eq '자문담당자' ? 'selected="selected"' : '' }>자문담당자</option>
												</select>
											</td>
										</tr>	
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/authList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 관리자정보 수정 form E -->
			
			<!-- 관리자정보 등록 form S -->
			<c:if test="${viewType eq 'create'}">
				<section id="widget-grid" class="">
					<div class="well well-sm">
						<form id="insertFrm" name="insertFrm" action="#" method="POST">
							<div class="table-responsive">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">아이디 * </th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="mngId" name="mngId" class="input-sm" value="" style="width:90%" maxlength="20" onkeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');">
													<a href="#" id="idChkBtn" class="btn btn-primary" ><b>중복확인</b></a>
												</label>
												<div id="able" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:blue;">
													사용가능한 아이디입니다.
												</div>
												<div id="enable" style="padding-top:5px;padding-bottom:5px;width:99%;display:none;color:red;">
													사용 불가능한 아이디입니다.
												</div>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="mngPw" name="mngPw" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">비밀번호 확인 * </th>
											<td>
												<label class="input" style="width:100%">
													<input type="password" id="memPwdChk" name="memPwdChk" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이름 * </th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="mngrNm" name="mngNm" class="input-sm" value="" maxlength="20" style="width:100%">
												</label>
											</td>
										</tr>
										<!-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="joinTypeCdNm" name="joinTypeCdNm" class="input-sm" value="" maxlength="40" style="width:100%">
												</label>
											</td>
										</tr> -->
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">주소</th>
											<td colspan="3">
												<label class="input" style="width:94%">
													<input type="text" id="mngAddr" name="mngAddr" class="input-sm" value="" maxlength="50" style="width:90%">
													<a href="#" class="btn btn-primary" onclick="javascript:openDaumPostcode()"><b>주소검색</b></a>
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">이메일</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="mngEmail" name="mngEmail" class="input-sm" value="" maxlength="30" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">전화번호</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="mngTel" name="mngTel" class="input-sm" value="" maxlength="12" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%">
												</label>
											</td>
										</tr>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">휴대폰번호 *</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="mngHp" name="mngHp" class="input-sm" value="" maxlength="12" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100%">
												</label>
											</td>
										</tr>
										<!-- <tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">소속 *</th>
											<td colspan="3">
												<label class="input" style="width:100%">
													<input type="text" id="mngFlag" name="mngFlag" class="input-sm" value="" maxlength="13" style="width:100%">
												</label>
											</td>
										</tr> -->
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">부서 *</th>
											<td colspan="3">
												<!-- <label class="input" style="width:100%">
													<input type="text" id="mngBelong" name="mngBelong" class="input-sm" value="" maxlength="13" style="width:100%">
												</label> -->
												<select id="mngBelong"name="mngBelong">
													<option value="000001">경영지원팀</option>
													<option value="000002">콘텐츠산업진흥단</option>
													<option value="000003">ICT산업진흥단</option>
													<option value="000004">4차산업혁명대응TF</option>
												</select>
											</td>
										</tr>
										
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">가입유형</th>
											<td>
												<select id="authTpCd" name="authTpCd">
													<option value="000001">마스터</option>
													<option value="000002">사업담당자</option>
													<option value="000003">시설담당자</option>
													<option value="000004">자문담장자</option>
												</select>
											</td>
										</tr>	
									</tbody>
								</table>
								<div style="padding-top:5px;padding-bottom:5px;text-align:right;width:99%">
									<a href="/db/member/authList.do" class="btn" ><b>취소</b></a>&nbsp;
									<a href="#" id="createBtn" class="btn btn-primary" ><b>등록</b></a>
								</div>
							</div>
						</form>
					</div>
				</section>
			</c:if>
			<!-- 관리자정보 등록 form E -->			
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	 
	<input type="hidden" name="chkYn" id="chkYn" value="">
	
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchType" value="<c:out value='${searchVO.searchType}'/>"/>
    <input type="hidden" name="searchText" value="<c:out value='${searchVO.searchText}'/>"/>
    <input type="hidden" name="memberSt" value="<c:out value='${searchVO.memberSt}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
    <input type="hidden" name="joinTypeCd" value="<c:out value='${searchVO.joinTypeCd}'/>"/>  
    
	<!-- END MAIN PANEL -->
	
</body>
</html>


