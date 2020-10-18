package com.sist.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.*;

/**
 * @author 이동은
 *
 */
public class NewsDAO {

	private static SqlSessionFactory ssf;
	   
	   static 
	   {
		   try
		   {
			  
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   
			   ssf=new SqlSessionFactoryBuilder().build(reader);
			   
		   }catch(Exception ex)
		   {
			   
			   System.out.println(ex.getMessage());
		   }   
	   }
	   
	   
	   public static void NewsVO(NewsVO vo)
	   {
		   List<NewsVO> list=new ArrayList<NewsVO>();
		 
		   SqlSession session=null;
		   
		  
		   try
		   {
			   
			   session=ssf.openSession(true);
			   
			   session.insert("NewsInsert",vo);
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

}



