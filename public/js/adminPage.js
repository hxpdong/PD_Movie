const timeout = 200;

var usertable = document.getElementById("tbd-usertable");
var admintable = document.getElementById("tbd-admintable");
var userArray = [];
var cntNumClickUser = 0;
var adminArray = [];
var cntNumClickAdmin = 0;

var movietable = document.getElementById("tbd-movietable");
var movieArray = [];

var genreArray = [];
var moviegenretable = document.getElementById("tbd-movie-genre-table");
var moviegenreArray = [];

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
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {
                addDataToGenreArray();
                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("genrepage");
        postNewGenre();
        inputSearchGenre();
    }

    else if (isPageMovie) {
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {
                getPosterType();
                addDataToMovieArray();
                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("moviepage");
        postNewMovie();
        updateMovie();
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
        axios.get('/api/admin/movies/as/' + accId, {
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
    var cnt = 0;
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
            var mvidElement = document.getElementById("dtmvid");
            var enNameElement = document.getElementById("dtEnName");
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

            mvidElement.disabled = true;
            mvidElement.value = "";
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

            mvidElement.value = mv[0];
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
            if (mv[9] != null) {
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
                else if (mv[8] == 2) {
                    var movieId = mv[9];
                    var xhrmv = new XMLHttpRequest();
                    xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
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
            Swal.fire({
                icon: 'warning',
                title: 'Bạn có chắc chắn muốn xóa phim ' + mv[0] + " - " + mv[2] + "?",
                html: 'Khi đồng ý <span class="text-red-500 font-bold">XÓA</span>, toàn bộ thông tin liên quan đến phim (bình luận, đánh giá,...) đều sẽ bị xóa và <span class="text-red-500 font-bold">không thể</span> khôi phục lại',
                showCancelButton: true,
                confirmButtonText: 'Xóa',
                confirmButtonColor: 'red',
                cancelButtonText: 'Suy nghĩ lại'
            }).then((result) => {
                if (result.isConfirmed) {
                    var apiUrl = `/api/admin/movies-drop/${mv[0]}/as/${accId}`;

                    fetch(apiUrl, {
                        method: "DELETE",
                        headers: headers
                    })
                        .then(function (response) {
                            return response.json();
                        })
                        .then(function (data) {
                            if (data.success === true) {
                                Swal.fire(
                                    'Đã xóa!',
                                    'Xóa phim thành công!',
                                    'success'
                                );
                                for (var i = 0; i < movieArray.length; i++) {
                                    if (movieArray[i][0] === mv[0]) {
                                        movieArray.splice(i, 1); // Xóa đối tượng tại chỉ mục i
                                        break; // Sau khi xóa, bạn có thể thoát khỏi vòng lặp
                                    }
                                }
                                if ($.fn.DataTable.isDataTable('#movietable')) {
                                    $('#movietable').DataTable().destroy();
                                }
                                getMovieList();
                                document.getElementById("numOfMovie").textContent = parseInt(document.getElementById("numOfMovie").textContent) - 1;
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Không thể thực hiện thao tác',
                                    html: 'Do bạn không có quyền hoặc tài khoản đang được đăng nhập ở nơi khác.<br/> Vui lòng đăng nhập lại!',
                                    confirmButtonText: 'Đăng nhập lại',
                                    allowOutsideClick: false,
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = '/logoutHeader';
                                    }
                                });
                            }
                        })
                        .catch(function (error) {
                            Swal.fire({
                                icon: 'error',
                                title: 'An error occurred: ' + error,
                                html: 'Please try again later',
                            });
                        });
                }
            });
        }
        mvActionCell.appendChild(removeButton);
        cnt++;
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

function closeAddMovieModal() {
    var modal = document.getElementById("addnewMovie-modal");
    if (modal) {
        var inputFields = modal.querySelectorAll('input[type="text"]');
        inputFields.forEach(function (input) {
            input.value = '';
        });
        var textAreaFields = modal.querySelectorAll('textarea');
        textAreaFields.forEach(function (input) {
            input.value = '';
        });
        var numberFields = modal.querySelectorAll('input[type="number"]');
        numberFields.forEach(function (input) {
            input.value = '';
        });
        var selectFields = modal.querySelectorAll('select');
        selectFields.forEach(function (input) {
            input.value = 0;
        });
        document.getElementById('newIMGnotExists').textContent = "";
        document.getElementById('newReviewIMG').src = "";
    }
}

function closeAddGenreModal() {
    var modal = document.getElementById("addnewGenre-modal");
    if (modal) {
        var inputFields = modal.querySelectorAll('input[type="text"]');
        inputFields.forEach(function (input) {
            input.value = '';
        });
    }
}

function closeListMovieGenreModal() {
    var modal = document.getElementById("listMovieGenre-modal");
    modal.classList.add("hidden");
    const overlay = document.querySelector('#overlay');
    overlay.style.display = 'none';
}

function getPosterType() {
    var selectAPI1 = document.getElementById("newTypePoster");
    var selectAPI2 = document.getElementById("dtTypePoster");
    axios.get('/api/system/get-poster-list', {
        headers: headers
    }).then(function (response) {
        if (response.status === 200) {
            if (response.data.success === true) {
                var apil = response.data.apiList;
                apil.forEach(function (api) {
                    var newOption = document.createElement("option");
                    newOption.value = api.api_id;
                    newOption.textContent = api.api_name;

                    var newOption2 = document.createElement("option");
                    newOption2.value = api.api_id;
                    newOption2.textContent = api.api_name;

                    selectAPI2.appendChild(newOption2);
                    selectAPI1.appendChild(newOption);
                });
            }
        }
    });
}

function postNewMovie() {
    $('#modalNewMovieForm').submit(function (e) {
        e.preventDefault();
        if (false) {

        } else {
            Swal.fire({
                title: 'Đang xử lý...',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                onBeforeOpen: () => {
                    Swal.showLoading();
                },
                onClose: () => {
                    Swal.hideLoading();
                }
            });
            const formData = $(this).serialize();
            axios.post('/api/admin/movies/as/' + accId, formData, {
                headers: {
                    Authorization: apiToken,
                    "Content-Type": "application/x-www-form-urlencoded",
                }
            })
                .then(response => {
                    Swal.close();
                    if (response.data.success) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Thêm phim mới thành công',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                //ocation.reload();
                                document.getElementById("numOfMovie").textContent = parseInt(document.getElementById("numOfMovie").textContent) + 1;
                                var mv = response.data.newmv;
                                mv = mv[0];
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

                                if ($.fn.DataTable.isDataTable('#movietable')) {
                                    $('#movietable').DataTable().destroy();
                                }
                                getMovieList();
                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Không thể thêm phim',
                            text: response.data.error
                        });
                    }
                });
        }
    });
}

