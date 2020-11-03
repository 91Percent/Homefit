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
	// 로그인
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("member/login_ok.do")
	public String member_login_ok(HttpServletRequest request) {

		String msg = "";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
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

	// 회원가입
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request) {
		System.out.println("join_ok...");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String bday1 = request.getParameter("bday1");
		String bday2 = request.getParameter("bday2");
		String bday3 = request.getParameter("bday3");
		String tel = request.getParameter("tel");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String my_exercise = request.getParameter("my_exercise");
		String my_level = request.getParameter("my_level");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setGender(gender);
		vo.setBirthday(bday1 + "." + bday2 + "." + bday3);
		vo.setTel(tel);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setMy_exercise(my_exercise);
		vo.setMy_level(my_level);
		
		
		MemberDAO.memberInsert(vo);

		return "redirect:../main/main.do";
	}

	// 아이디 체크
	@RequestMapping("member/idcheck.do")
	public String member_idcheck(HttpServletRequest request) {
		return "../member/idcheck.jsp";
	}

	@RequestMapping("member/idcheck_ok.do")
	public String member_idcheck_ok(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		// DB연동
		int count = MemberDAO.memberIdCheck(id);
		request.setAttribute("count", count);
		return "../member/idcheck_ok.jsp";
	}
	
	
}