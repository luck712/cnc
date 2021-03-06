package jcep.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import jcep.admin.model.MemberVO;
import jcep.admin.model.SiteVO;


/**
 * @Class Name : MemberMapper.java
 * @Description : 회원관리에 대한 데이터처리 매퍼 클래스
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.06.10           최초생성
 *
 * @since 2019.06.10
 * @version 1.0
 */

@Mapper
public interface MemberMapper {

	/**
	 * 회원 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectMemberList(MemberVO params) throws Exception;
	
	/**
	 * 기업회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail(MemberVO params) throws Exception;

	/**
	 * 바이어회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail1(MemberVO params) throws Exception;

	/**
	 * 전문가회원 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetail2(MemberVO params) throws Exception;

	/**
	 * 관리자 상세 정보를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원정보 상세
	 * @exception Exception
	 */
	public MemberVO selectMemberDetailAuthList(MemberVO params) throws Exception;
	
	
	/**
	 * 회원 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectMemberListTotCnt(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdate(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer managerDetailAuthUpdate(MemberVO params) throws Exception;
	
	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdateOne(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdateTwo(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdateThree(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdate1(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberUpdate2(MemberVO params) throws Exception;
	
	/**
	 * 회원 아이디 중복 체크
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int memberIdChk(MemberVO params) throws Exception;

	/**
	 * 관리자 아이디 중복 체크
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int mngIdChk(MemberVO params) throws Exception;
	
	
	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberInsert(MemberVO params) throws Exception;
	
	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberDetailAuthInsert(MemberVO params) throws Exception;

	
	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberInsertOne(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberInsertTwo(MemberVO params) throws Exception;

	/**
	 * 회원 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberInsertThree(MemberVO params) throws Exception;
	
	/**
	 * 회원 정보 권한정보 
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberAuthInsert(MemberVO params) throws Exception;
	
	/**
	 * 회원 정보를 승인한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberConfirm(MemberVO params) throws Exception;
	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAuthList(MemberVO params) throws Exception;

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAuthListCompanyInformationList(MemberVO params) throws Exception;

	/**
	 * 권한관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAuthListCompanyInformationListTotCnt(MemberVO params) throws Exception;

	/**
	 * 문의하기 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectContactUsList(MemberVO params) throws Exception;

	/**
	 * 문의하기 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectContactUsListTotCnt(MemberVO params) throws Exception;

	/**
	 * 문의하기 상세 내용을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectContactUsDetailList(MemberVO params) throws Exception;
	
	/**
	 * 공지사항 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectNoticeListCompanyInformationList(MemberVO params) throws Exception;

	/**
	 * 공지사항 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectNoticeListCompanyInformationListTotCnt(MemberVO params) throws Exception;

	/**
	 * 공지사항 패스워드를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public int selectContactUsListPassWd(MemberVO params) throws Exception;

	/**
	 * 문의하기 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer contactUsDetailInsert(MemberVO params) throws Exception;

	
	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetail(MemberVO params) throws Exception;

	
	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetailPlus(MemberVO params) throws Exception;

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAuthListDetailMinus(MemberVO params) throws Exception;

	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetail(MemberVO params) throws Exception;

	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetailPlus(MemberVO params) throws Exception;
	
	/**
	 * 권한관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectNoticeDetailMinus(MemberVO params) throws Exception;
	
	
	
	
	
	
	/**
	 * 권한관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAuthListTotCnt(MemberVO params) throws Exception;

	
	
	/**
	 * 회원권한을 설정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer memberAuthSave(MemberVO params) throws Exception;
	
	public int selectCompanyInformationListCheck(MemberVO params) throws Exception;

	/**
	 * 바이어정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBuyerInformationList(MemberVO params) throws Exception;

	/**
	 * 바이어정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectBuyerInformationListTotCnt(MemberVO params) throws Exception;

	/**
	 * 바이어정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public MemberVO selectBuyerInformationListPopup(MemberVO params) throws Exception;

	/**
	 * 전문가정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectExpertInformationList(MemberVO params) throws Exception;

	/**
	 * 전문가정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectExpertInformationListTotCnt(MemberVO params) throws Exception;

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectBusinessAnnouncementList(MemberVO params) throws Exception;

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectselectBusinessAnnouncementListTotCnt(MemberVO params) throws Exception;

	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - String형 bussAnncemntNo
	 * @author 최선권
	 * @date 20191117
	 * @return 사업공고 상세페이지 조회
	 * @exception Exception
	 */
	public MemberVO selectBusinessDetail(String bussAnncemntNo) throws Exception;
		
