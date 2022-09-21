package kr.co.work.service;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.work.mapper.MemberMapper;
import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;
import kr.co.work.vo.WorkVO;



@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	
	// 홈 리스트 출력
	@Override
	public String home(Model model,HttpServletRequest request) {
		
		String day;
		if(request.getParameter("day")==null)
		{
			day="";
		}
		else
			{
			day=request.getParameter("day");
			}
			
		ArrayList<WorkVO> wlist=mapper.work_list(day);
	  
		model.addAttribute("wlist",wlist);
		return "/main/home";
	}
 
	
	@Override
	public String member_input_ok(MemberVO mvo) 
	{
		
		 mapper.member_input_ok(mvo);
		return "redirect:/main/home"; // 나중에 /login/login 따로만들기
	}

	@Override
	public void check_userid(HttpServletRequest request, PrintWriter out) {
		 String userid=request.getParameter("userid");
		 int chk=mapper.check_userid(userid);
		out.print(chk);
	}
	
	// 로그인
	
    @Override
    public String login(HttpServletRequest request,Model model)
    {
   	String state=request.getParameter("state");
       String err=request.getParameter("err");
   	model.addAttribute("state",state);
       model.addAttribute("err",err);
   	return "/member/login";
    }
	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		  MemberVO mvo2=mapper.login_ok(mvo);
		  if(mvo2 != null) //로그인성공
		  {
			  //0 정상/ 1 탈퇴신청중 /2 탈퇴완료/777관리자
			  if(mvo2.getState()==1)
			  {
				  return  "redirect:/login/login?state=1";
			  }
			  else if(mvo2.getState()==2)
			  {
				  return  "redirect:/login/login?state=2";
			  }
			  else 
			  {
				 // 세션변수를 생성
				session.setAttribute("userid",mvo2.getUserid());
				session.setAttribute("name", mvo2.getName());
				return "redirect:/main/home";
			  }
		  }
		  else //로그인 실패 (아이디,비밀번호 일치하지않음)
		  {			  
			  
			  return "redirect:/member/login?err=1";
		  }
	}
	
	// 아이디,비번찾기 ajax 부분 
		@Override
		public void searching_userid(HttpServletRequest request, PrintWriter out) {
			
			String name=request.getParameter("name");
			String ymd=request.getParameter("ymd");
			
			String userid=mapper.get_userid(name,ymd);
			
		 
			out.print(userid);
			
		}
		@Override
		public void searching_pwd(HttpServletRequest request, PrintWriter out) {
			
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			String pwd=mapper.get_pwd(userid,name,phone);
			
		 
			out.print(pwd);
			
		}
	 
		
		

	

		
		
		
}
