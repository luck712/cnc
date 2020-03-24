package jcep.front.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.sun.xml.internal.bind.v2.runtime.reflect.Accessor.GetterOnlyReflection;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import jcep.admin.model.MemberVO;
import jcep.admin.service.MemberService;

/**
 * @Class Name : BusinessAnnouncementController.java
 * @Description : BusinessAnnouncementController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.03          최초생성
 * @version 1.0
 * @see
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BusinessAnnouncementController {

	@Resource(name = "memberService")
	protected MemberService memberService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Autowired
	JeonnamCommonsController jeonnamCommonsController;
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessAnnouncementController.class);
	
	// 업로드된 파일이 저장될 위치 
	private final String PATH = "C:/JCEP_SYSTEM/JCEP_SYSTEM/src/main/webapp/WEB-INF/upload/";
	
	@Autowired
	MappingJackson2JsonView jsonView;
	@Resource(name="noticeFilePath")
    String noticeFilePath;
	
	/**
	 * 사업공고 리스트 페이지
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @author 최선권
	 * @Date 20191116
	 * @param MemberVO
	 * @return "businessMoreList"
	 * @exception Exception
	 */
/*	@RequestMapping(value = "/businessList.do")
	public ModelAndView businessList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("businessList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		String business_nm = request.getParameter("business_nm");
		String business_ceo = request.getParameter("business_ceo");
		String datepicker1 = request.getParameter("datepicker1");
		String datepicker2 = request.getParameter("datepicker2");
		String searchText = request.getParameter("searchText");
		int year = Integer.parseInt(StringUtils.defaultString(request.getParameter("year"), "-1"));
		int month = Integer.parseInt(StringUtils.defaultString(request.getParameter("month"), "-1"));
		
		Map<String, Integer> currentDate = this.getCurrentDate(); 
		
		int sysYear = year == -1 ? currentDate.get("year") : year;
		int sysMonth = month == -1 ? currentDate.get("month") : month;

		Map<String, String> date = this.makeFirstAndEndDate(sysYear, sysMonth);
		
		String startDate = date.get("startDate");
		String endDate = date.get("endDate");

		searchVO.setAccountId(datepicker1);
		searchVO.setAccountId(datepicker2);
		searchVO.setBusiness_nm(business_nm);
		searchVO.setBusiness_ceo(business_ceo);
		searchVO.setSearchText(searchText);
		searchVO.setStartDate(startDate);
		searchVO.setEndDate(endDate);
		searchVO.setStartNum(0);
		searchVO.setEndNum(10);

		System.out.println("datepicker1 :: " + datepicker1);
		System.out.println("datepicker2 :: " + datepicker2);
		System.out.println("business_nm :: " + business_nm);
		System.out.println("business_ceo :: " + business_ceo);
		System.out.println("searchText :: " + searchText);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("datepicker1", datepicker1);
		model.addAttribute("datepicker2", datepicker2);		
		model.addAttribute("business_nm", business_nm);
		model.addAttribute("business_ceo", business_ceo);
		model.addAttribute("searchText", searchText);
		model.addAttribute("startDate", searchText);
		model.addAttribute("endDate", searchText);
		
		ArrayList<MemberVO> authList = memberService.selectBusinessAnnouncementList(searchVO);
		model.addAttribute("resultList", authList);
		model.addAttribute("sysYear", sysYear);
		model.addAttribute("sysMonth", sysMonth);
		
		int totCnt = memberService.selectselectBusinessAnnouncementListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("businessList_2***********************"+searchVO);
		mv.setViewName("/view/frontView/businessList");
		
		return mv;
	}*/
	
	/**
	 * 공지사항 목록에서 [더보기] 버튼을 눌렀을 때 추가 리스트를 가져온다.
	 * @param mv
	 * @param request
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/businessList.do")
	public ModelAndView businessList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("businessList_1***********************"+searchVO);
		
		String bussAnncemntNm = request.getParameter("bussAnncemntNm");
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		String business_nm = request.getParameter("business_nm");
		String business_ceo = request.getParameter("business_ceo");
		String datepicker1 = request.getParameter("datepicker1");
		String datepicker2 = request.getParameter("datepicker2");
		String searchText = request.getParameter("searchText");
		String searchType = request.getParameter("searchType");
		int year = Integer.parseInt(StringUtils.defaultString(request.getParameter("year"), "-1"));
		int month = Integer.parseInt(StringUtils.defaultString(request.getParameter("month"), "-1"));
		
		Map<String, Integer> currentDate = this.getCurrentDate(); 
		
		int sysYear = year == -1 ? currentDate.get("year") : year;
		int sysMonth = month == -1 ? currentDate.get("month") : month;
		
		Map<String, String> date = this.makeFirstAndEndDate(sysYear, sysMonth);
		
		String startDate = date.get("startDate");
		String endDate = date.get("endDate");
		
		searchVO.setSearchType(searchType);
		searchVO.setBussAnncemntNm(bussAnncemntNm);;
		searchVO.setBussAnncemntNo(bussAnncemntNo);
		searchVO.setAccountId(datepicker1);
		searchVO.setAccountId(datepicker2);
		searchVO.setBusiness_nm(business_nm);
		searchVO.setBusiness_ceo(business_ceo);
		searchVO.setSearchText(searchText);
		searchVO.setStartDate(startDate);
		searchVO.setEndDate(endDate);
		searchVO.setStartNum(0);
		searchVO.setEndNum(10);
		
		System.out.println("datepicker1 :: " + datepicker1);
		System.out.println("datepicker2 :: " + datepicker2);
		System.out.println("searchText :: " + searchText);
		System.out.println("searchType :: " + searchType);
				
		ArrayList<MemberVO> authList = memberService.selectBusinessAnnouncementList(searchVO);		
		int totCnt = memberService.selectselectBusinessAnnouncementListTotCnt(searchVO);

		mv.addObject("bussAnncemntNo", bussAnncemntNo); 
		mv.addObject("bussAnncemntNm", bussAnncemntNm); 
		mv.addObject("viewType", "modify"); 
		mv.addObject("datepicker1", datepicker1);
		mv.addObject("datepicker2", datepicker2);		
		mv.addObject("business_nm", business_nm);
		mv.addObject("business_ceo", business_ceo);
		mv.addObject("searchText", searchText);
		mv.addObject("startDate", searchText);
		mv.addObject("endDate", searchText);
		mv.addObject("resultList", authList);
		mv.addObject("sysYear", sysYear);
		mv.addObject("sysMonth", sysMonth);
		mv.addObject("totCnt",totCnt);
		
		System.out.println("businessList_2***********************"+searchVO);
		System.out.println("totCnt: " + totCnt);
		mv.setViewName("/view/frontView/businessList");		
		return mv;
	}
	

	@RequestMapping(value = "/businessMoreList.do", method=RequestMethod.POST)
	public ModelAndView businessMoreList(ModelAndView mv, HttpServletRequest request, MemberVO searchVO) throws Exception{
		int year = Integer.parseInt(StringUtils.defaultString(request.getParameter("year"), "-1"));
		int month = Integer.parseInt(StringUtils.defaultString(request.getParameter("month"), "-1"));
		int listCnt = Integer.parseInt(StringUtils.defaultString(request.getParameter("listCnt"), "-1"));
		
		Map<String, Integer> currentDate = this.getCurrentDate(); 
		
		int sysYear = year == -1 ? currentDate.get("year") : year;
		int sysMonth = month == -1 ? currentDate.get("month") : month;

		Map<String, String> date = this.makeFirstAndEndDate(sysYear, sysMonth);
		
		String startDate = date.get("startDate");
		String endDate = date.get("endDate");
		
		searchVO.setStartDate(startDate);
		searchVO.setEndDate(endDate);
		searchVO.setStartNum(listCnt);
		searchVO.setEndNum(5);

		ArrayList<MemberVO> authList = memberService.selectBusinessAnnouncementList(searchVO);
		mv.addObject("resultList", authList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
/*	@RequestMapping(value = "/businessDetail.do")
	public ModelAndView businessDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("businessDetail_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		String business_est_dt = request.getParameter("business_est_dt");
		String business_reg_dt = request.getParameter("business_reg_dt");
		String business_id = request.getParameter("business_id");
		String business_nm = request.getParameter("business_nm");
		String business_bus_area = request.getParameter("business_bus_area");
		String business_site = request.getParameter("business_site");

		searchVO.setBusiness_est_dt(business_est_dt);
		searchVO.setBusiness_reg_dt(business_reg_dt);
		searchVO.setBusiness_nm(business_nm);
		searchVO.setBusiness_bus_area(business_bus_area);
		searchVO.setBusiness_site(business_site);
		searchVO.setBusiness_id(business_id);
		
		System.out.println("business_id :: " + business_id);
		
		MemberVO detail = memberService.selectBusinessDetail(searchVO);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("detail", detail);  
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("business_est_dt", business_est_dt);
		model.addAttribute("business_reg_dt", business_reg_dt);
		model.addAttribute("business_nm", business_nm);
		model.addAttribute("business_bus_area", business_bus_area);
		model.addAttribute("business_site", business_site);
		model.addAttribute("business_id", business_id);
		
		
		System.out.println("detail :: " + detail);
		
		mv.setViewName("/view/frontView/businessDetail");
		
		System.out.println("businessDetail_2***********************"+searchVO);
		
		return mv;
	}*/
	
	/**
	 * 사업공고 상세보기 클릭 페이지
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @author 최선권
	 * @Date 20191116
	 * @param memberId(아이디), bussAnncemntNm(사업명)
	 * @return "@ModelAttribute"
	 * @exception Exception
	 */
		@RequestMapping(value = "/businessDetail.do")
	public ModelAndView businessDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("businessDetail_1***********************"+searchVO);

		//파라미터값으로 넘겼던 memberID(아이디) , bussAnncemntNm(사업명을 가져온다) 해당값으로 데이터값을 조회 할 것이다.
		//String memberId =searchVO.getMemberId();
		String bussAnncemntNo = searchVO.getBussAnncemntNo();
		//System.out.println("memberId:: " + memberId);
		System.out.println("bussAnncemntNo:: " + bussAnncemntNo);
		//상세보기 페이지의 글번호를 담을 변수
		int pageNum = 0;
		int pageNumPlus = 0;
		int pageNumMinus = 0;
		//HashMap으로 넣어 진행할까 싶었지만 통일성을 가지고 VO에 데이터를 입력
		
		
		
		//상세보기 페이지에 나타내줄 데이터를 조회한다.
		System.out.println("***********조회시작**************");
		MemberVO detail = memberService.selectBusinessDetail(bussAnncemntNo);
		MemberVO File = memberService.selectBusinessFile(bussAnncemntNo);
		//필요한 데이터: 사업명 , 등록일, 기간(시작일, 종료일), 내용, 첨부파일, 그리고... 해당글 번호를 가져와야한다..ㅎㅎ;
		System.out.println("***********조회종료**************");
		pageNum = searchVO.getPageNum();	
		pageNumPlus = pageNum++;
		pageNumMinus = pageNum--;
		System.out.println("pageNum ::" + pageNum);
		System.out.println("pageNumPlus ::" + pageNumPlus);
		System.out.println("pageNumMinus ::" + pageNumMinus);
