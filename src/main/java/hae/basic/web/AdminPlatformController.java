package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hae.basic.service.CarService;
import hae.basic.service.RentService;
import hae.basic.vo.CarVO;
import hae.basic.vo.RentVO;
import net.sf.json.JSONObject;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LoginPlatformController.java
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
@RequestMapping(value = "/admin")
public class AdminPlatformController extends HController {
    
    @Resource(name = "carService")
    CarService carService;
    
    @Resource(name = "rentService")
    RentService rentService;
    
    @RequestMapping(value = "/main.do")
    public String adminForm(HttpSession session, Model model) throws Exception { // admin mainpage
        
        List<CarVO> carList = carService.selectCarList();
        List<RentVO> rentList = rentService.selectRentList();
        
        model.addAttribute("carList", carList);
        model.addAttribute("rentList", rentList);
        
        return "admin/main";
    }
    
    @RequestMapping(value = "/getCurrentPosition.do")
    @ResponseBody
    public String getCurrentPosition(HttpServletResponse res) throws Exception {
        res.setContentType("text/html; charset=UTF-8");

        List<CarVO> carList = carService.selectCarList();
        List<RentVO> rentList = rentService.selectRentList();

        JSONObject jo = new JSONObject();
        jo.put("carList", carList);
        jo.put("rentList", rentList);
        
        return jo.toString();   
    }
    
    @RequestMapping(value = "/register.do") 
    public String registerForm(Model model) throws Exception { // admin car register form        
        List<CarVO> resultList = carService.selectStandard();
        
        model.addAttribute("resultList", resultList);
        return "admin/register";
    }
    
    @ResponseBody
    @RequestMapping(value = "/registerCar.do") 
    public void register(@RequestBody String jsonData, Model model) throws Exception { // admin car register form
        JSONObject carInfo = JSONObject.fromObject(jsonData);
        
        CarVO carVO = new CarVO();
        carVO.setCarType(carInfo.getString("carType"));
        carVO.setLatitude(carInfo.getString("latitude"));
        carVO.setLongitude(carInfo.getString("longitude"));

        carService.insertCar(carVO);
    }
}