function checkNewPoster() {
    var imgtag = document.getElementById("newReviewIMG");
    var imgnotfound = document.getElementById("newIMGnotExists");
    var imgURL = document.getElementById("newPosterURL").value;
    var imgType = document.getElementById("newTypePoster").value;

    var imgtagDt = document.getElementById("dtReviewIMG");
    var imgnotfoundDt = document.getElementById("dtIMGnotExists");
    var imgURLDt = document.getElementById("dtPosterURL").value;
    var imgTypeDt = document.getElementById("dtTypePoster").value;

    if (imgURL) {
        imgtag.src = "";
        imgnotfound.textContent = "";
        if (imgType == "0") {
            imgtag.src = imgURL;
        } else if (imgType == "1") {
            var xhrmv = new XMLHttpRequest();
            xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', imgURL), true);
            xhrmv.onload = function () {
                if (xhrmv.status === 200) {
                    var response = JSON.parse(xhrmv.responseText);
                    imgtag.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                } else {
                    imgnotfound.textContent = 'Với themoviedb, cần nhập vào id của phim ở themoviedb.';
                }
            };
            xhrmv.send();
        } else if (imgType == "2") {
            var xhrmv = new XMLHttpRequest();
            xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', imgURL), true);
            xhrmv.onload = function () {
                if (xhrmv.status === 200) {
                    var response = JSON.parse(xhrmv.responseText);
                    imgtag.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                } else {
                    imgnotfound.textContent = 'Với themoviedb, cần nhập vào id của phim ở themoviedb.';
                }
            };
            xhrmv.send();
        }
    }

    if (imgURLDt) {
        imgtagDt.src = "";
        imgnotfoundDt.textContent = "";
        if (imgTypeDt == "0") {
            imgtagDt.src = imgURLDt;
        } else if (imgTypeDt == "1") {
            var xhrmv = new XMLHttpRequest();
            xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', imgURLDt), true);
            xhrmv.onload = function () {
                if (xhrmv.status === 200) {
                    var response = JSON.parse(xhrmv.responseText);
                    imgtagDt.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                } else {
                    imgnotfoundDt.textContent = 'Với themoviedb, cần nhập vào id của phim ở themoviedb.';
                }
            };
            xhrmv.send();
        } else if (imgTypeDt == "2") {
            var xhrmv = new XMLHttpRequest();
            xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', imgURLDt), true);
            xhrmv.onload = function () {
                if (xhrmv.status === 200) {
                    var response = JSON.parse(xhrmv.responseText);
                    imgtagDt.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                } else {
                    imgnotfoundDt.textContent = 'Với themoviedb, cần nhập vào id của phim ở themoviedb.';
                }
            };
            xhrmv.send();
        }
    }
}

