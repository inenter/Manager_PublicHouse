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
    <title>人员管理</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .person .layui-inline input {
            width: 180px !important;
            line-height: 36px;
        }

        .layui-layer-page {
            width: 390px !important;
            height: 420px !important;
        }

        .layui-input, .layui-textarea {
            width: 192px !important;
        }
        .layui-btn-xs {
            height: 25px !important;
            line-height: 25px !important;
            font-size: 15px;
        }
    </style>
</head>
<body>

<div style="padding: 15px; font-size: 20px;" class="person">
    <h3 style="margin: 10px 0; text-align: center;">人员管理</h3>
    <div style="display: flex">
        <span style="margin-left: 15px">人员姓名：</span>
        <div class="layui-inline">
            <input type="text" class="layui-input" id="managerName"/>
        </div>
        <span style="margin-left: 50px">账号：</span>
        <div class="layui-inline">
            <input type="text" class="layui-input" id="managerAcc"/>
        </div>
        <form class="layui-form">
            <div class="layui-inline">
                <label class="layui-form-label">角色：</label>
                <div class="layui-input-inline" id="selectRole">
                    <select>
                        <option></option>
                        <option value="2">房源发布员</option>
                        <option value="3">资格审核员</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline" id="selectState">
                    <select>
                        <option></option>
                        <option value="启用">启用</option>
                        <option value="禁用">禁用</option>
                    </select>
                </div>
            </div>
        </form>
        <button style="margin-left: 10px" class="layui-btn" id="searchBtn">查询</button>
    </div>
    <table id="demo" lay-filter="test" class="indexTable"></table>
</div>

<%--添加人员--%>
<div style="display: none; padding: 10px" id="add_model">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">账号:</label>
            <div class="layui-input-block">
                <input type="text" id="addPersonAcc" lay-verify="required"
                       autocomplete="off" placeholder="请输入账号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">人员姓名:</label>
            <div class="layui-input-block">
                <input type="text" id="addPersonName" lay-verify="required"
                       autocomplete="off" placeholder="请输入人员姓名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block">
                <input type="text" id="addPersonPwd" lay-verify="required"
                       autocomplete="off" placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-block">
                <input type="text" id="addPersonRePwd" lay-verify="required"
                       autocomplete="off" placeholder="请再次输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色：</label>
            <div class="layui-input-inline" id="addRoles">
                <select>
                    <option></option>
                    <option value="2">房源发布员</option>
                    <option value="3">资格审核员</option>
                </select>
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

<%--修改信息的模板--%>
<script id="updateViewTpl" type="text/html">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 50px">
            <label class="layui-form-label">人员ID:</label>
            <div class="layui-input-block">
                <input type="text" id="personId" lay-verify="required" value={{d.managerId}}
                       autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">人员姓名:</label>
            <div class="layui-input-block">
                <input type="text" id="personName" lay-verify="required" value={{d.managerName}}
                       autocomplete="off" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色：</label>
            <div class="layui-input-inline" id="updateRoles">
                <select>
                    <option></option>
                    <option value="2">房源发布员</option>
                    <option value="3">资格审核员</option>
                </select>
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

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="addEmp">添加</a>
</script>

