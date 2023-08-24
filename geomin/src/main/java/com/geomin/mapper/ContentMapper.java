package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;

public interface ContentMapper {

public List<ContentVO> contentList();
	
public int insertSubscription(GroupVO groupVO);

}
