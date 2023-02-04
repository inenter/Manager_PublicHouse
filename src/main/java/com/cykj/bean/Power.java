package com.cykj.bean;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/13 21:10
 */
public class Power {

    private int rightId;
    private String rightName;
    private int roleId;

    public Power() {
    }

    public Power(int rightId, String rightName, int roleId) {
        this.rightId = rightId;
        this.rightName = rightName;
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Power{" +
                "rightId=" + rightId +
                ", rightName='" + rightName + '\'' +
                ", roleId=" + roleId +
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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
