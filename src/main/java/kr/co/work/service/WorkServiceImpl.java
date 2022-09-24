package kr.co.work.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.work.mapper.WorkMapper;
import kr.co.work.vo.NoticeVO;
import kr.co.work.vo.WorkVO;

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
		
		/*for(int i=0;i<48;i++) // 나중에삭제
		{
			for(int d=0;d<=6;d++)
			mapper.dobae(d);
		}
		*/
		
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

	@Override
	public String shortwork_list(HttpServletRequest request, Model model) {
		
		String day; //월,화,수,목,금 ,토,일 
		if(request.getParameter("day")==null)
		{
			day="";
		}
		else
			{
			day=request.getParameter("day");
			}
		
		int page,start;
		  //현재페이지,그 페이지의 시작인덱스

		// 한 페이지의 레코드 갯수를 구하여 변수에 저장
		int pcnt;
		if(request.getParameter("pcnt")==null)
		      {
			pcnt=10;
		      }
		else
		{
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		}
		// 원하는 페이지의 시작 인덱스 값을 구하기
				if(request.getParameter("page")==null)
				{
					page=1;
				}
				else
				{
					page=Integer.parseInt(request.getParameter("page"));
				}
				
				start=(page-1)*pcnt;
				
		// 사용자가 페이지를 이동하기 위해 출력하는 범위
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10;
		if(page%10==0)
		{
			pstart=pstart-1;
		}
		
		pstart=pstart*10+1;
      pend=pstart+9;
      
      int chong=mapper.getchong(day); // 여기 조건달아줘야됨
     
      if(chong < pend)
        pend=chong;
      
      ArrayList<WorkVO> list=mapper.shortwork_list(day,start,pcnt);
     
      model.addAttribute("list",list);
      model.addAttribute("page",page); // 현재페이지
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);		
		model.addAttribute("chong",chong); //총페이지
       model.addAttribute("pcnt",pcnt);
        
       model.addAttribute("day",day);
		return "/work/shortwork";
	}

	
	
	//공지
	
	@Override
	public String notice_list(Model model) {
		 
		model.addAttribute("list",mapper.notice_list());
		  
		return "/notice/notice_list";
	}

	@Override
	public String notice_readnum(HttpServletRequest request) {
		
		String id=request.getParameter("id");
		 mapper.notice_readnum(id);
		return "redirect:/notice/notice_content?id="+id;
		
	}

	@Override
	public String notice_content(HttpServletRequest request,Model model) {
		
		String id=request.getParameter("id");
		
		NoticeVO nvo=mapper.notice_content(id);
		nvo.setContent(nvo.getContent().replace("\r\n", "<br>"));
		model.addAttribute("nvo",nvo);
		 
		
		int prev_id=mapper.prev_id(id);  // xml에서 CDATA는 태그안에서는 전부 문자열로 치환시켜버리기 때문입니다 부등호 문자열
		int next_id=mapper.next_id(id);
		
		model.addAttribute("prev_id",prev_id);
		model.addAttribute("next_id",next_id);
		
		return "/notice/notice_content";
	}


	
	
}
