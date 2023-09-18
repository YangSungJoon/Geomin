package com.geomin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geomin.vo.AnnouncementVO;

public interface AnnouncementMapper {
	
	public int announceInsert(AnnouncementVO announcementVo);

	public List<AnnouncementVO> getAllAnnouncements(@Param("announcement_type") String announcement_type,@Param("startNo") int startNo, @Param("endNo") int endNo);

	public int getTotalAnnouncementCount(@Param("announcement_type") String announcement_type,@Param("startNo") int startNo, @Param("endNo") int endNo);

	public AnnouncementVO getAnnouncementById(String announcement_id);


}
