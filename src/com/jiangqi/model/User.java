
package com.jiangqi.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.validation.annotation.Validated;

@Validated
@Entity
@Table(name = "users")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer userId;

    @Column(name = "userName")
    @NotEmpty(message = "用户名不能为空")
    @Size(min = 2, max = 6, message = "姓名长度应在{min}-{max}")
    private String userName;

    @Column(name = "password")
    @NotEmpty(message = "密码不能为空")
    @Size(min = 6, max = 15, message = "密码长度应在{min}-{max}")
    private String password;

    @Column(name = "head")
    private String headSculpture;

    @Column(name = "regTime")
    private Date regTime;

    @Column(name = "email")
    @NotEmpty(message = "邮箱不能为空")
    @Email
    private String email;

    @Column(name = "gender")
    @NotNull(message = "性别不能为空")
    @Min(value = 0, message = "性别不能小于{value}")
    @Max(value = 1, message = "性别不能大于{value}")
    private Integer gender;

    @Transient
    private String repassword;

    public User() {
        super();
    }


    public User(@NotEmpty(message = "用户名不能为空") @Size(min = 2, max = 6, message = "姓名长度应在{min}-{max}") String userName,
                @NotEmpty(message = "密码不能为空") @Size(min = 6, max = 15, message = "密码长度应在{min}-{max}") String password,
                String headSculpture, Date regTime, @NotEmpty(message = "邮箱不能为空") @Email String email,
                @NotNull(message = "性别不能为空") @Min(value = 0, message = "性别不能小于{value}") @Max(value = 1, message = "性别不能大于{value}") Integer gender) {
        super();
        this.userName = userName;
        this.password = password;
        this.headSculpture = headSculpture;
        this.regTime = regTime;
        this.email = email;
        this.gender = gender;
    }


    public String getHeadSculpture() {
        return headSculpture;
    }

    public void setHeadSculpture(String headSculpture) {
        this.headSculpture = headSculpture;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }
}