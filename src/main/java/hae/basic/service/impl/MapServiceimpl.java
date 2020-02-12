package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.MapService;
import hae.basic.service.dao.MapDAO;
import hae.basic.vo.CarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MapServiceimpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author OHS
 * @since 2020. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 11.     OHS     	최초 생성
 * </pre>
 */

@Service("mapService")
public class MapServiceimpl extends HService implements MapService{

    @Resource(name = "mapDAO")
    private MapDAO mapDAO;
    
    @Override
    public List<CarVO> selectPossibleCar() throws Exception{
        return mapDAO.selectPossibleCar();
    }
}
