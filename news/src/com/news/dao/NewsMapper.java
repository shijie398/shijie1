package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.pojo.Newsa;
import com.news.pojo.Newsb;


public interface NewsMapper {
	//下拉信息的查询
	public List<Newsb> findNews();
	//修改新闻信息
	public int updNews(Newsa news);
	//根据id获取所有的值
	public Newsa findli(@Param("id")int id);
	//查询页面的查询方法
	public List<Newsa> findNewslist(@Param("categoryId")Integer categoryId,@Param("title")String title);
	//删除
	public int delNews(@Param("id")int id);
	//添加
	public int addNews(Newsa news);
	//查询标题是否重复
	public int findid(@Param("title")String title);
}
