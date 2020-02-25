package hae.basic.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
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
        rentDAO.updateRent(vo);
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
    public RentVO selectRent(String rentNo) throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRent(rentNo);
    }

    /*
     * @see hae.basic.service.RentService#selectRentList(hae.basic.vo.RentVO)
     */
    @Override
    public List<RentVO> selectRentList() throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRentList();
    }

    /*
     * @see hae.basic.service.RentService#selectRentListByCar(java.lang.String)
     */
    @Override
    public List<RentVO> selectRentListByCar(String carNo) throws Exception {
        // TODO Auto-generated method stub
        List<RentVO> temp = new ArrayList<RentVO>();
        for(RentVO items : rentDAO.selectRentList()) {
            if(items.getCarNo().equals(carNo))
                temp.add(items);
        }
        
        return temp;
    }

    /*
     * @see hae.basic.service.RentService#selectRentListByUserID(java.lang.String)
     */
    @Override
    public List<RentVO> selectRentListByUserID(String userID) throws Exception {
        // TODO Auto-generated method stub
        List<RentVO> temp =  new ArrayList<RentVO>();
        for(RentVO items : rentDAO.selectRentList()) {
            if(items.getUserID().equals(userID))
                temp.add(items);
        }
        
        return temp;
    }

    /*
     * @see hae.basic.service.RentService#selectRentByCarNo(java.lang.String)
     */
    @Override
    public RentVO selectRentByCarNo(String carNo) throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRentByCarNo(carNo);
    }

    /*
     * @see hae.basic.service.RentService#selectRentedList()
     */
    @Override
    public List<RentVO> selectRentedList() throws Exception {
        // TODO Auto-generated method stub
        return rentDAO.selectRentedList();
    }

}
