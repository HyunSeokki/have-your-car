package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hae.basic.service.CarService;
import hae.basic.service.MapService;
import hae.basic.service.RentService;
import hae.basic.vo.CarVO;
import hae.basic.vo.RentVO;
import hae.basic.vo.UserVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MapController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author OHS
 * @since 2020. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 2. 10.     OHS     	최초 생성
 * </pre>
 */

@Controller
public class MapController extends HController{
    /**
     * CRUD 기본 샘플의 서비스
     */
    @Resource(name = "mapService")
    private MapService mapService;

    @Resource(name = "rentService")
    private RentService rentService;
    
    @Resource(name = "carService")
    private CarService carService;
    
    @RequestMapping(value = "/basic/main.do")
    public String main(Model model) throws Exception {
        
        List<CarVO> resultList = mapService.selectPossibleCar();
        
        model.addAttribute("resultList", resultList);
        return "user/main";
    }
    
    @RequestMapping(value = "/basic/rent.do")
    public String rent(@ModelAttribute("rentVO") RentVO rentVO, 
            Model model) throws Exception {
        
        rentService.insertRent(rentVO);        
        CarVO carInfo = carService.selectCar(rentVO.getCarNo());
        
        model.addAttribute("carInfo",carInfo);
        
        return "user/rent";
    }
}
