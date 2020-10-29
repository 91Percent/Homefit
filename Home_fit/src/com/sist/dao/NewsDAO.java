package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class NewsDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<NewsVO> newsListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<NewsVO> nList=session.selectList("newsListData",map);
		session.close();
		return nList;
	}
	public static int newsTotalPage()
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("newsTotalPage");
		session.close();
		return total;
	}
	public static NewsVO newsDetailData(int no)
	{
		SqlSession session=ssf.openSession();
		NewsVO vo=session.selectOne("newsDetailData",no);
		session.close();
		return vo;
	}

}
