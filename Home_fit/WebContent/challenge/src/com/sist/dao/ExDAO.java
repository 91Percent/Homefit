package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.ExVO;

public class ExDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * <select id="exListData" resultType="ExVO" parameterType="hashmap">
	SELECT home_no,poster,subject,num
	FROM (SELECT home_no,poster,subject,rownum as num 
	FROM (SELECT home_no,poster,subject
	FROM hometraining WHERE cate_no=#{cate_no} ORDER BY cate_no DESC))
	WHERE num BETWEEN #{start} AND #{end}
</select>
<select id="exTotalPage" resultType="int" parameterType="int">
	SELECT CEIL(COUNT(*)/12.0) FROM hometraining
	WHERE cate_no=#{cate_no}
</select>
	 */
	public static List<ExVO> exListData(Map map)
	{
		//SqlSession session=ssf.openSession();
		//List<ExVO> list=session.selectList("exListData",map);
		//session.close();
		List<ExVO> list=new ArrayList<ExVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("exListData",map);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			session.close();
		}
		return list;
	}
	public static int exTotalPage(int cate_no)
	{
		//SqlSession session=ssf.openSession();
		//int total=session.selectOne("exTotalPage");
		//session.close();
		int total=0;
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			total=session.selectOne("exTotalPage",cate_no);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			session.close();
		}
		return total;
		
	}
	public static List<ExVO> exTotalData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<ExVO> list=session.selectList("exTotalData",map);
		session.close();
		return list;
	}
	public static int exTotalPage2()
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("exTotalPage2");
		session.close();
		return total;
	}
	public static ExVO exDetailData(int home_no)
	{
		SqlSession session=ssf.openSession();
		ExVO vo=session.selectOne("exDetailData",home_no);
		session.close();
		return vo;
	}
}
