package hae.basic.service.impl;

import hae.basic.service.BasicSampleService;
import hae.basic.service.dao.BasicSampleMDAO;
import hae.basic.vo.BasicSampleVO;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;

/**
 * @ClassName : BasicSampleServiceImpl.java
 * @Description : BasicSampleService의 서비스 구현 클래스
 * @author ADM기술팀
 * @since 2016. 7. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 1.       ADM기술팀                                      최초 생성
 * </pre>
 */

@Service("basicSampleService")
public class BasicSampleServiceImpl extends HService implements BasicSampleService {
    
    /** MDAO 등록 */
	@Resource(name = "basicSampleMDAO")
	private BasicSampleMDAO basicSampleMDAO;
	
	/*
	 * @see hae.basic.service.BasicSampleService#insertSample(hae.basic.vo.BasicSampleVO)
	 */
	@Override
	public void insertSample(BasicSampleVO vo) throws Exception {
		basicSampleMDAO.insertSample(vo);
	}

	/*
	 * @see hae.basic.service.BasicSampleService#updateSample(hae.basic.vo.BasicSampleVO)
	 */
	@Override
	public void updateSample(BasicSampleVO vo) throws Exception {
		basicSampleMDAO.updateSample(vo); 
	}

	/*
	 * @see hae.basic.service.BasicSampleService#deleteSample(java.lang.String)
	 */
	@Override
	public void deleteSample(String seq) throws Exception {
		basicSampleMDAO.deleteSample(seq);
	}

	/*
	 * @see hae.basic.service.BasicSampleService#selectSample(java.lang.String)
	 */
	@Override
	public BasicSampleVO selectSample(String seq) throws Exception {
		return basicSampleMDAO.selectSample(seq);
	}

	/*
	 * @see hae.basic.service.BasicSampleService#selectSampleList(hae.basic.vo.BasicSampleVO)
	 */
	@Override
	public List<BasicSampleVO> selectSampleList(BasicSampleVO vo) throws Exception {
		return basicSampleMDAO.selectSampleList(vo); 
	}

	/*
	 * @see hae.basic.service.BasicSampleService#updateSampleViewCount(java.lang.String)
	 */
	@Override
	public void updateSampleViewCount(String seq) throws Exception {
		basicSampleMDAO.updateSampleViewCount(seq);
	}

}
