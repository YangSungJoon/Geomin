package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.vo.AnnouncementVO;

@Service
public interface AnnouncementService {

	public int announceInsert(AnnouncementVO announcementVo);

	public List<AnnouncementVO> getAllAnnouncements(String type);

	public AnnouncementVO getAnnouncementById(String announcement_id);
}
