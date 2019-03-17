package com.urge.controller;

import com.urge.entity.User;
import com.urge.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserServices userServices;

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        //重定向到登录页面的跳转方法
        return "redirect:to_login";
    }
    //跳转到本工程主页的action
    @RequestMapping(value = "/to_login")
    public String to_login() {
        return "user/login";
    }

    @RequestMapping(value = "/to_register")
    public String to_register() {
        return "user/register";
    }

    @RequestMapping(value = "/to_updata")
    public ModelAndView to_updata(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("loginUser");
        String Teamname = userServices.getTeamnameByUsername(String.valueOf(username));
        String Telnum = userServices.getTelnumByUsername(String.valueOf(username));
        session.setAttribute("loginUser",username);
        mv.addObject("loginTeam",Teamname);
        mv.addObject("loginTelnum",Telnum);
        mv.setViewName("user/updata");
        return mv;
    }


    // 删除用户信息
    @RequestMapping(value="/{id}/delete",method=RequestMethod.GET)
    public String delete(@PathVariable int id) {
        userServices.remove(id);
        return "redirect:/AllUser";
    }


    //关于用户登录的表单提交
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        ModelMap model,
                        HttpSession session) {
        if (!userServices.isUserExist(username)) {
            model.addAttribute("msg", "用户名不存在！");
        } else {
            if (password.equals(userServices.getPasswordByUsername(username))) {
                String Teamname=userServices.getTeamnameByUsername(username);
                String Telnum = userServices.getTelnumByUsername(username);
                //保存登陆信息
                session.setAttribute("loginUser",username);
                session.setAttribute("loginTeam",Teamname);
                session.setAttribute("loginTelnum",Telnum);
                return "redirect:/AllFile";
            } else {
                model.addAttribute("msg", "密码错误！");
            }
        }
        return "redirect:/to_login";
    }

    @RequestMapping(value = "/to_re_password")
    public String re_password() {
        return "user/re_password";
    }


    //关于用户注册的表单提交
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("telnum") String telnum,
                           @RequestParam("teamname") String teamname, ModelMap model) {
        if (userServices.isUserExist(username)) {
            model.addAttribute("msg", "用户名已存在！");
        } else {
            userServices.addUser(username, password, telnum, teamname);
            model.addAttribute("msg", "注册成功！");
        }
        return "redirect:/to_login";
    }
    @RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
    public String modifyUser(@RequestParam("username") String username,
                                 @RequestParam("telnum") String telnum,
                             @RequestParam("teamname") String teamname) {
        userServices.modifyByUsername(username,telnum,teamname);
        return "redirect:/AllFile";
    }



    //忘记密码修改密码的表单提交
    @RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
    public String modifyPassword(@RequestParam("username") String username,
                                 @RequestParam("telnum") String telnum,
                                 @RequestParam("teamname") String teamname,
                                 @RequestParam("newpassword") String newpassword, ModelMap model) {
        if (!userServices.isUserExist(username)) {
            model.addAttribute("msg", "用户名不存在！");
        } else {
            if (telnum.equals(userServices.getTelnumByUsername(username))
                    &&(teamname.equals(userServices.getTeamnameByUsername(username)))) {
                userServices.modifyPasswordByUsername(username, newpassword);
                model.addAttribute("msg", "找回成功！");
            } else {
                model.addAttribute("msg", "您输入的信息有错误！");
            }
        }
        return "user/success";
    }
}