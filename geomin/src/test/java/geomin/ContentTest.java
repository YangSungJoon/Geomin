package geomin;

import static org.junit.Assume.assumeNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.ContentMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ContentTest {

	@Autowired
	ContentMapper contentMapper;
	
	/*
	 * @Test public void test() { assumeNotNull(contentMapper);
	 * 
	 * 
	 * List<ContentVO> list = contentMapper.contentList();
	 * 
	 * list.forEach(content ->{ log.info(content.getContent_id()); });
	 * 
	 * }
	 */
	
	/*
	 * @Test public void learnerGroup() {
	 * 
	 * List<SubScriptionVO> list = contentMapper.groupApproval();
	 * 
	 * list.forEach(learner ->{
	 * 
	 * log.info(learner.getContent_id()); log.info(learner.getContent_name());
	 * 
	 * });
	 * 
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void subContentListTest() { assumeNotNull(contentMapper);
	 * 
	 * 
	 * List<ContentVO> list = contentMapper.subContentList();
	 * 
	 * ContentVO contentVO = new ContentVO();
	 * 
	 * contentVO.setUser_id("ID1");
	 * 
	 * 
	 * list.forEach(content ->{
	 * 
	 * log.info(content.getContent_id()); log.info(content.getUser_id()); });
	 * 
	 * }
	 */
	
	

	
	  @Test 
	  public void insert() {
	  
	  GroupVO groupVO = new GroupVO();
	  
	  groupVO.setUser_id_leader("ID1");
	  groupVO.setContent_id("0002");
	  groupVO.setGroup_name("그룹이름123");
	  groupVO.setGroup_personnel(11);
	  groupVO.setLearning_start("2023-08-24");
	  groupVO.setLearning_end("2023-09-01");
	  
	  contentMapper.insertgroup(groupVO);
	  
	  }
	 
	
	  @Test public void insertSubContentTest() {
	  
	  SubScriptionVO subscriptionVO = new SubScriptionVO();
	  
	  subscriptionVO.setContent_id("0004");
	  subscriptionVO.setUser_id("ID1");
	  
	  
	  contentMapper.insertSubContent(subscriptionVO);
	  
	  }
	 
	  
	  @Test
	  public void payStatusUpdate() {
		  
		  SubScriptionVO subscriptionVO = new SubScriptionVO();
		  
		  contentMapper.payStatusUpdate(subscriptionVO);
		  
	  }
	  
	  @Test
	  public void contentPay() {
		  SubScriptionVO subscriptionVO = new SubScriptionVO();
		  
		  subscriptionVO.setContent_id("0002");
		  subscriptionVO.setReal_price("123123");
		  
		  contentMapper.insertContentPay(subscriptionVO);
		  
		  
	  }
	  
	  @Test
	  public void delete() {
		  
		  SubScriptionVO subscriptionVO = new SubScriptionVO();
		  
		  subscriptionVO.setContent_id("0004");
		  
		  contentMapper.deletePay(subscriptionVO);
	  }
	  

}
