package hae.basic.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import hae.basic.vo.DrivingInfoVO;

/**
 * @ClassName   : DrivingInfoDAO.java
 * @Description :  주행 정보를 위한 CRUD DAO 인터페이스 클래스
 * @author 임현아
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.         임현아                    주행 정보를 위한 CRUD DAO 인터페이스 클래스
 * </pre>
 */

@Mapper("drivingInfoDAO")
public interface DrivingInfoDAO {

	/**
	 * 주행정보 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void insertRent(DrivingInfoVO vo) throws Exception;
	
	/**
	 * 주행정보 수정
	 * @param vo
	 * @throws Exception
	 */
	void updateRent(DrivingInfoVO vo) throws Exception;
	
	/**
	 * 주행정보 삭제
	 * @param rentNo
	 * @throws Exception
	 */
	void deleteRent(DrivingInfoVO vo) throws Exception;
	
	/**
	 * 주행정보 상세 조회
	 * @param rentNo
	 * @return
	 * @throws Exception
	 */
	DrivingInfoVO selectRent(DrivingInfoVO vo) throws Exception;
	
	/**
	 * 주행정보 전체 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<DrivingInfoVO> selectRentList() throws Exception;
	
	/**
     * 주행정보 렌트 정보 기준 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<DrivingInfoVO> selectRentList(String rentNo) throws Exception;
	
}
