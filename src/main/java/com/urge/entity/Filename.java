package com.urge.entity;

public class Filename {
    private Integer id;

    private String teamname;

    private String filename;

    private String uploaduser;

    private String fileaddress;

    private String summary;

    private String datatime;

    public Filename(Integer id, String teamname, String filename, String uploaduser, String fileaddress, String summary, String datatime) {
        this.id = id;
        this.teamname = teamname;
        this.filename = filename;
        this.uploaduser = uploaduser;
        this.fileaddress = fileaddress;
        this.summary = summary;
        this.datatime = datatime;
    }

    public Filename() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeamname() {
        return teamname;
    }

    public void setTeamname(String teamname) {
        this.teamname = teamname == null ? null : teamname.trim();
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getUploaduser() {
        return uploaduser;
    }

    public void setUploaduser(String uploaduser) {
        this.uploaduser = uploaduser == null ? null : uploaduser.trim();
    }

    public String getFileaddress() {
        return fileaddress;
    }

    public void setFileaddress(String fileaddress) {
        this.fileaddress = fileaddress == null ? null : fileaddress.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getDatatime() {
        return datatime;
    }

    public void setDatatime(String datatime) {
        this.datatime = datatime == null ? null : datatime.trim();
    }

    public void setName(String filename) {
    }
}