//		MemberVO detail1 = memberService.selectBusinessDetailplus(pageNum);	//다음글에 필요한 데이터
//		MemberVO detail2 = memberService.selectBusinessDetailminus(pageNum);	//이전글에 필요한 데이터
		System.out.println("detail :: " + detail);
		mv.addObject("detail", detail);
		mv.addObject("File", File);
		mv.addObject("viewType", "modify");
		
		mv.setViewName("/view/frontView/businessDetail");
		
/*		
		*===========================================*
		||                                                                            ||
		||       사업 신청하기 클릭시 필요한 정보를 불러와 화면에 띄워주기          ||
		||                                                                            ||
		*===========================================*
*/
//		String memberId = (String) session.getAttribute("memberId");		
		
		String memberId = (String) session.getAttribute("memberId");
		if(memberId !=null) {
			int JoinTypeCd = Integer.parseInt((String)session.getAttribute("joinTypeCd"));
			if(JoinTypeCd==000001) {
				MemberVO enterpriseDetail = memberService.selectenterpriseDetail(memberId);//로그인한 회원의 아이디로 
				String[] email = enterpriseDetail.getEntprRespsibEmail().split("@");
				String email1 = email[0]; 
				String email2 = email[1]; 
				
				
				
				
				mv.addObject("email1", email1);
				mv.addObject("email2", email2);
				mv.addObject("list1",enterpriseDetail);
						
				System.out.println("list1::" + enterpriseDetail);
			}
		}
		System.out.println("businessDetail_2***********************"+searchVO);
		
		return mv;
	}
	/**
	 * 사업공고 신청.
	 * @param memberidx - 등록할 회원 idx
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "businessDetail"
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(value= "/businessDetailInsert.do")
    public ModelAndView  businessDetailInsert(MultipartHttpServletRequest request, ModelAndView mv, HttpServletResponse response , @ModelAttribute("searchVO") MemberVO searchVO, HttpSession session) throws Exception {
		
/*		searchVO.setEntprRespsibHpNo(request.getParameter("phone1")+"-"+request.getParameter("entprRespsiHpNo2")+"-"+request.getParameter("entprRespsiHpNo3"));
		searchVO.setEntprRespsibEmail(request.getParameter("entprRespsibEmail1")+"@"+request.getParameter("entprRespsibEmail2"));
*/		searchVO.setEntprNm(request.getParameter("entprNm"));					//사업명
		searchVO.setMemberId((String)session.getAttribute("memberId"));		//신청자 아이디
		searchVO.setApplicStCd("접수");														//	신청상태코드 
		searchVO.setApprovalDt("");															// 승인일자(값을 주지 않고 넣게 되면 null이 잡혀 공란으로 채운다.) 관리자에서 승인이 될경우 데이터를 입력.
		
		String bussAnncemntNo = searchVO.getBussAnncemntNo();
		String memberId =searchVO.getMemberId();

		mv.addObject("request", request);
		mv.addObject("searchVO", searchVO);
		mv.addObject("memberId", memberId);
		mv.addObject("bussAnncemntNo", bussAnncemntNo);
		
		MultipartFile file1 = request.getFile("file");
		MultipartFile file2 = request.getFile("file1");
		String fileName1 = file1.getOriginalFilename();
		String fileName2 = file2.getOriginalFilename();

		if(fileName1!="") {
			MultipartFile file = request.getFile("file");
			String attchFileNo = bussAnncemntNo + memberId + "_1";
			mv.addObject("attchFileNo",attchFileNo);
			mv.addObject("file", file);
			MemberVO fileVo = jeonnamCommonsController.FileUpload(mv);
			fileVo.setMemberId(memberId);
			fileVo.setBussAnncemntNo(bussAnncemntNo);			//사업공고 번호
			fileVo.setRegId(memberId);									//등록자아이디
			fileVo.setAttchFileNo(attchFileNo);							//첨부파일번호
			
			FileUpload(fileVo);
		}
		if(fileName2!="") {
			MultipartFile file = request.getFile("file1");
			
			String attchFileNo = bussAnncemntNo + memberId + "_2";
			mv.addObject("attchFileNo",attchFileNo);
			mv.addObject("file", file);

			MemberVO fileVo  =  jeonnamCommonsController.FileUpload(mv);
			
			fileVo.setMemberId(memberId);
			fileVo.setBussAnncemntNo(bussAnncemntNo);			//사업공고 번호
			fileVo.setRegId(memberId);									//등록자아이디
			fileVo.setAttchFileNo(attchFileNo);							//첨부파일번호
			
			FileUpload(fileVo);
		}
		
		int check = memberService.businessDetailCheck(searchVO);
		if(check==0) {
			memberService.businessDetailInseert(searchVO);
			check++;
		}	

		mv.addObject("check", check);
		mv.addObject("bussAnncemntNo",bussAnncemntNo);
		mv.setViewName("/view/frontView/businessDetailOk");
		
		return mv;
    }
	
	public void FileUpload(MemberVO fileVo) throws Exception {

		int check = 0;
			check = memberService.bussFileCheck(fileVo);
		//공고번호,파일번호를 통해 파일이 있는지 확인
		System.out.println("check::" + check);
		if(check==0) {
			memberService.bussFileUpload(fileVo);
			//파일이 없을경우 인서트
		}else if(check==1){
			//시간이 되면 파일 업데이트를 하기전에 기존에 있던 파일 없애보자
			memberService.bussFileUpdate(fileVo);
			//파일이 있으면 업데이트
		
		}
	}
	/**
	 * insert Table = tb_enterprise_attch_file(기업진흥원수혜사업진행첨부파일) 
	 * 간략화 = 사업공고 신청시 첨부파일1
	 * @param ModelAndView.mv - 해당 파일에 필요한 file1값 밑 신청하는 회원의 정보
	 * @Date 20191120
	 * @author 최선권
	 * @return "businessDetailInsert"
	 * @exception Exception
	 */

    
	/**
	 * insert Table = tb_enterprise_attch_file(기업진흥원수혜사업진행첨부파일) 
	 * 간략화 = 사업공고 신청시 첨부파일2
	 * @param ModelAndView.mv - 해당 파일에 필요한 file1값 밑 신청하는 회원의 정보
	 * @Date 20191120
	 * @author 최선권
	 * @return "businessDetailInsert"
	 * @exception Exception
	 */
