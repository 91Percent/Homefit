
package com.sist.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.*;
/**
 * @author 지승구
 *
 */
public class Challenge_CertifiedDAO {

	private static SqlSessionFactory ssf;

	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}

	public static List<ChallengeVO> ChallengeListData(Map map) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		SqlSession session = null;

		try {
			System.out.println("돌아가냐??");
			session = ssf.openSession();
			list = session.selectList("ChallengeListData", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	public static ChallengeVO ChallengeDetailData(int challenge_no) {
		ChallengeVO vo = new ChallengeVO();
		SqlSession session = null;
		
		try {
			session=ssf.openSession();
			vo  = session.selectOne("ChanllenDetailData",challenge_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}
	public static List<Challenge_CertifiedVO> CertifiedData(int no)
	{
		List<Challenge_CertifiedVO> list = new ArrayList<Challenge_CertifiedVO>();
		SqlSession session = null;
		try {
			System.out.println("인증 돌아간다!");
			session = ssf.openSession();
			list = session.selectList("Challenge_CertifiedData",no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			 
			if(session!=null)
			{
				session.close();
			}
		}
		
		return list;
	}	
	// <insert id="Challenge_CertifiedUpload"  parameterType="Challenge_CertifiedVO">
	public static void Challenge_CertifiedUpload(Challenge_CertifiedVO vo)
	{	
		SqlSession session =null;
		try {
			session=ssf.openSession(true);
			session.insert("Challenge_CertifiedUpload",vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
	}
	//<select id="Challnege_paticipation_check" parameterType="Challenge_ParticipationVO" resultType="int">
	//방에 유저가 있는지 없는지 검색
	public static int Challnege_paticipation_check(Challenge_ParticipationVO vo)
	{
		SqlSession session = null;
		int count =0;
		try {
			session=ssf.openSession();
			count=session.selectOne("Challnege_paticipation_check",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	//<insert id="Challenge_participation" parameterType="ChallengeVO">
	// 방 참가 하기
	public static void Challenge_participation(Challenge_ParticipationVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("Challenge_participation",vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
	}


}
