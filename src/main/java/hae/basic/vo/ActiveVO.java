package hae.basic.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ActiveVO.java
 * @Description : 시동 테이블
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

public class ActiveVO {
    /** 식별번호 **/
    private String carNo;
    /** 시동여부 **/
    private String startYn;
    
    public String getCarNo() {
        return carNo;
    }
    
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }
    
    public String getStartYn() {
        return startYn;
    }
    
    public void setStartYn(String startYn) {
        this.startYn = startYn;
    }
}
