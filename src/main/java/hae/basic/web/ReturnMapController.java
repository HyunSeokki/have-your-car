package hae.basic.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.net.ntp.TimeStamp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hae.basic.service.ActiveService;
import hae.basic.service.CarService;
import hae.basic.service.DrivingInfoService;
import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.ActiveVO;
import hae.basic.vo.DrivingInfoVO;
import hae.basic.vo.RentVO;

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
public class ReturnMapController extends HController{
    
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
    
    @RequestMapping(value = "/basic/go.do")
    public String goTest() throws Exception {
        return "basic/JunsTest";  
    }
    
    @RequestMapping(value = "/basic/makeData.do")
    public String makeData(@RequestParam("rentNo") String rentNo,
            Model model) throws Exception {
        model.addAttribute("rentNo", rentNo);
        return "basic/makeData";
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
            List<RentVO> rent = rentService.selectRentListByCar(carNo);
            RentVO rentOne = new RentVO();
            for (RentVO item : rent) {
                if(item.getReturnDate()==null)
                    rentOne = item;
            }
            model.addAttribute("rentInfo", rentOne);
            // 차량 주행정보 가져오기
            List<DrivingInfoVO> drv = drivingInfoService.selectDrivingInfoListByRentNo(rentOne.getRentNo());
            model.addAttribute("drv", drv);
            // 차량 정보에서 비용 가져오기
            int cost = carService.selectCar(carNo).getCost();
            model.addAttribute("cost", cost);
            
            return "basic/trip";
        }
    }
    
    @RequestMapping(value= "/basic/insertTestSample.do")
    @ResponseBody
    public void logDatas(@RequestParam String lng, @RequestParam String lat, @RequestParam String rentNo,
            Model model) throws Exception {
        
        DrivingInfoVO dvo = new DrivingInfoVO();
        dvo.setLatitude(lat);
        dvo.setLongitude(lng);
        dvo.setRentNo(rentNo);
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        String timestamp = format.format(System.currentTimeMillis());
        dvo.setTimeStamp(timestamp);
        logger.debug(lng + " " + lat + " " + rentNo + " " + timestamp);
        drivingInfoService.insertDrivingInfo(dvo);
        
    }
    
}
