package hae.basic.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import hae.basic.vo.CarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HAVE
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.     HAVE     	최초 생성
 * </pre>
 */

@Mapper("carDAO")
public interface CarDAO {

    /* 자동차 목록 불러오기 */
    List<CarVO> selectCarList();
    /* 자동차 정보 삽입하기 */
    void insertCar(CarVO vo);
    /* 자동차 정보 가져오기 */
    CarVO selectCar(String carNo);
    /* 자동차 정보 업데이트 */
    void updateCar(CarVO vo);
    /* 자동차 정보 삭제 */
    void deleteCar(String carNo);

}
