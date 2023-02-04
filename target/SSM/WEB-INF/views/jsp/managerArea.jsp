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
    <title>区域管理</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .layui-input-block input {
            width: 200px !important;
        }
        .layui-layer-page {
            width: 390px !important;
            height: 420px !important;
        }
        .layui-btn-xs {
            height: 25px !important;
            line-height: 25px !important;
            font-size: 15px;
        }
        .layui-table .layui-form-checkbox {
            line-height: 28px;
        }
    </style>
</head>
<body>

<div style="padding: 15px; font-size: 20px;">
    <h3 style="margin: 10px 0; text-align: center; ">区域管理</h3>
    <div style="display: flex">
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
                    <select name="district" lay-verify="required" id="selectCity">
                        <option value=""></option>
                    </select>
                </div>
            </div>
        </form>
        <span style="margin-left: 50px">区域名称：</span>
        <div class="layui-inline">
            <input type="text" class="layui-input" id="testInput"/>
        </div>
        <button class="layui-btn" id="searchBtn">查询</button>
    </div>
    <table id="demo" lay-filter="test" class="indexTable"></table>
</div>

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="delAll">批量删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="addArea">添加</a>
</script>

<%--添加区域的模板--%>
<div style="display: none; padding: 10px" id="add_model">
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
                <select name="district" lay-verify="required" id="addNewCity">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="margin-top: 10px" id="addAreaFont">
            <label class="layui-form-label">区域名称：</label>
            <div class="layui-input-inline">
                <input type="text" id="addAreaName" placeholder="请输入区域名称" class="layui-input" lay-verify="required"
                       style="width: 223px">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-filter="submit" id="addes">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary" lay-filter="back" id="back">返回</button>
            </div>
        </div>
    </form>
</div>

<%--修改信息的模板--%>
<script id="updateViewTpl" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">编号:</label>
            <div class="layui-input-block">
                <input type="text" name="townId" required lay-verify="required" value={{d.townId}}
                       autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">省份:</label>
            <div class="layui-input-block">
                <input type="text" name="province" required lay-verify="required" value={{d.provName}}
                       autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">城市:</label>
            <div class="layui-input-block">
                <input type="text" name="city" readonly lay-verify="required" autocomplete="off" value={{d.cityName}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">区域名称:</label>
            <div class="layui-input-block">
                <input type="text" name="areaName" id="townNewName" lay-verify="required" autocomplete="off" value={{d.townName}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">小区数量:</label>
            <div class="layui-input-block">
                <input type="text" name="comCount" readonly lay-verify="required" autocomplete="off" value={{d.comCount}}
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注:</label>
            <div class="layui-input-block">
                <input type="text" name="remark" readonly lay-verify="required" autocomplete="off" value={{d.remark}}
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

<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    // 左侧菜单
    layui.use(['form', 'element', 'layer', 'util', 'jquery'], function () {
        var element = layui.element,
            layer = layui.layer,
            util = layui.util,
            form = layui.form,
            $ = layui.$;
        form.render();
        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {
                    icon: 0
                });
            },
            menuRight: function () {
                layer.open({
                    type: 1,
                    content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                    area: ['260px', '100%'],
                    offset: 'rt', //右上角
                    anim: 5,
                    shadeClose: true
                });
            }
        });
    });

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
                limit: 10,
                limits: [10, 15, 20]
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        type: 'checkbox',
                        fixed: 'left'
                    },
                    {
                        field: 'townId',
                        title: '区域id',
                        hide: true
                    }, {
                    field: 'provName',
                    title: '省',
                }, {
                    field: 'cityName',
                    title: '市',
                }, {
                    field: 'townName',
                    title: '区域名称',
                }, {
                    field: 'comCount',
                    title: '小区数量',
                }, {
                    field: 'remark',
                    title: '备注',
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
                case 'delAll':
                    if (checkStatus.data.length > 0) {
                        layer.confirm('确定删除吗？', function (index) {
                            layer.close(index); // 关闭弹出层
                            var idsArray = [];
                            for (var i = 0; i < checkStatus.data.length; i++) {
                                idsArray.push(checkStatus.data[i].townId);
                                console.log(idsArray);
                            }
                            $.ajax({
                                url: 'distribute/delAll',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    'idsArray': JSON.stringify(idsArray)
                                },
                                success: function (resp) {
                                    layer.msg(resp.message);
                                }
                            });
                            $(".layui-form-checked").not('.header').parents('tr').remove();
                        });
                    } else {
                        layer.msg("请至少选择一行");
                    }
                    break;
                case 'addArea':
                    addView = layer.open({
                        type: 1,
                        title: "新增区域",
                        area: ['360px', '400px'],
                        resize: false,
                        content: $('#add_model')
                    });
                    form.render('select');
                    break;
            }
        });

        //工具条事件
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
                    title: '更新区域',
                    area: ["640px"],
                    content: $('#updateView')
                });
            } else if (layEvent === 'del') { // 删除
                layer.confirm('确定删除吗？', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index); // 关闭弹出层
                    $.ajax({
                        url: 'distribute/delTown',
                        type: 'get',
                        data: {
                            "areaId": data.townId
                        },
                        dataType: 'json',
                        success: function (resp) {
                            layer.msg(resp.message);
                        }
                    });
                });
            }
            // 监听更新数据的表单提交
            form.on('submit(formDemo)', function (d) {
                console.log(d.elem); // 被执行事件的元素DOM对象，一般为button对象
                console.log(d.form); // 被执行提交的form对象，一般在存在form标签时才会返回
                console.log(d.field); // 当前容器的全部表单字段，名值对形式：{name: value}
                // 发送更新请求
                $.ajax({
                    url: "distribute/updateArea",
                    type: "get",
                    data: {
                        "updateData":JSON.stringify(d.field)
                    },
                    dataType: 'json',
                    success: function (resp) {
                        obj.update({
                            townName:$('#townNewName').val()
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
                    provId: $('#prov .layui-this').attr('lay-value'),
                    cityId: $('#city .layui-this').attr('lay-value'),
                    areaName: $('#testInput').val()
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

        form.on('select(showCity)', function (data) {
            if ($('#prov .layui-this').attr('lay-value') == null) {
                $("#selectCity").html("");
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

        form.on('select(addCity)', function (data) {
            if ($('#provs .layui-this').attr('lay-value') == null) {
                $("#distribute_house #addNewCity").html("");
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

        // 提交
        $(document).on('click', "#addes", function () {
            layer.confirm('确定添加吗？', function (data) {
                if (($('#cities .layui-this').text() == null) || ($('#addAreaName').val() === null) ){
                    layer.msg("不能为空！");
                }else {
                    $.ajax({
                        url: 'distribute/addArea',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            "cityName": $('#cities .layui-this').text(),
                            "areaName": $('#addAreaName').val()
                        },
                        success: function (resp) {
                            layer.msg(resp.message);
                            layer.close(addView);     // 关闭填写窗口
                            layer.close(data);      // 关闭提示层
                        }
                    });
                }
            });
        });
        // 取消
        $(document).on('click', "#back", function () {
            layer.confirm('确定取消吗？', function (data) {
                layer.close(addView);     // 关闭填写窗口
                layer.close(data);      // 关闭提示层
            });
        });
    });
    
</script>

</body>
</html>

