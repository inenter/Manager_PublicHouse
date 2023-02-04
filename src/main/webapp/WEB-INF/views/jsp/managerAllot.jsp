<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/14
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <title>房源分配</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .layui-input-block input {
            width: 150px !important;
        }

        .layui-layer-page {
            width: 340px !important;
            height: 395px !important;
        }

        form .layui-input-inline {
            width: 120px;
        }

        .layui-table-header {
            height: 36px;
        }

        .layui-form-label {
            width: 70px;
        }

        #addAllHouse input {
            width: 30px !important;
        }

        #addAllHouse .layui-form-select .layui-edge {
            right: 8px !important;
        }

        #addAllHouse .layui-input-block {
            margin-left: 115px;
        }

        .layui-layer-page {
            width: 364px !important;
        }

        .flexed {
            display: flex;
            margin-left: -18px;
        }

        .laytable-cell-1-0-6 {
            width: 220px !important;
        }

        .layui-btn-xs {
            height: 25px !important;
            line-height: 25px !important;
            font-size: 15px;
        }

        img {
            width: 150px;
            height: 100px;
        }

        .layui-table-col-special .layui-form-radio {
            line-height: 28px;
        }
    </style>
</head>
<body>

<div style="padding: 15px; font-size: 20px;">
    <h3 style="margin: 10px 0; text-align: center; ">房源分配</h3>
    <div class="top" style="margin-bottom: 50px">
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
                <div class="layui-inline" id="state">
                    <label class="layui-form-label">状态：</label>
                    <div class="layui-input-inline" id="selectState">
                        <select>
                            <option></option>
                            <option value="已发布">未分配</option>
                            <option value="已分配">已分配</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">人数：</label>
                    <div class="layui-input-inline">
                        <input style="width: 150px" type="text" class="layui-input" id="familySum"/>
                    </div>
                </div>
            </form>
            <span style="width: 70px; line-height: 38px; margin-left: 55px">姓名：</span>
            <div class="layui-inline">
                <input style="width: 150px" type="text" class="layui-input" id="testInput"/>
            </div>
            <button class="layui-btn" id="searchBtn">查询</button>
        </div>
        <table id="demo" lay-filter="test" class="indexTable"></table>
    </div outputStylesheet>
    <div class="bottom">
        <div class="flexed">
            <form class="layui-form" id="bfindSelect">
                <div class="layui-inline" id="bprov">
                    <label class="layui-form-label">省：</label>
                    <div class="layui-input-inline">
                        <select name="district" lay-verify="required" lay-filter="bshowCity" id="bselectProvince">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline" id="bcity">
                    <label class="layui-form-label">市：</label>
                    <div class="layui-input-inline">
                        <select name="district" lay-verify="required" lay-filter="bshowTown" id="bselectCity">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline" id="btown">
                    <label class="layui-form-label">区域：</label>
                    <div class="layui-input-inline">
                        <select name="district" lay-verify="required" lay-filter="bshowComm" id="bselectTown">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline" id="bcomm">
                    <label class="layui-form-label">小区：</label>
                    <div class="layui-input-inline">
                        <select name="district" lay-verify="required" id="bselectComm">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline" style="width: 160px; margin-left: 10px">
                        <div class="layui-inline">
                            <input style="width: 150px" placeholder="最小面积" type="text" class="layui-input"
                                   id="bminsize"/>
                        </div>
                    </div>
                    <div class="layui-input-inline" style="width: 160px">
                        <div class="layui-inline">
                            <input style="width: 150px" placeholder="最大面积" type="text" class="layui-input"
                                   id="bmaxsize"/>
                        </div>
                    </div>
                </div>
            </form>
            <button class="layui-btn" id="bsearchBtn">查询</button>
        </div>
        <table id="demo2" lay-filter="test2" class="indexTable"></table>
    </div>
</div>

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/upload.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="allotAll">批量分配</a>
    <a class="layui-btn layui-btn-xs" lay-event="delAll">全部清除</a>
    <a class="layui-btn layui-btn-xs" lay-event="saveAllot">分配保存</a>
