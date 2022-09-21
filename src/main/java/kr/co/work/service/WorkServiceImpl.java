package kr.co.work.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.work.mapper.WorkMapper;

@Service
@Qualifier("ws")
public class WorkServiceImpl implements WorkService {

	@Autowired 
	 private WorkMapper mapper;
	
	@Override
	public String work_content(HttpServletRequest request, Model model, HttpSession session) {
		
		String id=request.getParameter("id");
		if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("apply",mapper.check_apply(id,userid)); // 유저가 신청한건지 확인용 apply=0 => 신청가능 1=> 이미신청함
		}
		
		model.addAttribute("wvo",mapper.work_content(id));

		return "/work/work_content";
	}

	@Override
	public String apply(HttpSession session, HttpServletRequest request) {
		
		String userid=session.getAttribute("userid").toString();
		String workid=request.getParameter("wid");
		
		//cnt = 중복신청체크 0이면 신청가능 1이면 이미신청
		int cnt=mapper.getApply(userid,workid);
		
		if(cnt==0)
		  {
			mapper.apply_add(userid,workid);
			return "redirect:/work/work_content?ok=1&id="+workid;
		  }
		else 
		{
			return "redirect:/work/work_content?cnt=1&id="+workid;
		}
		
	}


	
}
