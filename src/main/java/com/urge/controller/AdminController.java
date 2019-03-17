package com.urge.controller;

import com.urge.entity.Filename;
import com.urge.entity.User;
import com.urge.service.FileService;
import com.urge.service.Tb_userService;
import com.urge.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {
    @Autowired
    private UserServices userServices;
    @Autowired
    private Tb_userService userService;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/to_Admin_login")
    public String to_Admin_login(){
        return "user/admin/Admin_Login";
    }

    //关于用户登录的表单提交
    @RequestMapping(value = "/Adminlogin", method = RequestMethod.POST)
    public String Adminlogin(@RequestParam("username") String username,
                             @RequestParam("password") String password,
                             ModelMap model,
                             HttpSession session) {
        if (!userService.AdminisUserExist(username)) {
            model.addAttribute("msg", "用户名不存在！");
        } else {
            if (password.equals(userService.AdmingetPasswordByUsername(username))) {
                session.setAttribute("AdminUser",username);
                model.addAttribute("msg", "登录成功！");
                return "redirect:/Admin_User";
            } else {
                model.addAttribute("msg", "密码错误！");
                return "redirect:/to_Admin_login";
            }
        }
        return "redirect:/Adminlogin";
    }

    // 删除用户信息
    @RequestMapping(value="/{id}/Admin_delete",method=RequestMethod.GET)
    public String Admin_delete(@PathVariable int id) {
        userServices.remove(id);
        return "redirect:/Admin_index";
    }



    @RequestMapping(value = "{username}/to_Admin_updata")
    public ModelAndView to_Admin_updata(@PathVariable String username,
                                        HttpServletRequest request,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Object Adminusername = request.getSession().getAttribute("AdminUser");
        String teamname = userServices.getTeamnameByUsername(username);
        String telnum = userServices.getTelnumByUsername(username);
        String password = userServices.getPasswordByUsername(username);
        session.setAttribute("AdminUser",Adminusername);
        mv.addObject("username",username);
        mv.addObject("password",password);
        mv.addObject("telnum",telnum);
        mv.addObject("teamname",teamname);
        mv.setViewName("user/admin/User_Updata_Admin");
        return mv;
    }

    //关于修改user的表单提交
    @RequestMapping(value = "{username}/Admin_modify", method = RequestMethod.POST)
    public String Admin_modifyPassword(@PathVariable String username,
                                       @RequestParam("password") String password,
                                       @RequestParam("telnum") String telnum,
                                       @RequestParam("teamname") String teamname) {
        userServices.AdminmodifyByUsername(username, password ,telnum,teamname);
        return "redirect:/Admin_User";
    }

    // 删除文件信息
    @RequestMapping(value="/{id}/File_Admin_delete",method= RequestMethod.GET)
    public String delete(@PathVariable int id) {
        fileService.remove(id);
        return "redirect:/Admin_index";
    }



    //去上传页面
    @RequestMapping("/to_Admin_upload")
    public ModelAndView to_Admin_uploadFile(HttpServletRequest request,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("loginUser");
        session.setAttribute("loginUser",username);
        mv.setViewName("user/admin/File_Upload_Admin");
        return mv;
    }


    @RequestMapping(value="/Admin_form",method=RequestMethod.POST)
    public String Admin_handleFormUpload(String teamname,
                                   String filename,
                                   String uploaduser,
                                   String summary,
                                   HttpServletRequest request,
                                   @RequestParam("file") MultipartFile file) throws Exception{
        if(!file.isEmpty()){
            //可以对user做一些操作如存入数据库
            //以下的代码是将文件file重新命名并存入Tomcat的webapps目录下项目的下级目录fileDir
            //获得原始文件名;
            String fileRealName = file.getOriginalFilename();
            //点号的位置
            int pointIndex =  fileRealName.indexOf(".");
            //截取文件后缀
            String a;
            String fileSuffix = fileRealName.substring(pointIndex);
            //生成文件的前缀包含连字符
            UUID FileId = UUID.randomUUID();
            //文件存取名
            String savedFileName = FileId.toString().replace("-","").concat(fileSuffix);
            //获取服务器指定文件存取路径
            String c;
            String savedDir = request.getSession().getServletContext().getRealPath("static\\upload");
            File savedFile = new File(savedDir,savedFileName );
            boolean isCreateSuccess = savedFile.createNewFile();
            String b;
            //我要获取当前的日期
            Date time = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String g;
            String createTime = sdf.format(time);
            String Path = "static/upload/" + savedFileName;
            String e;
            fileService.addFile(teamname,filename,uploaduser,summary,Path,createTime);
            if(isCreateSuccess){
                String h;
                file.transferTo(savedFile);  //转存文件
            }

            return "redirect:/Admin_index";
        }
        return "redirect:/Admin_index";
    }

    //管理员对文件信息修改
    @RequestMapping("/{id}/File_Admin_Updata")
    public ModelAndView File_updata(@PathVariable int id,
                                    HttpServletRequest request,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("AdminUser");
        String teamname = fileService.getTeamnameById(id);
        String filename = fileService.getFilenameById(id);
        String uploaduser = fileService.getUploaduserById(id);
        String summary = fileService.getSummaryById(id);
        session.setAttribute("AdminUser",username);
        mv.addObject("id",id);
        mv.addObject("teamname",teamname);
        mv.addObject("filename",filename);
        mv.addObject("uploaduser",uploaduser);
        mv.addObject("summary",summary);
        mv.setViewName("user/admin/File_Updata_Admin");
        return mv;
    }

    //用户修改文件件信息表单提交
    @RequestMapping(value = "{id}/modifyAdmin_File_data", method = RequestMethod.POST)
    public String modifyAdmin_File_data(@PathVariable int id,
                                  @RequestParam("teamname") String teamname,
                                  @RequestParam("filename") String filename,
                                  @RequestParam("uploaduser") String uploaduser,
                                  @RequestParam("summary") String summary) {
        //我要获取当前的日期
        Date time = new Date();
        String abc;
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createTime = sdf.format(time);
        fileService.modifyFileByPrimaryKey( id,teamname, filename,uploaduser, summary,createTime);
        return "redirect:/Admin_index";
    }

    @RequestMapping("Admin_index")
    public ModelAndView Admin(HttpServletRequest request,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("AdminUser");
        if (!username.equals("")) {
            session.setAttribute("AdminUser",username);
            List<Filename> alldata = fileService.getAllFile();
            mv.addObject("allData", alldata);
            mv.setViewName("user/admin/Admin_File");
        }
        return mv;
    }


    @RequestMapping("Admin_User")
    public ModelAndView Admin_User(HttpServletRequest request,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("AdminUser");
        if (!username.equals("")) {
            session.setAttribute("AdminUser",username);
            List<User> alldata =  userServices.getAllUser();
            mv.addObject("allData", alldata);
            mv.setViewName("user/admin/Admin_User");
        }
        return mv;
    }

    @RequestMapping(value = "/to_Admin_Add_User")
    public String Admin_Add_User() {
        return "user/admin/User_Register_Admin";
    }
    //关于用户注册的表单提交
    @RequestMapping(value = "/Admin_register", method = RequestMethod.POST)
    public String Add_User(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("telnum") String telnum,
                           @RequestParam("teamname") String teamname, ModelMap model) {
        if (userServices.isUserExist(username)) {
            String q;
            model.addAttribute("msg", "用户名已存在！");
        } else {
            userServices.addUser(username, password, telnum, teamname);
            model.addAttribute("msg", "注册成功！");
        }
        return "redirect:/Admin_User";
    }
//    @RequestMapping(value="/{id}/File_delete",method= RequestMethod.GET)
//    public String Admin_delete(@PathVariable int id) {
//        fileService.remove(id);
//        return "redirect:/AllFile";
//    }
}