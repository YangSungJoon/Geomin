package com.geomin.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AnnouncementVO {
	
	private String announcement_id;
	private String announcement_type;
	private String title;
	private String announcement_content;
	
	private LocalDate announcement_date;
	
	public void setAnnouncement_date(LocalDate announcement_date) {
        this.announcement_date = announcement_date;
    }
}
