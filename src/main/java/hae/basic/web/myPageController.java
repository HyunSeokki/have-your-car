package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.mail.iap.Response;

import hae.basic.service.DrivingInfoService;
import hae.basic.service.RentService;
import hae.basic.vo.DrivingInfoVO;
import hae.basic.vo.RentVO;
import net.sf.json.JSONObject;

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

        model.addAttribute("myRentList", rentList);
        
        return "basic/mypage";
    }
    
    @Resource(name = "drivingInfoService")
    private DrivingInfoService drivingInfoService;  

    @RequestMapping(value = "/basic/mypagedetail.do")
    @ResponseBody
    public String getDrivingInfo(@RequestParam String rentNo, HttpServletResponse res) throws Exception {
        logger.debug(rentNo);
        
        res.setContentType("text/html; charset=UTF-8");

        List<DrivingInfoVO> selectDrivingInfoList = drivingInfoService.selectDrivingInfoListByRentNo(rentNo);

//        for (int i = 0; i < selectDrivingInfoList.size(); i++) {
//            System.out.println(selectDrivingInfoList.get(i));
//        }
        
        JSONObject jo = new JSONObject();
        jo.put("data", selectDrivingInfoList);
        
        return jo.toString();
       
//        return "{test : success, test2 : hello }";
    }
    
    
/*    @RequestMapping(value = "/basic/mypagedetail.do")
    @ResponseBody
    public String getDrivingInfo(@RequestParam(value = "rentNo") String rentNo) throws Exception {
        logger.debug(rentNo);
        
        List<DrivingInfoVO> selectDrivingInfoList = drivingInfoService.selectDrivingInfoList(rentNo);
        
        for (int i = 0; i < selectDrivingInfoList.size(); i++) {
            System.out.println(selectDrivingInfoList.get(i));
        }
        return "{test : success, test2 : hello }";
    }
*/}
