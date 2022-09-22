package kr.co.work.mapper;

import java.util.ArrayList;

import kr.co.work.vo.WorkVO;

public interface WorkMapper {

	public WorkVO work_content(String id);
    public int check_apply(String id,String userid);
	
    public void dobae();
    
	public int getApply(String userid,String workid);
	public void apply_add(String userid,String workid);
	
	public int getchong(String day);
	public ArrayList<WorkVO> shortwork_list(String day,int start,int pcnt);
	

}