</script>
<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    {{# if(d.remark != '已分配'){}}
    <a class="layui-btn layui-btn-xs" lay-event="clearAllot">清除分配</a>
    {{# }}}
</script>
<script type="text/html" id="toolEventDemo2">
    <a class="layui-btn layui-btn-xs" lay-event="allot">分配</a>
</script>

<script>
    let demoObj;
    let demo2Obj;
    let renterId;
    let applyTime;
    let familySum;
    let saveData = [];
    let delData = [];
    // 表格1
    layui.use(['form', 'jquery', 'table', 'laytpl'], function () {
        var form = layui.form,
            table = layui.table,
            laytpl = layui.laytpl,
            $ = layui.$;
        // 执行渲染
        table.render({
            elem: '#demo',
            url: 'allot/getAllotList', //数据接口
            page: {
                limit: 5,
                limits: [5]
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        type: 'radio',
                        title: '选中',
                    }, {
                    field: 'houseId',
                    title: '套房Id',
                    hide: true
                },
                    {
                        field: 'applyName',
                        title: '姓名',
                    }, {
                    field: 'areaName',
                    title: '区域',
                }, {
                    field: 'familySum',
                    title: '家庭人数',
                }, {
                    field: 'houseNo',
                    title: '分配的套房',
                },
                    {
                        title: '操作',
                        templet: '#toolEventDemo',
                        fixed: "right"
                    }
                ]
            ],
            toolbar: '#barDemo'
        });

        $(document).on('click', "#searchBtn", function () {
            table.reload('demo', {
                where: {
                    areaName: $('#town .layui-this').text(),
                    state: $('#state .layui-this').attr('lay-value'),
                    personNum: $('#familySum').val(),
                    name: $('#testInput').val()
                },
                page: {
                    curr: 1
                }
            })
        });

        // 头监听事件
        table.on('toolbar(test)', function (obj) {
            var layEvent = obj.event;
            switch (layEvent) {
                case 'allotAll':
                    var houseList = [];
                    layer.confirm("确定批量分配吗？", function (index) {
                        $.ajax({
                            url: "distribute/areaList",
                            type: "post",
                            dataType: "JSON",
                            data: {
                                "action": 'allotHouse'
                            },
                            success: function (resp) {
                                if (resp.code === 200){
                                    houseList = resp.data;
                                    console.log(houseList);
                                }
                                layer.close(index);
                                layer.msg(resp.message);
                            }
                        });
                    });
                    break;
                case 'delAll':
                    // var array = [];
                    // for(var i=0;i<delData.length;i++){
                    //     array.push(delData[i].data.houseId);
                    // }
                    // console.log("数据：", array);
                    layer.confirm("确定全部清除吗？", function (index) {
                        $.ajax({
                            url: "allot/delEveryAllot",
                            type: "get",
                            dataType: "JSON",
                            data: {},
                            success: function (resp) {
                                layer.msg(resp.message);
                                if (resp.code === 200){
                                    // 改变已清除分配的套房状态
                                    for(let item of delData){
                                        item.update({
                                            houseState:'',
                                        })
                                    }
                                    table.reload('demo');
                                }
                                layer.close(index);
                            }
                        });
                    });
                    break;
                case 'saveAllot':
                    if (saveData.length <= 0){
                        alert("请分配后操作！");
                        return false;
                    }
                    layer.confirm("确定保存吗？", function (index) {
                        $.ajax({
                            url: "allot/submitAllot",
                            type: "post",
                            dataType: "JSON",
                            data: {
                                "submitData": JSON.stringify(saveData)
                            },
                            success: function (resp) {
                                if (resp.code === 200){
                                    saveData = [];
                                }
                                layer.close(index);
                                layer.msg(resp.message);
                                table.reload('demo');
                            }
                        });
                    });
                    break;
            }
        });

        //工具条事件 单行清除分配
        table.on('tool(test)', function (obj) {
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event;
            if (layEvent === 'clearAllot') {
                $.ajax({
                    url: "allot/delAllot",
                    type: "post",
                    dataType: "JSON",
                    data: {
                        "renterId": data.renterId
                    },
                    success: function (resp) {
                        if (resp.code === 200){
                            layer.msg("操作成功");
                            let deleteIndex = saveData.findIndex(item => item.renterId === data.renterId);
                            saveData.splice(deleteIndex,1);
                            obj.update({
                                houseNo:''
                            });
                            // 改变已清除分配的套房状态
                            for(let item of delData){
                                if (obj.data.houseNo === item.data.roomNumber){
                                    item.update({
                                        houseState:''
                                    })
                                }
                            }
                            // 删除已清除分配的套房状态
                            let delIndex = delData.findIndex(item => item.data.roomNumber === data.houseNo);
                            delData.splice(delIndex,1);
                        }
                    }
                })
            }
        });

        // 获取选中行
        table.on('radio(test)', function (obj) {
            demoObj = obj;
            renterId = obj.data.renterId;
            applyTime = obj.data.applyTime;
            familySum = obj.data.familySum;
            console.log(demoObj);
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
                    if (resp.code === 200) {
                        var provincesArr = resp.data;
                        $("#selectProvince").html("");
                        $("#bselectProvince").html("");
                        var str = `<option value=""></option>`;
                        for (var i = 0; i < provincesArr.length; i++) {
                            str += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                        }
                        $("#selectProvince").html(str);
                        $("#bselectProvince").html(str);
                        form.render('select');
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
    });

    // 表格2
    layui.use(['form', 'jquery', 'table', 'laytpl'], function () {
        var form = layui.form,
            table = layui.table,
            laytpl = layui.laytpl,
            $ = layui.$;
        // 执行渲染
        table.render({
            elem: '#demo2',
            url: 'distribute/areaList', //数据接口
            page: {
                limit: 3,
                limits: [3, 6, 9]
            },
            where: {
                action: 'allotHouse'
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        title: '序号',
                        type: 'numbers'
                    },
                    {
                        field: 'roomNumber',
                        title: '套房号',
                    }, {
                    field: 'houseArea',
                    title: '面积',
                }, {
                    field: 'townName',
                    title: '区域',
                }, {
                    field: 'comName',
                    title: '小区',
                }, {
                    field: 'houseType',
                    title: '户型',
                }, {
                    field: 'houseState',
                    title: '是否已分配',
                    hide: true
                },
                    {
                        title: '操作',
                        templet: '#toolEventDemo2',
                        fixed: "right"
                    }
                ]
            ],
        });

        $(document).on('click', "#bsearchBtn", function () {
            table.reload('demo2', {
                where: {
                    action: 'allotHouse',
                    provId: $('#bprov .layui-this').attr('lay-value'),
                    cityId: $('#bcity .layui-this').attr('lay-value'),
                    toareaId: $('#btown .layui-this').attr('lay-value'),
                    comId: $('#bcomm .layui-this').attr('lay-value'),
                    minArea: $('#bminsize').val(),
                    maxArea: $('#bmaxsize').val()
                },
                page: {
                    curr: 1
                }
            })
        });

        //工具条事件
        table.on('tool(test2)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'allot') {
                console.log(data);
                if (demoObj.data.remark === '已分配'){
                    alert("该用户已分配套房，无法再次分配！");
                    return false;
                }
                if ($.isEmptyObject(demoObj)){
                    alert("请选择用户再进行分配！");
                    return false;
                }
                if (data.houseState === '已分配'){
                    alert("该套房已分配！");
                    return false;
                }
                let houseArea = obj.data.houseArea;
                console.log(familySum);
                // 保存选中的对象
                delData.push(obj);
                if (familySum <= 3){
                    if (houseArea <= 35) {
                        // 分配套房
                        saveAllot(obj);
                    }else {
                        alert("家庭成员在3人或3人以内，只能分配35平方米或以下的套房");
                    }
                }
                if (familySum == 4){
                    if (houseArea > 35 && houseArea <= 50) {
                        // 分配套房
                        saveAllot(obj);
                    }else {
                        alert("家庭成员在4人，只能分配35平方米以上，50平方米或以下的套房");
                    }
                }
                if (familySum == 5){
                    if (houseArea > 50 && houseArea <= 70) {
                        // 分配套房
                        saveAllot(obj);
                    }else {
                        alert("家庭成员在5人，只能分配50平方米以上，70平方米或以下的套房");
                    }
                }
                if (familySum == 6){
                    if (houseArea > 70 && houseArea <= 80) {
                        // 分配套房
                        saveAllot(obj);
                    }else {
                        alert("家庭成员在6人，只能分配70平方米以上，80平方米或以下的套房");
                    }
                }
            }
        });

        function saveAllot(obj){
            $.ajax({
                url: "allot/saveAllot",
                type: "post",
                dataType: "JSON",
                data: {
                    "houseId": obj.data.houseId,
                    "renterId": renterId
                },
                success: function (resp) {
                    if (resp.code === 200){
                        layer.msg("操作成功");
                        demoObj.update({
                            houseNo: obj.data.roomNumber,
                            houseId: obj.data.houseId
                        });
                        obj.update({
                            houseState: '已分配',
                        });
                        var object = {
                            "houseId": obj.data.houseId,
                            "applyTime": applyTime,
                            "renterId": renterId
                        };
                        saveData.push(object)
                    }
                }
            })
        }

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
                    if (resp.code === 200) {
                        var provincesArr = resp.data;
                        $("#selectProvince").html("");
                        $("#bselectProvince").html("");
                        var str = `<option value=""></option>`;
                        for (var i = 0; i < provincesArr.length; i++) {
                            str += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                        }
                        $("#selectProvince").html(str);
                        $("#bselectProvince").html(str);
                        form.render('select');
                    }
                }
            });
        };
        showProv();
        // 展示城市
        form.on('select(bshowCity)', function (data) {
            if ($('#bprov .layui-this').attr('lay-value') == null) {
                $("#bselectCity").html("");
                $("#btown #bselectTown").html("");
                $("#bcomm #bselectComm").html("");
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
                            $("#bselectCity").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#bselectCity").html(str);
                            form.render('select');
                        }
                    }
                });
            }
        });
        // 展示区域
        form.on('select(bshowTown)', function (data) {
            if ($('#bcity .layui-this').attr('lay-value') == null) {
                $("#btown #bselectTown").html("");
                $("#bcomm #bselectComm").html("");
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
                            $("#btown #bselectTown").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].areaId}">${cityArr[i].areaName}</option>`
                            }
                            $("#btown #bselectTown").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
        // 小区
        form.on('select(bshowComm)', function (data) {
            if ($('#btown .layui-this').attr('lay-value') == null) {
                $("#bcomm #bselectComm").html("");
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
                            $("#bcomm #bselectComm").html("");
                            var str = `<option value=""></option>`;
                            for (var i = 0; i < cityArr.length; i++) {
                                str += `<option value="${cityArr[i].communityId}">${cityArr[i].communityName}</option>`
                            }
                            $("#bcomm #bselectComm").html(str);
                            form.render();
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
