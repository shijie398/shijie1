package com.news.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.news.pojo.Newsa;
import com.news.pojo.Newsb;
import com.news.service.NewsService;

@Controller
@RequestMapping("/new")
public class Newscontroller {
	@Autowired
	private NewsService objnewsService;
	
	@RequestMapping("/findNews")
	@ResponseBody//用于ajax
	public String findflight(@RequestParam(value="categoryId",required=false)Integer categoryId,@RequestParam(value="title",required=false)String title){
		List<Newsa> list=objnewsService.findNewslistService(categoryId, title);
		return JSON.toJSONString(list);
	}
	
	@RequestMapping("/showfindNews")
	  public String showfindNews(Model model){
		List<Newsb> list=objnewsService.findNewsService();
		model.addAttribute("list",list);
		  return "findnews";
	  }
	
	@RequestMapping("/showupdNews")
	  public String showupdFlight(@RequestParam(value="id",required=false)int id ,Model model){
		List<Newsb> list=objnewsService.findNewsService();
		model.addAttribute("list",list);
		Newsa fli=objnewsService.findliService(id);
		 model.addAttribute("book", fli);
		  return "updnews";
	  }
	
	@RequestMapping("/updNews")
	@ResponseBody//用于ajax
	public int updNews(Newsa news){
		 int count=objnewsService.updNewsService(news);
		return count;
	}
	
	@RequestMapping("/delNews")
	@ResponseBody//用于ajax
	public int delNews(@RequestParam(value="id",required=false)int id ){
		 int count=objnewsService.delNewsService(id);
		return count;
	}
	
	@RequestMapping("/showaddNews")
	  public String showaddFlight(Model model){
		List<Newsb> list=objnewsService.findNewsService();
		model.addAttribute("list",list);
		  return "addnews";
	  }
	
	@RequestMapping("/addNews")
	@ResponseBody//用于ajax
	public int addNews(Newsa news ){
		news.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		int count = 0;
        if (news != null)
        {
            count = objnewsService.addNews(news);
        }
        return count;
	}
	
	@RequestMapping("/findid")
	@ResponseBody//用于ajax
	public int findid(@RequestParam(value="title",required=false)String title ){
		 int count=objnewsService.findid(title);
		return count;
	}
}
