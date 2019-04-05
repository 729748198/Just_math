package com.just.fatie.service;

import com.just.fatie.entity.ForumMain;
import com.just.fatie.entity.ForumSecond;

import java.util.List;

/**
 * @author 贺文杰
 * 2018/11/15 18:30
 */
public interface FatieService {
   //获取帖子列表
   List<ForumMain> selectAll();

   //根据帖子Id查找某一条帖子主题信息
   ForumMain selectByPrimaryMainId(String mainId);

   //根据主贴ID查找回帖
   List<ForumSecond> selectByTid(String Tid);

   //发表一条帖子
   int add(ForumMain main);
}
