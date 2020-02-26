package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hae.basic.service.ActiveService;
import hae.basic.service.CarService;
import hae.basic.service.DrivingInfoService;
import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.ActiveVO;
import hae.basic.vo.CarVO;
import hae.basic.vo.DrivingInfoVO;
import hae.basic.vo.RentVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : JunController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HAVE
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     HAVE     	최초 생성
 *               </pre>
 */

@Controller
public class ReturnMapController extends HController {

    /**
     * CRUD 기본 샘플의 서비스
     */
    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "rentService")
    private RentService rentService;

    @Resource(name = "activeService")
    private ActiveService activeService;

    @Resource(name = "carService")
    private CarService carService;

    @Resource(name = "drivingInfoService")
    private DrivingInfoService drivingInfoService;

    @RequestMapping(value = "/basic/return.do")
    public String goTrip(@RequestParam("carNo") String carNo, @RequestParam("rentNo") String rentNo, Model model)
            throws Exception {
        logger.debug("진입 : " + carNo);
        // 시동이 꺼져 있는지 확인
        ActiveVO temp = activeService.selectActive(carNo);
        if (temp.getStartYn().equals("Y")) {
            // 시동이 걸려있을 때
            // 되돌려보낸다.
            logger.debug("시동 켜져있음");
            return "basic/returnRefuse";
        } else {
            logger.debug("시동 꺼짐");
            // 시동이 꺼져있을 때
            // 렌트 정보 가져오기
            RentVO rentOne = rentService.selectRent(rentNo);
            rentService.updateRent(rentOne);
            rentOne = rentService.selectRent(rentNo);
            model.addAttribute("rentInfo", rentOne);
            // 차량 주행정보 가져오기
            List<DrivingInfoVO> drv = drivingInfoService.selectDrivingInfoListByRentNo(rentOne.getRentNo());
            if(drv.size() == 0) {
                DrivingInfoVO tempVO = new DrivingInfoVO();
                // drv 임시 값 집어넣기
                CarVO carVO = carService.selectCar(rentOne.getCarNo());
                tempVO.setLatitude(carVO.getLatitude());
                tempVO.setLongitude(carVO.getLongitude());
                tempVO.setRentNo(rentNo);
                tempVO.setTimeStamp("");
                drv.add(tempVO);
            }
            model.addAttribute("drv", drv);
            // 차량 정보에서 비용 가져오기
            int cost = carService.selectCar(carNo).getCost();
            model.addAttribute("cost", cost);

            return "user/trip";
        }
    }

    @RequestMapping(value = "/basic/payAndReturn.do")
    public String payAndReturn(@RequestParam float distance, @RequestParam String lat, @RequestParam String lng,
            @RequestParam String rentNo, Model model) throws Exception {
        /*
         * 데이터 업데이트
         */
        RentVO rentInfo = rentService.selectRent(rentNo);

        CarVO tempCar = carService.selectCar(rentInfo.getCarNo());

        /*if (!(lat.equals("0") || lng.equals("0"))) {
            tempCar.setLatitude(lat);
            tempCar.setLongitude(lng);
        }*/
        tempCar.setMileage(tempCar.getMileage() + distance);
        carService.updateCar(tempCar);

        return "redirect:/basic/main.do";
    }

}
