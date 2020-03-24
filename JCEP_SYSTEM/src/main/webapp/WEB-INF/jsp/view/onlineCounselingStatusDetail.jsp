 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<body>
		<form role="form" id="searchDetail" action="/frontView/companyListSearch.do" class="form-horizontal" method="post">
		   <input type="hidden" name="onestopSupportNo" id="onestopSupportNo" value="${result.onestopSupportNo}">
			<input type="hidden" name="memberId" id="memberId" value="${result.memberId}">
		
		<div class="ti">온라인 상담내역</div>
			<div class="sti">신청내용</div>
			<table class="table01">
				<colgroup>
					<col width="13%" />
					<col width="12%" />
					<col width="30%" />
					<col width="15%" />
					<col width="30%" />
				</colgroup>
				<tr>
					<th>업체(기관)명</th>
					<td colspan="2">
						<c:out value="${result.entprNm}"/>
					</td>
					<th>대표자명</th>
					<td>
						<c:out value="${result.entprCeo}"/>
					</td>
				</tr>
				<tr>
					<th>사업분야</th>
					<td colspan="2">
						<c:out value="${result.largeBussAreaCd}"/> >  <c:out value="${result.mediumBussAreaCd}"/>
					</td>
					<th>직원수</th>
					<td>
						<c:out value="${result.entprResultEmpCnt}"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="4">
						<c:out value="${result.entprHeadAddr}"/> <c:out value="${result.entprHeadDetailAddr}"/>
					</td>
				</tr>
				
				<tr>
					<th rowspan="3">신청인</th>
					<th>성명</th>
					<td>
						<c:out value="${result.compApplNm}" />
					</td>
					<th>직위</th>
					<td>
						<c:out value="${result.compPosit}" />
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<c:out value="${result.compTelNo}" />
					</td>
					<th>팩스번호</th>
					<td>
						<c:out value="${result.compFaxNo}" />
					</td>
				</tr>	
					
				<tr>
					<th>핸드폰</th>
					<td>
						<c:out value="${result.compHpNo}" />
					</td>
					<th>이메일</th>
					<td>
						<c:out value="${result.compMail}" />
					</td>
				</tr>
				
			</table>
		
			
		<div class="sti">사용자원</div>	
		
			<table class="table01">
				<colgroup>
					<col width="30%" /><col width="*" />
				</colgroup>
				<tr>
					<th>희망일자</th>
					<td class="adviceHopeDt">
						<c:out value="${result.adviceHopeDt}" />
					</td>
				</tr>
 				<tr>
					<th>희망장소</th>
					<td class="advicePlaceCd">
						<c:out value="${result.advicePlaceCd}" />
					</td>
				</tr>
 				<tr>
					<th>자문신청분야</th>
					<td class="adviceAreaCd">
						<c:out value="${result.adviceAreaCd}" />
					</td>
				</tr>
 				<tr>
					<th>자문내용</th>
					<td class="adviceApplicCont">
						<c:out value="${result.adviceApplicCont}" />
					</td>
				</tr>
			</table>


			<!--전문가 일경우 파일 수정  -->

			<div id="expertFile" style="display: none">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 자문 계획서</b></h5>
				</div>
				<table class="table01" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
					<colgroup>
						<col width="10%">
					</colgroup>
				<tbody>
					<tr>
						<th style="text-align:center;background:#eee;vertical-align:middle;">자문 계획서</th>
						<td>
							<input type="file"   <c:if test="${File1.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName1"        id="fileName1" size=100>
							<input type="hidden" class="" name="originFileName1" id="originFileName1" readonly value="Y">
							<c:if test="${File1.orgFileNm!=null}">
							<p  id="uploadFileName1">
								<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File1.attchFileNo}">${File1.orgFileNm}</a></span>
								<input type="hidden" class="" name="attchFileNo1" id="attchFileNo1" value="${File1.attchFileNo}">
								<span style="cursor: pointer;" onClick="chageFile('fn1');" >x</span>
							</p>
							</c:if>
						</td>
					</tr>
				</tbody>
				</table>
				
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 업무보고서(회의록,주간보고서,월간보고서 등)</b></h5>
				</div>
				<table class="table01" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
					<colgroup>
						<col width="10%">
					</colgroup>
				<tbody>
					<tr>
						<th style="text-align:center;background:#eee;vertical-align:middle;">업무보고서<br>(주간보고,회의록,<br>업무보고 등)</th>
						<td>
							<input type="file"   <c:if test="${File2.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName2"        id="fileName2" size=100>
							<input type="hidden" class="" name="originFileName2" id="originFileName2" readonly value="Y">
							<c:if test="${File2.orgFileNm!=null}">
							<p  id="uploadFileName2">
								<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File2.attchFileNo}">${File2.orgFileNm}</a></span>
								<input type="hidden" class="" name="attchFileNo2" id="attchFileNo2" value="${File2.attchFileNo}">
								<span style="cursor: pointer;" onClick="chageFile('fn2');" >x</span>
							</p>
							</c:if>
						</td>
					</tr>
				</tbody>
				</table>
					
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 완료보고서</b></h5>
				</div>
				<table class="table01" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
					<colgroup>
						<col width="10%">
					</colgroup>
				<tbody>
					<tr>
						<th style="text-align:center;background:#eee;vertical-align:middle;">완료 보고서</th>
						<td>
							<input type="file"   <c:if test="${File3.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName3"        id="fileName3" size=100>
							<input type="hidden" class="" name="originFileName3" id="originFileName3" readonly value="Y">
							<c:if test="${File3.orgFileNm!=null}">
							<p  id="uploadFileName3">
								<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File3.attchFileNo}">${File3.orgFileNm}</a></span>
								<input type="hidden" class="" name="attchFileNo3" id="attchFileNo3" value="${File3.attchFileNo}">
								<span style="cursor: pointer;" onClick="chageFile('fn3');" >x</span>
							</p>
							</c:if>
						</td>

					</tr>
				</tbody>
				</table>
				
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
					&nbsp;<h5 class="page-title txt-color-blueDark"><b>● 산출물</b></h5>
				</div>
				<table class="table01" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
					<colgroup>
						<col width="10%">
					</colgroup>
				<tbody>
					<tr>
						<th style="text-align:center;background:#eee;vertical-align:middle;">산출물</th>
						<td>
							<input type="file"   <c:if test="${File4.orgFileNm!=null}">  style="display:none;" </c:if> name="fileName4"        id="fileName4" size=100>
							<input type="hidden" class="" name="originFileName4" id="originFileName4" readonly value="Y">
							<c:if test="${File4.orgFileNm!=null}">
							<p  id="uploadFileName4">
								<span><a href="/db/adviceOnlineStatusBusinessfileDownload.do?fileNum=${File4.attchFileNo}">${File4.orgFileNm}</a></span>
								<input type="hidden" class="" name="attchFileNo4" id="attchFileNo4" value="${File4.attchFileNo}">
								<span style="cursor: pointer;" onClick="chageFile('fn4');" >x</span>
							</p>
							</c:if>
						</td>

					</tr>
				</tbody>
				</table>								


													<a href="#" id="saveBtn" class="btn btn-primary" ><b>저장</b></a>&nbsp;
			
			</div>

			
			<a href="#" id="closeBtnX">
				<button type="button" class="btn_close">X</button>
			</a>
		</form>
