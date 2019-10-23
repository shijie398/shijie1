package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.pojo.Newsa;
import com.news.pojo.Newsb;


public interface NewsMapper {
	//������Ϣ�Ĳ�ѯ
	public List<Newsb> findNews();
	//�޸�������Ϣ
	public int updNews(Newsa news);
	//����id��ȡ���е�ֵ
	public Newsa findli(@Param("id")int id);
	//��ѯҳ��Ĳ�ѯ����
	public List<Newsa> findNewslist(@Param("categoryId")Integer categoryId,@Param("title")String title);
	//ɾ��
	public int delNews(@Param("id")int id);
	//���
	public int addNews(Newsa news);
	//��ѯ�����Ƿ��ظ�
	public int findid(@Param("title")String title);
}
