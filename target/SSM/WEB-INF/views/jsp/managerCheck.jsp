<%--
  Created by IntelliJ IDEA.
  User: LQB
  Date: 2022/12/14
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <title>资格审核</title>
    <link rel="stylesheet" href="resources/js/layui-v2.6.8/layui/css/layui.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-theme.css" media="screen">
    <link rel="stylesheet" href="resources/css/information.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <style>
        .layui-input-block input {
            width: 200px !important;
        }

        .layui-layer-page {
            width: 340px !important;
            height: 395px !important;
        }

        form .layui-input-inline {
            width: 150px;
        }

        .layui-table-header {
            height: 36px;
        }

        .layui-form-label {
            width: 90px;
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
            width: 364px !important;
        }

        .flexed {
            display: flex;
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
    </style>
</head>
<body>

<div style="padding: 15px; font-size: 20px;">
    <h3 style="margin: 10px 0; text-align: center; ">资格审核</h3>
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
            <div class="layui-inline">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline" id="selectState">
                    <select>
                        <option></option>
                        <option value="未审核">未审核</option>
                        <option value="未通过">未通过</option>
                        <option value="已通过">已通过</option>
                    </select>
                </div>
            </div>
        </form>
        <span style="margin-left: 30px; line-height: 38px">姓名：</span>
        <div class="layui-inline">
            <input type="text" class="layui-input" id="testInput"/>
        </div>
        <button class="layui-btn" id="searchBtn">查询</button>
    </div>
    <table id="demo" lay-filter="test" class="indexTable"></table>
</div>

<!-- 查看详情 -->
<div>
    <div style="z-index: 99999;" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 1300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="font-size: 25px;">详情</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -36px; font-size: 25px">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <section class="col-sm-8 maincontent" style="width: 1260px;">
                            <h4 class="title" style="margin-left: 20px">申请人基本信息</h4>
                            <div class="showData">
                                <table cellpadding="1" cellspacing="1" border="1">
                                    <tr>
                                        <td>申请人姓名:</td>
                                        <td>
                                            <span id="selfName"></span>
                                        </td>
                                        <td>身份证号:</td>
                                        <td>
                                            <span id="selfIdCard"></span>
                                        </td>
                                        <td>出生年月:</td>
                                        <td>
                                            <span id="selfBirth"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>手机:</td>
                                        <td>
                                            <span id="selfPhone"></span>
                                        </td>
                                        <td>保障类型:</td>
                                        <td>
                                            <span id="selfEnType"></span>
                                        </td>
                                        <td>申请的区域:</td>
                                        <td>
                                            <span id="selectProvinces"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>家庭年收入:</td>
                                        <td>
                                            <span id="selfIncome"></span>
                                        </td>
                                        <td>住房面积:</td>
                                        <td>
                                            <span id="selfAreaSize"></span>
                                        </td>
                                        <td>家庭人数:</td>
                                        <td>
                                            <span id="selfPeople"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>身份证上传</td>
                                        <td>
                                            <img alt="" id="selfCardName">
                                        </td>
                                        <td>户口本上传</td>
                                        <td>
                                            <img alt="" id="selfBook">
                                        </td>
                                        <td>毕业证上传</td>
                                        <td>
                                            <img alt="" id="selfCer">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>备注</td>
                                        <td colspan="5">
                                            <span id="selfInfo"></span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                        <section class="col-sm-8 maincontent detail-con" style="margin-top: 20px">
                            <h4 class="title" id="read" style="display: none;">家庭成员信息</h4>
                            <div class="showData show-sen" id="readFamily">
                                <table border="1">
                                    <thead>
                                    <tr>
                                        <td>与本人关系</td>
                                        <td>姓名</td>
                                        <td>身份证</td>
                                        <td>职业</td>
                                        <td>出生年月</td>
                                        <td>手机号</td>
                                        <td>身份证上传</td>
                                        <td>户口本上传</td>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="modal-footer">
                    <button style="outline: none; background-color: rgb(40,167,69);" type="button" class="btn btn-secondary" data-dismiss="modal" id="closeReading">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--拒绝信息的模板--%>
<script id="refuseViewTpl" type="text/html">
    <div style="padding: 16px;">
        <div class = "body">
            <div class="amendDiv" style="margin-left: 17px">
                <textarea placeholder="请填写原因" rows="10" cols="40" id="textarea"></textarea>
            </div>
            <input id="sureBtn" type="button" class="amendInput layui-btn-normal" value="确定" style="margin-top: 50px;width: 245px; margin-left: 39px">
        </div>
    </div>
</script>
<!-- 更新数据的视图：这个视图要通过页面弹出层显示 -->
<div id="refuseView" style="width: 360px; display: none;"></div>

<script src="resources/js/jQuery.min.js"></script>
<script src="resources/js/upload.js"></script>
<script src="resources/js/layui-v2.6.8/layui/layui.js"></script>

<!-- 操作 -->
<script type="text/html" id="toolEventDemo">
    <a class="layui-btn layui-btn-xs" data-toggle="modal" data-target="#exampleModal" lay-event="readInfo" id="readInfo">查看详情</a>
    {{# if(d.checkState == '未审核'){}}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="agree">同意</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="refuse">拒绝</a>
    {{# }}}
</script>

<script>
    layui.use(['form', 'jquery', 'table', 'laytpl'], function () {
        var form = layui.form,
            table = layui.table,
            laytpl = layui.laytpl,
            $ = layui.$;
        // 执行渲染
        table.render({
            elem: '#demo',
            url: 'check/getCheckList', //数据接口
            page: {
                limit: 5,
                limits: [5, 10, 15]
            },
            method: 'post',
            cols: [
                [ //表头
                    {
                        field: 'applyName',
                        title: '姓名',
                    }, {
                    field: 'checkState',
                    title: '状态',
                }, {
                    field: 'familyIncome',
                    title: '家庭收入',
                }, {
                    title: '操作',
                    templet: '#toolEventDemo',
                    fixed: "right"
                }
                ]
            ],
        });

        //工具条事件
        table.on('tool(test)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'readInfo'){
                $.ajax({
                    url:"check/readInfo",
                    type: "post",
                    dataType: "JSON",
                    data:{
                        "renterId": data.renterId
                    },
                    success:function (resp) {
                        console.log(resp.data[0]);
                        console.log(resp.data[0][0]);
                        console.log(resp.data[1]);
                        showPersonInfo(resp.data[0][0], resp.data[1].length);
                        showFamilyInfo(resp.data[1]);
                    }
                })
            } else if (layEvent === 'agree') { // 同意
                layer.confirm('确定审核通过吗？', function (index) {
                    checkInfo(data, index, '已通过', obj);
                });
            } else if(layEvent === 'refuse'){
                var getReTpl = refuseViewTpl.innerHTML,
                    review = document.getElementById('refuseView');
                laytpl(getReTpl).render(data, function (html) {
                    review.innerHTML = html;
                });
                // 更新渲染
                form.render();
                // 通过页面层展示
                var refuseViewIndex = layer.open({
                    type: 1,
                    title: '拒绝原因',
                    area: ["340px"],
                    content: $('#refuseView')
                });
                ensure(obj, data, refuseViewIndex);
            }


        });

        // 拒绝申请
        window.ensure = (function (obj, data, refuseViewIndex) {
            $('#sureBtn').click(function () {
                layer.confirm('确定审核通过吗？', function (index) {
                    checkInfo(data, index, '未通过', obj, $('#textarea').val());
                    layer.close(refuseViewIndex);
                });
            })
        });

        $(document).on('click', "#searchBtn", function () {
            console.log($('#prov .layui-this').attr('lay-value'));
            table.reload('demo', {
                where: {
                    areaName: $('#town .layui-this').text(),
                    checkState: $('#selectState .layui-this').attr('lay-value'),
                    applyName: $('#testInput').val()
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
                    if (resp.code === 200) {
                        var provincesArr = resp.data;
                        $("#selectProvince").html("");
                        var str = `<option value=""></option>`;
                        for (var i = 0; i < provincesArr.length; i++) {
                            str += `<option value='${provincesArr[i].areaId}'>${provincesArr[i].areaName}</option>`;
                        }
                        $("#selectProvince").html(str);
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

        function checkInfo(data, index, checkState, obj, text) {
            layer.close(index); // 关闭弹出层
            $.ajax({
                url: 'check/checkInfo',
                type: 'get',
                data: {
                    "checkId": data.checkId,
                    "checkState": checkState,
                    "renterId": data.renterId,
                    "areaName": data.areaName,
                    "text": text,
                    "applyTime": data.applyTime
                },
                dataType: 'json',
                success: function (resp) {
                    if (resp.code === 200){
                        obj.update({
                            checkState: checkState
                        });
                    }
                    layer.msg(resp.message);
                }
            });
        }

        function showPersonInfo(arr, num) {
            $('#selfName').text(arr.applyName);
            $('#selfIdCard').text(arr.idCard);
            $('#selfBirth').text(stampToDate(arr.birthday));
            $('#selfPhone').text(arr.phone);
            $('#selfEnType').text(arr.enType);
            $('#selectProvinces').text(arr.areaName);
            $('#selfIncome').text(arr.familyIncome);
            $('#selfAreaSize').text(arr.houseArea);
            $('#selfPeople').text(num);
            $('#selfCardName').attr('src', 'http://localhost:8080/Rent_Font/resources/imgs/' + arr.idCardImg);
            $('#selfBook').attr('src', 'http://localhost:8080/Rent_Font/resources/imgs/' + arr.rebookPerImg);
            $('#selfCer').attr('src', 'http://localhost:8080/Rent_Font/resources/imgs/' + arr.grabookImg);
            $('#selfInfo').text(arr.remarks);
        }
        function showFamilyInfo(arr) {
            $('#readFamily>table>tbody').html('');
            for (var i = 0; i < arr.length; i++) {
                $('#read').attr('style', 'display:block!important');
                $('#readFamily').attr('style', 'display:block!important');
                $('#readFamily>table').append(`<tbody>
				        					<tr>
				        						<td>
				        							<span>${arr[i].relation}</span>
				        						</td>
				        						<td>
				        							<span>${arr[i].familyName}</span>
				        						</td>
				        						<td>
				        							<span style="width: 200px;">${arr[i].familyIdCard}</span>
				        						</td>
				        						<td>
				        							<span>${arr[i].work}</span>
				        						</td>
				        						<td>
				        							<span id="birth${i}"></span>
				        						</td>
				        						<td>
				        							<span>${arr[i].familyTel}</span>
				        						</td>
				        						<td>
				        							<img alt="" id="card${i}">
				        						</td>
				        						<td>
				        							<img alt="" id="book${i}">
				        						</td>
				        					</tr>
				        				</tbody>`);
                $('#birth' + i).text(stampToDate(arr[i].familyBirthday));
                $('#card' + i).attr('src', 'http://localhost:8080/Rent_Font/resources/imgs/'+ arr[i].familyCardImg);
                $('#book' + i).attr('src', 'http://localhost:8080/Rent_Font/resources/imgs/'+ arr[i].familyReBookImg);
            }
        }
        /**
         * 将时间戳转为标准时间
         */
        function stampToDate(time) {
            var date = new Date(Number(time));
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d) + '-';
        }

    });

</script>

<script src="resources/js/jq.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
