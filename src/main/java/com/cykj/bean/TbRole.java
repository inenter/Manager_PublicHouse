package com.cykj.bean;


public class TbRole {

  private int roleId;
  private String roleName;

  public TbRole() {
  }

  public TbRole(int roleId, String roleName) {
    this.roleId = roleId;
    this.roleName = roleName;
  }

  @Override
  public String toString() {
    return "TbRole{" +
            "roleId=" + roleId +
            ", roleName='" + roleName + '\'' +
            '}';
  }

  public int getRoleId() {
    return roleId;
  }

  public void setRoleId(int roleId) {
    this.roleId = roleId;
  }

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }
}
