package com.jiangqi.model;

import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

import org.springframework.validation.annotation.Validated;

@Validated
@Entity
@Table(name = "notes")
public class Note {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer noteId;
	@NotEmpty(message="标题不能为空")
	private String title;
	@NotEmpty(message="内容不能为空")
	private String content;
	@Column(name = "pubTime")
	private Date  pubTime;

	@OneToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="userId",referencedColumnName="id")
	private User user;
	//附件
	private String attachment;
	//文章id,0表示父标题
	private Integer pid;

	public Note() {
		super();
	}

	public Note(@NotEmpty(message = "标题不能为空") String title, @NotEmpty(message = "内容不能为空") String content, Date pubTime, User user, String attachment, Integer pid) {
		this.title = title;
		this.content = content;
		this.pubTime = pubTime;
		this.user = user;
		this.attachment = attachment;
		this.pid = pid;
	}

	public Integer getNoteId() {
		return noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPubTime() {
		return pubTime;
	}

	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
}
