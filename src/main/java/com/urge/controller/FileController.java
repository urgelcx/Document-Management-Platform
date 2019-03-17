package com.urge.controller;

import com.urge.entity.Filename;
import com.urge.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class FileController {

    @Autowired
    private FileService fileService;

    // 删除文件信息
    @RequestMapping(value="/{id}/File_delete",method= RequestMethod.GET)
    public String delete(@PathVariable int id) {
        fileService.remove(id);
        return "redirect:/AllFile";
    }
    //去上传页面
    @RequestMapping("/to_upload")
    public ModelAndView to_uploadFile(HttpServletRequest request,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("loginUser");
        Object teamname = request.getSession().getAttribute("loginTeam");
        Object telnum = request.getSession().getAttribute("loginTelnum");
        session.setAttribute("loginUser",username);
        session.setAttribute("loginTeam",teamname);
        session.setAttribute("loginTelnum",telnum);
        mv.setViewName("upload/File_upload");
        return mv;
    }
    //用户删除文件信息表单提交
    @RequestMapping("/{id}/File_updata")
    public ModelAndView File_updata(@PathVariable int id,
                                    HttpServletRequest request,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Object teamname = request.getSession().getAttribute("loginTeam");
        Object username = request.getSession().getAttribute("loginUser");
        String filename = fileService.getFilenameById(id);
        String summary = fileService.getSummaryById(id);
        session.setAttribute("loginUser",username);
        session.setAttribute("loginTeam",teamname);
        mv.addObject("id",id);
        mv.addObject("filename",filename);
        mv.addObject("summary",summary);
        mv.setViewName("data/File_updata");
        return mv;
    }

    //用户修改文件件信息表单提交
    @RequestMapping(value = "{id}/modifyFile_data", method = RequestMethod.POST)
    public String modifyFile_data(@PathVariable int id,
                                  @RequestParam("teamname") String teamname,
                                  @RequestParam("filename") String filename,
                                  @RequestParam("uploaduser") String uploaduser,
                                  @RequestParam("summary") String summary) {
        //我要获取当前的日期
        Date time = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createTime = sdf.format(time);
        fileService.modifyFileByPrimaryKey( id,teamname, filename,uploaduser, summary,createTime);
        System.out.println(1231);
        return "redirect:/AllFile";
    }

    //模糊查询
    @RequestMapping(value = "/getFile", method = RequestMethod.POST)
    public ModelAndView File(String filename,HttpServletRequest request, HttpSession session) {
        Object username = request.getSession().getAttribute("loginUser");
        ModelAndView mv = new ModelAndView();
        if (username.equals("")) {
            mv.setViewName("data/error");
            mv.addObject("login","您还未登陆,请登陆！");
            return mv;
        }else {
            List<Filename> alldata =  fileService.getFile(filename);
            mv.setViewName("data/File_data");
            session.setAttribute("loginUser",username);
            mv.addObject("allData", alldata);
            return mv;
        }
    }

    @RequestMapping(value="/form",method=RequestMethod.POST)
    public String handleFormUpload(String teamname, String filename,
                                   String uploaduser, String summary, HttpServletRequest request,
                                   @RequestParam("file") MultipartFile file) throws Exception{
        if(!file.isEmpty()){
            //可以对user做一些操作如存入数据库
            //以下的代码是将文件file重新命名并存入Tomcat的webapps目录下项目的下级目录fileDir
            //获得原始文件名;
            String fileRealName = file.getOriginalFilename();
            //点号的位置
            int pointIndex =  fileRealName.indexOf(".");
            //截取文件后缀
            String fileSuffix = fileRealName.substring(pointIndex);
            //生成文件的前缀包含连字符
            UUID FileId = UUID.randomUUID();
            //文件存取名
            String savedFileName = FileId.toString().replace("-","").concat(fileSuffix);
            //获取服务器指定文件存取路径
            String savedDir = request.getSession().getServletContext().getRealPath("static\\upload");
            File savedFile = new File(savedDir,savedFileName );
            boolean isCreateSuccess = savedFile.createNewFile();
            //我要获取当前的日期
            Date time = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String createTime = sdf.format(time);
            String Path = "static/upload/" + savedFileName;
            fileService.addFile(teamname,filename,uploaduser,summary,Path,createTime);
            if(isCreateSuccess){
                file.transferTo(savedFile);  //转存文件
            }

            return "redirect:/AllFile";
        }
        return "redirect:/AllFile";
    }

    //控制拦截，未登陆无法看信息
    @RequestMapping("/AllFile")
    public ModelAndView FileAll(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Object username = request.getSession().getAttribute("loginUser");
        String Username = String.valueOf(username);
        if (Username.equals("")) {
            mv.setViewName("data/error");
            mv.addObject("login","您还未登陆,请登陆！");
            return mv;
        }else {
            mv.setViewName("data/File_data");
            List<Filename> alldata =  fileService.getAllFile();
            session.setAttribute("loginUser",username);
            mv.addObject("allData", alldata);
            return mv;
        }
    }
    @RequestMapping("/AllFile1")
    public ModelAndView FileAll1(HttpServletRequest request, HttpSession session) {
        Object username = request.getSession().getAttribute("loginUser");
        ModelAndView mv = new ModelAndView();
        if (username.equals("")) {
            mv.setViewName("data/error");
            mv.addObject("login","您还未登陆,请登陆！");
            return mv;
        }else {
            List<Filename> alldata =  fileService.getAllFile1();
            mv.setViewName("data/File_data");
            session.setAttribute("loginUser",username);
            mv.addObject("allData", alldata);
            return mv;
        }
    }
    @RequestMapping("/AllFile2")
    public ModelAndView FileAll2(HttpServletRequest request, HttpSession session) {
        Object username = request.getSession().getAttribute("loginUser");
        ModelAndView mv = new ModelAndView();
        if (username.equals("")) {
            mv.setViewName("data/error");
            mv.addObject("login","您还未登陆,请登陆！");
            return mv;
        }else {
            List<Filename> alldata =  fileService.getAllFile2();
            mv.setViewName("data/File_data");
            session.setAttribute("loginUser",username);
            mv.addObject("allData", alldata);
            return mv;
        }
    }
}