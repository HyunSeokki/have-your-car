package hae.basic;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import hae.basic.service.BasicSampleService;
import hae.basic.vo.BasicSampleVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * <pre>
 * Test를 위한 BasicSampleServiceTest Sample Class
 * 
 * <pre>
 * 
 * @ClassName   : BasicSampleServiceTest.java
 * @Description : 클래스 설명을 기술합니다.
 * @author 
 * @since 2016. 4. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 31.          최초 생성
 * </pre>
 */

// Spring Test를 위해 @RunWith 선언
// Spring Bean 설정을 위해 @ContextConfiguration등록 (file, classpath 등으로 선언 가능)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/context-*.xml" })
// @ContextConfiguration(locations = {
// "file:./src/test/resources/spring/context-*.xml" })
public class BasicSampleServiceTest {

    @Autowired
    BasicSampleService basicSampleService;

    /**
     * selectPerson method Test
     *
     */
    @Test
    public void testSelectPerson() {

        try {
            /*BasicSampleVO sampleVO = new BasicSampleVO();
            sampleVO.setSeq("1");*/
            
            BasicSampleVO result = basicSampleService.selectSample("1");
            assertEquals("데이터가 일치하지 않습니다.", "1", result.getSeq());
            
        } catch (Exception e) {
            e.printStackTrace();
            fail("Error 발생");
        }
    }

}
