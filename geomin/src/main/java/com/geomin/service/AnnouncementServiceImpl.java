package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.mapper.AnnouncementMapper;
import com.geomin.vo.AnnouncementVO;

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
	public List<AnnouncementVO> getAllAnnouncements(String type) {
		return announcementMapper.getAllAnnouncements(type);
	}

	@Override
	public AnnouncementVO getAnnouncementById(String announcement_id) {
		return announcementMapper.getAnnouncementById(announcement_id);
	}

}
