package com.cykj.bean;


public class TbRight {

  private int rightId;
  private String rightName;
  private String rightConnect;
  private int upRight;

  public TbRight() {
  }

  public TbRight(int rightId, String rightName, String rightConnect, int upRight) {
    this.rightId = rightId;
    this.rightName = rightName;
    this.rightConnect = rightConnect;
    this.upRight = upRight;
  }

  @Override
  public String toString() {
    return "TbRight{" +
            "rightId=" + rightId +
            ", rightName='" + rightName + '\'' +
            ", rightConnect='" + rightConnect + '\'' +
            ", upRight=" + upRight +
            '}';
  }

  public int getRightId() {
    return rightId;
  }

  public void setRightId(int rightId) {
    this.rightId = rightId;
  }

  public String getRightName() {
    return rightName;
  }

  public void setRightName(String rightName) {
    this.rightName = rightName;
  }

  public String getRightConnect() {
    return rightConnect;
  }

  public void setRightConnect(String rightConnect) {
    this.rightConnect = rightConnect;
  }

  public int getUpRight() {
    return upRight;
  }

  public void setUpRight(int upRight) {
    this.upRight = upRight;
  }
}
