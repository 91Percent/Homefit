package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.*;

public class ShopDAO {

	private static SqlSessionFactory ssf; // XML을 읽기

	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static void shopInsert(ShopVO vo) {
		SqlSession session = null;
		try {
			// 미리 만들어 둔 Connection
			/*
			 * autoCommit설정 ssf.openSession(); // commit이 없는 경우
			 * ssf.openSession(true);..autoCommit설정
			 */
			session = ssf.openSession(true);// commit을 실행한다
			// INSERT,UPDATE,DELETE => 데이터베이스 변경 => 반드시 COMMIT
			session.insert("shopInsert", vo);
			// 여러개의 SQL문장을 실행하면
			// session.commit();
		} catch (Exception ex) {
			// 에러 처리
			ex.printStackTrace();
		} finally {
			if (session != null) // 오라클에 연결되어 있다면
				session.close();
		}
	}

	public static List<ShopVO> shopListData(Map map) {
		List<ShopVO> list = new ArrayList<ShopVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // COMMIT을 사용여부
			list = session.selectList("shopListData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 총페이지 구하기
	public static int shopTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			// 연결
			session = ssf.openSession();
			total = session.selectOne("shopTotalPage");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static ShopVO shopDetailData(int shop_no) {
		ShopVO vo = new ShopVO();
		// 연결
		SqlSession session = null;
		try {
			// 연결 시도
			session = ssf.openSession();
			// SQL문장을 실행 => 결과값을 저장
			vo = session.selectOne("shopDetailData", shop_no);
		} catch (Exception ex) {
			// 에러 처리
			ex.printStackTrace();
		} finally {
			// 닫기 ==> 재사용이 가능하게 반환
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static List<ShopVO> shopDetailData2(String title) {
		List<ShopVO> list = new ArrayList<ShopVO>();
		// 연결
		SqlSession session = null;
		try {
			// 연결 시도
			session = ssf.openSession();
			// SQL문장을 실행 => 결과값을 저장
			list = session.selectOne("shopDetailData2", title);
		} catch (Exception ex) {
			// 에러 처리
			ex.printStackTrace();
		} finally {
			// 닫기 ==> 재사용이 가능하게 반환
			if (session != null)
				session.close();
		}
		return list;
	}

}
