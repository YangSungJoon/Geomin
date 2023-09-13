package geomin;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.AnnouncementMapper;
import com.geomin.vo.AnnouncementVO;

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
        announcementVo.setTitle("안내해드립니다");
        announcementVo.setAnnouncement_content("금일 일정 모두 취소 모두 가라");

        log.info("Before insert: " + announcementVo);

        announcementMapper.announceInsert(announcementVo);

        log.info("After insert: " + announcementVo);

        assertNotNull(announcementVo.getAnnouncement_id()); // Insert 후 announcement_id가 설정되었는지 확인
    }

    @Test
    public void testGetAllAnnouncements() {
        String announcementType = "1"; // 변경해야 할 announcement_type 값
        int startNo = 1; // 시작 페이지 번호
        int endNo = 10; // 종료 페이지 번호

        List<AnnouncementVO> list = announcementMapper.getAllAnnouncements(announcementType, startNo, endNo);

        assertNotNull(list);

        list.forEach(announce -> {
            log.info(announce.getAnnouncement_type());
        });
    }


}
