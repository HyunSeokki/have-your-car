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
    String userPW;
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
     * @return the userPW
     */
    public String getUserPW() {
        return userPW;
    }
    /**
     * @param userPW the userPW to set
     */
    public void setUserPW(String userPW) {
        this.userPW = userPW;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "UserVO [userID=" + userID + ", userPW=" + userPW + "]";
    }
    
}
