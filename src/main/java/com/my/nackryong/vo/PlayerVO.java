package com.my.nackryong.vo;

public class PlayerVO {
	private String playerid;
	private String playerpwd;
	public PlayerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlayerVO(String playerid, String playerpwd) {
		super();
		this.playerid = playerid;
		this.playerpwd = playerpwd;
	}
	public String getPlayerid() {
		return playerid;
	}
	public void setPlayerid(String playerid) {
		this.playerid = playerid;
	}
	public String getPlayerpwd() {
		return playerpwd;
	}
	public void setPlayerpwd(String playerpwd) {
		this.playerpwd = playerpwd;
	}
	@Override
	public String toString() {
		return "PlayerVO [playerid=" + playerid + ", playerpwd=" + playerpwd + "]";
	}
	
	
	
}
