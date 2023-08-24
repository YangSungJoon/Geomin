package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.LearnerGroupVO;
import com.geomin.vo.SubScriptionVO;

public interface ContentMapper {

public List<ContentVO> contentList();

public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO);

public List<LearnerGroupVO> learnerGroup();

public int insertgroup(GroupVO groupVO);

public int insertSubContent(SubScriptionVO subScriptionVO);

public int payStatusUpdate(SubScriptionVO subScriptionVO);

public int insertContentPay(SubScriptionVO subScriptionVO);

public int deletePay(SubScriptionVO subScriptionVO);


}
