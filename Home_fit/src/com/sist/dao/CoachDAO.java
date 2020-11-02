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
	   public static void CoachInsert(tutor_VO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("CoachInsert",vo);
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
	   
	   public static List<ScheduleVO> scheduleData(ScheduleVO vo)
	   {
	 	  SqlSession session=ssf.openSession();
	 	  List<ScheduleVO> list = new ArrayList<ScheduleVO>();
	 	  list=session.selectList("scheduleData",vo);
	 	  session.close();
	 	  return list;
	   }
	   

	   public static void replyInsert(ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);// commit(X)
		   // commit() ==> DML
		   session.insert("replyInsert",vo);
		   session.close();
	   }
	   
	   public static List<ReplyVO> replyListData(int bno)
	   {
		   SqlSession session=ssf.openSession();
		   List<ReplyVO> list=session.selectList("replyListData",bno);
		   session.close();
		   return list;
	   }
	   
	   // 예약 (코치목록)
	   public static List<tutor_VO> coachReserveData()
	   {
		   SqlSession session=ssf.openSession();
		   List<tutor_VO> list=session.selectList("coachReserveData");
		   session.close();
		   return list;
	   }
	   // 예약 (스케쥴 목록)
	   public static List<ScheduleVO> scheduleListData2(int coach_no)
	   {
		   SqlSession session=null;
		   List<ScheduleVO> list = new ArrayList<ScheduleVO>();
		   try {
			   session=ssf.openSession();
			   list=session.selectList("scheduleReserveData",coach_no);
		   }catch (Exception e) {
			   e.printStackTrace();
		   }finally {
			if(session!=null)
				session.close();
		}
		   return list;
	   } 
	   
	   // 코치 Q&A 목록
	   public static List<CoachQnaVO> coachQnaList()
	   {
		   SqlSession session=ssf.openSession();
		   List<CoachQnaVO> list=session.selectList("coachQnaList");
		   session.close();
		   return list;
	   }
	   
	   // 코치예약 추가
	   public static void coachreserveInsert(Coach_ReserveVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("coachreserveInsert", vo);
		   session.close();
	   }
	   
	   // 코치예약체크변경
	   public static void coachreserveCheck(Map map)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("coachreserveOK", map);
		   session.close();
	   }
	   
	   // 예약페이지 => 마이페이지 출력
	   public static List<Coach_ReserveVO> coachreserveList(String id)
	   {
		   SqlSession session=ssf.openSession();
		   List<Coach_ReserveVO> list=session.selectList("coachReserveList",id);
		   session.close();
		   return list;
	   }
	   
	   
	}
	   
	   
	   
	   
	   
	   
	   
