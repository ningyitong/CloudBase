function ValidateUploadForm(Form) {
    var _validFileExtensions = [".jpg", ".jpeg", ".png", ".bmp", ".jar", ".war"];
    var title = document.forms["uploadAppForm"]["title"].value;
    var price = document.forms["uploadAppForm"]["price"].value;
    if (title == "") {
        alert("Title should not empty");
        return false;
    }
    if (price == "") {
        alert("Price should not empty");
        return false;
    }
    var arrInputs = Form.getElementsByTagName("input");
    for (var i = 0; i < arrInputs.length; i++) {
        var Input = arrInputs[i];
        if (Input.type == "file") {
            var upName = Input.value;
            upName = upName.replace(/\\/g, '/');
            var fName = upName.substring(upName.lastIndexOf('/')+1, upName.lastIndexOf('.'));
            console.log(fName);
        }
    }
    for (var i = 0; i < arrInputs.length; i++) {
        var Input = arrInputs[i];
        if (Input.type == "file") {
            var FileName = Input.value;
            if (FileName.length > 0) {
                var blnValid = false;
                for (var j = 0; j < _validFileExtensions.length; j++) {
                    var CurExtension = _validFileExtensions[j];
                    if (FileName.substr(FileName.length - CurExtension.length, CurExtension.length).toLowerCase() == CurExtension.toLowerCase()) {
                        blnValid = true;
                        break;
                    }
                }
                if (!blnValid) {
                    alert("Sorry, " + FileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                    return false;
                }
            } else {
                alert("Empty file!");
                return false;
            }
        }
    }
    return true;
    alert("Uploading... Please wait.");
}