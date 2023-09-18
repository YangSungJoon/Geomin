package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.AnnouncementMapper;
import com.geomin.vo.AnnouncementVO;
import com.geomin.vo.Criteria;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{

	@Autowired
	AnnouncementMapper announcementMapper;
	
	@Override
	public int announceInsert(AnnouncementVO announcementVo) {
		// 패키지 정보를 DB에 저장
	    int res = announcementMapper.announceInsert(announcementVo);
	    return res > 0 ? 1 : 0; // 1: 성공, 0: 실패
	}

	@Override
	public List<AnnouncementVO> getAllAnnouncements(String announcement_type, Criteria cri, Model model) {
		List<AnnouncementVO> list = announcementMapper.getAllAnnouncements(announcement_type, cri.getStartNo(), cri.getEndNo());
		
		int totalCnt = announcementMapper.getTotalAnnouncementCount(announcement_type, cri.getStartNo(), cri.getEndNo());
		
		
		  model.addAttribute("totalCnt", totalCnt);
		
		return list;
	}
	
	@Override
	public int getTotalAnnouncementCount(String announcement_type, Criteria cri) {
		return announcementMapper.getTotalAnnouncementCount(announcement_type, cri.getStartNo(), cri.getEndNo());
	}

	@Override
	public AnnouncementVO getAnnouncementById(String announcement_id) {
		return announcementMapper.getAnnouncementById(announcement_id);
	}


}
