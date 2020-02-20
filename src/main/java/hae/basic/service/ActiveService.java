package hae.basic.service;

import java.util.List;

import hae.basic.vo.ActiveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveService.java
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

public interface ActiveService {
    /**
     * 시동정보 등록
     * @param vo
     * @return
     * @throws Exception
     */
    void insertActive(ActiveVO vo) throws Exception;
    
    /**
     * 시동정보 수정
     * @param vo
     * @throws Exception
     */
    void updateActive(ActiveVO vo) throws Exception;
    
    /**
     * 시동정보 삭제
     * @param carNo
     * @throws Exception
     */
    void deleteActive(String carNo) throws Exception;
    
    /**
     * 시동정보 조회
     * @param carNo
     * @return
     * @throws Exception
     */
    ActiveVO selectActive(String carNo) throws Exception;
    
    /**
     * 시동정보 목록 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<ActiveVO> selectActiveList() throws Exception;
}
