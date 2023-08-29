package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.AnnouncementVO;

public interface AnnouncementMapper {
	
	public int announceInsert(AnnouncementVO announcementVo);

	public List<AnnouncementVO> getAllAnnouncements(String type);

	public AnnouncementVO getAnnouncementById(String announcement_id);

}
