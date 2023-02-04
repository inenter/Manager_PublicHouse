$(function () {
    $('#login').click(function () {
        let acc = $('#account').val();
        let pwd = $('#password').val();
        if (acc === '') {
            alert("账号不能为空！");
            return false;
        }
        if (pwd === '') {
            alert("密码不能为空！");
            return false;
        }
        $.ajax({
            url: 'manager/login',
            type: 'post',
            data: {
                'acc': acc,
                'pwd': pwd
            },
            dataType: 'json',
            success: function (resp) {
                if (resp.code === 200){
                    location.href = 'index';
                }else {
                    alert(resp.message);
                }
            },
            error: function (err) {
                alert("通讯失败！")
            }
        })
    })
});
