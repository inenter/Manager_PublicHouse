<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/6
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <meta charset="utf-8">
    <title>套房管理</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .layui-input-block input {
            width: 60px !important;
        }

        .layui-layer-page {
            width: 390px !important;
            height: 495px !important;
        }

        form .layui-input-inline {
            width: 120px;
        }

        #comm .layui-input-inline {
            width: 170px;
        }

        tbody .layui-table-cell {
            height: 90px;
            line-height: 90px;
        }

        .layui-table-header {
            height: 36px;
        }

        .layui-form-label {
            width: 65px;
            padding: 10px 0 !important;
        }

        #addAllHouse input {
            width: 50px !important;
        }

        #addAllHouse .layui-form-select .layui-edge {
            right: 8px !important;
        }

        #addAllHouse .layui-input-block {
            margin-left: 115px;
        }

        .layui-layer-page {
            width: 564px !important;
        }

        .flexed {
            display: flex;
        }

        .laytable-cell-1-0-6 {
            width: 220px !important;
        }

        #add_model .layui-form-label {
            width: 95px;
            margin-left: 30px;
            padding: 10px 0 !important;
        }

        .updateData .layui-form-label {
            width: 120px;
        }
        .houseInfo .layui-form-label {
            width: 130px;
        }
        .houseInfo .layui-input-block {
            margin-left: 30px;
        }
        .layui-btn-xs {
            height: 25px !important;
            line-height: 25px !important;
            font-size: 15px;
        }
    </style>
</head>
<body>

<div style="padding: 15px; font-size: 20px;">
    <h3 style="margin: 10px 0; text-align: center; ">套房管理</h3>
    <div class="flexed">
        <form class="layui-form" id="findSelect">
            <div class="layui-inline" id="prov">
                <label class="layui-form-label">省：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" lay-filter="showCity" id="selectProvince">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" id="city">
                <label class="layui-form-label">市：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" lay-filter="showTown" id="selectCity">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" id="town">
                <label class="layui-form-label">区域：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" lay-filter="showComm" id="selectTown">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" id="comm">
                <label class="layui-form-label">小区：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" lay-filter="showRidge" id="selectComm">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" id="ridge">
                <label class="layui-form-label">栋：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" id="selectRidge">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" id="state">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline">
                    <select name="district" lay-verify="required" lay-filter="showState" id="selectState">
                        <option></option>
                        <option value="未发布">未发布</option>
                        <option value="已发布">已发布</option>
                        <option value="已分配">已分配</option>
                        <option value="已回收">已回收</option>
                    </select>
                </div>
            </div>
        </form>
        <span style="display: inline-block; margin-left: 15px; line-height: 35px; width: 110px">房间号：</span>
        <div class="layui-inline">
            <input style="width: 150px" type="text" class="layui-input" id="testInput"/>
        </div>
        <button class="layui-btn" id="searchBtn">查询</button>
    </div>
    <table id="demo" lay-filter="test" class="indexTable"></table>
</div>

<%--添加小区的模板--%>
<div style="display: none; padding: 10px; " id="add_model">
    <form class="layui-form" id="distribute_house">
        <div class="layui-inline" style="margin-top: 10px">
            <label class="layui-form-label">省：</label>
            <div class="layui-input-inline" id="provs">
                <select name="district" lay-verify="required" lay-filter="addCity" id="addProv">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px">
            <label class="layui-form-label">市：</label>
            <div class="layui-input-inline" id="cities">
                <select name="district" lay-verify="required" lay-filter="addArea" id="addNewCity">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px">
            <label class="layui-form-label">区域：</label>
            <div class="layui-input-inline" id="areaes">
                <select name="district" lay-verify="required" lay-filter="addNewComm" id="addNewArea">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComFont">
            <label class="layui-form-label">小区：</label>
            <div class="layui-input-inline" id="community">
                <select name="district" lay-verify="required" id="addCommunity">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addMoney">
            <label class="layui-form-label">租金(元/月)：</label>
            <div class="layui-input-inline">
                <input type="text" id="addMonthMoney" placeholder="请输入租金" class="layui-input" lay-verify="required"
                       style="width: 120px">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComImage">
            <label class="layui-form-label">套房图片：</label>
            <div class="layui-input-inline">
                <div class="pic" onclick="selectPic()"
                     style="display: flex; width: 100px; height: 80px; cursor: pointer">
                    <img src="resources/imgs/pic.png" alt="" id="mypic" style="width: 100px; height: 80px; ">
                </div>
                <input type="file" id="fileImg" style="display: none;">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addHouseNum">
            <label class="layui-form-label">房间号：</label>
            <div class="layui-input-inline">
                <input type="text" id="addHouseNumber" placeholder="请输入房间号" class="layui-input" lay-verify="required"
                       style="width: 120px">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addHouseArea">
            <label class="layui-form-label">面积(平方米)：</label>
            <div class="layui-input-inline">
                <input style="width: 120px" type="text" id="addHouseSize" placeholder="请输入面积" autocomplete="off"
                       class="layui-input" lay-verify="required">
            </div>
        </div>
        <div class="flexed" style="margin-top: 10px">
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="roomNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 42px; margin-left: 3px">个房间</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="washroomNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 56px; margin-left: 3px">个卫生间</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="livingroomNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 28px; margin-left: 3px">个厅</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="balconyNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 42px; margin-left: 3px">个阳台</label>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 40px; margin-left: 90px">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit lay-filter="addes" id="addes">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary" lay-filter="back" id="back">返回</button>
            </div>
        </div>
    </form>
