package com.aowin.controller;

import com.aowin.domain.User;
import com.aowin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 用户控制层
 *
 * @author bingo
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(User user, HttpSession session, Model model) {
        User loginUser = userService.getLoginUser(user);
        if (loginUser != null) {
            session.setAttribute("user", loginUser);
        } else {
            model.addAttribute("alert", "账号或密码错误");
        }
        return "/index.jsp";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "/index.jsp";
    }

    @RequestMapping("getUser")
    public String getUser(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        User dbUser = userService.getUser(user);
        model.addAttribute("dbUser", dbUser);
        return "/usermanager/userMessage.jsp";
    }

    @RequestMapping("makeUpArrears")
    public String makeUpArrears(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        User dbUser = userService.getUser(user);
        if (userService.makeUpArrears(dbUser)) {
            model.addAttribute("alert", "缴费成功");
        } else {
            model.addAttribute("alert", "缴费失败");
        }
        return "getUser";
    }
}
