package kr.co.work.mapper;

import java.util.ArrayList;

import kr.co.work.vo.NoticeVO;
import kr.co.work.vo.WorkVO;

public interface WorkMapper {

	public WorkVO work_content(String id);
    public int check_apply(String id,String userid);
	
    public void dobae(int d);
    
	public int getApply(String userid,String workid);
	public void apply_add(String userid,String workid);
	
	public int getchong(String day);
	public ArrayList<WorkVO> shortwork_list(String day,int start,int pcnt);
	
   //공지
    public ArrayList<NoticeVO> notice_list();
	public void notice_readnum(String id);
	
	public NoticeVO notice_content(String id);
	public int prev_id(String id);
	public int next_id(String id);
}