</div>

<%--修改小区的模板--%>
<script id="updateViewTpl" type="text/html">
    <div class="flexed updateData">
        <form class="layui-form" id="update_house">
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">编号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="houseId" readonly class="layui-input" value={{d.houseId}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">租金(元/月)：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updateMonthMoney" placeholder="请输入租金" class="layui-input" value={{d.money}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px" id="updateHouseImage">
                <label class="layui-form-label">套房图片：</label>
                <div class="layui-input-inline">
                    <div class="pic" onclick="selectPic()"
                         style="display: flex; width: 100px; height: 80px; cursor: pointer">
                        <img src={{d.houseImg}} alt="" id="mypices" style="width: 100px; height: 80px; ">
                    </div>
                    <input type="file" id="fileImg" style="display: none;">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px" id="updateHouseNum">
                <label class="layui-form-label">房间号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updateHouseNumber" placeholder="请输入房间号" value={{d.roomNumber}}
                           class="layui-input" lay-verify="required"
                           style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px" id="updateHouseArea">
                <label class="layui-form-label">面积(平方米)：</label>
                <div class="layui-input-inline">
                    <input style="width: 120px" type="text" id="updateHouseSize" placeholder="请输入面积"
                           value={{d.houseArea}} autocomplete="off"
                           class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="flexed" style="margin-top: 10px">
                <div class="layui-form-item flexed">
                    <div class="layui-input-block" style="margin-left: 25px" id="updateRoomNum">
                        <select name="district" lay-verify="required">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <label class="layui-form-label" style="width: 42px; margin-left: 3px">个房间</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block" style="margin-left: 25px" id="updateWashroomNum">
                        <select name="district" lay-verify="required">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <label class="layui-form-label" style="width: 56px; margin-left: 3px">个卫生间</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block" style="margin-left: 25px" id="updateLivingroomNum">
                        <select name="district" lay-verify="required">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <label class="layui-form-label" style="width: 28px; margin-left: 3px">个厅</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block" style="margin-left: 25px" id="updateBalconyNum">
                        <select name="district" lay-verify="required">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <label class="layui-form-label" style="width: 42px; margin-left: 3px">个阳台</label>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 230px; margin-top: 10px">
                    <button type="button" class="layui-btn" lay-submit lay-filter="formDemo" id="updateHouseData">更新数据</button>
                </div>
            </div>
        </form>
    </div>
</script>
<!-- 更新数据的视图：这个视图要通过页面弹出层显示 -->
<div id="updateView" style="width: 360px; display: none;"></div>

