package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;

public interface ContentMapper {

public List<ContentVO> contentList(SubScriptionVO subScriptionVO);

public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO);

public List<SubScriptionVO> groupApproval(SubScriptionVO subScriptionVO);

public List<SubScriptionVO> option_content_id(SubScriptionVO subScriptionVO);

public List<SubScriptionVO> myGroup(SubScriptionVO subScriptionVO);

public int insertgroup(SubScriptionVO subScriptionVO);

public int insertSubContent(SubScriptionVO subScriptionVO);

public int payStatusUpdate(SubScriptionVO subScriptionVO);

public int insertContentPay(SubScriptionVO subScriptionVO);

public int deletePay(SubScriptionVO subScriptionVO);

public int updateGroupyn(SubScriptionVO subScriptionVO);

public int add_current(SubScriptionVO subScriptionVO);

public int delGroup(SubScriptionVO subScriptionVO);

public int homework_add(SubScriptionVO subScriptionVO);

}
