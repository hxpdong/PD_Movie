var usertable = document.getElementById("tbd-usertable");
var admintable = document.getElementById("tbd-admintable");
var usertb = document.getElementById("ustb");
var admintb = document.getElementById("amtb");
var userArray = [];
var cntNumClickUser = 0;
var adminArray = [];
var cntNumClickAdmin = 0;

if (usertable) {
    axios.get('/api/admin/get-users/as/' + accId, {
        headers: headers
    })
        .then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    var usl = response.data.usersList;
                    usl.forEach(function (us) {
                        var usItem = [us.user_id, us.acctype_id, us.isLocked, us.usname, us.fullname, us.email
                        ];
                        userArray.push(usItem);
                    });
                    document.getElementById("numOfUser").textContent = response.data.totaluser;
                }
            } else if (response.status === 404 || response.status === 500) {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi!',
                    text: response.data.message
                });
            }
        })
        .catch(function (error) {
            console.error('Lỗi trong quá trình gửi yêu cầu:', error);
        });
}
if (admintable) {
    axios.get('/api/admin/get-admins/as/' + accId, {
        headers: headers
    })
        .then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    var usl = response.data.adminsList;
                    usl.forEach(function (us) {
                        var amItem = [us.admin_id, us.acctype_id, us.isLocked, us.usname, us.fullname, us.email, us.phone
                        ];
                        adminArray.push(amItem);
                    });
                    document.getElementById("numOfAdmin").textContent = response.data.totaladmin;
                }
            } else if (response.status === 404 || response.status === 500) {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi!',
                    text: response.data.message
                });
            }
        })
        .catch(function (error) {
            console.error('Lỗi trong quá trình gửi yêu cầu:', error);
        });
}

function showAccTable(num) {
    switch (num) {
        case 1:
            if (cntNumClickAdmin == 0) {
                getAdminList();
            }
            if (document.getElementById("ustb")) {
                document.getElementById("ustb").hidden = true;
            }
            if (document.getElementById("amtb")) {
                document.getElementById("amtb").hidden = !document.getElementById("amtb").hidden;
            }
            cntNumClickAdmin++;
            break;

        case 2:
            if (cntNumClickUser == 0) {
                getUserList();
            }
            if (document.getElementById("amtb")) {
                document.getElementById("amtb").hidden = true;
            }
            if (document.getElementById("ustb")) {
                document.getElementById("ustb").hidden = !document.getElementById("ustb").hidden;
            }
            cntNumClickUser++;
            break;

        default:
            break;
    }

}

document.addEventListener("DOMContentLoaded", function () {

});

