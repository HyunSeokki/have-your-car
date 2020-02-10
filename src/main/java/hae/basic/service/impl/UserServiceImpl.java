package hae.basic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import hae.basic.service.BasicSampleService;
import hae.basic.service.UserService;
import hae.basic.service.dao.BasicSampleMDAO;
import hae.basic.service.dao.UserDAO;
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

@Service("UserService")
public class UserServiceImpl extends HService implements UserService {
    
    /** MDAO 등록 */
    @Resource(name = "UserDAO")
    private UserDAO userDAO;
    
    /*
     * @see hae.basic.service.UserService#insertUser(hae.basic.vo.UserVO)
     */
    @Override
    public void insertUser(UserVO vo) throws Exception {
        userDAO.insertUser(vo);
    }

    /*
     * @see hae.basic.service.UserService#updateUser(hae.basic.vo.UserVO)
     */
    @Override
    public void updateUser(UserVO vo) throws Exception {
        userDAO.updateUser(vo); 
    }

    /*
     * @see hae.basic.service.UserService#deleteUser(java.lang.String)
     */
    @Override
    public void deleteUser(String userID) throws Exception {
        userDAO.deleteUser(userID);
    }

    /*
     * @see hae.basic.service.UserService#selectUser(java.lang.String)
     */
    @Override
    public UserVO selectUser(String userID) throws Exception {
        return userDAO.selectUser(userID);
    }

    /*
     * @see hae.basic.service.UserService#selectUserList(hae.basic.vo.UserVO)
     */
    @Override
    public List<UserVO> selectUserList() throws Exception {
        return userDAO.selectUserList();
    }
}

