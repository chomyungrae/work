package kr.co.work.mapper;

import kr.co.work.vo.WorkVO;

public interface WorkMapper {

	public WorkVO work_content(String id);
	
	public String getApply(String wid);
	public void apply(String inapply,String wid);

}
