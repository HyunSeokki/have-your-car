package hae.basic.service;

import java.util.List;

import hae.basic.vo.CarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MapService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author OHS
 * @since 2020. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 11.     OHS     	최초 생성
 * </pre>
 */

public interface MapService {
    List<CarVO> selectPossibleCar() throws Exception;
}
