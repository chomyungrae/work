package kr.co.work.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.work.mapper.MypageMapper;
import kr.co.work.vo.InfoVO;
import kr.co.work.vo.MemberVO;

@Service
@Qualifier("ms2")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;

	// mypage부분
			@Override
			public String myinfo(HttpSession session, Model model) {
				  String userid=session.getAttribute("userid").toString();
				    MemberVO mvo=mapper.myinfo(userid);
				    model.addAttribute("mvo",mvo);
				    
				return "/mypage/myinfo";
			}
			@Override
			public String pwd_change_ok(HttpServletRequest request, HttpSession session) {
				 String userid=session.getAttribute("userid").toString();
				 String pwd=request.getParameter("pwd");
				
				 String dbpwd=mapper.get_dbpwd(userid,pwd);
				
				 if(dbpwd!=null)
				  {	 		 
				   String pwd1=request.getParameter("pwd1");
				    mapper.pwd_change_ok(userid,pwd1);
				    return "redirect:/mypage/myinfo";
				  }
				 else
				 {
					 return "redirect:/mypage/pwd_change?err=1";
				 }
				 
				 }
			@Override
			public String my_update(HttpSession session, Model model) {
				String userid=session.getAttribute("userid").toString();
			    MemberVO mvo=mapper.myinfo(userid); // 위에 쿼리문 돌려쓰기
			    model.addAttribute("mvo",mvo);    
				return "/mypage/my_update";
			}

			@Override
			public String my_update_ok(MemberVO mvo,HttpSession session) {
				 String userid=session.getAttribute("userid").toString();
				 mvo.setUserid(userid);
				 mapper.my_update_ok(mvo);
				
				 return "redirect:/mypage/myinfo";
			}

			@Override
			public String member_out_ok(HttpSession session, HttpServletRequest request) {
				 String userid=session.getAttribute("userid").toString();
				 String pwd=request.getParameter("pwd");
				 
				 //0 정상/ 1 탈퇴신청중 /2 탈퇴완료/777관리자
				 int chk=mapper.check_member(userid,pwd);
				 if(chk==1)
				 {
					 mapper.member_state1(userid);
				     session.invalidate(); 
					 return "redirect:/main/home";
				 }
				 else
				 {
					 return "redirect:/mypage/member_out?err=1"; 
			    }
				 
			}


			@Override
			public String my_apply(Model model,HttpSession session) {
				String userid=session.getAttribute("userid").toString(); 
				model.addAttribute("list",mapper.my_apply(userid));
				return "mypage/my_apply";
			}

			
			@Override
			public String information(Model model,HttpSession session) {
				String userid=session.getAttribute("userid").toString(); 
				model.addAttribute("ivo",mapper.information(userid));
				return "/mypage/information";
			}

			@Override
			public String info_input_ok(InfoVO ivo,HttpSession session) {
				
	            String userid=session.getAttribute("userid").toString();		
				ivo.setUserid(userid);
			
				mapper.info_input_ok(ivo);
				return "redirect:/mypage/information";
			}
			@Override
			public String info_update_ok(InfoVO ivo, HttpSession session) {
				String userid=session.getAttribute("userid").toString();		
				ivo.setUserid(userid);
			
				mapper.info_update_ok(ivo);
				return "redirect:/mypage/information";
			}

}