function getAdminList() {
    adminArray.forEach(function (us) {
        var newRow = admintable.insertRow();
        var nameCell = newRow.insertCell(0);
        nameCell.classList.add("text-center");
        if (us[4])
            nameCell.textContent = us[4];
        else {
            nameCell.textContent = "_";
            nameCell.classList.add("italic");
        }
        var usernameCell = newRow.insertCell(1);
        usernameCell.textContent = us[3];
        usernameCell.classList.add("text-center");
        var emailCell = newRow.insertCell(2);
        emailCell.textContent = us[5];
        emailCell.classList.add("text-center");
        var phoneCell = newRow.insertCell(3);
        phoneCell.textContent = us[6];
        phoneCell.classList.add("text-center");
        var stateCell = newRow.insertCell(4);
        if (us[2] == 1) {
            stateCell.textContent = 'Bị khóa';
            stateCell.classList.add('text-red-500');
        } else {
            stateCell.textContent = 'Hoạt động';
            stateCell.classList.add('text-green-500');
        }
        stateCell.classList.add("text-center");
        var actionCell = newRow.insertCell(5);
        actionCell.classList.add("flex", "justify-around");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg");
        updateButton.title = "Cập nhật người dùng";
        var updateIcon = document.createElement("span");
        updateIcon.className = "material-icons";
        updateIcon.textContent = "manage_accounts";
        updateIcon.style.color = "#1355c9";
        updateButton.appendChild(updateIcon);
        updateButton.onclick = function () {
            var newfullname;
            var newemail;
            var newphone;
            Swal.fire({
                title: "Cập nhật thông tin quản trị viên",
                html: `
                                        <form id="updateForm">
                                        <label for="fullName">Họ và Tên</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${us[4]}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" id="phone" name="phone" class="swal2-input" required value="${us[6]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const fullname = document.getElementById("fullname")
                        .value;
                    const email = document.getElementById("email")
                        .value;
                    const phone = document.getElementById("phone")
                        .value;
                    newfullname = fullname;
                    newemail = email;
                    newphone = phone;
                    return fetch("/api/admin/changeInfo-admin/" + us[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            fullname,
                            email,
                            phone
                        }).toString(),
                    })
                        .then((response) => {
                            if (!response.ok) {
                                throw new Error(response
                                    .statusText);
                            }
                            return response.json();
                        })
                        .catch((error) => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`);
                        });
                },
                allowOutsideClick: () => !Swal.isLoading(),
            }).then((result) => {
                if (result.isConfirmed) {
                    const response = result.value;
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Cập nhật thông tin thành công",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                nameCell.textContent = newfullname;
                                emailCell.textContent = newemail;
                                phoneCell.textContent = newphone;
                                us[4] = newfullname;
                                us[5] = newemail;
                                us[6] = newphone;
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Lỗi!",
                            text: "Lỗi: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(updateButton);

        var changePasswordButton = document.createElement("button");
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg");
        changePasswordButton.title = "Cập nhật mật khẩu";
        var changePasswordIcon = document.createElement("span");
        changePasswordIcon.className = "material-icons";
        changePasswordIcon.textContent = "password";
        changePasswordIcon.style.color = "#ffc800";
        changePasswordButton.appendChild(changePasswordIcon);
        changePasswordButton.onclick = function () {
            var uptnewpassword;
            Swal.fire({
                title: "Cập nhật mật khẩu quản trị viên",
                html: `
                                        <form id="updatePasswordForm">
                                        <label for="uptnewpassword">Mật khẩu mới</label>
                                        <input type="text" id="uptnewpassword" name="uptnewpassword" class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const newpass = document.getElementById("uptnewpassword").value;
                    uptnewpassword = newpass;
                    return fetch("/api/admin/changePassword-admin/" + us[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            uptnewpassword,
                        }).toString(),
                    })
                        .then((response) => {
                            if (!response.ok) {
                                throw new Error(response
                                    .statusText);
                            }
                            return response.json();
                        })
                        .catch((error) => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`);
                        });
                },
                allowOutsideClick: () => !Swal.isLoading(),
            }).then((result) => {
                if (result.isConfirmed) {
                    const response = result.value;
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Cập nhật mật khẩu thành công",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Lỗi!",
                            text: "Lỗi: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(changePasswordButton);

        var deleteButton = document.createElement("button");
        deleteButton.classList.add("border-2", "p-2", "rounded-lg");
        var deleteIcon = document.createElement("span");
        deleteIcon.className = "material-icons";
        if (us[2] == 1) {
            deleteButton.title = "Mở khóa người dùng";
            deleteIcon.textContent = "lock_open";
            deleteIcon.classList.add('text-green-500');
        } else {
            deleteButton.title = "Khóa người dùng";
            deleteIcon.textContent = "lock";
            deleteIcon.classList.add('text-red-500');
        }
        deleteButton.appendChild(deleteIcon);
        deleteButton.onclick = function () {
            var url = '/api/admin/lock-admin/' + us[0] + '/as/' + accId;
            $.ajax({
                url: url,
                type: 'PUT',
                headers: headers,
                success: function (response) {
                    us[2] = response.currentState;
                    if (us[2] == 0) {
                        stateCell.textContent = 'Hoạt động';
                        stateCell.classList.remove('text-red-500');
                        stateCell.classList.add('text-green-500');

                        deleteButton.title = "Khóa người dùng";
                        deleteIcon.textContent = "lock";
                        deleteIcon.classList.remove('text-green-500');
                        deleteIcon.classList.add('text-red-500');
                    } else if (us[2] == 1) {
                        stateCell.textContent = 'Bị khóa';
                        stateCell.classList.remove('text-green-500');
                        stateCell.classList.add('text-red-500');

                        deleteButton.title = "Mở khóa người dùng";
                        deleteIcon.textContent = "lock_open";
                        deleteIcon.classList.remove('text-red-500');
                        deleteIcon.classList.add('text-green-500');
                    }
                },
                error: function (error) {
                    console.log("error: " + error);
                }
            });
        }
        actionCell.appendChild(deleteButton);
    });

    $('#admintable').DataTable({
        responsive: true,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal({
                    header: function (row) {
                        var data = row.data();
                        return 'Thông tin của ' + data[1];
                    }
                }),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                    tableClass: 'table'
                })
            }
        }
    })
        .columns.adjust()
        .responsive.recalc();
}

