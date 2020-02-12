package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.ActiveService;
import hae.basic.service.dao.ActiveDAO;
import hae.basic.vo.ActiveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveServiceimpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author OHS
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     OHS     	최초 생성
 * </pre>
 */

@Service("activeService")
public class ActiveServiceImpl extends HService implements ActiveService{
    /** MDAO 등록 */
    @Resource(name = "activeDAO")
    private ActiveDAO activeDAO;
    
    @Override
    public void insertActive(ActiveVO vo) throws Exception{
        activeDAO.insertActive(vo);
    }
    
    @Override
    public void updateActive(ActiveVO vo) throws Exception{
        activeDAO.updateActive(vo);
    }
    
    @Override
    public void deleteActive(String carNo) throws Exception{
        activeDAO.deleteActive(carNo);
    }
    
    @Override
    public ActiveVO selectActive(String carNo) throws Exception{
        return activeDAO.selectActive(carNo);
    }
    
    @Override
    public List<ActiveVO> selectActiveList(ActiveVO vo) throws Exception{
        return activeDAO.selectActiveList(vo);
    }
}
