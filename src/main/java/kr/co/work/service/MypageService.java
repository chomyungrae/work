package kr.co.work.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;

public interface MypageService {

	// mypage
			public String myinfo(HttpSession session,Model model);
			public String pwd_change_ok(HttpServletRequest request,HttpSession session);
			public String my_update(HttpSession session,Model model);
			public String my_update_ok(MemberVO mvo,HttpSession session);
			public String member_out_ok(HttpSession session,HttpServletRequest request);
	   
			public String my_apply(Model model,HttpSession session);
			   
			public String information(Model model,HttpSession session);
			public String info_input_ok(InfoVO ivo,HttpSession session);
            public String info_update_ok(InfoVO ivo,HttpSession session);


}
