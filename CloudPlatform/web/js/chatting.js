//face icons
// function InitFace() {
//     var strHTML = "";
//     for (var i = 1; i <= 10; i++) {
//         strHTML += "![](Face/" + i + ".gif )";
//     }
//     $("#divFace").html(strHTML);
// }
//
//
// $(function() {
//
//     InitFace();
//
//     $("table tr td img").click(function() {
//         var strContent = $("#txtContent").val() + "<:" + this.id + ":>";
//         $("#txtContent").val(strContent);
//
//     })
// });
// //face icons
// function InitFace() {
//     var strHTML = "";
//     for (var i = 1; i <= 10; i++) {
//         strHTML += "![](Face/" + i + ".gif )";
//     }
//     $("#divFace").html(strHTML);
// }

//get message content
//data is the message content data
function GetMessageList() {
    $.ajax({
        type: "POST",
        url: "ChattingServlet",
        data: "action=ChatList&d=" + new Date(),
        success: function(data) {
            $("#divContent").html(data);
        }
    });
    AutoUpdContent();
}

//get online user list
//data is the online user data
function  GetOnLineList() {
    $.ajax({
        type: "POST",
        url: "ChattingServlet",
        data: "action=OnLineList",
        success: function(data) {
            $("#divOnLine").html(data);
        }
    });
    AutoUpdContent();
}

//auto update member and message
function AutoUpdContent() {
    setTimeout(GetMessageList, 5000);
    setTimeout(GetOnLineList, 5000);
}

//send message
function SendContent(content) {
    $.ajax({
        type: "POST",
        url: "ChattingServlet",
        data: "action=SendContent&d=" + new Date() + "&content=" + content,
        success: function(data) {
            //alert(data);
            if (data==1) {
                GetMessageList();
                $("#txtContent").val("");
            }else {
                GetMessageList();
                alert("请先登录!");
                window.location.href="Login.html";
            }
        }
    });
}

$(function() {
    // InitFace();
    GetMessageList();
    GetOnLineList();

    $("#Button1").click(function() {
        var $content = $("#txtContent");
        if ($content.val() != "") {
            SendContent($content.val());
        }
        else {
            alert("Your message cannot be empty!");
            $content.focus();
            return false;
        }
    })

    $("table tr td img").click(function() {
        var strContent = $("#txtContent").val() + "<:" + this.id + ":>";
        $("#txtContent").val(strContent);

    })
});

function close_window() {
    if (confirm("Exit the Chatting room?")) {
        close();
    }
}
