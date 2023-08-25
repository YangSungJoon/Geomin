package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;

public interface ManagementMapper {

	public int insert(ContentVO contentVo);

	public List<ContentVO> contentList();

}
