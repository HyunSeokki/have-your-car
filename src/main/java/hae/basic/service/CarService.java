package hae.basic.service;

import java.util.List;

import hae.basic.vo.CarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HAVE
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     HAVE     	최초 생성
 * </pre>
 */

public interface CarService {

    /**
     * 자동차 정보 등록
     * @param vo
     * @return
     * @throws Exception
     */
    void insertCar(CarVO vo) throws Exception;
    
    /**
     * 자동차 정보 수정
     * @param vo
     * @throws Exception
     */
    void updateCar(CarVO vo) throws Exception;
    
    /**
     * 자동차 정보 삭제
     * @param carNo
     * @throws Exception
     */
    void deleteCar(String carNo) throws Exception;
    
    /**
     * 자동차 정보 상세 조회
     * @param carNo
     * @return
     * @throws Exception
     */
    CarVO selectCar(String carNo) throws Exception;
    
    /**
     * 자동차 정보 목록 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<CarVO> selectCarList() throws Exception;
  
    
}
