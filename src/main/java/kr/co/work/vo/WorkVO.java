package kr.co.work.vo;

import java.sql.Date;
import java.time.LocalDate;

public class WorkVO {
 private int id,gender,pay,time,inwon,state,paytype;
 private String workday,workname,workplace,content,writeday,start_time,close_time;

 private int day; // 월,화,수,목..
 


public int getPaytype() {
	return paytype;
}
public void setPaytype(int paytype) {
	this.paytype = paytype;
}
public int getDay() {
	return day;
}
public void setDay(int day) {
	this.day = day;
}
public String getWorkday() {
	return workday;
}
public void setWorkday(String workday) {
	this.workday = workday;
}
public String getStart_time() {
	return start_time;
}
public void setStart_time(String start_time) {
	this.start_time = start_time;
}
public String getClose_time() {
	return close_time;
}
public void setClose_time(String close_time) {
	this.close_time = close_time;
}
public String getWriteday() {
	return writeday;
}
public void setWriteday(String writeday) {
	this.writeday = writeday;
}
public int getInwon() {
	return inwon;
}
public void setInwon(int inwon) {
	this.inwon = inwon;
}
public int getTime() {
	return time;
}
public void setTime(int time) {
	this.time = time;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getGender() {
	return gender;
}
public void setGender(int gender) {
	this.gender = gender;
}
public int getPay() {
	return pay;
}
public void setPay(int pay) {
	this.pay = pay;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}

public String getWorkname() {
	return workname;
}
public void setWorkname(String workname) {
	this.workname = workname;
}
public String getWorkplace() {
	return workplace;
}
public void setWorkplace(String workplace) {
	this.workplace = workplace;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
}
