package hae.basic.web;

import javax.servlet.http.HttpSession;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    @RequestMapping(value = "/main.do")
    public String adminForm(HttpSession session, Model model) throws Exception { // admin mainpage
        
        
        return "admin/main";
    }
    
    @RequestMapping(value = "/register.do") 
    public String registerForm(Model model) throws Exception { // admin car register form
        
        return "admin/register";
    }
    
}
