package com.urge.service;
import com.urge.entity.Filename;

import java.util.Date;
import java.util.List;

public interface FileService {

    String getFilenameById(int id);

    String getTeamnameById(int id);

    String getUploaduserById(int id);

    String getSummaryById(int id);

    //新增一个文件
    void addFile(String teamname, String filename, String uploaduser, String summary, String fileAddress, String datetime);


    Filename doUpLoadFile(String teamname, String filename, String uploaduser, String fileAddress, String summary, String datatime);

    //修改
    void modifyFileByPrimaryKey(int id, String teamname, String filename, String uploaduser, String summary, String datatime);

    void remove(int id);

    List<Filename> getAllFile();

    List<Filename> getAllFile1();

    List<Filename> getAllFile2();

    //模糊查询
    List<Filename> getFile(String filename);
}