function updateMovie() {
    $('#modalUpdateMovieForm').submit(function (e) {
        e.preventDefault();
        if (false) {

        } else {
            mvid = document.getElementById("dtmvid").value;
            Swal.fire({
                title: 'Đang xử lý...',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                onBeforeOpen: () => {
                    Swal.showLoading();
                },
                onClose: () => {
                    Swal.hideLoading();
                }
            });
            const formData = $(this).serialize();
            axios.put('/api/admin/movies-update/' + mvid + '/as/' + accId, formData, {
                headers: {
                    Authorization: apiToken,
                    "Content-Type": "application/x-www-form-urlencoded",
                }
            })
                .then(response => {
                    Swal.close();
                    if (response.data.success) {
                        var mv = response.data.newmv;
                        mv = mv[0];
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
                        for (var i = 0; i < movieArray.length; i++) {
                            if (movieArray[i][0] === mvItem[0]) {
                                movieArray[i][1] = mvItem[1];
                                movieArray[i][2] = mvItem[2];
                                movieArray[i][3] = mvItem[3];
                                movieArray[i][4] = mvItem[4];
                                movieArray[i][5] = mvItem[5];
                                movieArray[i][6] = mvItem[6];
                                movieArray[i][7] = mvItem[7];
                                movieArray[i][8] = mvItem[8];
                                movieArray[i][9] = mvItem[9];
                                movieArray[i][10] = mvItem[10];
                                movieArray[i][11] = mvItem[11];
                                break;
                            }
                        }
                        if ($.fn.DataTable.isDataTable('#movietable')) {
                            $('#movietable').DataTable().destroy();
                        }
                        getMovieList();
                        Swal.fire({
                            icon: 'success',
                            title: 'Cập nhật thành công',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Không thể cập nhật phim',
                            text: response.data.error
                        });
                    }
                });
        }
    });

}

