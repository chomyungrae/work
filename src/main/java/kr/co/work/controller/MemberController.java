package kr.co.work.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.work.service.MemberService;
import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms")
	private MemberService service;

	// home 출력부분
	@RequestMapping("/")
	public String root()
	{
		return "redirect:/main/home";
	}
	@RequestMapping("/main/home")
	public String home(Model model,HttpServletRequest request)
	{
		return service.home(model,request);
	}
	
	// 회원가입부분
	@RequestMapping("/member/member_input")
	public String member_input() {
		return "/member/member_input";
	}

	 @RequestMapping("/member/check_userid")
	   public void check_userid(HttpServletRequest request,PrintWriter out)
	   {
		   service.check_userid(request,out);
	   }
	 
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVO mvo) {
		return service.member_input_ok(mvo);
	}
	
	
	 @RequestMapping("/member/member_input_final")
	   public String member_input_final()
	   {
		   return "/member/member_input_final";
	   }
	   
	 // 로그인관련부분   
	   @RequestMapping("/member/login")
	   public String login(HttpServletRequest request,Model model)
	   {
		   return service.login(request,model);
	   }
	   @RequestMapping("/member/login_ok")
	   public String login_ok(MemberVO mvo,HttpSession session)
	   {
		   return service.login_ok(mvo,session);
	   }
	   @RequestMapping("/logout")
	   public String logout(HttpSession session)
	   {
		   session.invalidate();
		   return "redirect:/main/home";
	   }
	   //아이디 ,비밀번호 찾기
	   @RequestMapping("/member/userid_search")
	   public String userid_search()
	   {
		   return "/member/userid_search";
	   }
	   @RequestMapping("/member/pwd_search")
	   public String pwd_search()
	   {
		   return "/member/pwd_search";
	   }
	   
	 //아이디 ,비밀번호 찾기 (아작스 부분 )
	   @RequestMapping("/member/searching_userid")
	    public void searching_userid(HttpServletRequest request,PrintWriter out)
	    {
		   service.searching_userid(request,out);
	    }
	   @RequestMapping("/member/searching_pwd")
	   public void searching_pwd(HttpServletRequest request,PrintWriter out)
	   {
		   service.searching_pwd(request,out);
	   }
	   
	   
	  
	   
}
