package geomin;

import static org.junit.Assert.assertEquals;
import static org.junit.Assume.assumeNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.HomeWorkMapper;
import com.geomin.mapper.ManagementMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.SaleVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class managementTest {
	
	@Autowired
    ManagementMapper managementMapper;
	
	@Autowired
    HomeWorkMapper homeworkMapper;


	
	@Test
	public void contentTest() {
	    assumeNotNull(managementMapper);

	    List<ContentVO> list = managementMapper.contentList(); // yearSaleList로 변경
	    
	    list.forEach(sale -> {
	        log.info(sale.getContent_id());
	    });
	}
	
	/*
	
	@Test
	public void getListTest() {
	    assumeNotNull(homeworkMapper);

	    // 테스트에 필요한 파라미터 값을 설정
	    String user_id = "study1";

	    List<HomeWorkVO> list = homeworkMapper.getListTest(user_id);

	    list.forEach(sale -> {
	        log.info(sale.getUser_id());
	    });
	}
	*/
	
	@Test
	public void getLeaderTest() {
	    assumeNotNull(homeworkMapper);

	    // 테스트에 필요한 파라미터 값을 설정
	    String user_id_leader = "teach1";

	    HomeWorkVO home = homeworkMapper.getLeaderName(user_id_leader);

	    log.info(home);
	    log.info(user_id_leader);
	    
	}

	
	@Test
	public void update() {
	    HomeWorkVO homeworkVo = new HomeWorkVO();
	    
	    homeworkVo.setHomework_content_learner("선생님 숙제해왔어요.");
	    
	    homeworkVo.setUser_id_learner("study1");
	    
	    homeworkMapper.update(homeworkVo);
	    
	}

	
	@Test
	public void contentDelete() {
	    ContentVO contentVo = new ContentVO();
	    contentVo.setContent_id("0017");
	    contentVo.setIs_deleted("Y");
	    managementMapper.contentDelete(contentVo);
	}


}
