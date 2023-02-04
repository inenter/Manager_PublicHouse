package com.cykj.bean;


public class TbArea {

  private int areaId;
  private String areaName;
  private int pid;
  private String remark;

  public TbArea() {
  }

  public TbArea(int areaId, String areaName, int pid, String remark) {
    this.areaId = areaId;
    this.areaName = areaName;
    this.pid = pid;
    this.remark = remark;
  }

  @Override
  public String toString() {
    return "TbArea{" +
            "areaId=" + areaId +
            ", areaName='" + areaName + '\'' +
            ", pid=" + pid +
            ", remark='" + remark + '\'' +
            '}';
  }

  public int getAreaId() {
    return areaId;
  }

  public void setAreaId(int areaId) {
    this.areaId = areaId;
  }

  public String getAreaName() {
    return areaName;
  }

  public void setAreaName(String areaName) {
    this.areaName = areaName;
  }

  public int getPid() {
    return pid;
  }

  public void setPid(int pid) {
    this.pid = pid;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }
}
