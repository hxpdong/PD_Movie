const timeout = 200;

var usertable = document.getElementById("tbd-usertable");
var admintable = document.getElementById("tbd-admintable");
var userArray = [];
var cntNumClickUser = 0;
var adminArray = [];
var cntNumClickAdmin = 0;

var movietable = document.getElementById("tbd-movietable");
var movieArray = [];

document.addEventListener("DOMContentLoaded", function () {
    function hoanThanhCongViec() {
        Swal.close();
    }

    Swal.fire({
        title: 'Đang lấy dữ liệu...',
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        showConfirmButton: false,
        onBeforeOpen: () => {
            Swal.showLoading();
        },
        onClose: () => {
            Swal.hideLoading();
        }
    });
    if (isPageDashboard) {
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {
                addDataToUserArray();
                addDataToAdminArray();
                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("dashboardpage");
    }

    else if (isPageChapter) {
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {

                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("chapterpage");
    }

    else if (isPageGenre) {
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {

                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("genrepage");
    }

    else if (isPageMovie) {
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {
                addDataToMovieArray();
                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("moviepage");
    }
});

function addDataToUserArray() {
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
}

function addDataToAdminArray() {
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

function getAdminList() {
    while (admintable.firstChild) {
        admintable.removeChild(admintable.firstChild);
    }
    adminArray.forEach(function (us) {
        var newRow = admintable.insertRow();
        var nameCell = newRow.insertCell(0);
        nameCell.classList.add("text-center");
        nameCell.textContent = us[4];
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
        actionCell.classList.add("text-center");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
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
            var oldFullname = us[4] ? us[4] : "";
            Swal.fire({
                title: "Cập nhật thông tin quản trị viên",
                html: `
                                        <form id="updateForm">
                                        <label for="fullName">Họ và Tên</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${oldFullname}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" id="phone" name="phone" class="swal2-input" required value="${us[6]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                cancelButtonText: "Hủy bỏ",
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
                                us[4] = newfullname;
                                us[5] = newemail;
                                us[6] = newphone;
                                if ($.fn.DataTable.isDataTable('#admintable')) {
                                    $('#admintable').DataTable().destroy();
                                }
                                getAdminList();
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
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
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
                cancelButtonText: "Hủy bỏ",
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
        deleteButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
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
                    if ($.fn.DataTable.isDataTable('#admintable')) {
                        $('#admintable').DataTable().destroy();
                    }
                    getAdminList();
                },
                error: function (error) {
                    console.log("error: " + error);
                }
            });
        }
        actionCell.appendChild(deleteButton);
    });

    $('#admintable').DataTable({
        responsive: false,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
    })
        .columns.adjust();
}

function getUserList() {
    while (usertable.firstChild) {
        usertable.removeChild(usertable.firstChild);
    }
    userArray.forEach(function (us) {
        var newRow = usertable.insertRow();
        var nameCell = newRow.insertCell(0);
        nameCell.classList.add("text-center");
        nameCell.textContent = us[4];
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
        actionCell.classList.add("text-center");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        updateButton.title = "Cập nhật người dùng";
        var updateIcon = document.createElement("span");
        updateIcon.className = "material-icons";
        updateIcon.textContent = "manage_accounts";
        updateIcon.style.color = "#1355c9";
        updateButton.appendChild(updateIcon);
        updateButton.onclick = function () {
            var newfullname;
            var newemail;
            var oldFullname = us[4] ? us[4] : "";
            Swal.fire({
                title: "Cập nhật thông tin người dùng",
                html: `
                                        <form id="updateUserForm">
                                        <label for="fullName">Họ và Tên</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${oldFullname}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                cancelButtonText: "Hủy bỏ",
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
                                us[4] = newfullname;
                                us[5] = newemail;
                                if ($.fn.DataTable.isDataTable('#usertable')) {
                                    $('#usertable').DataTable().destroy();
                                }
                                getUserList();
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
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
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
                cancelButtonText: "Hủy bỏ",
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
        deleteButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
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
                    us[2] = response.currentState;
                    if ($.fn.DataTable.isDataTable('#usertable')) {
                        $('#usertable').DataTable().destroy();
                    }
                    getUserList();
                },
                error: function (error) {
                    console.log("error: " + error);
                }
            });
        }
        actionCell.appendChild(deleteButton);
    });

    $('#usertable').DataTable({
        responsive: false,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
    })
        .columns.adjust();
}
if (document.getElementById('btnAddNewAdmin')) {
    document.getElementById('btnAddNewAdmin').onclick = function () {
        var newfullname;
        var newemail;
        var newphone;
        var newusname;

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
            cancelButtonText: "Hủy bỏ",
            showLoaderOnConfirm: true,
            preConfirm: () => {
                const fullname = document.getElementById("fullname").value;
                const email = document.getElementById("email").value;
                const phone = document.getElementById("phone").value;
                const username = document.getElementById("usname").value;
                const password = document.getElementById("password").value;

                newfullname = fullname;
                newemail = email;
                newphone = phone;
                newusname = username;

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
                    const messageFromResponse = response.message;
                    var amItem = [
                        response.newadmin,
                        2,
                        0,
                        newusname,
                        newfullname,
                        newemail,
                        newphone
                    ];
                    adminArray.push(amItem);
                    if ($.fn.DataTable.isDataTable('#admintable')) {
                        $('#admintable').DataTable().destroy();
                    }
                    getAdminList();

                    document.getElementById("numOfAdmin").textContent = parseInt(document.getElementById("numOfAdmin").textContent) + 1;
                    Swal.fire({
                        icon: "success",
                        title: messageFromResponse,
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

function addDataToMovieArray() {
    if (movietable) {
        axios.get('/api/admin/movies', {
            headers: headers
        }).then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    var mvl = response.data.results;
                    mvl.forEach(function (mv) {
                        var mvItem = [
                            mv.movie_id,
                            mv.title_vi,
                            mv.title_en,
                            mv.content,
                            mv.director,
                            mv.actors,
                            mv.manufactureYear,
                            mv.videoLength,
                            mv.typeOfPosterURL,
                            mv.posterURL,
                            mv.updateAt,
                            mv.movie_url
                        ];
                        movieArray.push(mvItem);
                    });
                    getMovieList();
                    document.getElementById("numOfMovie").textContent = response.data.totalMovies;
                } else console.log("Error get movies");
            }
        });
    }
}

function getMovieList() {
    while (movietable.firstChild) {
        movietable.removeChild(movietable.firstChild);
    }
    movieArray.forEach(function (mv) {
        var newRow = movietable.insertRow();
        var mvidCell = newRow.insertCell(0);
        mvidCell.classList.add("text-center");
        mvidCell.textContent = mv[0];
        var mvViCell = newRow.insertCell(1);
        mvViCell.classList.add("text-center");
        mvViCell.textContent = mv[1];
        var mvEnCell = newRow.insertCell(2);
        mvEnCell.classList.add("text-center");
        mvEnCell.textContent = mv[2];
        var mvActionCell = newRow.insertCell(3);
        mvActionCell.classList.add("text-center", "md:flex", "md:flex-row");

        var infoButton = document.createElement("button");
        infoButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        infoButton.title = "Chi tiết phim";
        var infoIcon = document.createElement("span");
        infoIcon.className = "material-icons";
        infoIcon.textContent = "info";
        infoIcon.style.color = "#1355c9";
        infoButton.appendChild(infoIcon);
        infoButton.onclick = function () {
            var enNameElement =  document.getElementById("dtEnName");
            var viNameElement = document.getElementById("dtViName");
            var contentElement = document.getElementById("dtContent");
            var directorElement = document.getElementById("dtDirector");
            var actorElement = document.getElementById("dtActor");
            var yearElement = document.getElementById("dtYear");
            var typeposterElement = document.getElementById("dtTypePoster");
            var posterURLElement = document.getElementById("dtPosterURL");
            var vidlengthElement = document.getElementById("dtVidLength");
            var titleElement = document.getElementById("dtMovieTitle");
            var posterElement = document.getElementById("dtReviewIMG");
            var errIMG = document.getElementById("dtIMGnotExists");
            
            enNameElement.value = "";
            viNameElement.value = "";
            contentElement.value = "";
            directorElement.value = "";
            actorElement.value = "";
            yearElement.value = "";
            typeposterElement.value = "";
            posterURLElement.value = "";
            vidlengthElement.value = "";
            titleElement.textContent = "";
            posterElement.src = "";
            errIMG.textContent = "";

            document.getElementById("detailMovie-modal").classList.remove("hidden");
            const overlay = document.querySelector('#overlay');
            overlay.style.display = 'block';

            enNameElement.value = mv[2];
            viNameElement.value = mv[1];
            contentElement.value = mv[3];
            directorElement.value = mv[4];
            actorElement.value = mv[5];
            yearElement.value = mv[6];
            typeposterElement.value = mv[8];
            posterURLElement.value = mv[9];
            vidlengthElement.value = mv[7];
            titleElement.textContent = mv[2];
            if(mv[9] != null){
                if (mv[8] == 0) {
                    posterElement.src = mv[9];
                } else if (mv[8] == 1) {
                    var movieId = mv[9];
                    var xhrmv = new XMLHttpRequest();
                    xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                    xhrmv.onload = function () {
                        if (xhrmv.status === 200) {
                            var response = JSON.parse(xhrmv.responseText);
                            posterElement.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                        } else {
                            console.error('Error calling the API.');
                        }
                    };
                    xhrmv.send();
                }
            }
            else errIMG.textContent = "Phim chưa có Poster hoặc bị lỗi";
        };
        mvActionCell.appendChild(infoButton);

        var removeButton = document.createElement("button");
        removeButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        removeButton.title = "Xóa phim";
        var removeIcon = document.createElement("span");
        removeIcon.className = "material-icons";
        removeIcon.textContent = "delete";
        removeIcon.style.color = "#ff0000";
        removeButton.appendChild(removeIcon);
        removeButton.onclick = function () {
        }
        mvActionCell.appendChild(removeButton);
    });

    $('#movietable').DataTable({
        responsive: false,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
    })
        .columns.adjust();
}

function closeDetailModal() {
    if (document.getElementById("detailMovie-modal")) {
        document.getElementById("detailMovie-modal").classList.add("hidden");
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
    }
}