package hae.basic.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import hae.basic.vo.ActiveLogVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveLogDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author ableFrame
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.     ableFrame     	최초 생성
 * </pre>
 */

@Mapper("activeLogDAO")
public interface ActiveLogDAO {
    /**
     * 시동Log정보 등록
     * @param vo
     * @return
     * @throws Exception
     */
    void insertActiveLog(ActiveLogVO vo) throws Exception;
    
    /**
     * 시동Log정보 수정
     * @param vo
     * @throws Exception
     */
    void updateActiveLog(ActiveLogVO vo) throws Exception;
    
    /**
     * 시동Log정보 삭제
     * @param startNo
     * @throws Exception
     */
    void deleteActiveLog(String startNo) throws Exception;
    
    /**
     * 시동Log정보 조회
     * @param startNo
     * @return
     * @throws Exception
     */
    ActiveLogVO selectActiveLog(String startNo) throws Exception;
    
    /**
     * 시동Log정보 목록 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<ActiveLogVO> selectActiveLogList(ActiveLogVO vo) throws Exception;
}
