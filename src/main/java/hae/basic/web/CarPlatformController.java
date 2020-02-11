package hae.basic.web;

import java.util.List;

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
public class CarPlatformController extends HController {
    
    @Resource(name = "carService")
    private CarService carService;
    
    @Resource(name = "activeService")
    private ActiveService activeService;
    
    @RequestMapping(value = "/car/main.do")
    public String carMain(@ModelAttribute("carVO") CarVO carVO,
            Model model) throws Exception {
        
        List<CarVO> carList = carService.selectCarList();
        model.addAttribute("carList", carList);
        
        return "car/carTest";
    }
    
    @RequestMapping(value = "/car/selectCar.do")
    @ResponseBody
    public String getActiveState(@RequestParam(value = "carNo") String carNo) throws Exception {
        ActiveVO actVo = activeService.selectActive(carNo);
        return actVo.getStartYn();
    }
    
    @RequestMapping(value = "/car/updateActiveInfo.do")
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



}