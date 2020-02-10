package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.DrivingInfoService;
import hae.basic.service.dao.DrivingInfoDAO;
import hae.basic.vo.DrivingInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DrivingInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author ableFrame
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     ableFrame     	최초 생성
 * </pre>
 */

@Service("drivingInfoService")
public class DrivingInfoServiceImpl extends HService implements DrivingInfoService {
    
    /** MDAO 등록 */
    @Resource(name = "drivingInfoDAO")
    private DrivingInfoDAO drivingInfoDAO;
    
    /*
     * @see hae.basic.service.DrivingInfoService#insertDrivingInfo(hae.basic.vo.DrivingInfoVO)
     */
    @Override
    public void insertDrivingInfo(DrivingInfoVO vo) throws Exception {
        drivingInfoDAO.insertDrivingInfo(vo);
    }

    /*
     * @see hae.basic.service.DrivingInfoService#deleteDrivingInfo(java.lang.String)
     */
    @Override
    public void deleteDrivingInfo(DrivingInfoVO vo) throws Exception {
        drivingInfoDAO.deleteDrivingInfo(vo);
    }

    /*
     * @see hae.basic.service.DrivingInfoService#selectDrivingInfo(java.lang.String)
     */
    @Override
    public List<DrivingInfoVO> selectDrivingInfoList(String rentNo) throws Exception {
        return drivingInfoDAO.selectDrivingInfoList(rentNo);
    }

    /*
     * @see hae.basic.service.DrivingInfoService#selectDrivingInfoList(hae.basic.vo.BasicSampleVO)
     */
//    @Override
//    public List<DrivingInfoVO> selectDrivingInfoList() throws Exception {
//        return drivingInfoDAO.selectDrivingInfoList();
//    }

    /*
     * @see hae.basic.service.DrinvingInfoService#selectDrivingInfo(hae.basic.vo.DrivingInfoVO)
     */
    @Override
    public DrivingInfoVO selectDrivingInfo(DrivingInfoVO vo) throws Exception {
        // TODO Auto-generated method stub
        return drivingInfoDAO.selectDrivingInfo(vo);
    }
}
