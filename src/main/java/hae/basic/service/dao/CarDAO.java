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

@Mapper("CarDAO")
public interface CarDAO {

    List<CarVO> selectCar();
    void insertCar(CarVO vo);
    CarVO selectCar(String carNo);
    void updateCar(CarVO vo);
    void deleteCar(String carNo);

}
