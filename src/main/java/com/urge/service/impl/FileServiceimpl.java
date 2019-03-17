package com.urge.service.impl;


import com.urge.dao.FilenameMapper;
import com.urge.entity.Filename;
import com.urge.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceimpl implements FileService {
    @Autowired
    private FilenameMapper filenameMapper;


    @Override
    public String getTeamnameById(int id){
        return filenameMapper.findUsersById(id).getTeamname();
    }
    @Override
    public String getUploaduserById(int id){
        return filenameMapper.findUsersById(id).getUploaduser();
    }
    @Override
    public String getFilenameById(int id) {
        return filenameMapper.findUsersById(id).getFilename();
    }
    @Override
    public String getSummaryById(int id) {
        return filenameMapper.findUsersById(id).getSummary();
    }
    //新增一个文件
    @Override
    public void addFile(String teamname,String filename ,String uploaduser, String summary, String fileAddress,String datetime) {
        Filename file = new Filename();
        file.setTeamname(teamname);
        file.setFilename(filename);
        file.setUploaduser(uploaduser);
        file.setSummary(summary);
        file.setFileaddress(fileAddress);
        file.setDatatime(datetime);
        filenameMapper.insertSelective(file);
    }

    @Override
    public Filename doUpLoadFile(String teamname, String filename, String uploaduser, String fileAddress, String summary, String datatime) {
        return filenameMapper.doUpLoadFile(teamname,filename,uploaduser,fileAddress,summary,datatime);
    }

    //修改
    @Override
    public void modifyFileByPrimaryKey(int id, String teamname, String filename, String uploaduser, String summary, String datatime) {
        Filename file = filenameMapper.selectByPrimaryKey(id);
        file.setTeamname(teamname);
        file.setFilename(filename);
        file.setUploaduser(uploaduser);
        file.setSummary(summary);
        file.setDatatime(datatime);
        filenameMapper.updateByPrimaryKeySelective(file);
    }
    @Override
    public void remove(int id) {
        filenameMapper.deleteByPrimaryKey(id);
    }
    @Override
    public List<Filename> getAllFile() {
        return filenameMapper.getAllFile();
    }
    @Override
    public List<Filename> getAllFile1(){
        return filenameMapper.getAllFile1();
    }
    @Override
    public List<Filename> getAllFile2(){
        return filenameMapper.getAllFile2();
    }
    //模糊查询
    @Override
    public List<Filename> getFile(String filename){
        return filenameMapper.searchFileName(filename);
    }
}
