package com.sist.dao;
import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.ExVO;
import com.sist.vo.MemberVO;
import com.sist.vo.ShopVO;
/**
 * @author 이보미
 *
 */
import com.sist.vo.tutor_VO;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static int memberIdCheck(String id) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdcheck", id);
		session.close();
		return count;
	}
	
	public static void memberInsert(MemberVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("memberInsert", vo);
		session.close();
	}

	public static MemberVO memberLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdcheck", id);
		if (count == 0) {
			vo.setMsg("NOID");
		} else {
			MemberVO dVO = session.selectOne("memberLogin", id);
			if (pwd.equals(dVO.getPwd())) {
				vo.setMsg("OK");
				vo.setId(dVO.getId());
				vo.setName(dVO.getName());
				vo.setAdmin(dVO.getAdmin());
			} else {
				vo.setMsg("NOPWD");
			}
		}

		return vo;
	}
	public static List<MemberVO> memberRcList1(String id)
	{
		SqlSession session = ssf.openSession();
		List<MemberVO> list1 = session.selectList("memberRcList1",id);
		session.close();
		
		return list1;
	}
	
	public static List<MemberVO> memberRcList2(String id)
	{
		SqlSession session = ssf.openSession();
		List<MemberVO> list2 = session.selectList("memberRcList2",id);
		session.close();
		
		return list2;
	}
	
	// 비회원 로그인시에 데이터 랜덤으로 받아서 출력하는 부분
	/*
	 	<!-- 비회원로그인시 홈트 데이터 랜덤으로 가져오는 부분  -->
		<select id="Non-members_Ex" resultType="ExVO" parameterType="int">
			SELECT * FROM hometraining WHERE cate_no=#{cate_no};
		</select>
	 */
	public static List<ExVO> Non_members_Ex(int cate_no)
	{
		SqlSession session =null;
		List<ExVO> list =new  ArrayList<ExVO>();
		try {
			session=ssf.openSession();
			list = session.selectList("Non_members_Ex",cate_no);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}


	// 비회원 로그인시에 데이터 랜덤으로 받아서 출력하는 부분
	/*
	 	<!-- 비회원로그인시 코치 데이터 랜덤으로 가져오는 부분  -->
		<select id="Non_members_coach" resultType="tutor_VO" parameterType="int">
			SELECT * FROM coach_info WHERE cate_no=#{cate_no};
		</select>
	 */
	
	public static List<tutor_VO> Non_members_coach(int cate_no)
	{
		SqlSession session = null;
		List<tutor_VO> list = new ArrayList<tutor_VO>();
		try {
			session=ssf.openSession();
			list = session.selectList("Non_members_coach",cate_no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 비회원 로그인시에 데이터 랜덤으로 받아서 출력하는 부분
	/*
	 	<!-- 비회원로그인시 샵 데이터 랜덤으로 가져오는 부분  -->
		<select id="Non_members_shop" resultType="ShopVO" parameterType="int">
			select * from shop where cate_no like '%'||#{cate_no}||'%';
		</select>
	 */
	public static List<ShopVO> Non_members_shop(int cate_no)
	{
		SqlSession session =null;
		List<ShopVO> list = new ArrayList<ShopVO>();
		try {
			session=ssf.openSession();
			list=session.selectList("Non_members_shop",cate_no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}