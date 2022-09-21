package kr.co.work.mapper;

import kr.co.work.vo.WorkVO;

public interface WorkMapper {

	public WorkVO work_content(String id);
    public int check_apply(String id,String userid);
	
	public int getApply(String userid,String workid);
	public void apply_add(String userid,String workid);

}
