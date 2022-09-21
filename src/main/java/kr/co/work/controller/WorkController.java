package kr.co.work.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.work.service.WorkService;

@Controller
public class WorkController {
 
	@Autowired
	@Qualifier("ws")
	private WorkService service;
	
	@RequestMapping("/work/work_content")
	public String work_content(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.work_content(request,model,session);
	}
	
    @RequestMapping("/work/apply") // 회원이 content에서 일자리 신청했을경우 처리  
    public String apply(HttpSession session,HttpServletRequest request)
    {
    	return service.apply(session,request);
    }
    
    //일일알바 리스트
    @RequestMapping("work/shortwork")
    public String shortwork()
    {
    	return "work/shortwork";
    }
}
