package hae.basic.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import hae.basic.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDAO.java
 * @Description : 유저 DAO
 * @author HAVE
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.     HAVE     	최초 생성
 * </pre>
 */

@Mapper("UserDAO")
public interface UserDAO {

    /* 유저 목록 불러오기 */
    List<UserVO> selectUserList();
    /* 유저 삽입  */
    void insertUser(UserVO vo);
    /* 유저 정보 불러오기 */
    UserVO selectUser(String userID);
    /* 유저 정보 업데이트 */
    void updateUser(UserVO vo);
    /* 유저 삭제하기 */ 
    void deleteUser(String userID);
    
}
