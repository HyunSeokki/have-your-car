package hae.basic.vo;

/**
 * @ClassName   : RentVO.java
 * @Description : 대여 관련 정보 vo 클래스
 * @author 임현아
 * @since 2020.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.        임현아                                   대여 관련 정보 vo 클래스
 * </pre>
 */
public class RentVO {
    
    /** 대여 번호 */
    private String rentNo;
    /** 차량 식별 번호 */
    private String carNo;
    /** 사용자 아이디 */
    private String userID;
    /** 대여 날짜 */
    private String rentDate;
    /** 반납 날짜 */
    private String returnDate;
    /**
     * @return the rentNo
     */
    public String getRentNo() {
        return rentNo;
    }
    /**
     * @param rentNo the rentNo to set
     */
    public void setRentNo(String rentNo) {
        this.rentNo = rentNo;
    }
    /**
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }
    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }
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
     * @return the rentDate
     */
    public String getRentDate() {
        return rentDate;
    }
    /**
     * @param rentDate the rentDate to set
     */
    public void setRentDate(String rentDate) {
        this.rentDate = rentDate;
    }
    /**
     * @return the returnDate
     */
    public String getReturnDate() {
        return returnDate;
    }
    /**
     * @param returnDate the returnDate to set
     */
    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "RentVO [rentNo=" + rentNo + ", carNo=" + carNo + ", userID=" + userID + ", rentDate=" + rentDate
                + ", returnDate=" + returnDate + "]";
    }
    
    
	
}