<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# if(d.managerState == '启用'){}}
    <a class="layui-btn layui-btn-xs" lay-event="updateState" id="updateFriState">禁用</a>
    {{# }}}
    {{# if(d.managerState == '禁用'){}}
    <a class="layui-btn layui-btn-xs" lay-event="updateState" id="updateSecState">启用</a>
    {{# }}}
    <a class="layui-btn layui-btn-xs" lay-event="resetPwd">重置密码</a>
</script>
<script>
    // 左侧菜单
    layui.use(['form', 'element', 'layer', 'util', 'jquery'], function () {
        var element = layui.element,
            layer = layui.layer,
            form = layui.form,
            $ = layui.$;
        form.render();
    });

    layui.use(['form', 'jquery', 'table', 'laytpl'], function () {
        var form = layui.form,
            table = layui.table,
            laytpl = layui.laytpl,
            $ = layui.$;
        // 执行渲染
        table.render({
            elem: '#demo',
            url: 'manager/personList', //数据接口
            page: {
                limit: 3,
                limits: [3, 6, 9]
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        field: 'id',
                        title: '序号',
                        type: 'numbers'
                    },
                    {
                        field: 'managerId',
                        title: '人员id',
                        hide: true
                    },
                    {
                        field: 'roleId',
                        title: '角色id',
                        hide: true
                    },
                    {
                        field: 'managerName',
                        title: '人员姓名',
                    },
                    {
                        field: 'roleName',
                        title: '角色',
                    },
                    {
                        field: 'managerState',
                        title: '状态',
                    },
                    {
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
                case 'addEmp':
                    addView = layer.open({
                        type: 1,
                        title: "新增人员",
                        area: ['380px', '400px'],
                        resize: false,
                        content: $('#add_model')
                    });
                    form.render('select');
                    break;
            }
        });

        //工具条事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
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
                    title: '更改信息',
                    area: ["640px"],
                    content: $('#updateView')
                });
                $('#updateRoles input').val(data.roleName);
            } else if (layEvent === 'del') { // 删除
                layer.confirm('确定删除' + data.managerName + '吗？', function (index) {
                    layer.close(index); // 关闭弹出层
                    $.ajax({
                        url: 'manager/updateData',
                        type: 'get',
                        data: {
                            "managerId": data.managerId
                        },
                        dataType: 'json',
                        success: function (resp) {
                            obj.del();
                            layer.msg(resp.message);
                        }
                    });
                });
            } else if (layEvent === 'updateState') {
                var state = (data.managerState === '启用') ? '禁用' : '启用';
                layer.confirm('确定' + state + data.managerName + '吗？', function (index) {
                    layer.close(index); // 关闭弹出层
                    $.ajax({
                        url: 'manager/updateData',
                        type: 'get',
                        data: {
                            "managerId": data.managerId,
                            "managerState": state
                        },
                        dataType: 'json',
                        success: function (resp) {
                            obj.update({
                                managerState: state
                            });
                            $(obj.tr).find('#updateFriState').html(data.managerState);
                            layer.msg(resp.message);
                        }
                    });
                });
            } else if (layEvent === 'resetPwd') {
                layer.confirm('确定将' + data.managerName + '重置密码吗？', function (index) {
                    layer.close(index); // 关闭弹出层
                    $.ajax({
                        url: 'manager/updateData',
                        type: 'get',
                        data: {
                            "managerId": data.managerId,
                            "resetPwd": '123456',
                        },
                        dataType: 'json',
                        success: function (resp) {
                            obj.update({
                                managerState: state
                            });
                            layer.msg(resp.message);
                        }
                    });
                });
            }
            // 监听更新数据的表单提交
            form.on('submit(formDemo)', function (d) {
                // 发送更新请求
                $.ajax({
                    url: "manager/updateData",
                    type: "get",
                    data: {
                        "managerId": $('#personId').val(),
                        "updateRole": $('#personName').val()
                    },
                    dataType: 'json',
                    success: function (resp) {
                        obj.update({
                            managerName: $('#townNewName').val()
                        });
                        layer.close(updateViewIndex);
                        layer.msg(resp.message);
                    }
                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
        });

        $(document).on('click', "#searchBtn", function () {
            table.reload('demo', {
                where: {
                    name: $('#managerName').val(),
                    acc: $('#managerAcc').val(),
                    roleId: $('#selectRole .layui-this').attr('lay-value'),
                    state: $('#selectState .layui-this').attr('lay-value')
                },
                page: {
                    curr: 1
                }
            })
        });

        // 添加
        $(document).on('click', "#addes", function () {
            let acc = $('#addPersonAcc').val();
            let name = $('#addPersonName').val();
            let pwd = $('#addPersonPwd').val();
            let rePwd = $('#addPersonRePwd').val();
            let roleId = $('#addRoles .layui-this').attr('lay-value');
            if (acc === '') {
                alert("账号不能为空！");
                return false;
            }
            if (name === '') {
                alert("人员姓名不能为空");
                return false;
            }
            if ((pwd === '') || (rePwd === '')) {
                layer.msg("密码不能为空！");
                return false;
            }
            if (pwd !== rePwd) {
                alert("密码不一致，请重新输入！");
                return false;
            }
            if (roleId == null){
                alert("请选择角色！");
                return false;
            }
            layer.confirm('确定添加吗？', function (data) {
                $.ajax({
                    url: 'manager/addPerson',
                    type: 'post',
                    data: {
                        "acc": acc,
                        "name": name,
                        "pwd": pwd,
                        "roleId": roleId
                    },
                    dataType:'json',
                    success: function (resp) {
                        console.log(resp);
                        layer.msg(resp.message);
                        if (resp.code === 200){
                            layer.close(addView);     // 关闭填写窗口
                        }
                        layer.close(data);      // 关闭提示层
                    },
                    error: function (err) {
                        alert("通讯失败")
                    }
                })
            });
            // 取消
            $(document).on('click', "#back", function () {
                layer.confirm('确定取消吗？', function (data) {
                    layer.close(addView);     // 关闭填写窗口
                    layer.close(data);      // 关闭提示层
                });
            });
        });
    });
</script>
</body>
</html>