function getUserList() {
    userArray.forEach(function (us) {
        var newRow = usertable.insertRow();
        var nameCell = newRow.insertCell(0);
        nameCell.classList.add("text-center");
        if (us[4])
            nameCell.textContent = us[4];
        else {
            nameCell.textContent = "_";
            nameCell.classList.add("italic");
        }
        var usernameCell = newRow.insertCell(1);
        usernameCell.textContent = us[3];
        usernameCell.classList.add("text-center");
        var emailCell = newRow.insertCell(2);
        emailCell.textContent = us[5];
        emailCell.classList.add("text-center");
        var stateCell = newRow.insertCell(3);
        if (us[2] == 1) {
            stateCell.textContent = 'Bị khóa';
            stateCell.classList.add('text-red-500');
        } else {
            stateCell.textContent = 'Hoạt động';
            stateCell.classList.add('text-green-500');
        }
        stateCell.classList.add("text-center");
        var actionCell = newRow.insertCell(4);
        actionCell.classList.add("flex", "justify-around");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg");
        updateButton.title = "Cập nhật người dùng";
        var updateIcon = document.createElement("span");
        updateIcon.className = "material-icons";
        updateIcon.textContent = "manage_accounts";
        updateIcon.style.color = "#1355c9";
        updateButton.appendChild(updateIcon);
        updateButton.onclick = function () {
            var newfullname;
            var newemail;
            Swal.fire({
                title: "Cập nhật thông tin người dùng",
                html: `
                                        <form id="updateUserForm">
                                        <label for="fullName">Họ và Tên</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${us[4]}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const fullname = document.getElementById("fullname")
                        .value;
                    const email = document.getElementById("email")
                        .value;
                    newfullname = fullname;
                    newemail = email;
                    return fetch("/api/admin/changeInfo-user/" + us[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            fullname,
                            email
                        }).toString(),
                    })
                        .then((response) => {
                            if (!response.ok) {
                                throw new Error(response
                                    .statusText);
                            }
                            return response.json();
                        })
                        .catch((error) => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`);
                        });
                },
                allowOutsideClick: () => !Swal.isLoading(),
            }).then((result) => {
                if (result.isConfirmed) {
                    const response = result.value;
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Cập nhật thông tin người dùng thành công",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                nameCell.textContent = newfullname;
                                emailCell.textContent = newemail;
                                us[4] = newfullname;
                                us[5] = newemail;
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Lỗi!",
                            text: "Lỗi: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(updateButton);

        var changePasswordButton = document.createElement("button");
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg");
        changePasswordButton.title = "Cập nhật mật khẩu";
        var changePasswordIcon = document.createElement("span");
        changePasswordIcon.className = "material-icons";
        changePasswordIcon.textContent = "password";
        changePasswordIcon.style.color = "#ffc800";
        changePasswordButton.appendChild(changePasswordIcon);
        changePasswordButton.onclick = function () {
            var uptnewpassword;
            Swal.fire({
                title: "Cập nhật mật khẩu người dùng",
                html: `
                                        <form id="updatePasswordForm">
                                        <label for="uptnewpassword">Mật khẩu mới</label>
                                        <input type="text" id="uptnewpassword" name="uptnewpassword" class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const newpass = document.getElementById("uptnewpassword").value;
                    uptnewpassword = newpass;
                    return fetch("/api/admin/changePassword-user/" + us[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            uptnewpassword,
                        }).toString(),
                    })
                        .then((response) => {
                            if (!response.ok) {
                                throw new Error(response
                                    .statusText);
                            }
                            return response.json();
                        })
                        .catch((error) => {
                            Swal.showValidationMessage(
                                `Request failed: ${error}`);
                        });
                },
                allowOutsideClick: () => !Swal.isLoading(),
            }).then((result) => {
                if (result.isConfirmed) {
                    const response = result.value;
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Cập nhật mật khẩu thành công",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Lỗi!",
                            text: "Lỗi: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(changePasswordButton);

        var deleteButton = document.createElement("button");
        deleteButton.classList.add("border-2", "p-2", "rounded-lg");
        var deleteIcon = document.createElement("span");
        deleteIcon.className = "material-icons";
        if (us[2] == 1) {
            deleteButton.title = "Mở khóa người dùng";
            deleteIcon.textContent = "lock_open";
            deleteIcon.classList.add('text-green-500');
        } else {
            deleteButton.title = "Khóa người dùng";
            deleteIcon.textContent = "lock";
            deleteIcon.classList.add('text-red-500');
        }
        deleteButton.appendChild(deleteIcon);
        deleteButton.onclick = function () {
            var url = '/api/admin/lock-user/' + us[0] + '/as/' + accId;
            $.ajax({
                url: url,
                type: 'PUT',
                headers: headers,
                success: function (response) {
                    userArray[2] = response.currentState;
                    if (userArray[2] == 0) {
                        stateCell.textContent = 'Hoạt động';
                        stateCell.classList.remove('text-red-500');
                        stateCell.classList.add('text-green-500');

                        deleteButton.title = "Khóa người dùng";
                        deleteIcon.textContent = "lock";
                        deleteIcon.classList.remove('text-green-500');
                        deleteIcon.classList.add('text-red-500');
                    } else if (userArray[2] == 1) {
                        stateCell.textContent = 'Bị khóa';
                        stateCell.classList.remove('text-green-500');
                        stateCell.classList.add('text-red-500');

                        deleteButton.title = "Mở khóa người dùng";
                        deleteIcon.textContent = "lock_open";
                        deleteIcon.classList.remove('text-red-500');
                        deleteIcon.classList.add('text-green-500');
                    }
                },
                error: function (error) {
                    console.log("error: " + error);
                }
            });
        }
        actionCell.appendChild(deleteButton);
    });

    $('#usertable').DataTable({
        responsive: true,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal({
                    header: function (row) {
                        var data = row.data();
                        return 'Thông tin của ' + data[1];
                    }
                }),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                    tableClass: 'table'
                })
            }
        }
    })
        .columns.adjust()
        .responsive.recalc();
}
if(document.getElementById('btnAddNewAdmin')){
    document.getElementById('btnAddNewAdmin').onclick = function() {
        Swal.fire({
            title: "Thêm người dùng quản trị",
            html: `
                <form id="addNewAdminForm">
                    <label for="fullName">Họ và Tên</label>
                    <input type="text" id="fullname" name="fullname" class="swal2-input">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="swal2-input">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" id="phone" name="phone" class="swal2-input">
                    <label for="usname">Tên tài khoản</label>
                    <input type="text" id="usname" name="usname" class="swal2-input">
                    <label for="password">Mật khẩu</label>
                    <input type="text" id="password" name="password" class="swal2-input">
                </form>
                                `,
            showCancelButton: true,
            confirmButtonText: "Thêm mới",
            showLoaderOnConfirm: true,
            preConfirm: () => {
                const fullname = document.getElementById("fullname").value;
                const email = document.getElementById("email").value;
                const phone = document.getElementById("phone").value;
                const username = document.getElementById("usname").value;
                const password = document.getElementById("password").value;
                
                var newfullname = fullname;
                var newemail = email;
                var newphone = phone;
                var newusname = usname;
                var newpassword = password;
                return fetch("/api/admin/create-admin/as/" + accId, {
                    method: "POST",
                    headers: {
                        Authorization: apiToken,
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                    body: new URLSearchParams({
                        fullname,
                        email,
                        phone,
                        username,
                        password
                    }).toString(),
                })
                .then((response) => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    }
                    return response.json();
                })
                .then((data) => {
                    if (!data.success) {
                        throw new Error(data.message);
                    }
                    return data;
                })
                .catch((error) => {
                    Swal.showValidationMessage(
                        `Request failed: ${error.message}`);
                });
                
            },
            allowOutsideClick: () => !Swal.isLoading(),
        }).then((result) => {
            if (result.isConfirmed) {
                const response = result.value;
                if (response.success) {
                    Swal.fire({
                        icon: "success",
                        title: "Thêm tài khoản thành công",
                        confirmButtonText: "OK",
                    }).then((result) => {
                        if (result.isConfirmed) {
                            
                        }
                    });
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "Lỗi!",
                        text: "Lỗi: " + response.message
                    });
                }
            }
        });
    };
}
