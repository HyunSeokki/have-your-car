package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.RentService;
import hae.basic.service.dao.RentDAO;
import hae.basic.vo.RentVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RentServiceImpl.java
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

@Service("rentService")
public class RentServiceImpl extends HService implements RentService {
    
    /** DAO 등록 */
    @Resource(name = "rentDAO")
    private RentDAO rentDAO;
    

    /*
     * @see hae.basic.service.RentService#insertRent(hae.basic.vo.RentVO)
     */
    @Override
    public void insertRent(RentVO vo) throws Exception {
        // TODO Auto-generated method stub
        rentDAO.insertRent(vo);
    }

    /*
     * @see hae.basic.service.RentService#updateRent(hae.basic.vo.RentVO)
     */
    @Override
    public void updateRent(RentVO vo) throws Exception {
        // TODO Auto-generated method stub
        rentDAO.insertRent(vo);
    }

    /*
     * @see hae.basic.service.RentService#deleteRent(java.lang.String)
     */
    @Override
    public void deleteRent(String seq) throws Exception {
        // TODO Auto-generated method stub
        rentDAO.deleteRent(seq);
    }

    /*
     * @see hae.basic.service.RentService#selectRent(java.lang.String)
     */
    @Override
    public RentVO selectRent(String seq) throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRent(seq);
    }

    /*
     * @see hae.basic.service.RentService#selectRentList(hae.basic.vo.RentVO)
     */
    @Override
    public List<RentVO> selectRentList(RentVO vo) throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRentList(vo);
    }

}
