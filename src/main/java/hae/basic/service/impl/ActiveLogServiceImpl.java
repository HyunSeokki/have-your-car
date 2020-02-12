package hae.basic.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.ActiveLogService;
import hae.basic.service.dao.ActiveLogDAO;
import hae.basic.service.dao.BasicSampleMDAO;
import hae.basic.vo.ActiveLogVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveLogServiceimpl.java
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

@Service("activeLogService")
public class ActiveLogServiceImpl extends HService implements ActiveLogService{
    
    /** MDAO 등록 */
    @Resource(name = "activeLogDAO")
    private ActiveLogDAO activeLogDAO;
    
    @Override
    public void insertActiveLog(ActiveLogVO vo) throws Exception{
        activeLogDAO.insertActiveLog(vo);
    }
    
    @Override
    public void updateActiveLog(ActiveLogVO vo) throws Exception{
        activeLogDAO.updateActiveLog(vo);
    }
    
    @Override
    public void deleteActiveLog(String startNo) throws Exception{
        activeLogDAO.deleteActiveLog(startNo);
    }
    
    @Override
    public ActiveLogVO selectActiveLog(String startNo) throws Exception{
        return activeLogDAO.selectActiveLog(startNo);
    }
    
    @Override
    public List<ActiveLogVO> selectActiveLogList() throws Exception{
        return activeLogDAO.selectActiveLogList();
    }

}




