package hae.basic.service;

import java.util.List;

import hae.basic.vo.DrivingInfoVO;
import hae.basic.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DrinvingInfoService.java
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

public interface DrivingInfoService {

    /**
     * 운전정보 등록
     * @param vo
     * @return
     * @throws Exception
     */
    void insertDrivingInfo(DrivingInfoVO vo) throws Exception;
    
    /**
     * 주행정보 삭제
     * @param vo
     * @throws Exception
     */
    void deleteDrivingInfo(DrivingInfoVO vo) throws Exception;

    
    /**
     * 주행정보 상세 조회
     * @param DrivingInfoNo
     * @return
     * @throws Exception
     */
    DrivingInfoVO selectDrivingInfo(DrivingInfoVO vo) throws Exception;
    
    /**
     * 주행정보 전체 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<DrivingInfoVO> selectDrivingInfoList() throws Exception;
    
    /**
     * 주행정보 렌트 정보 기준 조회
     * @param rentNo
     * @return
     * @throws Exception
     */
    List<DrivingInfoVO> selectDrivingInfoList(String rentNo) throws Exception;
}