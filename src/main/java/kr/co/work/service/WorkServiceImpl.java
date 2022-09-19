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
		model.addAttribute("wvo",mapper.work_content(id));
		return "/work/work_content";
	}

	@Override // 회원이 content에서 일자리 신청했을경우 처리 
	public String apply(HttpSession session, HttpServletRequest request) {
		 
		String userid=session.getAttribute("userid").toString();
		String wid=request.getParameter("wid");
		
		String dbapply=mapper.getApply(wid);
		String inapply=dbapply+","+userid; 
		
		mapper.apply(inapply,wid);
		
		return "/work";
	}

}
