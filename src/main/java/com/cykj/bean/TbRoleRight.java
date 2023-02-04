package com.cykj.bean;


public class TbRoleRight {

  private int rolePowerId;
  private int roleId;
  private int rightId;

  public TbRoleRight() {
  }

  public TbRoleRight(int rolePowerId, int roleId, int rightId) {
    this.rolePowerId = rolePowerId;
    this.roleId = roleId;
    this.rightId = rightId;
  }

  @Override
  public String toString() {
    return "TbRoleRight{" +
            "rolePowerId=" + rolePowerId +
            ", roleId=" + roleId +
            ", rightId=" + rightId +
            '}';
  }

  public int getRolePowerId() {
    return rolePowerId;
  }

  public void setRolePowerId(int rolePowerId) {
    this.rolePowerId = rolePowerId;
  }

  public int getRoleId() {
    return roleId;
  }

  public void setRoleId(int roleId) {
    this.roleId = roleId;
  }

  public int getRightId() {
    return rightId;
  }

  public void setRightId(int rightId) {
    this.rightId = rightId;
  }
}
