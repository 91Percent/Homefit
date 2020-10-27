package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
/**
 * @author 이보미
 *
 */
public class MemberModel {

	@RequestMapping("member/login.do")
	public String member_join(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/login_ok.do")
	public String member_login(HttpServletRequest request) {
		
		String msg="";
		// 데이터 받기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		// DAO로 전송 결과값을 가지고 온다
		// 받은 결과값을 ==> login.jsp전송
		MemberVO vo = MemberDAO.memberLogin(id, pwd);
		
		if (vo.getMsg().equals("OK")) {
			HttpSession session = request.getSession();

			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
		}
		request.setAttribute("msg", vo.getMsg());
		
		return "../member/login_ok.jsp";
	}

	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}