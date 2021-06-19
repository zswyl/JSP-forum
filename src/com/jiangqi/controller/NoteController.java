package com.jiangqi.controller;

import com.jiangqi.model.Note;
import com.jiangqi.model.User;
import com.jiangqi.repository.NoteRepository;
import com.jiangqi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author 江七
 */
@Controller
public class NoteController {
    @Autowired
    NoteRepository noteRepository;
    @Autowired
    UserRepository userRepository;

    @RequestMapping("/release")
    public ModelAndView release(String title, String content, MultipartFile file, ModelAndView mv,
                                HttpSession session, HttpServletRequest request) {

        // 获取当前登录的用户名
        String userName = (String) session.getAttribute("userName");
        //Integer userId = userRepository.getUserId(userName);
        User user=userRepository.findByUserName(userName);
        Note note;
        /*上传附件*/
        if (!file.isEmpty()) {
            String path = request.getServletContext().getRealPath("/assets/upload/");
            String fileName = file.getOriginalFilename();
            File file1 = new File(path, fileName);
            if (!file1.getParentFile().exists()) {
                file1.getParentFile().mkdirs();
            }

            try {
                file.transferTo(new File(path + File.separator + fileName));
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
           note = new Note(title, content, new Date(), user, fileName,0);

        } else {
           note = new Note(title, content, new Date(), user, null,0);
        }

        /*上传数据库和回显前台操作*/
        noteRepository.save(note);
        mv.addObject("leaveMessage", "留言成功");
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
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/addMessage")
    public String addMessage() {
        return "addMessage";
    }

    @RequestMapping("/index")
    public ModelAndView index(ModelAndView mv) {
        List<Note> noteList = noteRepository.findAll();
        mv.addObject("msg", noteList);
        List unameStringList = new ArrayList<>();
        List headList = new ArrayList<>();
        for (Note n : noteList) {
            unameStringList.add(userRepository.getUserName(n.getUser().userId));
            headList.add(userRepository.getHead(n.getUser().userId));
        }
        mv.addObject("msg", noteList);
        mv.addObject("unameString", unameStringList);
        mv.addObject("head", headList);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/reply")
    public String reply(){
        return "reply";
    }

    @RequestMapping("/replyContent")
    public Note replyComment(Note note, HttpSession session){
        return note;
    }
}
