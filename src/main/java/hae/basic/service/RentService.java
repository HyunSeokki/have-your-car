package hae.basic.service;

import java.util.List;

import hae.basic.vo.BasicSampleVO;
import hae.basic.vo.RentVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RentService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author 6800410
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     6800410     	최초 생성
 * </pre>
 */

public interface RentService {
    
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
     * @param seq
     * @throws Exception
     */
    void deleteRent(String seq) throws Exception;
    
    /**
     * 대여정보 상세 조회
     * @param seq
     * @return
     * @throws Exception
     */
    RentVO selectRent(String seq) throws Exception;
    
    /**
     * 대여정보 전체 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<RentVO> selectRentList() throws Exception;
    
    /**
     * 대여정보 차 번호로 조회
     * @param String
     * @return
     * @throws Exception
     */
    List<RentVO> selectRentListByCar(String carNo) throws Exception;
    
    /**
     * 대여정보 유저 아이디로 조회
     * @param String
     * @return
     * @throws Exception
     */
    List<RentVO> selectRentListByUserID(String userID) throws Exception;
    
    
    RentVO selectRentByCarNo(String carNo) throws Exception;
}
