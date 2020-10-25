package com.sist.dao;

import com.sist.vo.*;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ChallengeDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	

	
	//<!-- 새 도전 만들기 -->
	//<insert id="challengeInsert" parameterType="ChallengeVO">
	public static void challengeInsert(ChallengeVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.insert("challengeInsert", vo);
		}catch(Exception ex)
		{
			 ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close(); //connection닫기(반환)
		}
	}

	//<!-- 챌린지 전체목록 -->
	//<select id="challengeTotalListData" resultType="ChallengeVO" parameterType="hashmap">
	public static List<ChallengeVO> challengeTotalListData(Map map)
	{
		List<ChallengeVO> list=new ArrayList<ChallengeVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("challengeTotalListData",map);
		}catch(Exception ex)
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
	
	
	// 챌린지 카테고리별 목록
	//<select id="challengeListData" resultType="challengeVO" parameterType="hashmap">
	public static List<ChallengeVO> challengeCateListData(Map map)
	{
		List<ChallengeVO> list=new ArrayList<ChallengeVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("challengeCateListData",map);
		}catch(Exception ex)
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
	
	//<!-- 챌린지 목록 전체 페이지 수 -->
	public static int challengeTotalPage()
	{
		int total=0;
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			total=session.selectOne("challengeTotalPage");
		}catch(Exception ex)
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
	
	//<!-- 챌린지 목록 카테고리별 전체 페이지 수 -->
		public static int challengeCateTotalPage()
		{
			int total=0;
			SqlSession session=null;
			try
			{
				session=ssf.openSession();
				total=session.selectOne("challengeCateTotalPage");
			}catch(Exception ex)
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
		
	
	
	
	//<!-- 도전 상세보기 -->
	//<select id="challengDetailData" resultType="challengeVO" parameterType="int">
	public static ChallengeVO challengDetailData(int no)
	{
		SqlSession session=null;
		session= ssf.openSession();
		ChallengeVO vo= session.selectOne("challengDetailData",no);
		session.close();
		return vo;
	}

	
	
	

}