function addDataToGenreArray() {
    axios.get('/api/genres?type=0')
        .then(function (response) {
            var mvgenres = response.data.genres;
            mvgenres.forEach(function (mvg) {
                genreItem = [
                    mvg.mvgenre_id,
                    mvg.mvgenre_vi_name,
                    mvg.mvgenre_en_name
                ];
                genreArray.push(genreItem);
            });
            getMVGenreList();
        });
}
function getMVGenreList() {
    const backgroundColors = ['#995733', '#339957', '#573399'];

    var mvgListDiv = document.getElementById("mvgList");
    while (mvgListDiv.firstChild) {
        mvgListDiv.removeChild(mvgListDiv.firstChild);
    }

    genreArray.forEach(function (mvg, index) {
        const container = document.createElement('div');
        container.className = 'w-full px-6 sm:w-1/2 xl:w-1/3 my-2 mvgItem';
        const card = document.createElement('div');
        card.className = 'flex items-center px-5 py-6 bg-white rounded-md shadow-sm overflow-x-hidden';
        card.onclick = function () {
            //
            document.getElementById("listMovieGenre-modal").classList.remove("hidden");
            const overlay = document.querySelector('#overlay');
            overlay.style.display = 'block';

            AddDataToMovieGenreArray(mvg[0]);
        };
        const iconContainer = document.createElement('div');
        iconContainer.className = 'p-3 flex justify-center items-center h-16 rounded-md';
        const colorIndex = index % backgroundColors.length;
        iconContainer.style.backgroundColor = backgroundColors[colorIndex];
        const icon = document.createElement('i');
        icon.className = 'fa-solid fa-tags fa-2xl';
        icon.style.color = '#ffffff';
        iconContainer.appendChild(icon);
        const contentContainer = document.createElement('div');
        contentContainer.className = 'mx-5';
        const title = document.createElement('h4');
        title.className = 'text-md font-semibold text-gray-700';
        title.textContent = mvg[1] + "/" + mvg[2];
        const description = document.createElement('div');
        description.className = 'text-gray-500';
        description.textContent = '';
        contentContainer.appendChild(title);
        contentContainer.appendChild(description);

        const divButton = document.createElement("div");
        divButton.className = "w-32 grid grid-cols-2";
        const editBtn = document.createElement("button");
        editBtn.title = "Sửa";
        editBtn.style.backgroundColor = "#66ccff";
        editBtn.style.color = "#fff";
        editBtn.className = "rounded-t-lg py-1";
        const editIcon = document.createElement("span");
        editIcon.className = "material-icons";
        editIcon.textContent = "edit";
        editBtn.appendChild(editIcon);
        editBtn.onclick = function () {
            var newEnName;
            var newViName;
            Swal.fire({
                title: "Cập nhật thông tin thể loại",
                html: `
                                        <form id="modalUpdateGenreForm">
                                        <label for="uptGenreId"><b>Thể loại:</b></label>
                                        <input type="text" id="uptGenreId" name="uptGenreId" value='${mvg[0]}' class="swal2-input" required disabled>
                                        <label for="uptGenreEn">Tên tiếng Anh mới</label>
                                        <input type="text" id="uptGenreEn" name="uptGenreEn" value='${mvg[2]}' class="swal2-input" required>
                                        <label for="uptGenreVi">Tên tiếng Việt mới</label>
                                        <input type="text" id="uptGenreVi" name="uptGenreVi" value='${mvg[1]}' class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Cập nhật",
                cancelButtonText: "Thoát",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const uptGenreEn = document.getElementById("uptGenreEn").value;
                    newEnName = uptGenreEn;
                    const uptGenreVi = document.getElementById("uptGenreVi").value;
                    newViName = uptGenreVi;
                    return fetch("/api/admin/genres/" + mvg[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            uptGenreEn,
                            uptGenreVi,
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
                        var updatedGenre = response.newgenre;
                        console.log(updatedGenre);
                        updatedGenre = updatedGenre[0];
                        console.log(updatedGenre);
                        var mvgItem = [
                            updatedGenre.mvgenre_id,
                            updatedGenre.mvgenre_vi_name,
                            updatedGenre.mvgenre_en_name
                        ];
                        console.log(mvgItem);
                        for (var i = 0; i < genreArray.length; i++) {
                            if (genreArray[i][0] === mvgItem[0]) {
                                genreArray[i][1] = mvgItem[1];
                                genreArray[i][2] = mvgItem[2];
                                break;
                            }
                        }
                        getMVGenreList();

                        Swal.fire({
                            icon: "success",
                            title: "Cập nhật thể loại thành công",
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
        const rmvBtn = document.createElement("button");
        rmvBtn.title = "Xóa";
        rmvBtn.style.backgroundColor = "#EF4444";
        rmvBtn.style.color = "#fff";
        rmvBtn.className = "rounded-t-lg py-1";
        const rmIcon = document.createElement("span");
        rmIcon.className = "material-icons";
        rmIcon.textContent = "delete";
        rmvBtn.appendChild(rmIcon);
        rmvBtn.onclick = function () {
            Swal.fire({
                icon: 'warning',
                title: 'Bạn có chắc chắn muốn xóa thể loại ' + mvg[0] + " - " + mvg[2] + "/" + mvg[1] + "?",
                html: 'Khi đồng ý <span class="text-red-500 font-bold">XÓA</span>, thể loại này của phim cũng sẽ bị xóa và <span class="text-red-500 font-bold">không thể</span> khôi phục lại',
                showCancelButton: true,
                confirmButtonText: 'Xóa',
                confirmButtonColor: 'red',
                cancelButtonText: 'Suy nghĩ lại'
            }).then((result) => {
                if (result.isConfirmed) {
                    var apiUrl = `/api/admin/genres/${mvg[0]}/as/${accId}`;

                    fetch(apiUrl, {
                        method: "DELETE",
                        headers: headers
                    })
                        .then(function (response) {
                            return response.json();
                        })
                        .then(function (data) {
                            if (data.success === true) {
                                for (var i = 0; i < genreArray.length; i++) {
                                    if (genreArray[i][0] === mvg[0]) {
                                        genreArray.splice(i, 1);
                                        break;
                                    }
                                }
                                getMVGenreList();
                                Swal.fire(
                                    'Đã xóa!',
                                    'Xóa thể loại thành công!',
                                    'success'
                                );
                            }
                            else Swal.fire(
                                'Không thể xóa!',
                                data.message,
                                'error'
                            );
                        })
                        .catch(function (error) {
                            Swal.fire({
                                icon: 'error',
                                title: 'An error occurred: ' + error,
                                html: 'Please try again later',
                            });
                        });
                }
            });
        }
        divButton.appendChild(editBtn);
        divButton.appendChild(rmvBtn);

        card.appendChild(iconContainer);
        card.appendChild(contentContainer);
        container.appendChild(divButton);
        container.appendChild(card);
        mvgListDiv.appendChild(container);
    });
};

function postNewGenre() {
    $('#modalNewGenreForm').submit(function (e) {
        e.preventDefault();
        if (false) {

        } else {
            Swal.fire({
                title: 'Đang xử lý...',
                allowOutsideClick: false,
                allowEscapeKey: false,
                allowEnterKey: false,
                onBeforeOpen: () => {
                    Swal.showLoading();
                },
                onClose: () => {
                    Swal.hideLoading();
                }
            });
            const formData = $(this).serialize();
            axios.post('/api/admin/genres/as/' + accId, formData, {
                headers: {
                    Authorization: apiToken,
                    "Content-Type": "application/x-www-form-urlencoded",
                }
            })
                .then(response => {
                    Swal.close();
                    if (response.data.success) {
                        var mvg = response.data.newgenre;
                        mvg = mvg[0];
                        var mvgItem = [
                            mvg.mvgenre_id,
                            mvg.mvgenre_vi_name,
                            mvg.mvgenre_en_name
                        ];
                        genreArray.push(mvgItem);

                        getMVGenreList();
                        Swal.fire({
                            icon: 'success',
                            title: 'Thêm thể loại thành công',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                //ocation.reload();
                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Không thể thêm thể loại',
                            text: response.data.error
                        });
                    }
                });
        }
    });
}

function AddDataToMovieGenreArray(mvgid) {
    if (moviegenretable) {
        axios.get('/api/admin/movie-of-genres/' + mvgid + "/as/" + accId, {
            headers: headers
        })
            .then(function (response) {
                if (response.status === 200) {
                    if (response.data.success === true) {
                        var mvl = response.data.results.movies;
                        moviegenreArray.splice(0, moviegenreArray.length);
                        mvl.forEach(function (mv) {
                            var mvItem = [
                                mv.movie_id,
                                mv.title_vi,
                                mv.title_en,
                                mv.movgen_id
                            ];
                            moviegenreArray.push(mvItem);
                        });
                        document.getElementById("listmvofgenre").textContent = "Mã: " + response.data.infogenre.mvgenre_id + " - " + response.data.infogenre.mvgenre_vi_name + "/" + response.data.infogenre.mvgenre_en_name;
                        document.getElementById("numMVOfthisGenre").textContent = response.data.results.total;
                        document.getElementById("currentMVG").value = response.data.infogenre.mvgenre_vi_name + "/" + response.data.infogenre.mvgenre_en_name;
                        if ($.fn.DataTable.isDataTable('#movie-genre-table')) {
                            $('#movie-genre-table').DataTable().destroy();
                        }
                        getMovieOfGenreList();
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

function getMovieOfGenreList() {
    while (moviegenretable.firstChild) {
        moviegenretable.removeChild(moviegenretable.firstChild);
    }
    moviegenreArray.forEach(function (mv) {
        var newRow = moviegenretable.insertRow();
        var idCell = newRow.insertCell(0);
        idCell.classList.add("text-center");
        idCell.textContent = mv[0];
        var titleViCell = newRow.insertCell(1);
        titleViCell.textContent = mv[1];
        titleViCell.classList.add("text-center");
        var titleEnCell = newRow.insertCell(2);
        titleEnCell.textContent = mv[2];
        titleEnCell.classList.add("text-center");
        var actionCell = newRow.insertCell(3);
        actionCell.classList.add("text-center");
        var removeButton = document.createElement("button");
        removeButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        removeButton.title = "Xóa thể loại " + document.getElementById("currentMVG").value + " của phim";
        var removeIcon = document.createElement("span");
        removeIcon.className = "material-icons";
        removeIcon.textContent = "delete";
        removeIcon.style.color = "#EF4444";
        removeButton.appendChild(removeIcon);
        removeButton.onclick = function () {
            var apiUrl = `/api/admin/genre-movie/${mv[3]}/as/${accId}`;

            fetch(apiUrl, {
                method: "DELETE",
                headers: headers
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    if (data.success === true) {
                        for (var i = 0; i < moviegenreArray.length; i++) {
                            if (moviegenreArray[i][3] === mv[3]) {
                                moviegenreArray.splice(i, 1);
                                break;
                            }
                        }
                        document.getElementById("numMVOfthisGenre").textContent = parseInt(document.getElementById("numMVOfthisGenre").textContent) - 1;
                        if ($.fn.DataTable.isDataTable('#movie-genre-table')) {
                            $('#movie-genre-table').DataTable().destroy();
                        }
                        getMovieOfGenreList();
                        Swal.fire(
                            'Đã xóa!',
                            'Xóa thành công!',
                            'success'
                        );
                    }
                    else Swal.fire(
                        'Không thể xóa!',
                        data.message,
                        'error'
                    );
                })
                .catch(function (error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'An error occurred: ' + error,
                        html: 'Please try again later',
                    });
                });
        }
        actionCell.appendChild(removeButton);
    });

    $('#movie-genre-table').DataTable({
        responsive: false,
        language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"
        },
        lengthMenu: [5, 10, 15, 20],
    })
        .columns.adjust();
}

function inputSearchGenre() {
    const searchInput = document.getElementById('searchGenre');
    const mvgList = document.getElementById('mvgList');
    const mvgItems = mvgList.getElementsByClassName('mvgItem');
    searchInput.addEventListener('input', function () {
        const searchText = searchInput.value.toLowerCase();

        for (let i = 0; i < mvgItems.length; i++) {
            const item = mvgItems[i];
            const itemText = item.textContent.toLowerCase();

            if (itemText.includes(searchText) || searchText.includes(itemText)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        }
    });
}