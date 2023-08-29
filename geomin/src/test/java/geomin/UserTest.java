package geomin;

import static org.junit.Assume.assumeNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geomin.mapper.UserMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserTest {
	
	@Autowired
	UserMapper userMapper;
	
	@Test
	public void test() {
		assumeNotNull(userMapper);
		
	
		List<UserVO> list = userMapper.userList();
		
		list.forEach(user ->{
			log.info(user.getUser_id());
		});
		
	}
	
	@Test
	public void findId() {
		assumeNotNull(userMapper);
		
		UserVO userVo = new UserVO();
		
		userVo.setEmail("aaa985@naver.com");
		
		userMapper.findId(userVo);
	}
	
	
}









