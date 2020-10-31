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
	
	 // 그룹 리더가 방 만들면 참가자로 추가하기
	public static void leaderGroupIn(String id_leader)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("Challenge_participation", id_leader);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

	
	// 챌린지 전체 및 카테고리별 목록
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

	
	//<!-- 챌린지 목록 카테고리별 전체 페이지 수 -->
		public static int challengeCateTotalPage(String cate)
		{
			int total=0;
			SqlSession session=null;
			try
			{
				session=ssf.openSession();
				total=session.selectOne("challengeCateTotalPage",cate);
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