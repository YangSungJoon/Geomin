package com.geomin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geomin.vo.ContentVO;
import com.geomin.vo.SaleVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

public interface ManagementMapper {

	public int insert(ContentVO contentVo);

	public List<ContentVO> contentList();
		
	public List<SaleVO> yearSaleList(String content_id);

	public List<SaleVO> monthSaleList(@Param("content_id") String content_id, @Param("year") String year);
	
	public int emailEdit(UserVO userVo);

	public ContentVO contentListView(String contentId);
	
	public int contentUpdate(ContentVO contentVo);
	
	public int contentDelete(ContentVO contentVo);

	public List<SubScriptionVO> contentSelect();
}
