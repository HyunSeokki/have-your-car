package hae.basic.web;

import hae.basic.service.BasicSampleService;
import hae.basic.vo.BasicSampleVO;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import able.com.web.HController;

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
public class BasicSampleController extends HController {

	/**
	 * CRUD 기본 샘플의 서비스
	 */
	@Resource(name = "basicSampleService")
	private BasicSampleService basicSampleService;

	/**
	 * CRUD 기본 샘플의 목록을 조회한다.
	 * @param basicSampleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
//	@RequestMapping(value = "/basic/   .do")
//	public String selectItemList(@ModelAttribute("basicSampleVO") BasicSampleVO basicSampleVO,
//								Model model) throws Exception {
//
//		List<BasicSampleVO> sampleList = basicSampleService.selectSampleList(basicSampleVO);
//		model.addAttribute("resultList", sampleList);
//
//		return "basic/basicSampleList";
//	}
	
	@RequestMapping(value = "/basic/test.do")
    public String test(@ModelAttribute("basicSampleVO") BasicSampleVO basicSampleVO,
            Model model) throws Exception {
	    
	    List<BasicSampleVO> sampleList = basicSampleService.selectSampleList(basicSampleVO);
	    System.out.println(sampleList);
        model.addAttribute("resultList", sampleList);
        
        return "basic/test";
    }

	/**
	 * 게시글을 상세 조회한다. 게시글 조회시 조회수(view_count)가 +1 증가한다.
	 * @param seq
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/basic/selectItemById.do")
	public String selectItemById(@RequestParam("selectedSeq") String seq, Model model) throws Exception {
		basicSampleService.updateSampleViewCount(seq);
		model.addAttribute("result", selectItem(seq));
		return "basic/basicSampleDetailView";
	}

	/**
	 * 게시글 등록 화면
	 * @param basicSampleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/basic/insertItemForm.do")
	public String insertItemForm(@ModelAttribute BasicSampleVO basicSampleVO, Model model)	throws Exception {
		return "basic/basicSampleRegisterForm";
	}
	
	/**
	 * 게시글 등록 작업을 수행한다. 
	 * 유효성 검사 후 조건에 맞지 않으면 form으로 이동하고, 조건에 맞으면 insert를 하고 게시글 목록 화면으로 이동한다.
	 * @param basicSampleVO
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/basic/insertItem.do", method = RequestMethod.POST)
	public String insertItem(@ModelAttribute @Valid BasicSampleVO basicSampleVO, BindingResult result, Model model) throws Exception {

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError e : list) {
				logger.debug("ObjectError : " + e);
			}
			return "basic/basicSampleRegisterForm";
		}

		basicSampleService.insertSample(basicSampleVO);
		return "forward:/basic/selectItemList.do";
	}
	
	/**
	 * 게시글 삭제
	 * 게시글 삭제 후 게시글 목록 화면으로 이동한다.
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/basic/deleteItem.do")
	public String deleteItem(@RequestParam("selectedSeq") String seq) throws Exception {
		basicSampleService.deleteSample(seq);
		return "forward:/basic/selectItemList.do";
	}
	
	/**
	 * 게시글 수정 화면
	 * @param basicSampleVO
	 * @param model
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/basic/updateItemForm.do")
	public String updateItemForm(@ModelAttribute BasicSampleVO basicSampleVO, Model model, @RequestParam("selectedSeq") String seq) throws Exception {
		model.addAttribute("basicSampleVO", selectItem(seq));
		return "basic/basicSampleModifyForm";
	}
	
	/**
	 * 게시글 수정 작업을 수행한다.
	 * 유효성 검사 후 조건에 맞지 않으면 form으로 이동하고, 조건에 맞으면 update를 하고 게시글 상세 화면으로 이동한다.
	 * @param basicSampleVO
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/basic/updateItem.do")
	public String updateItem(@ModelAttribute @Valid BasicSampleVO basicSampleVO, BindingResult result, Model model) throws Exception {

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError e : list) {
				logger.debug("ObjectError : " + e);
			}
			return "basic/basicSampleModifyForm";
		}

		basicSampleService.updateSample(basicSampleVO);
		model.addAttribute("result", selectItem(basicSampleVO.getSeq()));
		return "basic/basicSampleDetailView";
	}
	
	/**
	 * 게시글 상세 내용 가져오기
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	public BasicSampleVO selectItem(String seq) throws Exception {
		return basicSampleService.selectSample(seq); 
	}
}
