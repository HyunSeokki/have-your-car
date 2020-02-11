package hae.basic.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import hae.basic.service.MapService;
import hae.basic.vo.CarVO;
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
public class MapController {
    /**
     * CRUD 기본 샘플의 서비스
     */
    @Resource(name = "mapService")
    private MapService mapService;

    @RequestMapping(value = "/main.do")
    public String main(Model model) throws Exception {
        
        List<CarVO> sampleList = mapService.selectPossibleCar();
        System.out.println(sampleList.toString());
        model.addAttribute("resultList", sampleList);
        return "basic/main";
    }
}