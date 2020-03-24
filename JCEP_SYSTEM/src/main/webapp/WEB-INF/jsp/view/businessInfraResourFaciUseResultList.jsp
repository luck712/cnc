<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>

<script type="text/javaScript" >
	$(document).ready(function () {
		betweenPicker("searchFromDate","searchToDate");
	});
	
      /* pagination 페이지 링크 function  */
      function fn_egov_link_page(pageNo){
      	document.listForm.pageIndex.value = pageNo;
        document.listForm.action = "<c:url value='/business/businessInfraResourFaciUseResultList.do'/>";
        document.listForm.submit();
      }
      
      function enterKey(){
      	if(window.event.keyCode == 13){
      		goSearch();
  		}
      }
      
       function goSearch(){
  			$('#searchFrm').attr('action', "/db/business/businessInfraResourFaciUseResultList.do").submit();
       }    
       
       function moveDetailView(enterpriseIdx){        
	       	$('#enterpriseIdx').val(enterpriseIdx);
	       	$('#detailFrm').attr('action', "/db/business/businessInfraResourFaciUseResultReg.do").submit();
       }         
      
</script>


<body>
	<!-- MAIN PANEL -->
	<div id="main" role="main" class="content">

		<!-- RIBBON -->
		<div id="ribbon">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li><li>사업 관리</li><li><b>사업운영 실적관리</b></li><li><b>인프라지원</b></li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
		<div id="content">
			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                    <h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i><b>사업운영 실적관리_인프라지원</b></h1>
				</div>
			</div>
			<div class="table-responsive">
				<ul class="tab01_4 clearfix">
					<li class="on" style="width:50%"><a href="/db/business/businessInfraResourFaciUseResultList.do">장비,시설 활용실적</a></li>
					<li style="width:50%"><a href="/db/business/businessInfraEnterpriseList.do">기업입주현황</a></li>					
				</ul>
			</div>			
			<!-- widget grid -->
			<section id="widget-grid" class="">
					<div class="well well-sm">
						<div class="table-responsive">
							<form role="form" id="searchFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-bordered table-striped" style="margin-bottom:0px;width:98%;margin-left:1%;margin-top:10px;">
									<colgroup>
										<col width="10%">
										<col width="40%">
										<col width="10%">
										<col width="40%"> 
									</colgroup>
									<tbody>
										<tr>
											<th style="text-align:center;background:#eee;vertical-align:middle;">검색</th>
											<td>
												<select name="searchType" id="searchType" class="select" style="width:150px; height: 31.5px;">
													<option value="">전체</option>
													<option value="1" ${searchVO.searchType eq 1 ? 'selected="selected"' : '' }>제목</option>
													<option value="2" ${searchVO.searchType eq 2 ? 'selected="selected"' : '' }>장비명(시설명)</option>
												</select>											
												<input type="text" name=searchText id="searchText" class="input-sm not-kor" style="width:250px;" value="${searchVO.searchText}" onkeydown="javascript:enterKey();">
											</td>
											<th style="text-align:center;background:#eee;vertical-align:middle;">등록일</th>
											<td>
												<label class="input"> 
                                                    <input class="input-sm" type="text" name="searchFromDate" id="searchFromDate" readonly="readonly" placeholder=""  value="${searchVO.searchFromDate}" data-dateformat="yy-mm-dd"  />
													&nbsp;~&nbsp;
												</label>
												<label class="input"> 
                                                    <input class="input-sm" type="text" name="searchToDate" id="searchToDate" readonly="readonly" placeholder="" value="${searchVO.searchToDate}" data-dateformat="yy-mm-dd">
												</label>
												<a href="javascript:goSearch();" class="btn btn-primary" style="margin-left: 120px;"><b>검색</b></a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- data table -->
					<div class="well well-sm">
						<div class="table-responsive">
							<div class="col-xs-12">
								<h6 class="page-title txt-color-blueDark"><b>총 : <fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /> 건</b></h6>
							</div>
							<form role="form" id="authFrm" name="authFrm" action="#" class="form-horizontal" method="post">
								<table class="table table-hover">
									<colgroup>
										<col width="10%">
										<col width="25%">
										<col width="25%">
										<col width="15%">
									</colgroup>								
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>장비명(시설명)</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${paginationInfo.totalRecordCount eq 0 }">
											<tr style="text-align:center;">
												<td colspan="5">조회 결과가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${paginationInfo.totalRecordCount ne 0 }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<td style="vertical-align: middle;"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
													<td style="vertical-align: middle;">
														<a href="javascript:moveDetailView('${result.enterpriseIdx}');">
															<c:out value="${result.resourcePerformNm}"/>
													   </a>
													</td>
													<td style="vertical-align: middle;"><c:out value="${result.resourFaciNm}"/></td>
													<td style="vertical-align: middle;"><c:out value="${result.regDt}"/></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</form>
						</div>
						<div id="paging">
							<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
				        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				        		<form:hidden path="pageIndex" />
                                <form:hidden path="searchType" />
                                <form:hidden path="searchText" />
                                <form:hidden path="searchFromDate" />
                                <form:hidden path="searchToDate" />
				        	</form:form>	
			        	</div>
					</div>
			</section>
			<!-- end widget grid -->
			<div style="padding-bottom:5px;text-align:right;">
				<a href="/db/business/businessInfraResourFaciUseResultReg.do" class="btn btn-primary" id="insertBtn" ><b>등록</b></a>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
		
	</div>
	<!-- END MAIN PANEL -->
	<form role="form" id="detailFrm" action="#" class="form-horizontal" method="post">	 
	   <input type="hidden" name="enterpriseIdx" id="enterpriseIdx" value="">
    </form>			
	
</body>
</html>





