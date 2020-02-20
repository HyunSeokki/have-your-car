package hae.basic.vo;

/**
 * @ClassName   : DrivingInfoVO.java
 * @Description : 주행 관련 정보 vo 클래스
 * @author 임현아
 * @since 2020.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.        임현아                                      주행 관련 정보 vo 클래스
 * </pre>
 */
public class DrivingInfoVO {

    /** 대여 번호 */
    private String rentNo;
    
    /** 위도 */
    private String latitude;
    
    /** 경도 */
    private String longitude;
    
    /** 시간 */
    private String timeStamp;
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
     * @return the latitude
     */
    public String getLatitude() {
        return latitude;
    }
    /**
     * @param latitude the latitude to set
     */
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    /**
     * @return the longitude
     */
    public String getLongitude() {
        return longitude;
    }
    /**
     * @param longitude the longitude to set
     */
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    /**
     * @return the timeStamp
     */
    public String getTimeStamp() {
        return timeStamp;
    }
    /**
     * @param timeStamp the timeStamp to set
     */
    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "DrivingInfoVO [rentNo=" + rentNo + ", latitude=" + latitude + ", longitude=" + longitude
                + ", timeStamp=" + timeStamp + "]";
    }

	
}
