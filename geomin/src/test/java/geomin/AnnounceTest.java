package geomin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.AnnouncementMapper;
import com.geomin.vo.AnnouncementVO;
import com.geomin.vo.GroupVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AnnounceTest {

	@Autowired
	AnnouncementMapper announcementMapper;
	
	@Test 
	  public void announceInsert() {
	  
	  AnnouncementVO announcementVo = new AnnouncementVO();
	  
	  announcementVo.setAnnouncement_id("2"); 
	  announcementVo.setTitle("안내해드립니다");
	  announcementVo.setAnnouncement_content("금일 일정 모두 취소 모두 가라");
	  
	  System.out.println("announce : " + announcementVo);
	  
	  announcementMapper.announceInsert(announcementVo);
	  
	  }
}
