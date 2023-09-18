package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.AnnouncementVO;
import com.geomin.vo.Criteria;

@Service
public interface AnnouncementService {

	public int announceInsert(AnnouncementVO announcementVo);

	public List<AnnouncementVO> getAllAnnouncements(String announcement_type, Criteria cri, Model model);

	public int getTotalAnnouncementCount(String announcement_type, Criteria cri);

	public AnnouncementVO getAnnouncementById(String announcement_id);
	
}
