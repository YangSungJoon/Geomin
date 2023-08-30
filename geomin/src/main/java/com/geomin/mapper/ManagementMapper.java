package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;

public interface ManagementMapper {

	public int insert(ContentVO contentVo);

	public List<ContentVO> contentList();

	public List<SubScriptionVO> yearSaleList(String contentName);

	public List<SubScriptionVO> yearSale();
}