<%--详情的模板--%>
<script id="houseInfoViewTpl" type="text/html">
    <div class="flexed houseInfo">
        <form class="layui-form" style="width: 560px !important;">
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">编号：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.houseId}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">省：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.provName}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">市：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.cityName}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">区域：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.townName}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">小区：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.comName}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">租金(元/月)：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.money}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">套房图片：</label>
                <div class="layui-input-inline">
                    <div class="pic" style="display: flex; width: 100px; height: 80px; ">
                        <img src={{d.houseImg}} alt="" style="width: 100px; height: 80px; ">
                    </div>
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">房间号：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.roomNumber}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 10px">
                <label class="layui-form-label">面积(平方米)：</label>
                <div class="layui-input-inline">
                    <input type="text" readonly class="layui-input" value={{d.houseArea}}
                           lay-verify="required" style="width: 120px">
                </div>
            </div>
            <div class="flexed" style="margin-top: 10px">
                <div class="layui-form-item flexed">
                    <div class="layui-input-block">
                        <input type="text" readonly class="layui-input" value={{d.roomNum}}
                               lay-verify="required" style="width: 120px">
                    </div>
                    <label class="layui-form-label" style="width: 42px; margin-left: 3px">个房间</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block">
                        <input type="text" readonly class="layui-input" value={{d.washroomNum}}
                               lay-verify="required" style="width: 120px">
                    </div>
                    <label class="layui-form-label" style="width: 56px; margin-left: 3px">个卫生间</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block">
                        <input type="text" readonly class="layui-input" value={{d.livingroomNum}}
                               lay-verify="required" style="width: 120px">
                    </div>
                    <label class="layui-form-label" style="width: 28px; margin-left: 3px">个厅</label>
                </div>
                <div class="layui-form-item flexed">
                    <div class="layui-input-block">
                        <input type="text" readonly class="layui-input" value={{d.balconyNum}}
                               lay-verify="required" style="width: 120px">
                    </div>
                    <label class="layui-form-label" style="width: 42px; margin-left: 3px">个阳台</label>
                </div>
            </div>
        </form>
    </div>
</script>
<div id="houseInfoView" style="width: 360px; display: none;"></div>

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/upload.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="addTown">添加</a>
</script>
<%--显示图片--%>
<script type="text/html" id="imgTmp">
    <img src="{{d.houseImg}}">
