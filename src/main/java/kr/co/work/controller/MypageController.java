package kr.co.work.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.work.service.MemberService;
import kr.co.work.service.MypageService;
import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;

@Controller
public class MypageController {
	@Autowired
	@Qualifier("ms2")
	private MypageService service;
	
	 // MYpage
	   
	   @RequestMapping("/mypage/myinfo")
	    public String myinfo(HttpSession session,Model model)
	    {
	    	return service.myinfo(session,model);
	    }
	    @RequestMapping("/mypage/pwd_change")
	    public String pwd_change()
	    {
	    	return "/mypage/pwd_change";
	    }
	    @RequestMapping("/mypage/pwd_change_ok")
	    public String pwd_change_ok(HttpServletRequest request,HttpSession session)
	    {
	    	return service.pwd_change_ok(request,session);
	    }
	    @RequestMapping("/mypage/my_update")
	    public String my_update(HttpSession session,Model model)
	    {
	    	return service.my_update(session,model);
	    }
	    @RequestMapping("/mypage/my_update_ok")
	    public String my_update_ok(MemberVO mvo,HttpSession session)
	    {
	    	return service.my_update_ok(mvo,session);
	    }
	    @RequestMapping("/mypage/member_out")
	    public String member_out()
	    {
	    	return "/mypage/member_out";
	    }
	    @RequestMapping("/mypage/member_out_ok")    
	    public String member_out(HttpSession session,HttpServletRequest request)
	    {
	    	return service.member_out_ok(session,request);
	    }
	    
	 
	   @RequestMapping("/mypage/my_apply")
	   public String my_apply(Model model,HttpSession session)
	   {
		   return service.my_apply(model,session);
	   }
	   
	   @RequestMapping("/mypage/information")
	   public String information(Model model,HttpSession session)
	   {
		   return service.information(model,session);
	   }
	   
	   @RequestMapping("/mypage/info_input_ok")
	   public String info_input_ok(InfoVO ivo,HttpSession session)
	   {
		   return service.info_input_ok(ivo,session);
	   }
	   @RequestMapping("/mypage/info_update_ok")
	   public String info_update_ok(InfoVO ivo,HttpSession session)
	   {
		   return service.info_update_ok(ivo, session);
	   }
}
