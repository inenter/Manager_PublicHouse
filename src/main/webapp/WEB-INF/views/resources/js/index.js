$.ajax({
    url:'manager/online',
    type:'get',
    data:{},
    dataType:'json',
    success: function (resp) {
        if (resp.code === 505){
            if (confirm("前往登录？")){
                location.href = 'login';
            }
        }else {
            getMenu();
        }
    },
    error: function (err) {
        alert("通讯失败")
    }
});

function getMenu(){
    $.ajax({
        url: 'manager/menu',
        type: 'post',
        data: {},
        dataType: 'json',
        success: function (resp) {
            var arr = resp.data;
            $('#one').text(resp.message);
            $('#title').text(resp.message);
            $('#bodys').append(`
        <iframe name="distribute" width="100%" height="100%" src="${arr[0].rightConnect}"></iframe> 
    `);
            for (var i = 0; i < arr.length; i++) {
                $('#power').append(
                    `
            <li class="layui-nav-item">
                    <a href="${arr[i].rightConnect}" target="distribute">${arr[i].rightName}</a>
                </li>
            `
                )
            }
        }
    });

}

$(function () {
    $('#savePwd').click(function () {
        var friPwd = $('#friPwd').val();
        var secPwd = $('#secPwd').val();
        var thrPwd = $('#thrPwd').val();
        if (friPwd === '' || secPwd === '' || thrPwd === ''){
            alert("密码不能为空！");
            return false;
        }
        if (secPwd !== thrPwd){
            alert("密码不一致，请输入输入");
            return false;
        }
        if (confirm("确认保存吗？")){
            $.ajax({
                url:'manager/updatePwd',
                type:'get',
                data:{
                    "friPwd":friPwd,
                    "managerPwd":secPwd
                },
                dataType:'json',
                success: function (resp) {
                    $('#savePwd').attr('data-dismiss', 'modal');
                    layer.msg(resp.message);
                }
            })
        }
    })
});

$(function () {
    $('#logout').click(function () {
        if (confirm("确认退出吗？")){
            $.ajax({
                url:'manager/logout',
                type:'get',
                data:{},
                dataType:'json',
                success: function (resp) {
                    if (resp.code === 200){
                        location.href = 'login';
                    }
                }
            })
        }
    })
});

