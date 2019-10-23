package com.news.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.dao.NewsMapper;
import com.news.pojo.Newsa;
import com.news.pojo.Newsb;
import com.news.service.NewsService;
@Service("NewsServiceImpl")
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsa;
	@Override
	public List<Newsb> findNewsService() {
		return newsa.findNews();
	}

	@Override
	public int updNewsService(Newsa news) {
		// TODO Auto-generated method stub
		return newsa.updNews(news);
	}

	@Override
	public Newsa findliService(int id) {
		// TODO Auto-generated method stub
		return newsa.findli(id);
	}

	@Override
	public List<Newsa> findNewslistService(Integer categoryId, String title) {
		// TODO Auto-generated method stub
		return newsa.findNewslist(categoryId, title);
	}

	@Override
	public int delNewsService(int id) {
		// TODO Auto-generated method stub
		return newsa.delNews(id);
	}

	@Override
	public int addNews(Newsa news) {
		// TODO Auto-generated method stub
		return newsa.addNews(news);
	}

	@Override
	public int findid(String title) {
		// TODO Auto-generated method stub
		return newsa.findid(title);
	}

}