<script type="text/javascript">
$(document).ready(function () {

	var onestopSupportNo = $('#onestopSupportNo').val();
	/*저장하기*/
	$("#saveBtn").click(function(){
		var	formData = new FormData();
				//upload file 
				var j = 5;
				for(var i =1; i<j; i++){
					formData.append("fileName"+i, $("input[name=fileName"+i+"]")[0].files[0]);						
				 	formData.append("originFileName"+i, $("input[name=originFileName"+i+"]").val());
				 	formData.append("attchFileNo"+i, $("#attchFileNo"+i).val());

				 	if(!fileSizeChk('fileName'+i)){
				 		return false;
				 	}
				}
				formData.append("memberId",$('#memberId').val());
	         	formData.append("onestopSupportNo",onestopSupportNo);
         	$.ajax({
				type : 'post',
				url:'/db/oneStop/adviceOnlineStatusBusinessUpdate.do',
	            enctype: 'multipart/form-data',
	            data: formData,
	            contentType:false,      
	            processData:false,
	            dataType: 'json',
	            success : function(data) {
		            if(data.returnCode == 0){
	                    alert("저장을 실패 하였습니다.");
	                    return;
	                }else{
	                	alert("저장이 완료 되었습니다.");
						location.reload();
						return false;
	                }
				},  
			    error:function(request,status,error){ //ajax 오류인경우  
		            alert("작업중 에러가 발생했습니다.");      
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   		} 
		 });
	});
	
	
});//document


function chageFile(fn){
	
	var con_test = confirm("삭제하시겠습니까?");
	if(con_test == false){
		return false;;
	}
	
	if(fn =='fn1'){
		$("#fileName1").css('display','block');	
		$("#originFileName1").val('N');
		$("#uploadFileName1").css('display','none');	
	}
	if(fn =='fn2'){
		$("#fileName2").css('display','block');	
		$("#originFileName2").val('N');
		$("#uploadFileName2").css('display','none');	
	}
	if(fn =='fn3'){
		$("#fileName3").css('display','block');	
		$("#originFileName3").val('N');
		$("#uploadFileName3").css('display','none');	
	}
	if(fn =='fn4'){
		$("#fileName4").css('display','block');	
		$("#originFileName4").val('N');
		$("#uploadFileName4").css('display','none');	
	}
	
}

function fileSizeChk(inputFileId){
	if(document.getElementById(inputFileId).value){
		 var fileSize  = document.getElementById(inputFileId).files[0].size;
		 var maxSize = 5 * 1024 * 1024;//5MB
			 if(fileSize > maxSize){
				 
			 	alert(fileSize + "|"+ maxSize);
			       alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
			       document.getElementById(inputFileId).focus();
					//location.reload();
			       return false;
			 }else if(fileSize == 0){
			       alert("0MB사이즈의 첨부파일는 등록이 불가능합니다. ");
					//location.reload();
			       return false;
			 }
		 }
	return true;
	}
</script>
</body>
</html>