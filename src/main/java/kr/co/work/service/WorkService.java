package kr.co.work.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
;

public interface WorkService {

	public String work_content(HttpServletRequest request,Model model,HttpSession session);
    public String apply(HttpSession session,HttpServletRequest request);
    
    public String shortwork_list(HttpServletRequest request,Model model);

    //공지
	public String notice_list(Model model);
    public String notice_readnum(HttpServletRequest request);
    public String notice_content(HttpServletRequest request,Model model);


}
