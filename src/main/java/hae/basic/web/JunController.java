package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hae.basic.service.ActiveService;
import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.ActiveVO;
import hae.basic.vo.UserVO;

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

public class JunController {
    
    /**
     * CRUD 기본 샘플의 서비스
     */
    @Resource(name = "userService")
    private UserService userService;
    
    @Resource(name = "rentService")
    private RentService rentService;
    
    @Resource(name = "ActiveService")
    private ActiveService activeService;

    @Resource(name = "/basic/return.do")
    public String goTrip(@RequestParam("carNo") String carNo, Model model) throws Exception {
        
        // 시동이 꺼져 있는지 확인
        ActiveVO temp = activeService.selectActive(carNo);
        if(temp.getStartYn() == "Y") {
            // 시동이 걸려있을 때
            // 되돌려보낸다.
        } else {
            // 시동이 꺼져있을 때
            model.addAttribute("carNo", carNo);
            return "basic/trip";
        }
        
        return carNo;
    }
    
    
    
}
