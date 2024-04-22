package com.rain.bean;

public class ProblemBean {
	/**
	 * 历史借阅记录的数据表的bean
	 */
	private int pid;// 反馈问题的id
	private int aid;//反馈问题的上传人
	private String name;// 标题
	private String page;// 问题页面
	private String body;// 问题描述
	private String phone;// 联系电话
	private String status;//问题状态

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public int getAid() {
		return aid;
	}
	
	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
