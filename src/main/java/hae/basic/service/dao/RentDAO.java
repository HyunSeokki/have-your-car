package hae.basic.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import hae.basic.vo.RentVO;

/**
 * @ClassName   : RentDAO.java
 * @Description :  대여 정보를 위한 CRUD DAO 인터페이스 클래스
 * @author 임현아
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.         임현아                    대여 정보를 위한 CRUD DAO 인터페이스 클래스
 * </pre>
 */

@Mapper("rentDAO")
public interface RentDAO {

	/**
	 * 대여정보 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void insertRent(RentVO vo) throws Exception;
	
	/**
	 * 반납일자 수정
	 * @param vo
	 * @throws Exception
	 */
	void updateRent(RentVO vo) throws Exception;
	
	/**
	 * 대여정보 삭제
	 * @param rentNo
	 * @throws Exception
	 */
	void deleteRent(String rentNo) throws Exception;
	
	/**
	 * 대여정보 상세 조회
	 * @param rentNo
	 * @return
	 * @throws Exception
	 */
	RentVO selectRent(String rentNo) throws Exception;
	
	/**
	 * 대여정보 전체 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<RentVO> selectRentList() throws Exception;
	
}
