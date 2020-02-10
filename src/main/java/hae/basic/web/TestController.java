package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import hae.basic.service.UserService;
import hae.basic.vo.BasicSampleVO;
import hae.basic.vo.UserVO;

/**
 * @ClassName   : BasicSampleController.java
 * @Description : 게시판 관련 업무 컨트롤러 클래스
 * @author ADM기술팀
 * @since 2016. 7. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 1.       ADM기술팀                                      최초 생성
 * </pre>
 */

@Controller
public class TestController extends HController {

	/**
	 * CRUD 기본 샘플의 서비스
	 */
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(value = "/basic/userList.do")
    public String test(@ModelAttribute("userVO") UserVO userVO,
            Model model) throws Exception {
	    
	    List<UserVO> sampleList = userService.selectUserList();
	    logger.debug("나는 사이즈에여 " + sampleList.size() + "");
	    System.out.println(sampleList.toString());
        model.addAttribute("resultList", sampleList);
        
        return "basic/basicSampleList";
    }


}