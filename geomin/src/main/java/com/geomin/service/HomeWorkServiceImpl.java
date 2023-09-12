package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.mapper.HomeWorkMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomeWorkServiceImpl implements HomeWorkService {
	
	@Autowired
	private HomeWorkMapper homeworkMapper;


	// 학습자 이름 조회
	@Override
	public UserVO getUserName(String user_id) {
		return homeworkMapper.getUserName(user_id);
	}
/*
	// 학습지도자 이름 조회
	@Override
	public HomeWorkVO getLeaderName(String user_id) {
		return homeworkMapper.getLeaderName(user_id);
	}
*/
	// 학습 콘텐츠 명 조회
	@Override
	public ContentVO getContentName(String content_id) {
		return homeworkMapper.getContentName(content_id);
	}

	// 그룹 정보 조회
	@Override
	public List<GroupVO> getGroupInfo() {
		return homeworkMapper.getGroupInfo();
	}

	@Override
	public GroupVO getGroupId(String group_id) {
		return homeworkMapper.getGroupId(group_id);
	}

	// 학습 내용 제출
	@Override
	public int update(HomeWorkVO homeworkVO) {
		return homeworkMapper.update(homeworkVO);
	}

	// 그룹 가입별 학생 로그인
	    @Override
	    public int groupLogin(String user_id) {
	        return homeworkMapper.groupLogin(user_id);
	    }

		@Override
		public List<HomeWorkVO> getList(String user_id) {
			return homeworkMapper.getList(user_id);
		}

		// 학습지도자 이름 조회
		@Override
		public HomeWorkVO getLeaderName(String user_id_leader) {
			return homeworkMapper.getLeaderName(user_id_leader);
		}
		

	


	

	
//	@Override
//	public List<HomeWorkVO> getList(HomeWorkVO vo, Model model){
//		List<HomeWorkVO> list = homeworkMapper.getList(vo);
//		
//		model.addAttribute("list", list);
//		return null;
//	}

}
