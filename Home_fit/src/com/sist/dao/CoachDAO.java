package com.sist.dao;
import java.io.Reader;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;


public class CoachDAO {
	private static SqlSessionFactory ssf;
	   static 
	   {
		   try
		   {
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
			   // getConnection,disConnection
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	   // 코치스케쥴 데이터
	   public static void ScheduleInsert(ScheduleVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   //System.out.println("돌아간다!!!");
			   session=ssf.openSession(true);
			   session.insert("ScheduleInsert",vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   // 코치스케쥴 목록
	   public static List<ScheduleVO> scheduleListData(Map map)
	   {
		   List<ScheduleVO> list=new ArrayList<ScheduleVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("scheduleListData",map);
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
	   
	   
	   // 스케쥴 총페이지
//	   public static int coachTotalpage()
//	   {
//		   int total=0;
//		   SqlSession session=null;
//		   try
//		   {
//			   session=ssf.openSession();
//			   total=session.selectOne("scheduleTotalPage");
//		   }catch(Exception ex)
//		   {
//			   ex.printStackTrace();
//		   }
//		   finally
//		   {
//			   if(session!=null)
//				   session.close();
//		   }
//		   return total;
//	   }
//	   
	   
	   
	   // 코치 목록 데이터
	   public static void CoachInsert(tutor_VO vo1)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("CoachInsert",vo1);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   // 코치 정보 목록
	   public static List<tutor_VO> coachListData(Map map)
	   {
		   List<tutor_VO> list=new ArrayList<tutor_VO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("coachListData",map);
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
	   // 코치 총페이지
	   public static int coachTotalpages()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("coachTotalPage");
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
	   public static tutor_VO coachDeatilData(int coach_no)
	   {
		   SqlSession session=ssf.openSession();
		   tutor_VO vo=session.selectOne("coachDetailData",coach_no);
		   session.close();
		   return vo;
	   }
	   
}
