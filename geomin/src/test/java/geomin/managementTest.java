package geomin;

import static org.junit.Assume.assumeNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.ManagementMapper;
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

	@Test
	public void salesTest() {
	    assumeNotNull(managementMapper);

	    List<SubScriptionVO> list = managementMapper.yearSaleList("콘텐츠명5"); // yearSaleList로 변경
	    
	    list.forEach(sale -> {
	        log.info(sale.getContent_id());
	    });
	}

}