</script>
<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# if(d.houseRemark == '未发布' || d.houseRemark == '已回收'){}}
    <a class="layui-btn layui-btn-xs" lay-event="release" id="reles">发布</a>
    {{# }}}
    {{# if(d.houseRemark == '已发布'){}}
    <a class="layui-btn layui-btn-xs" lay-event="release" id="reles">回收</a>
    {{# }}}
    <a class="layui-btn layui-btn-xs" lay-event="houseInfo">详情</a>
</script>

<script>
    // 批量添加套房设置宽度
    $('#addHouseView').parent().parent().attr('width', '1020px');

    // 上传套房图片
    var fileImg = document.getElementById('fileImg');
    var filename;
    var file;
    fileImg.onchange = function () {
        var url = URL.createObjectURL(fileImg.files[0]);
        document.getElementById("mypic").src = url;
        document.getElementById("mypices").src = url;
        var path = $(fileImg)[0].value;
        filename = path.slice(path.lastIndexOf("\\") + 1);
        var formData = new FormData();
        // 上传头像
        file = document.getElementById("fileImg").files[0];
        formData.append("file", file);
        $.ajax({
            url: "file/upload",
            type: "POST",
            processData: false,
            contentType: false,
            data: formData,
            dataType: "JSON",
            success: function (resp) {
                layer.msg(resp.message);
                document.getElementById("mypices").src = 'resources/imgs/' + filename;
            }
        })
    };

    function selectPic() {
        fileImg.click()
    }

    layui.use(['form', 'jquery', 'table', 'laytpl'], function () {
        var form = layui.form,
            table = layui.table,
            laytpl = layui.laytpl,
            $ = layui.$;
        // 执行渲染
        table.render({
            elem: '#demo',
            url: 'distribute/areaList', //数据接口
            page: {
                limit: 3,
                limits: [3, 6, 9, 12]
            },
            where: {
                action: 'house'
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        field: 'houseId',
                        title: '套房编号',
                        hide: true
                    }, {
                    field: 'buildingNum',
                    title: '栋',
                    hide: true
                }, {
                    field: 'houseNum',
                    title: '房号',
                    hide: true
                }, {
                    field: 'money',
                    title: '租金',
                    hide: true
                }, {
                    field: 'roomNum',
                    title: '房间个数',
                    hide: true
                }, {
                    field: 'washroomNum',
                    title: '卫生间个数',
                    hide: true
                }, {
                    field: 'livingroomNum',
                    title: '客厅个数',
                    hide: true
                }, {
                    field: 'balconyNum',
                    title: '阳台个数',
                    hide: true
                },
                    {
                        field: 'roomNumber',
                        title: '套房号',
                    }, {
                    field: 'houseArea',
                    title: '面积',
                }, {
                    field: 'houseRemark',
                    title: '状态',
                }, {
                    field: 'houseImg',
                    title: '图片',
                    templet: '#imgTmp'
                }, {
                    field: 'houseType',
                    title: '户型',
                }, {
                    title: '操作',
                    templet: '#toolEventDemo',
                    fixed: "right"
                }
                ]
            ],
            toolbar: '#barDemo',
        });

        $(document).on('click', "#searchBtn", function () {
            table.reload('demo', {
                where: {
                    action: 'house',
                    provId: $('#prov .layui-this').attr('lay-value'),
                    cityId: $('#city .layui-this').attr('lay-value'),
                    toareaId: $('#town .layui-this').attr('lay-value'),
                    comId: $('#comm .layui-this').attr('lay-value'),
                    buildingNum: $('#ridge .layui-this').attr('lay-value'),
                    houseRemark: $('#state .layui-this').attr('lay-value'),
                    houseNum: $('#testInput').val()
                },
                page: {
                    curr: 1
                }
            })
        });

        // 监听头事件
        var addView;
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addTown':
                    addView = layer.open({
                        type: 1,
                        title: "新增套房",
                        area: ['360px', '400px'],
                        resize: false,
                        content: $('#add_model')
                    });
                    form.render('select');
                    break;
            }
        });

        //工具条事件
        var updateViewIndex;
        table.on('tool(test)', function (obj) {
            var data = obj.data; //获得当前行数据
            console.log(data);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'update') { // 修改
                var getTpl = updateViewTpl.innerHTML,
                    view = document.getElementById('updateView');
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
                // 通过页面层展示
                updateViewIndex = layer.open({
                    type: 1,
                    title: '更新套房',
                    area: ["640px"],
                    content: $('#updateView')
                });
                // 更新渲染
                form.render();
                $('#updateRoomNum input').val(data.roomNum);
                $('#updateWashroomNum input').val(data.washroomNum);
                $('#updateLivingroomNum input').val(data.livingroomNum);
                $('#updateBalconyNum input').val(data.balconyNum);
                up(obj);
            } else if (layEvent === 'del') { // 删除
                layer.confirm('确定删除' + data.roomNumber + '套房吗？', function (index) {
                    if (data.houseRemark === '未发布' || data.houseRemark === '已回收') {
                        $.ajax({
                            url: 'houseManager/delHouse',
                            type: 'get',
                            data: {
                                "houseId": data.houseId,
                                "houseNumber": data.roomNumber
                            },
                            dataType: 'json',
                            success: function (resp) {
                                if (resp.code === 200) {
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                }
                                layer.msg(resp.message);
                            }
                        });
                    } else {
                        layer.msg(data.roomNumber + "套房状态为" + data.houseRemark + "，无法删除");
                    }
                });
            } else if (layEvent === 'release') {
                var btnState = ((data.houseRemark === "已发布") ? "回收" : "发布");
                layer.confirm('确定' + btnState + '套房吗？', function (index) {
                    var state = (data.houseRemark === '已发布') ? '已回收' : '已发布';
                    $.ajax({
                        url: 'houseManager/releaseHouse',
                        type: 'get',
                        data: {
                            "houseId": data.houseId,
                            "houseRemark": state
                        },
                        dataType: 'json',
                        success: function (resp) {
                            if (resp.code === 200) {
                                obj.update({
                                    houseRemark: state,
                                });
                                var btn = ((data.houseRemark === "已发布") ? "发布" : "回收");
                                $(obj.tr).find('#reles').html(btn);
                            }
                            layer.msg(resp.message);
                        }
                    });
                });
            } else if (layEvent === 'houseInfo') {
                var getTpls = houseInfoViewTpl.innerHTML,
                    view = document.getElementById('houseInfoView');
                laytpl(getTpls).render(data, function (html) {
                    view.innerHTML = html;
                });
                // 通过页面层展示
                updateViewIndex = layer.open({
                    type: 1,
                    title: '套房详情',
                    area: ["640px"],
                    content: $('#houseInfoView')
                });
            }
        });

        // 展示省份
        window.showProv = function () {
            $.ajax({
                url: "distribute/findArea",
                type: "post",
                data: {
                    "pid": 1
                },
                dataType: "JSON",
                success: function (resp) {
                    if (resp.code == 200) {
                        var provincesArr = resp.data;
                        $("#selectProvince").html("");
                        // 添加套房
                        $("#addProv").html("");
                        var str = `<option value=""></option>`;
                        for (var i = 0; i < provincesArr.length; i++) {
                            str += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                        }
                        $("#selectProvince").html(str);
                        $("#addProv").html(str);
                        form.render();
                    }
                }
            });
        };
        showProv();
        // 展示城市
        form.on('select(showCity)', function (data) {
            if ($('#prov .layui-this').attr('lay-value') == null) {
                $("#selectCity").html("");
                $("#town #selectTown").html("");
                $("#comm #selectComm").html("");
                $("#ridge #selectRidge").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "distribute/findArea",
                    type: "post",
                    data: {
                        "pid": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#selectCity").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#selectCity").html(str);
                            form.render('select');
                        }
                    }
                });
            }
        });
        // 展示区域
        form.on('select(showTown)', function (data) {
            if ($('#city .layui-this').attr('lay-value') == null) {
                $("#town #selectTown").html("");
                $("#comm #selectComm").html("");
                $("#ridge #selectRidge").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "distribute/findArea",
                    type: "post",
                    data: {
                        "pid": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#town #selectTown").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#town #selectTown").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
        // 展示小区
        form.on('select(showComm)', function (data) {
            if ($('#town .layui-this').attr('lay-value') == null) {
                $("#comm #selectComm").html("");
                $("#ridge #selectRidge").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "houseManager/findComm",
                    type: "post",
                    data: {
                        "toareaId": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#comm #selectComm").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].communityId}">${cityArr[i].communityName}</option>`
                            }
                            $("#comm #selectComm").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
        // 展示栋
        form.on('select(showRidge)', function (data) {
            if ($('#comm .layui-this').attr('lay-value') == null) {
                $("#ridge #selectRidge").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "houseManager/findRidge",
                    type: "post",
                    data: {
                        "comId": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#ridge #selectRidge").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].buildingNum}">${cityArr[i].buildingNum}</option>`
                            }
                            $("#ridge #selectRidge").html(str);
                            form.render();
                        }
                    }
                });
            }
        });

        // 添加套房
        // 展示城市
        form.on('select(addCity)', function (data) {
            if ($('#provs .layui-this').attr('lay-value') == null) {
                $("#distribute_house #addNewCity").html("");
                $("#distribute_house #addNewArea").html("");
                $("#community #addCommunity").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "distribute/findArea",
                    type: "post",
                    data: {
                        "pid": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#distribute_house #addNewCity").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#distribute_house #addNewCity").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
        // 展示区域
        form.on('select(addArea)', function (data) {
            if ($('#cities .layui-this').attr('lay-value') == null) {
                $("#areaes #addNewArea").html("");
                $("#community #addCommunity").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "distribute/findArea",
                    type: "post",
                    data: {
                        "pid": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            $("#distribute_house #addNewArea").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#distribute_house #addNewArea").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
        // 展示小区
        form.on('select(addNewComm)', function (data) {
            if ($('#areaes .layui-this').attr('lay-value') == null) {
                $("#community #addCommunity").html("");
                form.render('select');
            } else {
                $.ajax({
                    url: "houseManager/findComm",
                    type: "post",
                    data: {
                        "toareaId": data.value
                    },
                    dataType: "JSON",
                    success: function (resp) {
                        if (resp.code == 200) {
                            var cityArr = resp.data;
                            console.log(cityArr);
                            $("#distribute_house #addCommunity").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].communityId}">${cityArr[i].communityName}</option>`
                            }
                            $("#distribute_house #addCommunity").html(str);
                            form.render();
                        }
                    }
                });
            }
        });

        // 增加套房
        $(document).on('click', "#addes", function () {
            layer.confirm('确定添加吗？', function (data) {
                layer.close(data);      // 关闭提示层
                if ($('#community .layui-this').attr('lay-value') == null) {
                    alert("请选择小区!");
                    return false;
                }
                if ($('#addMonthMoney').val() === '') {
                    alert("请输入租金!");
                    return false;
                }
                var houseNumber = $('#addHouseNumber').val();
                var buildingNum = houseNumber.split('#')[0];
                var houseNum = houseNumber.split('#')[1];
                if (!houseNumber.match("#")) {
                    alert("请输入包含'#'字符的格式!");
                    return false;
                }
                var reg = RegExp(/^\d{1,}$/);
                if (!reg.test(buildingNum)) {
                    alert("请输入正确的楼栋编号");
                    return false;
                }
                var regex = RegExp(/^\d{3,}$/);
                if (!regex.test(houseNum)) {
                    alert("请输入正确的房间编号");
                    return false;
                }
                if (filename == null) {
                    alert("请输入上传图片");
                    return false;
                }
                if ($('#addHouseSize').val() === '') {
                    alert("请输入套房面积");
                    return false;
                }
                var obj = {
                    "tocommunityId": $('#community .layui-this').attr('lay-value'),
                    "images": 'resources/imgs/' + filename,
                    "money": $('#addMonthMoney').val(),
                    "buildingNum": buildingNum,
                    "houseNum": houseNum,
                    "houseArea": $('#addHouseSize').val(),
                    "roomNum": $('#roomNum .layui-this').attr('lay-value'),
                    "washroomNum": $('#washroomNum .layui-this').attr('lay-value'),
                    "livingroomNum": $('#livingroomNum .layui-this').attr('lay-value'),
                    "balconyNum": $('#balconyNum .layui-this').attr('lay-value')
                };
                $.ajax({
                    url: 'houseManager/addHouse',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        "houseInfo": JSON.stringify(obj)
                    },
                    success: function (resp) {
                        layer.msg(resp.message);
                        if (resp.code === 200) {
                            layer.close(addView);     // 关闭填写窗口
                        }
                    }
                });
            });
        });
        // 取消
        $(document).on('click', "#back", function () {
            layer.confirm('确定取消吗？', function (data) {
                layer.close(addView);     // 关闭填写窗口
                layer.close(data);      // 关闭提示层
            });
        });
        // 更新数据
        function up(obj) {
            $(document).on('click', "#updateHouseData", function () {
                layer.confirm('确定更新吗？', function (data) {
                    layer.close(data);      // 关闭提示层
                    if ($('#updateMonthMoney').val() === '') {
                        alert("请输入租金!");
                        return false;
                    }
                    var houseNumber = $('#updateHouseNumber').val();
                    var buildingNum = houseNumber.split('#')[0];
                    var houseNum = houseNumber.split('#')[1];
                    if (!houseNumber.match("#")) {
                        alert("请输入包含'#'字符的格式, 如1#103!");
                        return false;
                    }
                    var reg = RegExp(/^\d{1,}$/);
                    if (!reg.test(buildingNum)) {
                        alert("请输入正确的楼栋编号, 如1#103!");
                        return false;
                    }
                    var regex = RegExp(/^\d{3,}$/);
                    if (!regex.test(houseNum)) {
                        alert("请输入正确的房间编号, 如1#103!");
                        return false;
                    }
                    if ($('#updateHouseSize').val() === '') {
                        alert("请输入套房面积");
                        return false;
                    }
                    var object = {
                        "houseId": $('#houseId').val(),
                        "images": $('#updateHouseImage #mypices').attr('src'),
                        "money": $('#updateMonthMoney').val(),
                        "buildingNum": buildingNum,
                        "houseNum": houseNum,
                        "houseArea": $('#updateHouseSize').val(),
                        "roomNum": $('#updateRoomNum .layui-this').attr('lay-value'),
                        "washroomNum": $('#updateWashroomNum .layui-this').attr('lay-value'),
                        "livingroomNum": $('#updateLivingroomNum .layui-this').attr('lay-value'),
                        "balconyNum": $('#updateBalconyNum .layui-this').attr('lay-value')
                    };
                    var houseType = $('#updateRoomNum .layui-this').attr('lay-value') + "室" + $('#updateLivingroomNum .layui-this').attr('lay-value') + "厅" + $('#updateWashroomNum .layui-this').attr('lay-value') + "卫";
                    // 发送更新请求
                    $.ajax({
                        url: "houseManager/updateHouse",
                        type: "post",
                        data: {
                            "updateData": JSON.stringify(object)
                        },
                        dataType: 'json',
                        success: function (resp) {
                            obj.update({
                                roomNumber:$('#updateHouseNumber').val(),
                                houseArea:$('#updateHouseSize').val(),
                                houseImg: $('#mypices').attr('src'),
                                houseType:houseType
                            });
                            layer.close(updateViewIndex);
                            layer.msg(resp.message);
                        }
                    });
                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                })
            })
        }
    });

</script>

</body>
</html>

