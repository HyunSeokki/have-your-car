package hae.basic.service;

import java.util.List;

import hae.basic.vo.BasicSampleVO;
import hae.basic.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserService.java
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

public interface UserService {

    /**
     * 사용자 등록
     * @param vo
     * @return
     * @throws Exception
     */
    void insertUser(UserVO vo) throws Exception;
    
    /**
     * 사용자 수정
     * @param vo
     * @throws Exception
     */
    void updateUser(UserVO vo) throws Exception;
    
    /**
     * 사용자 삭제
     * @param userID
     * @throws Exception
     */
    void deleteUser(String userID) throws Exception;
    
    /**
     * 사용자 상세 조회
     * @param seq
     * @return
     * @throws Exception
     */
    UserVO selectUser(String userID) throws Exception;
    
    /**
     * 사용자 목록 조회
     * @param vo
     * @return
     * @throws Exception
     */
    List<UserVO> selectUserList() throws Exception;
   
}