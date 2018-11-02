package com.guosai.entity;
// Generated 2018-10-24 20:18:32 by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TGrade generated by hbm2java
 */
@Entity
@Table(name = "t_grade", catalog = "db_xiaomi")
public class Grade implements java.io.Serializable {

	private Integer id;
	private String gradename;
	private Integer grade;
	private Grade parent;


	public Grade() {
	}

	public Grade(String gradename, Integer grade, Grade parent) {
		this.gradename = gradename;
		this.grade = grade;
		this.parent = parent;
	
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parentId")
	
	public Grade getParent() {
		return parent;
	}

	public void setParent(Grade parent) {
		this.parent = parent;
	}

	@Column(name = "gradename", length = 20)
	public String getGradename() {
		return this.gradename;
	}

	

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	@Column(name = "grade")
	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	

	

}