	/**
	 * 사업공고에서 디테일페이지를 들어갈때 파일정보 불러온다..
	 * @author 최선권
	 * @Date 20191118
	 * @param params -  String형 bussAnncemntNo
	 * @return MemberVO
	 * @exception Exception
	 */	
	public MemberVO selectBusinessFile(String bussAnncemntNo) throws Exception;

	/**
	/**
	 * 사업공고정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 HashMap<Object, String> 2개의 변수가 들어가있다. memberId, bussAnncemntNo
	 * @author 최선권
	 * @date 20191117
	 * @return 사업공고 상세페이지 조회
	 * @exception Exception
	 */ 
	public int businessDetailInseert(MemberVO params) throws Exception;

	/**
	 * 기업 정보 파일을 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public int bussFileUpload(MemberVO fileVo);
	public int bussFileCheck(MemberVO fileVo) throws Exception;
	public int bussFileUpdate(MemberVO fileVo) throws Exception;

	
	/**
	 * 기업 정보 파일을 가져온다.
	 * @author 최선권
	 * @Date 20191115
	 * @param params - 회원 ID가 담긴 String형 memberId
	 * @return MemberVO
	 * @exception Exception
	 */
	public MemberVO fileSearchList(String memberId);
	

	/**
	 * 관리자정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectManageList(MemberVO params) throws Exception;

	/**
	 * 관리자정보 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectManageListTotCnt(MemberVO params) throws Exception;

	/**
	 * 내 원스톱 정보를 등록한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectOnlineApply(String memberId) throws Exception;
	

	/**
	 * 내 시설 사용신청 현황을 조회 한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public MemberVO selectFacilitiesResourcesApplicationStatus(MemberVO params) throws Exception;


	/**
	 * 내 온라인 상담신청 정보를 조회한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatus(MemberVO params) throws Exception;

	/**
	 * 온라인 상담신청 현황 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 바이어 목록
	 * @exception Exception
	 */
	public int selectOnlineCounselingStatusCount(MemberVO params) throws Exception;
	
	/**
	 * 온라인 상담신청 현황 팝업 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 온라인 상담신청현황 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatusPopup(MemberVO params) throws Exception;

	/**
	 * 온라인 상담신청 현황 팝업 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 온라인 상담신청현황 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectOnlineCounselingStatusPopup1(MemberVO params) throws Exception;

	
	
	/**
	 * 기업 정보 파일을 가져온다.
	 * @author 최선권
	 * @Date 20191118
	 * @param params - Session에담긴 String형 memberId
	 * @return MemberVO
	 * @exception Exception
	 */
	public MemberVO selectenterpriseDetail(String memberId);

	public int businessDetailCheck(MemberVO memberVo) throws Exception;

	/**
	 * 온라인상담 현황 관리 목록을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public ArrayList<MemberVO> selectAdviceOnlineStatusManagementList(MemberVO params) throws Exception;

	/**
	 * CommonsTable 조회
	 * @author 최선권
	 * @Date	20191121
	 * @param params - commonsTable 조회를 위한 commonsVo
	 * @return List

	 * 온라인상담 현황 관리 목록 총 갯수를 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록 총 갯수
	 * @exception
	 */
	public int selectAdviceOnlineStatusManagementListTotCnt(MemberVO params) throws Exception;
	
	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetail(MemberVO params) throws Exception;

	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetailPlus(MemberVO params) throws Exception;
	
