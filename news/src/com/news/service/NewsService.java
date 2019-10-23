package com.news.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import com.news.pojo.Newsa;
import com.news.pojo.Newsb;

public interface NewsService {
	
		public List<Newsb> findNewsService();

		public int updNewsService(Newsa news);

		public Newsa findliService(int id);

		public List<Newsa> findNewslistService(Integer categoryId,String title);
		
		public int delNewsService(int id);
		
		public int addNews(Newsa news);
		
		public int findid(String title);
}
