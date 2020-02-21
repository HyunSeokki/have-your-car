package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hae.basic.service.CarService;
import hae.basic.vo.CarVO;

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
    private CarService carService;
    
    @RequestMapping(value = "/main.do")
    public String adminForm(HttpSession session, Model model) throws Exception { // admin mainpage
        
        
        return "admin/main";
    }
    
    @RequestMapping(value = "/register.do") 
    public String registerForm(Model model) throws Exception { // admin car register form        
        List<CarVO> resultList = carService.selectStandard();
        
        model.addAttribute("resultList", resultList);
        return "admin/register";
    }
    
    @RequestMapping(value = "/registerCar.do") 
    public String register(Model model) throws Exception { // admin car register form
        
       
        return "admin/register";
    }
}
