package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.CarService;
import hae.basic.service.dao.CarDAO;
import hae.basic.vo.CarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarServiceImpl.java
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

@Service("carService")
public class CarServiceImpl extends HService implements CarService{

    /** MDAO 등록*/
    @Resource(name = "carDAO")
    private CarDAO carDAO;
    
    /*
     * @see hae.basic.service.CarService#insertCar(hae.basic.vo.CarVO)
     */
    @Override
    public void insertCar(CarVO vo) throws Exception {
        // TODO Auto-generated method stub
        carDAO.insertCar(vo);
    }

    /*
     * @see hae.basic.service.CarService#updateCar(hae.basic.vo.CarVO)
     */
    @Override
    public void updateCar(CarVO vo) throws Exception {
        // TODO Auto-generated method stub
        carDAO.updateCar(vo);
    }

    /*
     * @see hae.basic.service.CarService#deleteCar(java.lang.String)
     */
    @Override
    public void deleteCar(String carNo) throws Exception {
        // TODO Auto-generated method stub
        carDAO.deleteCar(carNo);
    }

    /*
     * @see hae.basic.service.CarService#selectCar(java.lang.String)
     */
    @Override
    public CarVO selectCar(String carNo) throws Exception {
        // TODO Auto-generated method stub
        return carDAO.selectCar(carNo);
    }

    /*
     * @see hae.basic.service.CarService#selectCarList(hae.basic.vo.CarVO)
     */
    @Override
    public List<CarVO> selectCarList() throws Exception {
        // TODO Auto-generated method stub
        return carDAO.selectCarList();
    }
}
