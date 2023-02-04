package com.cykj.bean;

/**
 * @author: LQB
 * @Description:
 * @create: 2022/12/6 17:38
 */
public class AreaManager {

    // 区域管理
    private int townId;
    private String provName;
    private String cityName;
    private String townName;
    private int comCount;
    private String remark;
    // 小区管理
    private int comId;
    private String address;
    private String comName;
    private String comImage;
    private int parkingNum;
    // 套房管理
    private int houseId;
    private int buildingNum;
    private String houseNum;
    private String roomNumber;
    private int houseArea;
    private String houseRemark;
    private String houseImg;
    private String houseType;
    private int roomNum;
    private int washroomNum;
    private int livingroomNum;
    private int money;
    private int balconyNum;

    private String houseState;

    public AreaManager() {
    }

    public AreaManager(int townId, String provName, String cityName, String townName, int comCount, String remark) {
        this.townId = townId;
        this.provName = provName;
        this.cityName = cityName;
        this.townName = townName;
        this.comCount = comCount;
        this.remark = remark;
    }

    public AreaManager(int comId, String address, String comName, String comImage, int parkingNum) {
        this.comId = comId;
        this.address = address;
        this.comName = comName;
        this.comImage = comImage;
        this.parkingNum = parkingNum;
    }

    public AreaManager(int houseId, int buildingNum, String houseNum, String roomNumber,
                       int houseArea, String houseRemark, String houseImg, String houseType,
                       int roomNum, int washroomNum, int livingroomNum,
                       int money, int balconyNum) {
        this.houseId = houseId;
        this.buildingNum = buildingNum;
        this.houseNum = houseNum;
        this.roomNumber = roomNumber;
        this.houseArea = houseArea;
        this.houseRemark = houseRemark;
        this.houseImg = houseImg;
        this.houseType = houseType;
        this.roomNum = roomNum;
        this.washroomNum = washroomNum;
        this.livingroomNum = livingroomNum;
        this.money = money;
        this.balconyNum = balconyNum;
    }

    @Override
    public String toString() {
        return "AreaManager{" +
                "townId=" + townId +
                ", provName='" + provName + '\'' +
                ", cityName='" + cityName + '\'' +
                ", townName='" + townName + '\'' +
                ", comCount=" + comCount +
                ", remark='" + remark + '\'' +
                ", comId=" + comId +
                ", address='" + address + '\'' +
                ", comName='" + comName + '\'' +
                ", comImage='" + comImage + '\'' +
                ", parkingNum=" + parkingNum +
                ", houseId=" + houseId +
                ", buildingNum=" + buildingNum +
                ", houseNum='" + houseNum + '\'' +
                ", roomNumber='" + roomNumber + '\'' +
                ", houseArea=" + houseArea +
                ", houseRemark='" + houseRemark + '\'' +
                ", houseImg='" + houseImg + '\'' +
                ", houseType='" + houseType + '\'' +
                ", roomNum=" + roomNum +
                ", washroomNum=" + washroomNum +
                ", livingroomNum=" + livingroomNum +
                ", money=" + money +
                ", balconyNum=" + balconyNum +
                '}';
    }

    public int getTownId() {
        return townId;
    }

    public void setTownId(int townId) {
        this.townId = townId;
    }

    public String getProvName() {
        return provName;
    }

    public void setProvName(String provName) {
        this.provName = provName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getTownName() {
        return townName;
    }

    public void setTownName(String townName) {
        this.townName = townName;
    }

    public int getComCount() {
        return comCount;
    }

    public void setComCount(int comCount) {
        this.comCount = comCount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public String getComImage() {
        return comImage;
    }

    public void setComImage(String comImage) {
        this.comImage = comImage;
    }

    public int getParkingNum() {
        return parkingNum;
    }

    public void setParkingNum(int parkingNum) {
        this.parkingNum = parkingNum;
    }

    public int getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(int houseArea) {
        this.houseArea = houseArea;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getHouseRemark() {
        return houseRemark;
    }

    public void setHouseRemark(String houseRemark) {
        this.houseRemark = houseRemark;
    }

    public String getHouseImg() {
        return houseImg;
    }

    public void setHouseImg(String houseImg) {
        this.houseImg = houseImg;
    }

    public int getBuildingNum() {
        return buildingNum;
    }

    public void setBuildingNum(int buildingNum) {
        this.buildingNum = buildingNum;
    }

    public String getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(String houseNum) {
        this.houseNum = houseNum;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public int getWashroomNum() {
        return washroomNum;
    }

    public void setWashroomNum(int washroomNum) {
        this.washroomNum = washroomNum;
    }

    public int getLivingroomNum() {
        return livingroomNum;
    }

    public void setLivingroomNum(int livingroomNum) {
        this.livingroomNum = livingroomNum;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType() {
        this.houseType = this.roomNum + "室" + this.livingroomNum + "厅" + this.washroomNum + "卫";
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber() {
        this.roomNumber = this.buildingNum + "#" + this.houseNum;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public int getBalconyNum() {
        return balconyNum;
    }

    public void setBalconyNum(int balconyNum) {
        this.balconyNum = balconyNum;
    }

    public String getHouseState() {
        return houseState;
    }

    public void setHouseState(String houseState) {
        this.houseState = houseState;
    }
}