/*    public int FileUpload2 (ModelAndView mv) throws Exception {
		Map<String, Object> map = mv.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		String memberId;
		if(map.get("session")==null) {
			//테스트 아이디값을 넣어주자
			memberId =  request.getParameter("memberId");
			memberId = "test22";
		}else {
			HttpSession session = (HttpSession) map.get("session");
			memberId = (String) session.getAttribute("member_id");
		}
		
		String bussAnncemntNo = request.getParameter("bussAnncemntNo");
		int result =0;
		
		logger.debug(">>>>>>>>>>> fileUpload start");
		MultipartFile upFile1=request.getFile("file1");

		String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile1.getOriginalFilename(); // 원본 파일 명 String saveFileName = String.format("%d_%s", time, originFileName); try { // 파일생성 mf.transferTo(new File(path, saveFileName)); } catch (Exception e) { e.printStackTrace(); } }
		logger.debug(">>>>>>>>>>> request : "+upFile1.toString());
		MemberVO memberVo = new MemberVO();
	
		File path=new File(noticeFilePath);
		path.mkdir();
	    	
		if(path.exists() && path.isDirectory()){			
			File file=new File(path, fileName);
					
			try {
				upFile1.transferTo(file);
				
				memberVo.setMemberId(memberId);								//아이디
				memberVo.setBussAnncemntNo(bussAnncemntNo);			//사업공고 번호
				memberVo.setFileCourse2(file.getAbsolutePath());			//경로
				memberVo.setOrgFileNm2(fileName);								//파일명
				memberVo.setRegId(memberId);									//등록자아이디
				memberVo.setAttchFileNo(bussAnncemntNo+"_2");						//첨부파일번호
				logger.debug(">>>>>>>>>>> originFileName : " + fileName);
				result = 1;
				
				int check = memberService.noticeFileCheck1(memberVo);//파일 인서트하기전에 해당테이블에 값이 있는지 확인
				System.out.println("check::" + check);
				if(check==0) {					
					memberService.noticeFileUpload2(memberVo);//값이 없을경우 파일을 insert(하지만 정보가 없을리는 없다)
				}else if(check==1){	
					memberService.noticeFileUpdate2(memberVo);//회원정보가 있다면 업데이트로 파일을 인서트
				}
			}catch (Exception e) {
				e.printStackTrace();
				result = 0;
			}
		}
		return result;
	}*/
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/companyInformationList.do")
	public ModelAndView companyInformationList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("companyInformationList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<MemberVO> authList = memberService.selectAuthListCompanyInformationList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totCnt = memberService.selectAuthListCompanyInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("companyInformationList_2***********************"+searchVO);
		mv.addObject("paginationInfo", paginationInfo);
		//mv.addObject("resultList", authList);
		mv.setViewName("/view/frontView/companyInformationList");
		
		return mv;
	}
	
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/companyInformationDetail.do")
	public ModelAndView companyInformationDetail(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("companyInformationDetail_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		String sno = request.getParameter("sno");
		String title = request.getParameter("title");
		String snominus = request.getParameter("snominus");
		String snoplus = request.getParameter("snoplus");
//		20191114 최선권 추가
		String memberId = request.getParameter("memberId");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int pageNumMinus = pageNum-1;
		int pageNumPlus = pageNum+1;
		searchVO.setMemberId(memberId);
		model.addAttribute("pageNum", pageNum);
		System.out.println("memberId :  " + memberId);
		System.out.println("pageNum :  " + pageNum);

		//memeberId가 가지고 있는 파일을 td_enterprise_attch_file Table에서 가져온다.
		//MemberVO FileInfo = memberService.fileSearchList(memberId);	//미구현
		searchVO.setSno(sno);
		searchVO.setTitle(title);
		
		searchVO.setSnominus(snominus);
		searchVO.setSnoplus(snoplus);
		
		System.out.println("sno :: " + sno);
		System.out.println("sno-1 :: " + snominus);
		System.out.println("sno+1 :: " + snoplus);
		System.out.println("title :: " + title);
		
		MemberVO detail = memberService.selectAuthListDetail(searchVO);
		MemberVO detail1 = memberService.selectAuthListDetailPlus(searchVO);
		MemberVO detail2 = memberService.selectAuthListDetailMinus(searchVO);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("detail", detail);  
		model.addAttribute("detail1", detail1);  
		model.addAttribute("detail2", detail2);  
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("sno", sno);
		model.addAttribute("title", title);
		model.addAttribute("snoplus", sno);
		model.addAttribute("snominus", sno);
		
		

		
		System.out.println("pageNum :: " + pageNum);
		System.out.println("pageNum+1 :: " + pageNum++);
		System.out.println("pageNum-1 :: " + pageNum +-1);
		System.out.println("detail1 :: " + detail1);
		System.out.println("detail2 :: " + detail2);
		mv.setViewName("/view/frontView/companyInformationDetail");
		
		System.out.println("companyInformationDetail_2***********************"+searchVO);
		
		return mv;
	}

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
/*	@RequestMapping(value = "/companyInformationDetailPlus.do")
	public ModelAndView companyInformationDetailPlus(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("companyInformationDetailPlus_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		String sno = request.getParameter("sno");
		String title = request.getParameter("title");
		String snominus = request.getParameter("snominus");
		String snoplus = request.getParameter("snoplus");
		
		searchVO.setSno(sno);
		searchVO.setTitle(title);
		
		searchVO.setSnominus(snominus);
		searchVO.setSnoplus(snoplus);
		
		System.out.println("sno :: " + sno);
		System.out.println("snoplus-1 :: " + snominus);
		System.out.println("snoplus+1 :: " + snoplus);
		System.out.println("title :: " + title);
		
		MemberVO detail = memberService.selectAuthListDetailPlus(searchVO);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("detail", detail); 
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("sno", sno);
		model.addAttribute("title", title);
		model.addAttribute("snoplus", snoplus);
		model.addAttribute("snominus", snominus);
		
		System.out.println("detail :: " + detail);
					
		mv.setViewName("/view/frontView/companyInformationDetail");
		
		System.out.println("companyInformationDetailPlus_2***********************"+searchVO);
		
		return mv;
	}*/
	

	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 *//*
	@RequestMapping(value = "/companyInformationDetailMinus.do")
	public ModelAndView companyInformationDetailMinus(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model, HttpServletRequest request) throws Exception {
		System.out.println("companyInformationDetailMinus_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		String sno = request.getParameter("sno");
		String title = request.getParameter("title");
		String snominus = request.getParameter("snominus");
		String snoplus = request.getParameter("snoplus");
		
		searchVO.setSno(sno);
		searchVO.setTitle(title);
		
		searchVO.setSnominus(snominus);
		searchVO.setSnoplus(snoplus);
		
		System.out.println("sno :: " + sno);
		System.out.println("snominus-1 :: " + snominus);
		System.out.println("snoplus+1 :: " + snoplus);
		System.out.println("title :: " + title);
		
		MemberVO detail = memberService.selectAuthListDetailMinus(searchVO);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("detail", detail); 
		model.addAttribute("viewType", "modify"); 
		model.addAttribute("sno", sno);
		model.addAttribute("title", title);
		model.addAttribute("snoplus", snoplus);
		model.addAttribute("snominus", snominus);
		
		System.out.println("detail :: " + detail);
					
		mv.setViewName("/view/frontView/companyInformationDetail");
		
		System.out.println("companyInformationDetailMinus_2***********************"+searchVO);
		
		return mv;
	}
	   */
//   20191115 최선권 이전글 다음글 수정
   @RequestMapping(value = "/companyInformationDetailpaging.do")
   public ModelAndView companyInformationDetailpaging(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv,  HttpServletRequest request) throws Exception {
      System.out.println("companyInformationDetailpaging***********************"+searchVO);
      searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
      searchVO.setPageSize(propertiesService.getInt("pageSize"));
      
      PaginationInfo paginationInfo = new PaginationInfo();
      paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
      paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
      paginationInfo.setPageSize(searchVO.getPageSize());
      
      searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
      searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
      searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       System.out.println("memberId::" + request.getParameter("memberId"));
//      20191114 최선권 추가
      String memberId = request.getParameter("memberId");                        //넘어온 아이디값 저장
      int pageNum = Integer.parseInt(request.getParameter("pageNum"));         //넘어온 번호값 저장
      searchVO.setMemberId(memberId);
      searchVO.setPageNum(pageNum);
      System.out.println("memberId :  " + memberId);
      System.out.println("pageNum :  " + pageNum);
      
      MemberVO detail = memberService.selectAuthListDetail(searchVO);         //해당페이지의 정보
      MemberVO detail1 = memberService.selectAuthListDetailPlus(searchVO);      //다음글에 대한 정보
      MemberVO detail2 = memberService.selectAuthListDetailMinus(searchVO);   //이전글에 대한 정보
   
      mv.addObject("paginationInfo", paginationInfo);
      mv.addObject("viewType", "modify");
      mv.addObject("detail", detail);
      mv.addObject("detail1", detail1);
      mv.addObject("detail2", detail2);
      mv.addObject("pageNum", pageNum);

      System.out.println("detail :: " + detail);
      
      mv.setViewName("/view/frontView/companyInformationDetail");      
      System.out.println("companyInformationDetailpaging***********************"+searchVO);
      
      return mv;
   }
	

	
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/expertInformationList.do")
	public ModelAndView expertInformationList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("expertInformationList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = memberService.selectExpertInformationList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totcnt = memberService.selectExpertInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totcnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("totCnt :: " + totcnt);
		System.out.println("expertInformationList_2***********************"+searchVO);
		mv.setViewName("/view/frontView/expertInformationList");
		
		return mv;
	}
	
	/**
	 * 공지사항 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "noticeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/buyerInformationList.do")
	public ModelAndView buyerInformationList(@ModelAttribute("searchVO") MemberVO searchVO, ModelAndView mv, Model model) throws Exception {
		System.out.println("buyerInformationList_1***********************"+searchVO);
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		ArrayList<MemberVO> authList = memberService.selectBuyerInformationList(searchVO);
		model.addAttribute("resultList", authList);
		
		int totcnt = memberService.selectBuyerInformationListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totcnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println("totCnt :: " + totcnt);
		System.out.println("buyerInformationList_2***********************"+searchVO);
		mv.setViewName("/view/frontView/buyerInformationList");
		
		return mv;
	}
	
	/*
	@ResponseBody
    @RequestMapping(value="/companyFileUpload1.do"  ,method= RequestMethod.POST)
    public String companyFileUpload1 (MultipartHttpServletRequest request) throws Exception {		
    	String result = "";
    	List<MultipartFile> fileList = request.getFiles("file");

    	logger.debug(">>>>>>>>>>> fileUpload start");
    	logger.debug(">>>>>>>>>>> request : "+fileList.toString());
    	
    	try {
			String path = noticeFilePath; 
			File fileDir = new File(path); 
			if (!fileDir.exists()) { fileDir.mkdirs(); } 
			long time = System.currentTimeMillis(); 
			String originFileName="";
			for (MultipartFile mf : fileList) { 
				originFileName = mf.getOriginalFilename(); // 원본 파일 명 String saveFileName = String.format("%d_%s", time, originFileName); try { // 파일생성 mf.transferTo(new File(path, saveFileName)); } catch (Exception e) { e.printStackTrace(); } }
			}
			logger.debug(">>>>>>>>>>> originFileName : " + originFileName);
			memberService.noticeFileUpload1(originFileName);
			result = "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "fail";
		}
    	
		return result;

    }
    @ResponseBody
    @RequestMapping(value="/companyFileUpload2.do"  ,method= RequestMethod.POST)
    public String companyFileUpload2 (MultipartHttpServletRequest request) throws Exception {		
    	String result = "";
    	
    	List<MultipartFile> fileList = request.getFiles("uploadProposal");

    	logger.debug(">>>>>>>>>>> fileUpload start");
    	logger.debug(">>>>>>>>>>> request : "+fileList.toString());
    	
    	try {
    		String path = noticeFilePath; 
    		File fileDir = new File(path); 
    		if (!fileDir.exists()) { fileDir.mkdirs(); } 
    		long time = System.currentTimeMillis(); 
    		String originFileName="";
    		for (MultipartFile mf : fileList) { 
    			originFileName = mf.getOriginalFilename(); // 원본 파일 명 String saveFileName = String.format("%d_%s", time, originFileName); try { // 파일생성 mf.transferTo(new File(path, saveFileName)); } catch (Exception e) { e.printStackTrace(); } }
    		}
    		logger.debug(">>>>>>>>>>> originFileName : " + originFileName);
			 memberService.noticeFileUpload2(originFileName);
			 result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
    	
		return result;

    }*/

	/**
	 * 현재 연월을 구한다.
	 * @return Map
	 */
	public Map<String, Integer> getCurrentDate(){
		Map<String, Integer> date = new HashMap<String, Integer>();
		
		Calendar cal = Calendar.getInstance();

		date.put("year", cal.get( cal.YEAR ));
		date.put("month", cal.get( cal.MONTH ) + 1);
		
		return date;
	}
	
	/**
	 * 해당 연도, 월의 처음 일자와 마지막 일자를 구한다.
	 * @param year
	 * @param month
	 * @return Map
	 */
	public Map<String, String> makeFirstAndEndDate(int year, int month){
		Map<String, String> date = new HashMap<String, String>();
		
		 Calendar cal = Calendar.getInstance();
		 cal.set(year, month-1, 1);
		 
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 cal.set(year, month-1, cal.getMinimum(Calendar.DAY_OF_MONTH));
		 date.put("startDate", dateFormat.format(cal.getTime()));
		 
		 cal.set(year, month-1, cal.getMaximum(Calendar.DAY_OF_MONTH));
		 date.put("endDate", dateFormat.format(cal.getTime()));
		 
		return date;
	}
}
