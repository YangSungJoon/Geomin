package com.geomin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

public interface ManagementMapper {

	public int insert(ContentVO contentVo);

	public List<ContentVO> contentList();

	public List<SubScriptionVO> yearSaleList(String contentName);

	public List<SubScriptionVO> monthSaleList(@Param("contentName") String contentName, @Param("year") String year);

	public int emailEdit(UserVO userVo);
}
