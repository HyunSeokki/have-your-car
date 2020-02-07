package hae.basic.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserInfoVO.java
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

public class UserVO {

    String userID;
    String userPWD;
    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }
    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }
    /**
     * @return the userPWD
     */
    public String getUserPWD() {
        return userPWD;
    }
    /**
     * @param userPWD the userPWD to set
     */
    public void setUserPWD(String userPWD) {
        this.userPWD = userPWD;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "UserVO [userID=" + userID + ", userPWD=" + userPWD + "]";
    }
  
    
}
