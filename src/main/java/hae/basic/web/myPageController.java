package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import hae.basic.service.RentService;
import hae.basic.service.UserService;
import hae.basic.vo.BasicSampleVO;
import hae.basic.vo.RentVO;
import hae.basic.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : myPageController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author ableFrame
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     ableFrame     	최초 생성
 * </pre>
 */

@Controller
public class myPageController extends HController {

    @Resource(name = "rentService")
    private RentService rentService;
    
    @RequestMapping(value = "/basic/mypage.do")
    public String rentList(@ModelAttribute("userID") String userID,
            Model model) throws Exception {
        
        // temp
        userID = "user1";
        
        List<RentVO> rentList = rentService.selectRentListByUserID(userID);
        System.out.println(rentList);
        model.addAttribute("myRentList", rentList);
        
        return "basic/mypage";
    }
 }
