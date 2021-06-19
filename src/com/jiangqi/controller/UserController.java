package com.jiangqi.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jiangqi.model.Note;
import com.jiangqi.model.User;
import com.jiangqi.repository.NoteRepository;
import com.jiangqi.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    NoteRepository noteRepository;

    @RequestMapping("/reg")
    public String reg() {
        return "registered";
    }

    @RequestMapping("/registere")
    public @ResponseBody
    ModelAndView addNewUser(@Validated User user, BindingResult br, ModelAndView mv,
                            HttpServletRequest request, MultipartFile head) {
        mv.addObject("existMsg", null);
        mv.setViewName("registered");
        mv.addObject("user", user);
        if (!user.getPassword().equals(user.getRepassword())) {
            mv.addObject("repasswordMsg", "两次输入密码不一致");
        }
        // 注解验证
        int errorCount = br.getErrorCount();
        if (errorCount > 0) {
            FieldError nameError = br.getFieldError("userName");
            FieldError passwordError = br.getFieldError("password");
            FieldError emailError = br.getFieldError("email");
            FieldError genderError = br.getFieldError("gender");
            if (nameError != null) {
                String userNameMsg = nameError.getDefaultMessage();
                mv.addObject("userNameMsg", userNameMsg);
            }
            if (passwordError != null) {
                String passwordMsg = passwordError.getDefaultMessage();
                mv.addObject("passwordMsg", passwordMsg);
            }
            if (emailError != null) {
                String emailMsg = emailError.getDefaultMessage();
                mv.addObject("emailMsg", emailMsg);
            }
            if (genderError != null) {
                String genderMsg = genderError.getDefaultMessage();
                mv.addObject("genderMsg", genderMsg);
            }
        } else {
            String fileName;
            if (!head.isEmpty()) {
                String path = request.getServletContext().getRealPath("/assets/head/");
                fileName = head.getOriginalFilename();
                File file1 = new File(path, fileName);
                if (!file1.getParentFile().exists()) {
                    file1.getParentFile().mkdirs();
                }

                try {
                    head.transferTo(new File(path + File.separator + fileName));
                } catch (IllegalStateException | IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } else {
                fileName = "0.png";
            }

            User username = userRepository.findByUserName(user.getUserName());
            if (username == null) {
                User u = new User(user.getUserName(), user.getPassword(), fileName, new Date(), user.getEmail(),
                        user.getGender());
                userRepository.save(u);
                mv.setViewName("login");
            } else {
                mv.addObject("existMsg", "用户名已存在，请重新注册！");
            }
        }
        return mv;
    }

    @RequestMapping("/login")
    public ModelAndView login(String userName, String password, HttpServletRequest request,
                              HttpServletResponse response, HttpSession session, ModelAndView mv) throws IOException {
        mv.setViewName("login");
        mv.addObject("errorMeg", null);
        User user = userRepository.findByUserNameAndPassword(userName, password);
        if (user != null) {
            mv.addObject("user", user);
            mv.setViewName("index");
            // session过期时间设置，以秒为单位，即在没有活动30分钟后，session将失效
            session.setMaxInactiveInterval(7 * 24 * 60 * 60);
            session.setAttribute("userName", userName);
            String isLogin = request.getParameter("isLogin");
            if ("on".equals(isLogin)) {
                session.setAttribute("dname", userName);
                session.setAttribute("dpassword", password);
            }
            List<Note> noteList = noteRepository.findAll();
            List unameStringList = new ArrayList<>();
            List headList = new ArrayList<>();
            for (Note n : noteList) {
                unameStringList.add(userRepository.getUserName(n.getUser().userId));
                headList.add(userRepository.getHead(n.getUser().userId));
            }
            mv.addObject("msg", noteList);
            mv.addObject("unameString", unameStringList);
            mv.addObject("head", headList);

        } else {
            mv.addObject("errorMeg", "用户名或密码错误!");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        session.invalidate();
        return "login";
    }

    @RequestMapping("/login1")
    public String login1() {
        return "login";
    }

    @RequestMapping("/error")
    public String error() {
        return "error";
    }
}
