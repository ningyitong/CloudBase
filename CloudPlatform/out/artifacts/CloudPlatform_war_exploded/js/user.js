function login(form) {
    if (form.username.value == "") {
        alert("Username cannot be empty!");
        return false;
    }
    if (form.password.value == "") {
        alert("Password cannot be empty!");
        return false;
    }
}

function registration(form) {
    if (form.username.value.equals("")) {
        alert("Username should not be empty!");
        return false;
    }
    if (form.username.value.length > 20) {
        alert("Username length should less than 20!");
        return false;
    }
    if (form.password.value.equals("")) {
        alert("Password should not be empty!");
        return false;
    }
    if (form.password.value.length < 3) {
        alert("Password should more than 3!");
        return false;
    }
    if (form.password.value !==form.repassword.value) {
        alert("Please input same password!");
        return false;
    }
    if (form.email.value.equals("")) {
        alert("Email Address should not be empty!");
        return false;
    }
    if (form.answer.value.equals("")) {
        alert("Answer should not be empty!");
        return false;
    }
    if (form.answer.value.length > 30) {
        alert("Answer length should no more than 30 letters!");
        return false;
    }
}

function resetPass(form) {
    if (form.username.value.equals("")) {
        alert("Username should not be empty!");
        return false;
    }
    if (form.password.value.equals("")) {
        alert("Password should not be empty!");
        return false;
    }
    if (form.password.value !== form.repassword.value) {
        alert("You should input the same password!");
        return false;
    }
    if (form.answer.value.equals("")) {
        alert("Answer should not be empty!");
        return false;
    }
}