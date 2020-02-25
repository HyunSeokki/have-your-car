package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hae.basic.service.ActiveService;
import hae.basic.service.CarService;
import hae.basic.service.DrivingInfoService;
import hae.basic.service.RentService;
import hae.basic.vo.ActiveVO;
import hae.basic.vo.CarVO;
import hae.basic.vo.DrivingInfoVO;
import hae.basic.vo.RentVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarPlatformController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author 6800410
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     6800410     	최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/car")
public class CarPlatformController extends HController {
    
    @Resource(name = "carService")
    private CarService carService;
    
    @Resource(name = "activeService")
    private ActiveService activeService;
    
    @Resource(name = "rentService")
    private RentService rentService;
    
    @Resource(name = "drivingInfoService")
    private DrivingInfoService drivingInfoService;

    @RequestMapping(value = "/main.do")
    public String carPopup (@RequestParam(value = "rentNo") String rentNo,
            Model model) throws Exception {
        
        RentVO rentInfo = rentService.selectRent(rentNo);
        CarVO carInfo = carService.selectCar(rentInfo.getCarNo());
        
        model.addAttribute("carInfo", carInfo);
        model.addAttribute("rentInfo", rentInfo);
        
        return "car/carPopup";
    }
    
    /*@RequestMapping(value = "/main.do")
    public String carMain(@RequestParam(value = "rentNo") String rentNo,
            Model model) throws Exception {
        
        logger.debug(rentNo);
        
        List<ActiveVO> carList = activeService.selectActiveList();
        
        model.addAttribute("carList", carList);
        
        return "car/carTest";
    }*/
    
    @RequestMapping(value = "/selectCar.do")
    @ResponseBody
    public String getCarDetail(@RequestParam(value = "carNo") String carNo) throws Exception {
        ActiveVO activeVO = activeService.selectActive(carNo);
        return activeVO.getStartYn();
    }
    
    @RequestMapping(value = "/updateActiveInfo.do")
    @ResponseBody
    public String updateActiveState(@RequestParam(value = "carNo") String carNo) throws Exception {
        ActiveVO activeVO = activeService.selectActive(carNo);
        
        if(activeVO.getStartYn().equals("Y")) { // 시동이 걸려있는 상태라면 --토글-> 시동 끔
            activeVO.setStartYn("N");
        } 
        else { // 시동이 꺼져있는 상태라면 --토글-> 시동 킴
            activeVO.setStartYn("Y");
        }
        activeService.updateActive(activeVO);
        
        return activeVO.getStartYn();
    }
    
    @RequestMapping(value = "/insertDrivingInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public void insertDrivingInfo(HttpServletRequest request, @RequestBody String jsonData) throws Exception {
        JSONObject drivingInfo = JSONObject.fromObject(jsonData);
        
        if(drivingInfo != null) {
            DrivingInfoVO dvin = new DrivingInfoVO();
            dvin.setRentNo(drivingInfo.getString("rentNo"));
            dvin.setLatitude(drivingInfo.getString("latitude"));
            dvin.setLongitude(drivingInfo.getString("longitude"));
            dvin.setTimeStamp(drivingInfo.getString("timeStamp"));
            
            logger.debug(dvin.toString());
            drivingInfoService.insertDrivingInfo(dvin);
            
            CarVO cvo = carService.selectCar(drivingInfo.getString("carNo"));
            cvo.setLatitude(drivingInfo.getString("latitude"));
            cvo.setLongitude(drivingInfo.getString("longitude"));
            carService.updateCar(cvo);
        }
     
    }

}
