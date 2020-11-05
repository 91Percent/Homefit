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
	
	
	// 	<select id="mychallengeRoomList" parameterType="hashmap" resultMap="mychallengeRoom">
	public static List<ChallengeVO> mychallengeRoomList(Map map)
	{
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		SqlSession session= null;
		try {
			session=ssf.openSession();
			list=session.selectList("mychallengeRoomList", map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	
	//myChallenge_roomdetail
	// <select id="myChallenge_roomdetail" parameterType="hashmap" resultType="ChallengeVO">
	public static List<ChallengeVO> myChallenge_roomdetail(Map map)
	{
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		SqlSession session= null;
		try {
			session=ssf.openSession();
			list=session.selectList("myChallenge_roomdetail", map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	
	// myChallenge_Certified_check
	public static int myChallenge_Certified_check(Map map)
	{
		int count=0;
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("myChallenge_Certified_check",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	
	// myChallenge_CertifiedData
	public static List<Challenge_CertifiedVO> myChallenge_CertifiedData(Map map)
	{
		List<Challenge_CertifiedVO> list = new ArrayList<Challenge_CertifiedVO>();
		SqlSession session= null;
		try {
			session=ssf.openSession();
			list=session.selectList("myChallenge_CertifiedData", map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	
	// challengeSearchTotalPage
	public static int challengeSearchTotalPage(String keyword)
	{
		int total=0;
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			total=session.selectOne("challengeSearchTotalPage",keyword);
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
	
	
	
	// challengeSearchData
	public static List<ChallengeVO> challengeSearchData(Map map)
	{
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		SqlSession session= null;
		try {
			session=ssf.openSession();
			list=session.selectList("challengeSearchData", map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// <!--도전 period 구하기 -->
	public static int challengePeriodCount(int challenge_no)
	{
		int period=0;
		SqlSession session= null;
		try {
			session=ssf.openSession();
			period=session.selectOne("challengePeriodCount", challenge_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return period;
	}


	// <!-- 도전 참여자 수 구하기 --> participantCount
	public static int totalPaticipantCount(int challenge_no)
	{
		int total=0;
		SqlSession session= null;
		try {
			session=ssf.openSession();
			total=session.selectOne("totalPaticipantCount", challenge_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
		
	
	//<!-- 새 도전 만들기 -->
	//<insert id="challengeInsert" parameterType="ChallengeVO">
	public static void challengeInsert(ChallengeVO vo)
	{
		SqlSession session=null;
		System.out.println("잘된건가 모르겟네"+vo.getPoster());
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
	
	// 방 만들자마자 도전참가자 목록에 추가시키기
	/*
		<insert id="Challenge_participation"
			parameterType="Challenge_ParticipationVO">
			INSERT INTO challenge_participation VALUES(
			#{challenge_no},
			#{challenge_id}
			)
		</insert>
	 */
	

	//<insert id="Challenge_participation" parameterType="ChallengeVO">
		// 방 참가 하기
//		public static void Challenge_participation(Challenge_ParticipationVO vo)
//		{
//			SqlSession session=null;
//			try {
//				session=ssf.openSession(true);
//				session.insert("Challenge_participation",vo);
//				
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				if(session!=null)
//					session.close();
//			}
//			
//		}
	

	
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