
reloadTable();

function reloadTable(){
    $.ajax({
        url:"manager/getPower",
        type:"post",
        dataType:"JSON",
        data:{},
        success:function (resp) {
            console.log(resp.data);
            deal(resp.data)
        },
        error:function (resp) {
            console.log("通讯失败")
        }
    })
}

function deal(data) {
    var allPower = [
         {"value": 1, "title": "区域管理", "disabled": "", "checked": ""}
        ,{"value": 2, "title": "小区管理", "disabled": "", "checked": ""}
        ,{"value": 3, "title": "套房管理", "disabled": "", "checked": ""}
        ,{"value": 4, "title": "人员管理", "disabled": "", "checked": ""}
        ,{"value": 5, "title": "权限管理", "disabled": true, "checked": ""}
        ,{"value": 6, "title": "资格审核", "disabled": "", "checked": ""}
        ,{"value": 7, "title": "房源分配", "disabled": "", "checked": ""}
        ,{"value": 8, "title": "统计分析", "disabled": "", "checked": ""}
    ];
    var SystemAdmHave = []; // 管理员
    var PublisherHave = []; // 发布员
    var DataAuditorHave = [];   // 审核员

    for (let i = 0; i < data.length ; i++) {
        if(data[i].roleId === 1 ){
            SystemAdmHave.push (data[i].rightId)
        }
        if(data[i].roleId === 2 ){
            PublisherHave.push (data[i].rightId)
        }
        if(data[i].roleId === 3 ){
            DataAuditorHave.push (data[i].rightId)
        }
    }

    layui.use('transfer', function () {
        var transfer = layui.transfer;
        // 系统管理端
        transfer.render({
            elem: '#SystemAdm',//绑定元素
            title: ['权限列表', '系统管理员']
            , data: allPower,
            value: SystemAdmHave,
            width: 150,
            id: 'SystemAdm',//定义索引
            onchange: function (data, index) {
                var SystemAdmData = transfer.getData('SystemAdm');
                let change = [];
                for (let i = 0; i <SystemAdmData.length ; i++) {
                    change.push(SystemAdmData[i].value)
                }
                $.ajax({
                    url:"manager/changePower",
                    type: "post",
                    dataType: "JSON",
                    data:{
                        "roleId": 1,
                        "power":JSON.stringify(change)
                    },
                    success:function (resp) {
                        reloadTable();
                        transfer.reload('SystemAdm', {
                            title: ['权限列表', '系统管理员']
                        });
                    }
                })
            }
        });
        // 房源发布员
        transfer.render({
            elem: '#Publisher',//绑定元素
            title: ['权限列表', '房源发布员']
            , data: allPower,
            value: PublisherHave,
            width: 150,
            id: 'Publisher',//定义索引
            onchange: function (data, index) {
                var PublisherData = transfer.getData('Publisher');
                let change = [];
                for (let i = 0; i <PublisherData.length ; i++) {
                    change.push(PublisherData[i].value)
                }
                $.ajax({
                    url:"manager/changePower",
                    type: "post",
                    dataType: "JSON",
                    data:{
                        "roleId":2,
                        "power":JSON.stringify(change)
                    },
                    success:function (resp) {
                        reloadTable();
                        transfer.reload('Publisher', {
                            title: ['权限列表', '房源发布员']
                        });
                    }
                })
            }
        });
        // 资质审核员
        transfer.render({
            elem: '#DataAuditor',//绑定元素
            title: ['权限列表', '资质审核员']
            , data: allPower,
            value: DataAuditorHave,
            width: 150,
            id: 'DataAuditor',//定义索引
            onchange: function (data, index) {
                var DataAuditorData = transfer.getData('DataAuditor');
                let change = [];
                for (let i = 0; i <DataAuditorData.length ; i++) {
                    change.push(DataAuditorData[i].value)
                }
                $.ajax({
                    url:"manager/changePower",
                    type: "post",
                    dataType: "JSON",
                    data:{
                        "roleId":3,
                        "power":JSON.stringify(change)
                    },
                    success:function (resp) {
                        reloadTable();
                        transfer.reload('DataAuditor', {
                            title: ['权限列表', '资格审核员']
                        });
                    }
                })
            }
        });

    });
}