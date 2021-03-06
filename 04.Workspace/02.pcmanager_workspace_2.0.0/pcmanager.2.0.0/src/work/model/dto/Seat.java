package work.model.dto;

import java.util.Date;

/** 좌석 클래스 */
public class Seat {
	
	/** 좌석번호 */
	private int seatNo;
	
	/** 회원아이디 */
	private String memberId;
	
	/** 상태
	 *  사용중 : 1, 빈좌석 : 0
	 */
	private int condition;
	
	/** 시작시각 */
	private Date startTime;
	
	/** 종료시각 */
	private Date finishTime;
	
	/** 최대가용시간*/
	private Date maxTime;
	
	/** 모니터 */
	private String monitor;
	
	/** 본체 */
	private String mainframe;
	
	public Seat() {}
	
	public Seat(int seatNo, String memberId, int condition) {
		this.seatNo = seatNo;
		this.memberId = memberId;
		this.condition = condition;
	}
	public Seat(int seatNo, String memberId, int condition, Date startTime, Date finishTime,Date maxTime, String monitor,
			String mainframe) {
		this.seatNo = seatNo;
		this.memberId = memberId;
		this.condition = condition;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.maxTime = maxTime;
		this.monitor = monitor;
		this.mainframe = mainframe;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	public String getMonitor() {
		return monitor;
	}
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	public String getMainframe() {
		return mainframe;
	}
	public void setMainframe(String mainframe) {
		this.mainframe = mainframe;
	}
	public Date getMaxTime() {
		return maxTime;
	}
	public void setMaxTime(Date maxTime) {
		this.maxTime = maxTime;
	}

	@Override
	public String toString() {
		return "Seat [seatNo=" + seatNo + ", memberId=" + memberId + ", condition=" + condition + ", startTime="
				+ startTime + ", finishTime=" + finishTime + ", maxTime=" + maxTime + ", monitor=" + monitor
				+ ", mainframe=" + mainframe ;
	}

	
	
}
