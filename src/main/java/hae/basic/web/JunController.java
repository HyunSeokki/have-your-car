package hae.basic.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hae.basic.service.ActiveLogService;
import hae.basic.service.ActiveService;
import hae.basic.service.CarService;
import hae.basic.service.DrivingInfoService;
import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.ActiveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JunController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HAVE
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     HAVE     	최초 생성
 * </pre>
 */

@Controller
public class JunController extends HController{
    
    /**
     * CRUD 기본 샘플의 서비스
     */
    @Resource(name = "userService")
    private UserService userService;
    
    @Resource(name = "rentService")
    private RentService rentService;
    
    @Resource(name = "activeService")
    private ActiveService activeService;
    
    @Resource(name = "activeLogService")
    private ActiveLogService activeLogService;
    
    @Resource(name = "carService")
    private CarService carService;
    
    @Resource(name = "drivingInfoService")
    private DrivingInfoService drivingInfoService;
    
    // test login user
    String loginID = "test";

    @RequestMapping(value = "/basic/go.do")
    public String goTest() throws Exception {
        return "basic/JunsTest";  
    }
    
    @RequestMapping(value = "/basic/return.do")
    public String goTrip(@RequestParam("carNo") String carNo,
            Model model) throws Exception {
        logger.debug("진입");
        // 시동이 꺼져 있는지 확인
        ActiveVO temp = activeService.selectActive(carNo);
        if(temp.getStartYn().equals("Y")) {
            // 시동이 걸려있을 때
            // 되돌려보낸다.
            logger.debug("시동 켜져있음");
            return "basic/returnRefuse";
        } else {
            logger.debug("시동 꺼짐");
            // 시동이 꺼져있을 때
            // 렌트 정보 가져오기
            model.addAttribute("rentInfo", rentService.selectRentListByCar(carNo));
            // 시동 로그 가져오기
            model.addAttribute("activeLog", rentService.selectRentListByCar(carNo));
            // 차량 주행정보 가져오기
            model.addAttribute("drivingInfo", rentService.selectRentListByCar(carNo));
            // 차량 정보에서 비용 가져오기
            model.addAttribute("carInfo", rentService.selectRentListByCar(carNo));
            
            
            
            return "basic/trip";
        }
    }
    
    
    
}