	/**
	 * 온라인상담 현황 관리을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusManagementDetailMinus(MemberVO params) throws Exception;
	
	
	/**
	 * 온라인상담 신청내용를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	public Integer adviceOnlineStatusManagementUpdate(HashMap<Object, Object> hMap) throws Exception;

	

	/**
	 * 원스톱 업무일지을 조회한다.
	 * @param params - 조회할 정보가 담긴 VO
	 * @return 회원 목록
	 * @exception Exception
	 */
	public MemberVO selectAdviceOnlineStatusBusiness(MemberVO params) throws Exception;


	/*2020-01-13 최선권 파일 업로드*
	 * 원스톱 업무일지를 수정한다.
	 * @param params - 수정할 정보가 담긴 MemberVO
	 * @return Integer형
	 * @exception Exception
	 */
	//2020-01-13 최선권 파일 업데이트 수정내용: 리턴값 / 파라미터
	public int adviceOnlineStatusBusinessUpdate(HashMap<String,Object> hMap) throws Exception;
	
	
	public List<MemberVO> selectCommonsList(MemberVO commonsVo) throws Exception;
	
	public int selectenterpriseDetailCheck(String MemberId) throws Exception;
	
	/*20200102 onestopfileUpload 추가*/
	public int onestopfileUpload(MemberVO searchVO) throws Exception;
	
	
	/**
	 * 마이페이지 진흥원 수혜사업 조회
	 * @author 최선권
	 * @Date	20191203
	 * @param params - memberId
	 * @return List
	 * @exception Exception
	 */
	public List<MemberVO> selectEnterpriseJcepBussDetail(String MemberId) throws Exception;

	public int selectEnterpriseJcepBussCheck(String MemberId) throws Exception;

	public List<MemberVO> selectEnterpriseInitProptyDetail(String MemberId) throws Exception;
	
	public int selectEnterpriseInitProptyCheck(String MemberId) throws Exception;

	public List<MemberVO> selectEnterpriseEmployeeDetail(String MemberId) throws Exception;
	
	public int selectEnterpriseEmployeeCheck(String MemberId) throws Exception;

	public int deleteEnterpriseEmployeeCheck(HashMap<String,String> hMap) throws Exception;
	
	public int deleteEnterpriseEmployeeDetail(HashMap<String,String> hMap) throws Exception;

	public int updateEnterpriseEmployeeCheck(MemberVO memberVo) throws Exception;

	public int updateEnterpriseEmployee(MemberVO memberVo) throws Exception;

	public int deleteJecpCheck(HashMap<String,String> hMap) throws Exception;
	
	public int deleteJecpDetail(HashMap<String,String> hMap) throws Exception;

	public int updateJecpCheck(MemberVO memberVo) throws Exception;

	public int updateJecp(MemberVO memberVo) throws Exception;
	
	public int mypageCompanyUpdate(MemberVO searchVo) throws Exception;

	public List<MemberVO> mypageEnterpriseResult(String memberId) throws Exception;
	
	public int mypageEnterpriseResultCheck(String memberId) throws Exception;

	public int deletememberEnterpriseResultCheck(HashMap<String, String> hMap) throws Exception;

	public int deletememberEnterpriseResult(HashMap<String, String> hMap) throws Exception;
	
	public int mypageEnterpriseResultInsert(MemberVO memberVo) throws Exception;
	
	public int memberEnterpriseResultUpdate(MemberVO searchVo) throws Exception;

	public int mypageEnterpriseResultCheckMin(String memberId) throws Exception;
	
	public List<MemberVO> mypageEnterpriseResultMin(String memberId) throws Exception;
	
	public int selectOnchangeCheck(String MediumBussAreaCd) throws Exception;
	
	public List<MemberVO> selectOnchange(String MediumBussAreaCd) throws Exception;
	
	public String selectLargeBussAreaCd(String MediumBussAreaCd) throws Exception;
	
	public String selectLargeBussAreaCd2(HashMap<String, Object> hMap) throws Exception;
	
	public String largecode(int largecode) throws Exception;
	
