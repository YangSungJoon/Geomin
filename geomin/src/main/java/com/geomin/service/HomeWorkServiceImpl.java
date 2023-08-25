package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.HomeWorkMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.HomeWorkCriteria;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomeWorkServiceImpl implements HomeWorkService {
	
	@Autowired
	private HomeWorkMapper homeworkMapper;

	// 게시판 목록
	@Override
	public List<HomeWorkVO> getList() {
		return homeworkMapper.getList();
	}

	// 학습자 이름 조회
	@Override
	public UserVO getUserName(String user_id) {
		return homeworkMapper.getUserName(user_id);
	}

	// 학습지도자 이름 조회
	@Override
	public UserVO getLeaderName(String user_id) {
		return homeworkMapper.getLeaderName(user_id);
	}

	// 학습 콘텐츠 명 조회
	@Override
	public ContentVO getContentName(String content_id) {
		return homeworkMapper.getContentName(content_id);
	}
	
//	@Override
//	public List<HomeWorkVO> getList(HomeWorkVO vo, Model model){
//		List<HomeWorkVO> list = homeworkMapper.getList(vo);
//		
//		model.addAttribute("list", list);
//		return null;
//	}

}
