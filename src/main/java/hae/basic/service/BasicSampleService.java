package hae.basic.service;

import hae.basic.vo.BasicSampleVO;

import java.util.List;

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

public interface BasicSampleService {

	/**
	 * 게시글 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void insertSample(BasicSampleVO vo) throws Exception;
	
	/**
	 * 게시글 수정
	 * @param vo
	 * @throws Exception
	 */
	void updateSample(BasicSampleVO vo) throws Exception;
	
	/**
	 * 게시글 삭제
	 * @param seq
	 * @throws Exception
	 */
	void deleteSample(String seq) throws Exception;
	
	/**
	 * 게시글 상세 조회
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	BasicSampleVO selectSample(String seq) throws Exception;
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<BasicSampleVO> selectSampleList(BasicSampleVO vo) throws Exception;
	
	/**
	 * 조회수 Count (+1)
	 * @param seq
	 * @throws Exception
	 */
	void updateSampleViewCount(String seq) throws Exception;

}
