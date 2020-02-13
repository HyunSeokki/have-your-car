package hae.basic.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hae.basic.service.ActiveService;
import hae.basic.service.CarService;
import hae.basic.vo.ActiveVO;
import hae.basic.vo.CarVO;
import net.sf.json.JSONArray;

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
    
    @RequestMapping(value = "/main.do")
    public String carMain(@ModelAttribute("carVO") CarVO carVO,
            Model model) throws Exception {
        
        List<CarVO> carList = carService.selectCarList();
        model.addAttribute("carList", carList);
        
        return "car/carTest";
    }
    
    @RequestMapping(value = "/test.do")
    public String test(@ModelAttribute("carVO") CarVO carVO,
            Model model) throws Exception {
        
        List<CarVO> carList = carService.selectCarList();
        model.addAttribute("carList", carList);
        
        return "car/test";
    }
    
    
    @RequestMapping(value = "/selectCar.do")
    @ResponseBody
    public String getActiveState(@RequestParam(value = "carNo") String carNo) throws Exception {
        ActiveVO actVo = activeService.selectActive(carNo);
        return actVo.getStartYn();
    }
    
    @RequestMapping(value = "/updateActiveInfo.do")
    @ResponseBody
    public String updateActiveState(@RequestParam(value = "carNo") String carNo) throws Exception {
        logger.debug(carNo);
        
        ActiveVO actVo = activeService.selectActive(carNo);
        logger.debug("--- 현재 시동 상태 --- : " + actVo.toString());
         
        if(actVo.getStartYn().equals("Y")) { // 시동이 걸려있는 상태라면 --토글-> 시동 끔
            actVo.setStartYn("N");
        } 
        else { // 시동이 꺼져있는 상태라면 --토글-> 시동 킴
            actVo.setStartYn("Y");
        }
        
        activeService.updateActive(actVo);
        
        return actVo.getStartYn();
    }
    
    @RequestMapping(value="/insertDrivingInfo.do")
    @ResponseBody
    public String insertDrivingInfo(
            @RequestParam(value = "drivingInfo") String drivingInfo) throws Exception {
        
        JSONArray arr = JSONArray.fromObject(drivingInfo);
        
        
        
        logger.debug(arr.toString());
        
        return "hello";
    }


}
