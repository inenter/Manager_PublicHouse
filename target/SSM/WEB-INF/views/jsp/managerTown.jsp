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
    <title>小区管理</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .layui-input-block input {
            width: 200px !important;
        }

        .layui-layer-page {
            width: 390px !important;
            height: 495px !important;
        }

        form .layui-input-inline {
            width: 150px;
        }

        tbody .layui-table-cell {
            height: 90px;
            line-height: 90px;
        }

        .layui-table-header {
            height: 36px;
        }

        .layui-form-label {
            width: 85px;
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
            width: 264px !important;
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
    <h3 style="margin: 10px 0; text-align: center; ">小区管理</h3>
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
                    <select name="district" lay-verify="required" id="selectTown">
                        <option value=""></option>
                    </select>
                </div>
            </div>
        </form>
        <span style="margin-left: 30px">小区名称：</span>
        <div class="layui-inline">
            <input type="text" class="layui-input" id="testInput"/>
        </div>
        <button class="layui-btn" id="searchBtn">查询</button>
    </div>
    <table id="demo" lay-filter="test" class="indexTable"></table>
</div>

<%--添加小区的模板--%>
<div style="display: none; padding: 10px; height: 410px" id="add_model">
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
            <label class="layui-form-label">区域名称：</label>
            <div class="layui-input-inline" id="areaes">
                <select name="district" lay-verify="required" id="addNewArea">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComFont">
            <label class="layui-form-label">小区名称：</label>
            <div class="layui-input-inline">
                <input type="text" id="addComName" placeholder="请输入小区名称" class="layui-input" lay-verify="required"
                       autocomplete="off"
                       style="width: 150px">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComAddress">
            <label class="layui-form-label">小区地址：</label>
            <div class="layui-input-inline">
                <input type="text" id="addAddress" placeholder="请输入小区地址" class="layui-input" lay-verify="required"
                       style="width: 150px">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComImage">
            <label class="layui-form-label">小区图片：</label>
            <div class="layui-input-inline">
                <div class="pic" onclick="selectPic()"
                     style="display: flex; width: 100px; height: 80px; cursor: pointer">
                    <img src="resources/imgs/pic.png" alt="" id="mypic" style="width: 100px; height: 80px; ">
                </div>
                <input type="file" id="fileImg" style="display: none;">
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addComParkingNum">
            <label class="layui-form-label">停车位数量：</label>
            <div class="layui-input-inline">
                <input type="text" id="addParkingNum" placeholder="请输入停车位数量" class="layui-input" lay-verify="required"
                       style="width: 150px">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 40px; margin-left: 90px">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-filter="addes" id="addes">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary" lay-filter="back" id="back">返回</button>
            </div>
        </div>
    </form>
</div>

<%--修改小区的模板--%>
<script id="updateViewTpl" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">编号:</label>
            <div class="layui-input-block">
                <input type="text" name="comId" readonly lay-verify="required" value={{d.comId}}
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小区名称:</label>
            <div class="layui-input-block">
                <input id="commName" type="text" name="comName" lay-verify="required" value={{d.comName}}
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址:</label>
            <div class="layui-input-block">
                <input id="commAddress" type="text" name="address" lay-verify="required" autocomplete="off" value={{d.address}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">区域名称:</label>
            <div class="layui-input-block">
                <input type="text" name="townName" readonly lay-verify="required" autocomplete="off"
                       value={{d.townName}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小区图片:</label>
            <div class="layui-input-block">
                <div class="pic" onclick="selectPic()"
                     style="display: flex; width: 100px; height: 80px; cursor: pointer">
                    <img src={{d.comImage}} alt="" id="mypics" style="width: 100px; height: 80px; ">
                </div>
                <input type="file" id="fileImg" style="display: none;">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">停车位数量:</label>
            <div class="layui-input-block">
                <input id="parkingNumber" type="text" name="parkingNum" lay-verify="required" autocomplete="off" value={{d.parkingNum}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">更新数据</button>
            </div>
        </div>
    </form>
</script>
<!-- 更新数据的视图：这个视图要通过页面弹出层显示 -->
<div id="updateView" style="width: 360px; display: none;"></div>

<%--套房批量添加--%>
<script id="addHouseViewTpl" type="text/html">
    <form class="layui-form" id="addAllHouse">
        <div class="layui-form-item">
            <label class="layui-form-label">编号:</label>
            <div class="layui-input-block">
                <input type="text" id="house-commId" name="comId" readonly lay-verify="required" value={{d.comId}}
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="flexed">
            <div class="layui-form-item">
                <label class="layui-form-label">开始栋:</label>
                <div class="layui-input-block">
                    <input id="firRidgepole" type="text" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束栋:</label>
                <div class="layui-input-block">
                    <input id="secRidgepole" type="text" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="flexed">
            <div class="layui-form-item">
                <label class="layui-form-label">开始楼梯口:</label>
                <div class="layui-input-block">
                    <input id="StartStair" type="text" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束楼梯口:</label>
                <div class="layui-input-block">
                    <input id="EndStair" type="text" name="townName" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item flexed">
                <label class="layui-form-label">一梯:</label>
                <div class="layui-input-block" style="margin-left: -10px" id="houseCount">
                    <select name="district">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 10px">户</label>
            </div>
        </div>
        <div class="flexed">
            <div class="layui-form-item">
                <label class="layui-form-label">开始楼层:</label>
                <div class="layui-input-block">
                    <input id="StartFloor" type="text" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束楼层:</label>
                <div class="layui-input-block">
                    <input id="EndFloor" type="text" name="townName" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">面积(平方米):</label>
            <div class="layui-input-block">
                <input id="HouseSize" type="text" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="flexed">
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
                <label class="layui-form-label" style="width: 42px; margin-left: -6px">个房间</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="washroomNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 56px; margin-left: -3px">个卫生间</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="livingroomNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 28px; margin-left: -10px">个厅</label>
            </div>
            <div class="layui-form-item flexed">
                <div class="layui-input-block" style="margin-left: 25px" id="balconyNum">
                    <select name="district" lay-verify="required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <label class="layui-form-label" style="width: 42px; margin-left: -5px">个阳台</label>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; margin-left: 100px">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-filter="addHouse" id="addHouse">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary" lay-filter="addBack" id="addBack">取消</button>
            </div>
        </div>
    </form>
</script>
<div id="addHouseView" style="width: 557px; display: none;"></div>

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/upload.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="addTown">添加</a>
</script>
<%--显示图片--%>
<script type="text/html" id="imgTmp">
    <img src="{{d.comImage}}">
</script>
<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="addAll">套房批量添加</a>
</script>

<script>
    // 批量添加套房设置宽度
    $('#addHouseView').parent().parent().attr('width', '1020px');

    // 上传小区图片
    var fileImg = document.getElementById('fileImg');
    var filename;
    var file;
    fileImg.onchange = function () {
        var url = URL.createObjectURL(fileImg.files[0]);
        document.getElementById("mypic").src = url;
        document.getElementById("mypics").src = url;
        var path = $(fileImg)[0].value;
        filename = path.slice(path.lastIndexOf("\\") + 1);
        console.log(filename);
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
                $('#mypics').attr('src', "resources/imgs/"+filename);
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
                action: 'comm'
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        field: 'comId',
                        title: '小区编号',
                        hide: true
                    }, {
                    field: 'comName',
                    title: '小区名称',
                }, {
                    field: 'address',
                    title: '地址',
                }, {
                    field: 'townName',
                    title: '区域名称',
                }, {
                    field: 'comImage',
                    title: '图片',
                    templet: '#imgTmp'
                }, {
                    field: 'parkingNum',
                    title: '停车位数量',
                }, {
                    title: '操作',
                    templet: '#toolEventDemo',
                    fixed: "right"
                }
                ]
            ],
            toolbar: '#barDemo',
        });

        // 监听头事件
        var addView;
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addTown':
                    addView = layer.open({
                        type: 1,
                        title: "新增小区",
                        area: ['360px', '400px'],
                        resize: false,
                        content: $('#add_model')
                    });
                    form.render('select');
                    break;
            }
        });

        //工具条事件
        var addHouseViewIndex;
        table.on('tool(test)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'update') { // 修改
                var getTpl = updateViewTpl.innerHTML,
                    view = document.getElementById('updateView');
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
                // 更新渲染
                form.render();
                // 通过页面层展示
                var updateViewIndex = layer.open({
                    type: 1,
                    title: '更新小区',
                    area: ["640px"],
                    content: $('#updateView')
                });
            } else if (layEvent === 'del') { // 删除
                layer.confirm('确定删除' + data.comName + '小区吗？', function (index) {
                    $.ajax({
                        url: 'commManager/delComm',
                        type: 'get',
                        data: {
                            "comId": data.comId,
                            "comName": data.comName
                        },
                        dataType: 'json',
                        success: function (resp) {
                            console.log(resp);
                            if (resp.code == 200) {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            }
                            layer.msg(resp.message);
                            // layer.close(index); // 关闭弹出层
                        }
                    });
                });
            } else if (layEvent === 'addAll') {
                var tpl = addHouseViewTpl.innerHTML,
                    houseView = document.getElementById('addHouseView');
                laytpl(tpl).render(data, function (html) {
                    houseView.innerHTML = html;
                });
                // 更新渲染
                form.render();
                // 通过页面层展示
                addHouseViewIndex = layer.open({
                    type: 1,
                    title: '批量添加套房',
                    area: ["1080px"],
                    content: $('#addHouseView')
                });
            }
            // 监听更新数据的表单提交
            form.on('submit(formDemo)', function (d) {
                console.log(d.elem); // 被执行事件的元素DOM对象，一般为button对象
                console.log(d.form); // 被执行提交的form对象，一般在存在form标签时才会返回
                console.log(d.field); // 当前容器的全部表单字段，名值对形式：{name: value}
                // 发送更新请求
                $.ajax({
                    url: "commManager/updateComm",
                    type: "get",
                    data: {
                        "comImage": 'resources/imgs/' + filename,
                        "updateData": JSON.stringify(d.field)
                    },
                    dataType: 'json',
                    success: function (resp) {
                        obj.update({
                            comName: $('#commName').val(),
                            address: $('#commAddress').val(),
                            comImage: $('#mypics').attr('src'),
                            parkingNum: $('#parkingNumber').val()
                        });
                        layer.close(updateViewIndex);
                        layer.msg(resp.message);
                    }
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
        });

        $(document).on('click', "#searchBtn", function () {
            console.log($('#prov .layui-this').attr('lay-value'));
            table.reload('demo', {
                where: {
                    action: 'comm',
                    provId: $('#prov .layui-this').attr('lay-value'),
                    cityId: $('#city .layui-this').attr('lay-value'),
                    areaId: $('#town .layui-this').attr('lay-value'),
                    comName: $('#testInput').val()
                },
                page: {
                    curr: 1
                }
            })
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
                        var str = `<option value=""></option>`;
                        // 添加区域
                        $("#addProv").html("");
                        var addStr = `<option value=""></option>`;
                        for (var i = 0; i < provincesArr.length; i++) {
                            str += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                            addStr += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                        }
                        $("#selectProvince").html(str);
                        form.render('select');
                        $("#addProv").html(addStr);
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
        // 添加小区
        // 展示城市
        form.on('select(addCity)', function (data) {
            if ($('#provs .layui-this').attr('lay-value') == null) {
                $("#distribute_house #addNewCity").html("");
                $("#distribute_house #addNewArea").html("");
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
                $("#areaes #selectTown").html("");
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

        // 增加小区
        $(document).on('click', "#addes", function () {
            layer.confirm('确定添加吗？', function (data) {
                $.ajax({
                    url: 'commManager/addComm',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        "areaId": $('#areaes .layui-this').attr('lay-value'),
                        "comName": $('#addComName').val(),
                        "address": $('#addAddress').val(),
                        "comImage": 'resources/imgs/' + filename,
                        "parkingNum": $('#addParkingNum').val()
                    },
                    success: function (resp) {
                        layer.msg(resp.message);
                        layer.close(addView);     // 关闭填写窗口
                        layer.close(data);      // 关闭提示层
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
        // 批量添加套房
        $(document).on('click', "#addHouse", function () {
            getHouse(addHouseViewIndex);
        });
        $(document).on('click', "#addBack", function () {
            layer.confirm('确定取消吗？', function (data) {
                layer.close(addHouseViewIndex);     // 关闭填写窗口
                layer.close(data);      // 关闭提示层
            });
        });
    });

    function getHouse(addHouseViewIndex) {
        var firRidge = $('#firRidgepole').val();
        var secRidge = $('#secRidgepole').val();
        var startStair = $('#StartStair').val();
        var endStair = $('#EndStair').val();
        var houseCount = $('#houseCount .layui-this').attr('lay-value');
        var houseSize = $('#HouseSize').val();
        var startFloor = $('#StartFloor').val();
        var endFloor = $('#EndFloor').val();
        var roomNum = $('#roomNum .layui-this').attr('lay-value');
        var washroomNum = $('#washroomNum .layui-this').attr('lay-value');
        var livingroomNum = $('#livingroomNum .layui-this').attr('lay-value');
        var balconyNum = $('#balconyNum .layui-this').attr('lay-value');

        var arrHouse = [];
        var ensureHouse = [];
        for (var i = firRidge; i <= secRidge; i++) {      // 栋
            for (var j = startFloor; j <= endFloor; j++) {  // 楼层
                var count = 0;
                for (var k = 1; k <= (endStair - startStair + 1) * houseCount; k++) {    // 楼梯
                    var obj = {
                        "buildingNum": i,
                        "houseArea": houseSize,
                        "roomNum": roomNum,
                        "washroomNum": washroomNum,
                        "livingroomNum": livingroomNum,
                        "balconyNum": balconyNum
                    };
                    var enObj = {};
                    if (((startStair - 1) * houseCount + (count)) < 9) {
                        obj['houseNum'] = j + '0' + ((startStair - 1) * houseCount + (++count));
                    } else {
                        obj['houseNum'] = i + "#" + j + "" + ((startStair - 1) * houseCount + (++count));

                    }
                    arrHouse.push(obj);
                    enObj['Num'] = (i + "#" + obj['houseNum']);
                    ensureHouse.push(enObj);
                }
            }
        }
        $.ajax({
            url:'commManager/addHouse',
            type:'get',
            data:{
                "comId": $('#house-commId').val(),
                "arrHouse": JSON.stringify(arrHouse)
            },
            dataType: 'json',
            success: function (resp) {
                if (resp.code === 200){
                    layer.close(addHouseViewIndex);
                    layer.msg(resp.message);
                }else {
                    var str='';
                    ensureHouse.map((item)=>{
                        str += (item.Num + ",");
                    });
                    layer.confirm('确定添加' + str + '套房吗？', function (data) {
                        $.ajax({
                            url:'commManager/ensureAddHouse',
                            type:'get',
                            data:{},
                            dataType: 'json',
                            success: function (resp) {
                                layer.msg(resp.message);
                            }
                        });
                        layer.close(addHouseViewIndex);
                        layer.close(data);      // 关闭提示层
                    });
                }
            }
        })
    }
</script>

</body>
</html>

