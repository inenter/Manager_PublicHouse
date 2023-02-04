// 查询省份
findProvinces(1);

function findProvinces() {
    $.ajax({
        url:"user/findArea",
        type:"post",
        data:{
            "pid":1
        },
        dataType:"JSON",
        success:function (resp) {
            if(resp.code == 200){
                var provincesArr = resp.data;
                $("#selectProvince").html("");
                var str = "<option>请选择省份</option>";
                for (var i = 0; i < provincesArr.length; i++) {
                    str += `<option value='${provincesArr[i].areaId}' id="${provincesArr[i].areaName}">${provincesArr[i].areaName}</option>`
                }
                $("#selectProvince").html(str);
            }
        }
    });
}

// 查询城市
function findCity(_this) {
    $.ajax({
        url:"user/findArea",
        type:"post",
        data:{
            "pid":_this.value
        },
        dataType:"JSON",
        success:function (resp) {
            if(resp.code == 200){
                var cityArr = resp.data;
                $("#selectCity").html("");
                var str = "<option>请选择城市</option>";
                for (var i = 0; i < cityArr.length; i++) {
                    str += `<option value="${cityArr[i].areaId}" id="${cityArr[i].areaName}">${cityArr[i].areaName}</option>`
                }
                $("#selectCity").html(str);
            }
        }
    });
}