	public String mediumcode(String demium) throws Exception;
	
	public MemberVO selectOnlineApply1(String memberId) throws Exception;
	
	public MemberVO selectMyExpertInformation(String memberId)throws Exception;
	
	public int selectOnchangeexpertDetailIntrtAreCdCheck(String expertDetailIntrtAreCd)throws Exception;

	public List<MemberVO> selectOnchangeExpertDetailIntrtAreCd(String expertDetailIntrtAreCd)throws Exception;
	
	public int mypageExpertUpdateCheck(MemberVO memberVo)throws Exception;
	
	public int mypageExpertUpdate(MemberVO memberVo)throws Exception;
	
	public int mypageExpertDeliberateInsert(MemberVO memberVo)throws Exception;

	public List<MemberVO> mypageExpertDeliberateList(MemberVO memberVo)throws Exception;

	public int mypageExpertDeliberateUpdate(MemberVO memberVo)throws Exception;
	
	public int mypageExpertDeliberateDelete(MemberVO memberVo)throws Exception;

	public MemberVO selectMyBuyerInformation(String memberId)throws Exception;
	
	public int mypageBuyerHistInsert(MemberVO memberVo)throws Exception;
	
	public int mypageBuyerHistUpdate(MemberVO memberVo)throws Exception;

	public List<MemberVO> mypageBuyerHistList(String memberId)throws Exception;
	
	public int mypageBuyerHistDelete(MemberVO memberVo)throws Exception;

	public int mypageBuyerUpdate(MemberVO memberVo)throws Exception;

	public MemberVO expertInformationManagementDetail(MemberVO memberVo)throws Exception;

	public List<MemberVO> expertDeliberateInformationManagementDetail(MemberVO memberVo)throws Exception;

	public MemberVO noticeFileDownload(String fileNum)throws Exception;
	
	public List<MemberVO> proMemberId(int joinTypeCd) throws Exception;   
	
	public int adviceOnlineStatusBusinessInsert(HashMap<String,Object> hMap)throws Exception;

	public int adviceOnlineStatusBusinessUpdateCheck(HashMap<String,Object> hMap)throws Exception;

	public MemberVO selectAdviceOnlineStatusBusinessFile(HashMap<String,String> hMap)throws Exception;

	public MemberVO adviceOnlineStatusBusinessfileDownload(String attchFileNo)throws Exception;

	public MemberVO adviceOnlineStatusManagementDetailfileDownload(String onestopSupportNo)throws Exception;

	public ArrayList<Map<String,Object>> selectadviceOnlineStatusEntprList(MemberVO params)throws Exception;

	public int selectadviceOnlineStatusEntprListCnt(MemberVO params)throws Exception;

	public String onestopSupportNoSelect(Map<String,String> params)throws Exception;

	public int onestopArearCdInsert(Map<String,String> map)throws Exception;
	
	public int adviceOnlineStatusMagagementInsertOk(Map<String,String> params)throws Exception;
	
	public int onestopBussLogInsertOk(Map<String,String> params)throws Exception;
	
	public List<Map<String,Object>> SelectExpertList(HashMap<String,Object> hMap)throws Exception;

	public List<Map<String,Object>> selectClassNmList(HashMap<String,Object> hMap)throws Exception;

	public int insertEvalu(HashMap<String,Object> hMap)throws Exception;

	public int insertEvaluDtl(HashMap<String,Object> hMap)throws Exception;

	public int SelectSlectEvaluInsert(HashMap<String,Object> hMap)throws Exception;
	
	public int SelectSelectClassCdInsert(HashMap<String,Object> hMap)throws Exception;
	public String SelectSearchSelectNo(int result)throws Exception;

	public List<HashMap<String,String>> selectClassNm(String param)throws Exception;

	public HashMap<String,String> selectEvaluInformationManagementDetail(String param)throws Exception;

	public List<HashMap<String,String>> selectEvaluInformationManagementDetailList(String param)throws Exception;

	public List<HashMap<String,String>> SelectadviceAreaCd(String param)throws Exception;

}
