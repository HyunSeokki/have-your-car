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
 * @Description : 클래스 설명을 기술합니다.
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

    List<UserVO> selectUser();
    void insertUser(UserVO vo);
    UserVO selectUser(String userID);
    void updateUser(UserVO vo);
    void deleteUser(String userID);
    
}
