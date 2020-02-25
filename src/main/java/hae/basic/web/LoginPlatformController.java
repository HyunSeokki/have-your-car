package hae.basic.web;

import java.io.BufferedReader;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.RentVO;
import hae.basic.vo.UserVO;

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
public class LoginPlatformController extends HController {
    
    @Resource(name = "userService")
    private UserService userService;
    
    @Resource(name = "rentService")
    private RentService rentService;
    
    @RequestMapping(value = "/basic/index.do")
    public String loginForm(@ModelAttribute("userVO") UserVO userVO,
            Model model) throws Exception {
        
        model.addAttribute("userVO", userVO);
        
        return "user/login";
    }
    
    @RequestMapping(value = "/basic/verifyLogin.do")
    @ResponseBody
    public String verifyLoginForm(HttpServletRequest data) throws Exception {
        Map<String, String> map = convertJSON(data);
        UserVO vo = userService.selectUser(map.get("userID"));
        // 아이디 없음.
        if(vo == null) 
            return "true";
        // 아이디 있음.
        else {
            // 일치하면
            if(vo.getUserPWD().equals(encrypPWD(map.get("userPWD")))) {
                return "true";
            }
            else 
                return "false";
        }
    }
    
    @RequestMapping(value = "/basic/login.do", method = RequestMethod.POST)
    public String loginProcess(@ModelAttribute("userVO") UserVO userVO, HttpSession session, RedirectAttributes rdtr) throws Exception {
        userVO.setUserPWD(encrypPWD(userVO.getUserPWD()));
        UserVO vo = userService.selectUser(userVO.getUserID());
        // 아이디 없음.
        if(vo == null) 
            userService.insertUser(userVO);
        // 아이디 있음.
        else if (!vo.getUserPWD().equals(userVO.getUserPWD())) {
            throw new Exception();
        }            
        
        session.setAttribute("user", userVO.getUserID());
        
        // 대여중인 리스트에 현재 유저가 있을 경우. 바로 렌트페이지로 이동한다.
        List<RentVO> rentList = rentService.selectRentedList();
        for(RentVO rv : rentList) {
            if(rv.getUserID().equals(userVO.getUserID())) {
                logger.debug(rv.toString());
                rdtr.addFlashAttribute("rentVO", rv);
                return "redirect:/basic/rent.do";
            }
        }
        
        if(userVO.getUserID().equals("admin")) {// admin일 경우
            return "redirect:/admin/main.do";
        }
        return "redirect:/basic/main.do";
    }
    
    @RequestMapping(value = "/basic/logout.do", method = RequestMethod.GET)
    public String logoutProcess(HttpSession session) throws Exception {
        session.removeAttribute("user");
        return "redirect:/basic/index.do";
    }
    
    // 가져온 JSON 형식의 Request를 Map 형태로 변환해주는 메소드
    public Map<String, String> convertJSON(HttpServletRequest hsr) {
        Map<String, String> map = new HashMap<>();
        
        StringBuffer json = new StringBuffer();
        String line = null;
     
        try {
            BufferedReader reader = hsr.getReader();
            while((line = reader.readLine()) != null) {
                json.append(line);
                logger.debug(line);
            }
     
        }catch(Exception e) {
            System.out.println("Error reading JSON string: " + e.toString());
        }
        
        String[] objects = json.toString().split("&amp;");
        for(String s : objects) {
            String[] object = s.split("=");
            map.put(object[0], object[1]);
        }
        
        return map;
    }
    
    // 비밀번호는 sha-256으로 암호화하는 메소드.
    public String encrypPWD(String pwd) throws Exception{
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(pwd.getBytes("UTF-8"));
        StringBuffer hexString = new StringBuffer();
        
        for(int i=0; i<hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1)
                hexString.append('0');
            hexString.append(hex);
        }
        
        return hexString.toString();
    }

}
