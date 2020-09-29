package com.my.nackryong.vo;

public class BookVO {
	private int seq;
	private String playerid;
	private String content;
	private String xdate;
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookVO(int seq, String playerid, String content, String xdate) {
		super();
		this.seq = seq;
		this.playerid = playerid;
		this.content = content;
		this.xdate = xdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getPlayerid() {
		return playerid;
	}
	public void setPlayerid(String playerid) {
		this.playerid = playerid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getXdate() {
		return xdate;
	}
	public void setXdate(String xdate) {
		this.xdate = xdate;
	}
	@Override
	public String toString() {
		return "BookVO [seq=" + seq + ", playerid=" + playerid + ", content=" + content + ", xdate=" + xdate + "]";
	}
		
}
