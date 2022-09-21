package kr.co.work.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;

public interface MemberService {

	//홈
	public String home(Model model,HttpServletRequest request);
	
	//회원가입
	public String member_input_ok(MemberVO mvo);
	public void check_userid(HttpServletRequest request,PrintWriter out);
    
	//로그인
	public String login(HttpServletRequest request,Model model);
	public String login_ok(MemberVO mvo,HttpSession session);
   
	// 아이디,비번찾기
	public void searching_userid(HttpServletRequest request,PrintWriter out);
	public void searching_pwd(HttpServletRequest request,PrintWriter out);
     
	// mypage
		public String myinfo(HttpSession session,Model model);
		public String pwd_change_ok(HttpServletRequest request,HttpSession session);
		public String my_update(HttpSession session,Model model);
		public String my_update_ok(MemberVO mvo,HttpSession session);
		public String member_out_ok(HttpSession session,HttpServletRequest request);
   
		public String my_apply(Model model,HttpSession session);
		   
		public String information(Model model,HttpSession session);
		public String info_input_ok(InfoVO ivo,HttpSession session);


		
}
