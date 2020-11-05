package com.sist.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.*;

/**
 * @author 김한비
 *
 */
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
	
	public static ShopVO shopWishlistData(int shop_no)
	   {
		   SqlSession session=ssf.openSession();
		   ShopVO list=session.selectOne("shopWishlistData",shop_no);
		   session.close();// 반환
		   return list;
	   }
	
		public static List<CategoryVO> shopCategoryData()
	   {
		   SqlSession session=ssf.openSession();
		   List<CategoryVO> list=session.selectList("shopCategoryData");
		   session.close();// 반환
		   return list;
	   }
	

	// 총페이지 구하기
	public static int shopTotalPage(int sub_cate_no_num) {
		int total = 0;
		SqlSession session = null;
		try {
			// 연결
			session = ssf.openSession();
			total = session.selectOne("shopTotalPage",sub_cate_no_num);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static ShopVO shopDetailData(int shop_no) {
		SqlSession session=ssf.openSession();
		ShopVO vo=session.selectOne("shopDetailData", shop_no);
		session.close();
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
	
	// 장바구니
	public static void wishlistInsert(WishlistVO wvo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("wishlistInsert",wvo);
		   session.close();
	   }
	
	public static List<WishlistVO> wishlistData(String id){
		   SqlSession session=ssf.openSession();
		   List<WishlistVO> list=session.selectList("wishlistData",id);
		   session.close();// 반환
		   return list;
	   }
	public static void wishlistDelete(int wishlist_no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.delete("wishlistDelete", wishlist_no);
		   session.close();
	   }

	public static void wishlistCount(WishlistVO wvo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("wishlistCount", wvo);
		   session.close();
	   }
	
	public static void wishlist_purchase(WishlistVO wvo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("wishlist_purchase", wvo);
		   session.close();
	   }
	
	public static List<WishlistVO> purchaselistData(String id){
		   SqlSession session=ssf.openSession();
		   List<WishlistVO> list=session.selectList("purchaselistData",id);
		   session.close();// 반환
		   return list;
	   }
	
}
