package com.geomin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;

public interface ContentMapper {

public List<ContentVO> contentList(@Param("learning_difficulty") String learning_difficulty,@Param("startNo") int startNo, @Param("endNo") int endNo);

public int contentListCnt(@Param("learning_difficulty") String learning_difficulty,@Param("startNo") int startNo, @Param("endNo") int endNo);

public List<SubScriptionVO> subContentList(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);

public int subContentListCnt(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);


public List<SubScriptionVO> groupApproval(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo, @Param("content_name") String content_name, @Param("groupyn") String groupyn);

public int groupApprovalCnt(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo, @Param("content_name") String content_name, @Param("groupyn") String groupyn);


public List<SubScriptionVO> myGroup(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);

public int myGroupCnt(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);


public List<SubScriptionVO> homeworkEval(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);

public int homeworkEvalCnt(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo);

public List<SubScriptionVO> homework_add_list(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo, @Param("content_name") String content_name, @Param("groupyn") String groupyn);

public int homework_add_list_Cnt(@Param("user_id") String user_id,@Param("startNo") int startNo, @Param("endNo") int endNo, @Param("content_name") String content_name, @Param("groupyn") String groupyn);



public List<SubScriptionVO> option_content_id(SubScriptionVO subScriptionVO);

public List<SubScriptionVO> homework_option(SubScriptionVO subScriptionVO);


public int insertgroup(SubScriptionVO subScriptionVO);

public int insertSubContent(SubScriptionVO subScriptionVO);

public int payStatusUpdate(SubScriptionVO subScriptionVO);

public int insertContentPay(SubScriptionVO subScriptionVO);

public int deletePay(SubScriptionVO subScriptionVO);

public int updateGroupyn(SubScriptionVO subScriptionVO);

public int add_current(SubScriptionVO subScriptionVO);

public int delGroup(SubScriptionVO subScriptionVO);

public int delGroup_leaner(SubScriptionVO subScriptionVO);

public int delGroup_homework(SubScriptionVO subScriptionVO);


public int homework_add(SubScriptionVO subScriptionVO);

public int updateEvaluation(SubScriptionVO subScriptionVO);

public int personReset(SubScriptionVO subScriptionVO);


}
