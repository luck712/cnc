package jcep.admin.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.common.UploadFileUtils;
import jcep.admin.model.BusinessVO;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;
import jcep.front.web.JeonnamCommonsController;

/**
 * @Class Name : OnestopSupportController.java
 * @Description : OnestopSupport Controller  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.14           최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class OnestopSupportController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/*공통함수 컨트롤러*/
	@Autowired
	protected JeonnamCommonsController jonnamCommonsController;

	/*파일경로*/
  @Resource(name="noticeFilePath")
    String noticeFilePath;
	
	/**
	 * 자문컨설팅 현황 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "adviceConsultingStatusManagementList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/oneStop/adviceConsultingStatusManagementList.do")
	public ModelAndView adviceConsultingStatusManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		/*ArrayList<MemberVO> authList = memberService.selectAuthList(searchVO);
		model.addAttribute("resultList", authList);*/
		
		//int totCnt = memberService.selectAuthListTotCnt(searchVO);
		//paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		mv.setViewName("/view/adviceConsultingStatusManagementList");
		
		return mv;
	}
	
	/**
	 * 자문컨설팅 현황 등록화면을 조회한다.
	 * @param MemberVO - 등록할 정보가 담긴 VO
	 * @param searchVO -  조회조건 정보가 담긴 VO
	 * @param status
	 * @return "facilityRegistrationManagementReg"
	 * @exception Exception
	 */
	@RequestMapping("/oneStop/adviceConsultingStatusManagementReg.do")
	public ModelAndView adviceConsultingStatusManagementReg(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		mv.setViewName("/view/adviceConsultingStatusManagementReg");
		
		return mv;
	}
	
			
		/**
		 * 온라인 현황 목록을 조회한다. (pageing)
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "adviceConsultingStatusManagementList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusManagementList.do")
		public ModelAndView adviceOnlineStatusManagementList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());			
			
	        /* FROM - TO Default */
	        Date dt = new Date();
	        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

	        if("".equals(searchVO.getStartDate()) || null == searchVO.getStartDate()) {
	            searchVO.setStartDate(format1.format(dt));
	        }
	        if("".equals(searchVO.getEndDate()) || null == searchVO.getEndDate()) {
	            searchVO.setEndDate(format1.format(dt));
	        }        
			ArrayList<MemberVO> memberList = memberService.selectAdviceOnlineStatusManagementList(searchVO);
			model.addAttribute("resultList", memberList);
			
			int totCnt = memberService.selectAdviceOnlineStatusManagementListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);		
			model.addAttribute("paginationInfo", paginationInfo);
			mv.setViewName("/view/adviceOnlineStatusManagementList");
			
			return mv;
		}	
		
		
		/**
		 * 온라인상담 현황 관리을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "noticeList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusManagementDetail.do")
		public ModelAndView adviceOnlineStatusManagementDetail(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
			String memberId = request.getParameter("memberId");
			String onestopSupportNo = request.getParameter("onestopSupportNo");
			searchVO.setMemberId(memberId);
			searchVO.setOnestopSupportNo(onestopSupportNo);
			
			List<HashMap<String,String>> adviceAreaCd = memberService.SelectadviceAreaCd(onestopSupportNo);
			
			MemberVO detail = memberService.selectAdviceOnlineStatusManagementDetail(searchVO);
			
			int joinTypeCd = 00002;
			List<MemberVO> proMemberId = memberService.proMemberId(joinTypeCd);
			
			model.addAttribute("detail", detail);
			model.addAttribute("adviceAreaCd", adviceAreaCd);
			model.addAttribute("proMemberId", proMemberId);
			mv.setViewName("/view/adviceOnlineStatusManagementDetail");


			return mv;
		}
		
		/**
		 * 원스톱 업무일지을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 MemberVO
		 * @param model
		 * @return "noticeList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusBusiness.do")
		public ModelAndView adviceOnlineStatusBusiness(@ModelAttribute("searchVO") MemberVO searchVO, Model model, ModelAndView mv, HttpServletRequest request) throws Exception {
			String memberId = request.getParameter("memberId");
			String onestopSupportNo = request.getParameter("onestopSupportNo");
			searchVO.setMemberId(memberId);
			searchVO.setOnestopSupportNo(onestopSupportNo);
			
			model.addAttribute("memberId", memberId);
			model.addAttribute("onestopSupportNo", onestopSupportNo);
			
			MemberVO detail = memberService.selectAdviceOnlineStatusBusiness(searchVO);
			HashMap<String,String> hMap = new HashMap<String,String>();
			hMap.put("memberId", memberId);
			hMap.put("onestopSupportNo", onestopSupportNo);

			hMap.put("attchFileDiviCd", "000001");			
			MemberVO File1 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
			hMap.put("attchFileDiviCd", "000002");
			MemberVO File2 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
			hMap.put("attchFileDiviCd", "000003");
			MemberVO File3 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
			hMap.put("attchFileDiviCd", "000004");
			MemberVO File4 = memberService.selectAdviceOnlineStatusBusinessFile(hMap);
			model.addAttribute("File1", File1);
			model.addAttribute("File2", File2);
			model.addAttribute("File3", File3);
			model.addAttribute("File4", File4);
			model.addAttribute("detail", detail);
			
			
			
			mv.setViewName("/view/adviceOnlineStatusBusiness");
			
			return mv;
		}
		
		/*2020-01-13 최선권 파일 업로드 / 업데이트 / 인서트 수정*
		 * 원스톱 업무일지 수정한다.
		 * @param MultipartHttpServletRequest, HttpServletRequest, MemberVO
		 * @return "jsonView"
		 * @exception Exception
		 */
	    @RequestMapping("/oneStop/adviceOnlineStatusBusinessUpdate.do")
	    public String adviceOnlineStatusBusinessUpdate(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
	    	ModelAndView mav = new ModelAndView();
	    	String data = "N";
	    	String memberId = request.getParameter("memberId");	
	    	String onestopSupportNo = request.getParameter("onestopSupportNo");	
	    	mav.addObject("memberId",memberId);
	    	mav.addObject("onestopSupportNo" ,onestopSupportNo);
	    	
	    	for(int i =0; i<4; i++) {
	    		if(i==0) {//자문 계획서
	    	    	String originFileName = request.getParameter("originFileName1");
			    	String attchFileNo = request.getParameter("attchFileNo1");
		    		String attchFileDiviCd = "000001";//자문코드
		    		String fileNumber = "1";
			    	mav.addObject("fileNumber",fileNumber);
			    	mav.addObject("fileName",multipartRequest.getFile("fileName1"));
			    	mav.addObject("attchFileNo",attchFileNo);
			    	mav.addObject("attchFileDiviCd",attchFileDiviCd);	    			
			    	if(multipartRequest.getFile("fileName1") != null) { //파일이 있으면 
				    	adviceOnlineStatusBusinessFiles(mav);
			    	}else if(data.equals(originFileName)) {
			    		adviceOnlineStatusBusinessFileDelete(mav);
			    	}
	    		}else if(i==1) {//업무 보고서
	    	    	String originFileName = request.getParameter("originFileName2");
			    	String attchFileNo = request.getParameter("attchFileNo2");
		    		String attchFileDiviCd = "000002";//자문코드
		    		String fileNumber = "2";
			    	mav.addObject("fileNumber",fileNumber);
			    	mav.addObject("fileName",multipartRequest.getFile("fileName2"));
			    	mav.addObject("attchFileNo",attchFileNo);
			    	mav.addObject("attchFileDiviCd",attchFileDiviCd);	    			
			    	if(multipartRequest.getFile("fileName2") != null) { //파일이 있으면 
				    	adviceOnlineStatusBusinessFiles(mav);
			    	}else if(data.equals(originFileName)) {
			    		adviceOnlineStatusBusinessFileDelete(mav);
			    	}
	    		}else if(i==2) {//완료 보고서
	    	    	String originFileName = request.getParameter("originFileName3");
			    	String attchFileNo = request.getParameter("attchFileNo3");
		    		String attchFileDiviCd = "000003";//자문코드
		    		String fileNumber = "3";
			    	mav.addObject("fileNumber",fileNumber);
			    	mav.addObject("fileName",multipartRequest.getFile("fileName3"));
			    	mav.addObject("attchFileNo",attchFileNo);
			    	mav.addObject("attchFileDiviCd",attchFileDiviCd);	    			
			    	if(multipartRequest.getFile("fileName3") != null) { //파일이 있으면 
				    	adviceOnlineStatusBusinessFiles(mav);
			    	}else if(data.equals(originFileName)) {
			    		adviceOnlineStatusBusinessFileDelete(mav);
			    	}
	    		}else if(i==3) {//산출물
	    	    	String originFileName = request.getParameter("originFileName4");
			    	String attchFileNo = request.getParameter("attchFileNo4");
		    		String attchFileDiviCd = "000004";//자문코드
		    		String fileNumber = "4";
			    	mav.addObject("fileNumber",fileNumber);
			    	mav.addObject("fileName",multipartRequest.getFile("fileName4"));
			    	mav.addObject("attchFileNo",attchFileNo);
			    	mav.addObject("attchFileDiviCd",attchFileDiviCd);	    			
			    	if(multipartRequest.getFile("fileName4") != null) { //파일이 있으면 
				    	adviceOnlineStatusBusinessFiles(mav);
			    	}else if(data.equals(originFileName)) {
			    		adviceOnlineStatusBusinessFileDelete(mav);
			    	}
	    		}
	    	}
			return "jsonView";
	    }
	    
	    //파일이 있으면 업데이트 후 업로드 //없으면 업데이트르르 여기ㅐ로 뺌
	    public ModelAndView adviceOnlineStatusBusinessFiles(ModelAndView mav)throws Exception {

	    	Map<String, Object> map=mav.getModelMap();

	    	MultipartFile fileName=(MultipartFile) map.get("fileName");	

    		String memberId = (String) map.get("memberId");
	    	String onestopSupportNo = (String) map.get("onestopSupportNo");
	    	String attchFileNo = (String) map.get("attchFileNo");
	    	String attchFileDiviCd = (String) map.get("attchFileDiviCd");
	    	String fileNumber = (String) map.get("fileNumber");

	    	int returnCode = 0;
	    	int updateCode = 0;

	    	HashMap<String,Object> hMap = new HashMap<String,Object>();

	    	hMap.put("memberId",memberId); 
    		hMap.put("onestopSupportNo",onestopSupportNo); 
    		hMap.put("attchFileNo",attchFileNo); 
    		hMap.put("attchFileDiviCd",attchFileDiviCd); 
    		hMap.put("attchFileDiviCd",attchFileDiviCd);
    		hMap.put("attchFileNo",attchFileNo);
	        String  path= noticeFilePath;

	    	if(fileName != null) { //파일이 있으면 
		    	HashMap<String,String> fileData = UploadFileUtils.OnefileUpload(fileName,path);//파일이 있으면 파일 업로드
				hMap.put("fileCourse",fileData.get("fileCourse"));
				hMap.put("orgFileNm",fileData.get("orgFileNm"));
				int check = memberService.adviceOnlineStatusBusinessUpdateCheck(hMap);//여기까지만 실행됨.
	    		if(check > 0) {
	    			updateCode = memberService.adviceOnlineStatusBusinessUpdate(hMap); //데이터가 있으면 'use_flag  = N' 업데이트
	    		}
	    		if(!fileName.isEmpty()) {
				        attchFileNo = memberId + "_"+onestopSupportNo + "_"+fileNumber;
				        hMap.put("attchFileNo",attchFileNo);
			    		returnCode = memberService.adviceOnlineStatusBusinessInsert(hMap); // 그리고 새로 추가		              
		        }
	    	}
	    	return mav;
	    }
	    
	    public ModelAndView adviceOnlineStatusBusinessFileDelete(ModelAndView mav)throws Exception {
	    	int returnCode = 0;
	    	int updateCode = 0;
	    	
	    	HashMap<String, Object> hMap  = new HashMap<String,Object>();
	    	Map<String, Object> map=mav.getModelMap();

    		String memberId = (String) map.get("memberId");
	    	String onestopSupportNo = (String) map.get("onestopSupportNo");
	    	String attchFileNo = (String) map.get("attchFileNo");
	    	String attchFileDiviCd = (String) map.get("attchFileDiviCd");
	    	hMap.put("memberId",memberId); 
    		hMap.put("onestopSupportNo",onestopSupportNo); 
    		hMap.put("attchFileNo",attchFileNo); 
    		hMap.put("attchFileDiviCd",attchFileDiviCd); 
    		hMap.put("attchFileNo",attchFileNo);
	    	
	    	int check = memberService.adviceOnlineStatusBusinessUpdateCheck(hMap);
    		if(check > 0) {
    			updateCode = memberService.adviceOnlineStatusBusinessUpdate(hMap); //데이터가 있으면 'use_flag  = N' 업데이트
    		}
	    	return mav;
	    	
	    }
	    

		/**
		 * 온라인상담 신청내용 수정한다.
		 * @param memberidx - 수정할 회원 idx
		 * @param searchVO - 목록 조회조건 정보가 담긴 VO
		 * @param model
		 * @return "memberRegister"
		 * @exception Exception
		 */
	    @RequestMapping("/oneStop/adviceOnlineStatusManagementUpdate.do")
	    public String adviceOnlineStatusManagementUpdate(HttpServletRequest request, Model model, @ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
	    	
	    	HashMap<Object, Object> hMap = new HashMap <Object, Object>();
	    	hMap.put("memberId", request.getParameter("memberId"));
	    	hMap.put("proMemberId", request.getParameter("proMemberId"));
	    	hMap.put("onestopSupportNo", request.getParameter("onestopSupportNo"));

	    	Integer returnCode = memberService.adviceOnlineStatusManagementUpdate(hMap);	    
	    	
			return "jsonView";
	    }

	   /*온라인상담 현황 관리 이전글 다음글 수정*/
	  @RequestMapping(value = "/adviceOnlineStatusManagementDetailpaging.do")
	  public ModelAndView adviceOnlineStatusManagementDetailpaging(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request) throws Exception {
	     searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	     searchVO.setPageSize(propertiesService.getInt("pageSize"));
	     
	     PaginationInfo paginationInfo = new PaginationInfo();
	     paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	     paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	     paginationInfo.setPageSize(searchVO.getPageSize());
	     
	     searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	     searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	     searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	     String memberId = request.getParameter("memberId");  
	     String noticeTitle = request.getParameter("noticeTitle");
	     String noticeIdx = request.getParameter("noticeIdx");
	     int pageNum = Integer.parseInt(request.getParameter("pageNum"));         //넘어온 번호값 저장
	     searchVO.setMemberId(memberId);
	     searchVO.setNoticeTitle(noticeTitle);
	     searchVO.setNoticeIdx(noticeIdx);
	     searchVO.setPageNum(pageNum);
	     
	     
	     MemberVO detail = memberService.selectNoticeDetail(searchVO);         //해당페이지의 정보
//	     MemberVO detail1 = memberService.selectNoticeDetailPlus(searchVO);      //다음글에 대한 정보
//	     MemberVO detail2 = memberService.selectNoticeDetailMinus(searchVO);   //이전글에 대한 정보
	  
	     mv.addObject("paginationInfo", paginationInfo);
	     mv.addObject("viewType", "modify");
	     mv.addObject("detail", detail);
//	     mv.addObject("detail1", detail1);
//	     mv.addObject("detail2", detail2);
	     mv.addObject("pageNum", pageNum);

	     
	     mv.setViewName("/view/adviceOnlineStatusManagementDetailpaging");      
	     
	     return mv;
	  }
	  
	  @RequestMapping(value = "/adviceOnlineStatusBusinessfileDownload.do")
	  public ModelAndView  adviceOnlineStatusBusinessfileDownload(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		  	String attchFileNo = request.getParameter("fileNum");

		  	MemberVO memberVo = memberService.adviceOnlineStatusBusinessfileDownload(attchFileNo);
		  	//다운로드 할 파일 정보를 불러온다.
		  	mv.addObject("memberVo",memberVo);
		  	mv.addObject("response",response);
			try {
				UploadFileUtils.fileDownload(mv);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  	return null;
	  }
	  @RequestMapping(value = "/adviceOnlineStatusManagementDetailfileDownload.do")
	  public ModelAndView  adviceOnlineStatusManagementDetailfileDownload(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String onestopSupportNo = request.getParameter("fileNum");
		  
		  MemberVO memberVo = memberService.adviceOnlineStatusManagementDetailfileDownload(onestopSupportNo);
		  //다운로드 할 파일 정보를 불러온다.
		  mv.addObject("memberVo",memberVo);
		  mv.addObject("response",response);
		  try {
			  UploadFileUtils.fileDownload(mv);
		  } catch (Exception e) {
			  // TODO Auto-generated catch block
			  e.printStackTrace();
		  }
		  return null;
	  }
	
	  //등록
	  
	  @RequestMapping(value = "/oneStop/adviceOnlineStatusManagementInsert.do")
	  public ModelAndView  adviceOnlineStatusManagementInsert(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mav) throws Exception {
		  
			MemberVO commonsVo = new MemberVO();

			commonsVo.setGroupCd("G00047");//구분
			List<MemberVO> onoffDiviCd = memberService.selectCommonsList(commonsVo);
			commonsVo.setGroupCd("G00028");//자문사업분야
			List<MemberVO> suppBussAreaCd = memberService.selectCommonsList(commonsVo);
			commonsVo.setGroupCd("G00029");//희망장소
			List<MemberVO> advicePlaceCd = memberService.selectCommonsList(commonsVo);
			commonsVo.setGroupCd("G00030");//자문 신청분야
			List<MemberVO> adviceAreaCd = memberService.selectCommonsList(commonsVo);

			int joinTypeCd = 00002;
			List<MemberVO> proMemberId = memberService.proMemberId(joinTypeCd);
			for(int i=0; i<proMemberId.size(); i++) {
				System.out.println(proMemberId.get(i));
			}
	        /* FROM - TO Default */
	        Date dt = new Date();
	        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

	        String today = format1.format(dt);
			
			mav.addObject("onoffDiviCd",onoffDiviCd);
			mav.addObject("suppBussAreaCd",suppBussAreaCd);
			mav.addObject("advicePlaceCd",advicePlaceCd);
			mav.addObject("adviceAreaCd",adviceAreaCd);
			mav.addObject("proMemberId",proMemberId);
			mav.addObject("today",today);
			mav.setViewName("/view/adviceOnlineStatusManagementInsert");
			return mav;
		}
		
		/**
		 * 기업찾기 - 지원사업수혜실적 (pageing)
		 * @param searchVO - 조회할 정보가 담긴 EnterpriseBuyerExpertVO
		 * @param model
		 * @return "businessOrderStatusList"
		 * @exception Exception
		 */
		@RequestMapping(value = "/oneStop/adviceOnlineStatusEntprList.do")
		public ModelAndView benefitPerformEntprSearchList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
			
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			ArrayList<Map<String,Object>> EntprList = memberService.selectadviceOnlineStatusEntprList(searchVO);
			model.addAttribute("resultList", EntprList);
			
			int totCnt = memberService.selectadviceOnlineStatusEntprListCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);		

			mv.setViewName("/html/adviceOnlineStatusEntprSearchListPop");
			
	    	return mv;
		}		
	  
		//원스톱지원정보 ->관리자페이지 등록
		@RequestMapping(value = "/oneStop/adviceOnlineStatusMagagementInsertOk.do",  produces="text/plain;charset=utf-8")
		public String adviceOnlineStatusMagagementInsertOk(@RequestParam(required=false) Map<String, String> map, MultipartHttpServletRequest multipartRequest) throws Exception {
			String[] adviceAreaCdList = map.get("adviceAreaCdList").split(",");		
			  
			String filePath = noticeFilePath;//파일경로 가져오기
			String attchFileNo = null;
			map.put("compMail",map.get("compMail1")+"@"+map.get("compMail2"));
			
			if(!multipartRequest.getFile("orgFileNm").isEmpty()) { //파일이 있으면 
				MultipartFile orgFileNm = multipartRequest.getFile("orgFileNm");
				HashMap<String, String> fileMap = UploadFileUtils.OnefileUpload(orgFileNm,filePath);
				map.put("fileCourse",fileMap.get("fileCourse"));
				map.put("orgFileNm",fileMap.get("orgFileNm"));
			}
			//onsertop info inserto
			String onestopSupportNo = memberService.onestopSupportNoSelect(map);

			map.put("onestopSupportNo", onestopSupportNo);
			System.out.println(onestopSupportNo);
			int insert = memberService.adviceOnlineStatusMagagementInsertOk(map);
			
			if(insert > 0) {
				//분류코드 insert
				map.put("adviceAreaCdList", map.get("adviceAreaCdList"));
				map.put("memberId", map.get("memberId"));
				for(int i=0; i<adviceAreaCdList.length;i++) {
					map.put("adviceAreaCd",adviceAreaCdList[i]);
					int areaCdInsert = memberService.onestopArearCdInsert(map);					
				}

				//파일 insert
				if(!multipartRequest.getFile("fileName1").isEmpty()) { //파일이 있으면 
						MultipartFile orgFileNm = multipartRequest.getFile("fileName1");
						HashMap<String, String> fileMap = UploadFileUtils.OnefileUpload(orgFileNm,filePath);
		    			attchFileNo = map.get("memberId")+"_"+onestopSupportNo+"_"+1+"_"+1;
			    		map.put("attchFileNo",attchFileNo);
			    		map.put("fileCourse",fileMap.get("fileCourse"));
						map.put("orgFileNm",fileMap.get("orgFileNm"));
						map.put("attchFileDiviCd","000001");//코드
						int bussLog = memberService.onestopBussLogInsertOk(map);
			    	}
			    	if(!multipartRequest.getFile("fileName2").isEmpty()) { //파일이 있으면 
			    		MultipartFile orgFileNm = multipartRequest.getFile("fileName2");
			    		HashMap<String, String> fileMap = UploadFileUtils.OnefileUpload(orgFileNm,filePath);
		    			attchFileNo = map.get("memberId")+"_"+onestopSupportNo+"_"+2+"_"+1;
			    		map.put("attchFileNo",attchFileNo);
			    		map.put("fileCourse",fileMap.get("fileCourse"));
			    		map.put("orgFileNm",fileMap.get("orgFileNm"));
			    		map.put("attchFileDiviCd","000002");//코드
			    		int bussLog = memberService.onestopBussLogInsertOk(map);
			    	}
			    	if(!multipartRequest.getFile("fileName3").isEmpty()) { //파일이 있으면 
			    		MultipartFile orgFileNm = multipartRequest.getFile("fileName3");
			    		HashMap<String, String> fileMap = UploadFileUtils.OnefileUpload(orgFileNm,filePath);
		    			attchFileNo = map.get("memberId")+"_"+onestopSupportNo+"_"+3+"_"+1;
			    		map.put("attchFileNo",attchFileNo);
			    		map.put("fileCourse",fileMap.get("fileCourse"));
			    		map.put("orgFileNm",fileMap.get("orgFileNm"));
			    		map.put("attchFileDiviCd","000003");//코드
			    		int bussLog = memberService.onestopBussLogInsertOk(map);
			    	}
			    	if(!multipartRequest.getFile("fileName4").isEmpty()) { //파일이 있으면 
			    		MultipartFile orgFileNm = multipartRequest.getFile("fileName4");
			    		HashMap<String, String> fileMap = UploadFileUtils.OnefileUpload(orgFileNm,filePath);
		    			attchFileNo = map.get("memberId")+"_"+onestopSupportNo+"_"+4+"_"+1;
			    		map.put("attchFileNo",attchFileNo);
			    		map.put("fileCourse",fileMap.get("fileCourse"));
			    		map.put("orgFileNm",fileMap.get("orgFileNm"));
			    		map.put("attchFileDiviCd","000004");//코드
			    		int bussLog = memberService.onestopBussLogInsertOk(map);
			    	}
			}

			return "jsonView";
		}
		
}
