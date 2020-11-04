
package com.sist.dao;

import java.io.Reader;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

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

	
	// 도전 목록
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

	// 인증 상세보기
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
	
	
	// 인증 데이터
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
	
	// 인증사진 올리기
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
			if(vo.getChallenge_id()!=null)
			{
				count=session.selectOne("Challnege_paticipation_check",vo);
			}
			else 
			{
				count=0;
			}
			
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
	
	// <update id="Challenge_room_update" parameterType="ChallengeVO">
	// 방 수정 업데이트
	public static void Challenge_room_update(ChallengeVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("Challenge_room_update",vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
	}
	/*
	 <!-- 3가지 모두 방 에 삭제되는 부분  -->
		<!-- 방 삭제 -->
		<delete id="Challenge_room_delete" parameterType="int">
			DELETE challenge 
			WHERE challenge_no=#{challenge_no} 
		</delete>
		
		<!-- 방에  해당하는 인증 삭제  -->
		<delete id="Challenge_room_certified_delete" parameterType="int">
			DELETE challenge_certified 
			WHERE challenge_no=#{challenge_no} 
		</delete>
		
		<!-- 방에 참가하는 인원 삭제 -->
		<delete id="Challenge_room_participation_delete" parameterType="int">
			DELETE challenge_participation 
			WHERE challenge_no=#{challenge_no} 
		</delete>
		<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ --> 
	 */
	//방삭제-> 인증,참가인원 방 삭제하는 순서
	public static void Challenge_room_delete(int no)
	{
		SqlSession session=null;
		try {
			System.out.println("no은 "+no);
			session=ssf.openSession();
			session.delete("Challenge_room_certified_delete",no);			
			session.delete("Challenge_room_participation_delete",no);
			session.delete("Challenge_room_delete",no);
			
			session.commit();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//방에 참여하고 있는 인원 검색하기.
	/*
	 <select id="challenge_people" resultType="Challenge_ParticipationVO" parameterType="int">
	SELECT challenge_id FROM challenge_participation
	WHERE challenge_no=#{challenge_no};
	</select>
	 */
	public static List<Challenge_ParticipationVO> challenge_people(int no)
	{
		SqlSession session=null;
		List<Challenge_ParticipationVO> list = new ArrayList<Challenge_ParticipationVO>();
		try {
			session=ssf.openSession();
			list = session.selectList("challenge_people",no);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/*
	 * 참가자가 오늘 인증을 했는지 안했는지 확인
	 * <select id="certified_check" parameterType="challengeVO">
	 */
	public static int certified_check(Challenge_CertifiedVO vo) 
	{
		int count=0;
		SqlSession session = null;
		try {
			session=ssf.openSession();
			count=session.selectOne("certified_check",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	/*
	 	<!-- 챌린지 방 인증 랭킹 (아이디 받아오는거)-->
		<select id="certified_ranking" parameterType="int" resultType="Challenge_CertifiedVO">
	 */
	public static List<Challenge_CertifiedVO> certified_ranking(int no)
	{
		SqlSession session = null;
		List<Challenge_CertifiedVO> list = new ArrayList<Challenge_CertifiedVO>();
		try {
			session=ssf.openSession();
			list = session.selectList("certified_ranking",no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}

	
	/*
		<!-- 방 강퇴하는 부분 -->
		<delete id="participation_kick_out" parameterType="Challenge_ParticipationVO">
			DELETE FROM challenge_participation 
			WHERE challenge_no=#{challenge_no} 
			AND challenge_id=#{challenge_id}
		</delete>
	 */
	public static void participation_kick_out(Challenge_ParticipationVO vo)
	{
		SqlSession session =null;
		try {
			session=ssf.openSession(true);
			session.delete("participation_kick_out",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 <!-- 댓글 올리기  -->
	  <insert id="replyInsert" parameterType="ReplyVO">
	    <!-- 적용할 수 없다(한번) -->
	    <selectKey keyProperty="no" resultType="int" order="BEFORE">
	      SELECT NVL(MAX(no)+1,1) as no FROM review_table
	    </selectKey>
	    INSERT INTO review_table(no,review_no,id,name,content,group_id) VALUES(
	      #{no},
	      #{review_no},
	      #{id},
	      #{name},
	      #{content},
	      (SELECT NVL(MAX(group_id)+1,1) FROM review_table)
	    ) 
	    </insert>
	 */
	public static void challenge_reply_insert(ReplyVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("replyInsert",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	/*
	  <!-- 댓글 가져오기 -->  
	    <select id="challenge_replyListData" resultType="ReplyVO" parameterType="int">
	    SELECT review_no,no,id,name,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,
	    group_tab FROM review_table
	    WHERE no=#{no}
	  	</select>
	 */
	public static List<ReplyVO> challeng_reply(ReplyVO vo)
	{
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		SqlSession session =null ;
		try {
			session=ssf.openSession();
			list=session.selectList("challenge_replyListData",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
//	<!-- 챌린지 인증 횟수를 가져오는 부분 -->
//	<select id="certified_count" parameterType="challengeVO" resultType="int">
//		SELECT count(*) FROM challenge_certified 
//		WHERE challenge_id=#{challenge_id} AND challenge_no=#{challenge_no};
//
//	</select>
	public static int certified_count(Challenge_CertifiedVO vo)
	{
		int count =0;
		SqlSession session =null;
		try {
			session=ssf.openSession();
			count=session.selectOne("certified_count",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return count;
	}
	
}
