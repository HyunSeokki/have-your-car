package hae.basic.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveLogVO.java
 * @Description : 시동Log 테이블
 * @author Hyeonju
 * @since 2020. 2. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 7.     Hyeonju     	최초 생성
 * </pre>
 */

public class ActiveLogVO {
    
    /** 시동 On date**/
    private String onDate;
    /** 시동 Off date**/
    private String offDate;
    /** 식별 번호 **/
    private String carNo;
    /** 시동 번호 **/
    private String startNo;
    
    
    public String getOnDate() {
        return onDate;
    }
    
    
    public void setOnDate(String onDate) {
        this.onDate = onDate;
    }
    
    public String getOffDate() {
        return offDate;
    }
    
    public void setOffDate(String offDate) {
        this.offDate = offDate;
    }
    
    public String getCarNo() {
        return carNo;
    }
    
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }
    
    public String getStartNo() {
        return startNo;
    }
   
    public void setStartNo(String startNo) {
        this.startNo = startNo;
    }
}
