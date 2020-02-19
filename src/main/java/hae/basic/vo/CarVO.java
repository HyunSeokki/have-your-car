package hae.basic.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarVO.java
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

public class CarVO {

    int carNo;
    String carSize;
    String carType;
    int mileage;
    String birth;
    int capacity;
    int cost;
    String latitude;
    String longitude;
    String imgSrc;
    
    /**
     * @return the carNo
     */
    public int getCarNo() {
        return carNo;
    }
    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(int carNo) {
        this.carNo = carNo;
    }
    /**
     * @return the carSize
     */
    public String getCarSize() {
        return carSize;
    }
    /**
     * @param carSize the carSize to set
     */
    public void setCarSize(String carSize) {
        this.carSize = carSize;
    }
    /**
     * @return the carType
     */
    public String getCarType() {
        return carType;
    }
    /**
     * @param carType the carType to set
     */
    public void setCarType(String carType) {
        this.carType = carType;
    }
    /**
     * @return the mileage
     */
    public int getMileage() {
        return mileage;
    }
    /**
     * @param mileage the mileage to set
     */
    public void setMileage(int mileage) {
        this.mileage = mileage;
    }
    /**
     * @return the birth
     */
    public String getBirth() {
        return birth;
    }
    /**
     * @param birth the birth to set
     */
    public void setBirth(String birth) {
        this.birth = birth;
    }
    /**
     * @return the capacity
     */
    public int getCapacity() {
        return capacity;
    }
    /**
     * @param capacity the capacity to set
     */
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    /**
     * @return the cost
     */
    public int getCost() {
        return cost;
    }
    /**
     * @param cost the cost to set
     */
    public void setCost(int cost) {
        this.cost = cost;
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
     * @return the imgSrc
     */
    public String getImgSrc() {
        return imgSrc;
    }
    /**
     * @param imgSrc the imgSrc to set
     */
    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CarVO [carNo=" + carNo + ", carSize=" + carSize + ", carType=" + carType + ", mileage=" + mileage
                + ", birth=" + birth + ", capacity=" + capacity + ", cost=" + cost + ", latitude=" + latitude
                + ", longitude=" + longitude + ", imgSrc=" + imgSrc + "]";
    }



}
