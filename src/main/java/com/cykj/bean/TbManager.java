package com.cykj.bean;


public class TbManager {

    private int managerId;
    private int roleId;
    private String managerAcc;
    private String managerPwd;
    private String managerName;
    private String managerState;
    private String roleName;

    public TbManager() {
    }

    public TbManager(int managerId, int roleId, String managerAcc, String managerPwd, String managerName, String managerState, String roleName) {
        this.managerId = managerId;
        this.roleId = roleId;
        this.managerAcc = managerAcc;
        this.managerPwd = managerPwd;
        this.managerName = managerName;
        this.managerState = managerState;
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "TbManager{" +
                "managerId=" + managerId +
                ", roleId=" + roleId +
                ", managerAcc='" + managerAcc + '\'' +
                ", managerPwd='" + managerPwd + '\'' +
                ", managerName='" + managerName + '\'' +
                ", managerState='" + managerState + '\'' +
                ", roleName='" + roleName + '\'' +
                '}';
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getManagerAcc() {
        return managerAcc;
    }

    public void setManagerAcc(String managerAcc) {
        this.managerAcc = managerAcc;
    }

    public String getManagerPwd() {
        return managerPwd;
    }

    public void setManagerPwd(String managerPwd) {
        this.managerPwd = managerPwd;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerState() {
        return managerState;
    }

    public void setManagerState(String managerState) {
        this.managerState = managerState;
    }
}
