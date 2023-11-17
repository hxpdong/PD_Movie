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

var chaptertable = document.getElementById("tbd-chaptertable");
var chapterArray = [];

var movieErrorTable = document.getElementById("tbd-movieErrTable");
var movieErrorArray = [];

var commentReportTable = document.getElementById("tbd-ReportCommentTable");
var commentReportArray = [];
var cntNumClickError = 0;
var cntNumClickReport = 0;
var totalOfReport = 0;
var reportOfErr = 0;
var reportOfComment = 0;

var statisticmovietable = document.getElementById("tbd-statisticmovietable");
var statisticMovieArray = [];
var cntNumClickStatisticMovie = 0;
document.addEventListener("DOMContentLoaded", function () {
    function hoanThanhCongViec() {
        Swal.close();
    }
    getAllMovieError();
    getAllReport();

    Swal.fire({
        title: 'Retrieving data...',
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
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {


                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("dashboardpage");
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
        inputSearchGenreOfMovie();
    }

    else if (isPageReport) {
        function simulateCongViecTieuHaoThoiGian(callback) {
            setTimeout(() => {

                callback();
            }, timeout);
        }
        simulateCongViecTieuHaoThoiGian(hoanThanhCongViec);
        console.log("reportpage");
        deleteReportError();
        deleteReportComment();
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
                        getUserList();
                    }
                } else if (response.status === 404 || response.status === 500) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: response.data.message
                    });
                }
            })
            .catch(function (error) {
                console.error('Error while sending request:', error);
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
                        getAdminList();
                    }
                } else if (response.status === 404 || response.status === 500) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: response.data.message
                    });
                }
            })
            .catch(function (error) {
                console.error('Error while sending request:', error);
            });
    }
}

function showAccTable(num) {
    divHiddenElements = document.getElementsByClassName("divHidden");
    Array.from(divHiddenElements).forEach(function (element) {
        element.hidden = true;
    });
    document.getElementById("btnDivHidden").hidden = true;
    switch (num) {
        case 1:
            if (cntNumClickAdmin == 0) {
                addDataToAdminArray();
            }
            if (document.getElementById("amtb")) {
                document.getElementById("amtb").hidden = false;
                document.getElementById("btnDivHidden").hidden = false;
            }
            cntNumClickAdmin++;
            break;

        case 2:
            if (cntNumClickUser == 0) {
                addDataToUserArray();
            }
            if (document.getElementById("ustb")) {
                document.getElementById("ustb").hidden = false;
                document.getElementById("btnDivHidden").hidden = false;
            }
            cntNumClickUser++;
            break;

        case 3:
            if (cntNumClickStatisticMovie == 0) {
                addDataToStatisticMovieArray();
            }
            if (document.getElementById("statistic-movie")) {
                document.getElementById("statistic-movie").hidden = false;
            }
            document.getElementById("btnDivHidden").hidden = false;
            cntNumClickStatisticMovie++;
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
            stateCell.textContent = 'Locked';
            stateCell.classList.add('text-red-500');
        } else {
            stateCell.textContent = 'Active';
            stateCell.classList.add('text-green-500');
        }
        stateCell.classList.add("text-center");
        var actionCell = newRow.insertCell(5);
        actionCell.classList.add("text-center");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        updateButton.title = "Update admin";
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
                title: "Update administrator information",
                html: `
                                        <form id="updateForm">
                                        <label for="fullName">Full name</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${oldFullname}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        <label for="phone">Phone</label>
                                        <input type="text" id="phone" name="phone" class="swal2-input" required value="${us[6]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
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
                            title: "Successfully updated!",
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
                            title: "Error!",
                            text: "Error: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(updateButton);

        var changePasswordButton = document.createElement("button");
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        changePasswordButton.title = "Change password";
        var changePasswordIcon = document.createElement("span");
        changePasswordIcon.className = "material-icons";
        changePasswordIcon.textContent = "password";
        changePasswordIcon.style.color = "#ffc800";
        changePasswordButton.appendChild(changePasswordIcon);
        changePasswordButton.onclick = function () {
            var uptnewpassword;
            Swal.fire({
                title: "Update administrator password",
                html: `
                                        <form id="updatePasswordForm">
                                        <label for="uptnewpassword-am">New password</label>
                                        <input type="text" id="uptnewpassword-am" name="uptnewpassword-am" class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const newpass = document.getElementById("uptnewpassword-am")
                        .value;
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
                            title: "Updated password successfully!",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error!",
                            text: "Error: " + response.message
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
            deleteButton.title = "Unlock account";
            deleteIcon.textContent = "lock_open";
            deleteIcon.classList.add('text-green-500');
        } else {
            deleteButton.title = "Lock account";
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
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
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
            stateCell.textContent = 'Locked';
            stateCell.classList.add('text-red-500');
        } else {
            stateCell.textContent = 'Active';
            stateCell.classList.add('text-green-500');
        }
        stateCell.classList.add("text-center");
        var actionCell = newRow.insertCell(4);
        actionCell.classList.add("text-center");
        var updateButton = document.createElement("button");
        updateButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        updateButton.title = "Update user";
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
                title: "Update user information",
                html: `
                                        <form id="updateUserForm">
                                        <label for="fullName">Full name</label>
                                        <input type="text" id="fullname" name="fullname" class="swal2-input" required value="${oldFullname}">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="swal2-input" required value="${us[5]}">
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
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
                            title: "User information updated successfully!",
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
                            title: "Error!",
                            text: "Error: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(updateButton);

        var changePasswordButton = document.createElement("button");
        changePasswordButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        changePasswordButton.title = "Change password";
        var changePasswordIcon = document.createElement("span");
        changePasswordIcon.className = "material-icons";
        changePasswordIcon.textContent = "password";
        changePasswordIcon.style.color = "#ffc800";
        changePasswordButton.appendChild(changePasswordIcon);
        changePasswordButton.onclick = function () {
            var uptnewpassword;
            Swal.fire({
                title: "Update user password",
                html: `
                                        <form id="updatePasswordForm">
                                        <label for="uptnewpassword-us">New password</label>
                                        <input type="text" id="uptnewpassword-us" name="uptnewpassword-us" class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const newpass = document.getElementById("uptnewpassword-us").value;
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
                            title: "Updated password successfully!",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error!",
                            text: "Error: " + response.message
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
            deleteButton.title = "Unlock account";
            deleteIcon.textContent = "lock_open";
            deleteIcon.classList.add('text-green-500');
        } else {
            deleteButton.title = "Lock account";
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
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
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
            title: "Add admin account",
            html: `
                <form id="addNewAdminForm">
                    <label for="fullName">Full name</label>
                    <input type="text" id="fullname" name="fullname" class="swal2-input">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="swal2-input">
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" class="swal2-input">
                    <label for="usname">Username</label>
                    <input type="text" id="usname" name="usname" class="swal2-input">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" class="swal2-input">
                </form>
                                `,
            showCancelButton: true,
            confirmButtonText: "Add",
            cancelButtonText: "Cancel",
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
                        title: "Error!",
                        text: "Error: " + response.message
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
        infoButton.title = "Movie detail";
        var infoIcon = document.createElement("span");
        infoIcon.className = "material-icons";
        infoIcon.textContent = "info";
        infoIcon.style.color = "#1355c9";
        infoButton.appendChild(infoIcon);
        infoButton.onclick = function () {
            document.getElementById("infoDiv").removeAttribute("hidden");
            document.getElementById("loadChapter").removeAttribute("hidden");
            document.getElementById("loadInfo").setAttribute("hidden", "true");
            document.getElementById("chapterDiv").setAttribute("hidden", "true");
            getGenreForUptMovie(mv[0]);
            document.getElementById('input-group-search-genre').value = "";
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
            else errIMG.textContent = "The movie doesn't have a poster or it's defective";
            AddDataToChapterArray(mv[0]);
        };
        mvActionCell.appendChild(infoButton);

        var removeButton = document.createElement("button");
        removeButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        removeButton.title = "Delete movie";
        var removeIcon = document.createElement("span");
        removeIcon.className = "material-icons";
        removeIcon.textContent = "delete";
        removeIcon.style.color = "#ff0000";
        removeButton.appendChild(removeIcon);
        removeButton.onclick = function () {
            Swal.fire({
                icon: 'warning',
                title: 'Are you sure you want to delete the movie ' + mv[0] + " - " + mv[2] + "?",
                html: 'When you agree <span class="text-red-500 font-bold">DELETE</span>, all information related to the movie (comments, ratings,...) will be deleted and <span class="text-red-500 font-bold">cannot</span> restore',
                showCancelButton: true,
                confirmButtonText: 'DELETE',
                confirmButtonColor: 'red',
                cancelButtonText: 'Rethink'
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
                                    'Deleted!',
                                    'Movie deletion successful!',
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
                                    title: 'Unable to perform operation',
                                    html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                                    confirmButtonText: 'Re-Login',
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
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
        },
        "order": [[0, 'desc']],
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
                title: 'Executing...',
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
                            title: 'Add movie successfully',
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
                            title: 'Cannot add movie',
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
                    imgnotfound.textContent = 'For themoviedb, enter the movie id in themoviedb.';
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
                    imgnotfound.textContent = 'For themoviedb, enter the movie id in themoviedb.';
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
                    imgnotfoundDt.textContent = 'For themoviedb, enter the movie id in themoviedb.';
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
                    imgnotfoundDt.textContent = 'For themoviedb, enter the movie id in themoviedb.';
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
                title: 'Executing...',
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
                            title: 'Update successful',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Unable to update movie',
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
        editBtn.title = "Edit";
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
                title: "Update genre information",
                html: `
                                        <form id="modalUpdateGenreForm">
                                        <label for="uptGenreId"><b>Genre:</b></label>
                                        <input type="text" id="uptGenreId" name="uptGenreId" value='${mvg[0]}' class="swal2-input" required disabled>
                                        <label for="uptGenreEn">English</label>
                                        <input type="text" id="uptGenreEn" name="uptGenreEn" value='${mvg[2]}' class="swal2-input" required>
                                        <label for="uptGenreVi">Vietnamese</label>
                                        <input type="text" id="uptGenreVi" name="uptGenreVi" value='${mvg[1]}' class="swal2-input" required>
                                        </form>
                                    `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
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

                        updatedGenre = updatedGenre[0];

                        var mvgItem = [
                            updatedGenre.mvgenre_id,
                            updatedGenre.mvgenre_vi_name,
                            updatedGenre.mvgenre_en_name
                        ];

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
                            title: "Category update successful",
                            confirmButtonText: "OK",
                        }).then((result) => {
                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error!",
                            text: "Error: " + response.message
                        });
                    }
                }
            });
        }
        const rmvBtn = document.createElement("button");
        rmvBtn.title = "Delete";
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
                title: 'Are you sure you want to delete genre' + mvg[0] + " - " + mvg[2] + "/" + mvg[1] + "?",
                html: 'When you agree <span class="text-red-500 font-bold">DELETE</span>, This genre of film will also be deleted and <span class="text-red-500 font-bold">cannot</span> restore',
                showCancelButton: true,
                confirmButtonText: 'Delete',
                confirmButtonColor: 'red',
                cancelButtonText: 'Rethink'
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
                                    'Deleted!',
                                    'Category deletion successful!',
                                    'success'
                                );
                            }
                            else Swal.fire(
                                'Can not delete!',
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
                title: 'Executing...',
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
                            title: 'Add genre successfully',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                //ocation.reload();
                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Unable to add genre',
                            text: response.data.error
                        });
                    }
                });
        }
    });
}

function AddDataToMovieGenreArray(mvgid) {
    if (moviegenretable) {
        moviegenreArray.splice(0, moviegenreArray.length);
        axios.get('/api/admin/movie-of-genres/' + mvgid + "/as/" + accId, {
            headers: headers
        })
            .then(function (response) {
                if (response.status === 200) {
                    if (response.data.success === true) {
                        var mvl = response.data.results.movies;
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
                        title: 'Error!',
                        text: response.data.message
                    });
                }
            })
            .catch(function (error) {
                console.error('Error while sending request:', error);
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
                            'Deleted!',
                            'Delete successfully!',
                            'success'
                        );
                    }
                    else Swal.fire(
                        'Can not delete!',
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
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
        },
        "order": [[0, 'desc']],
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

function getGenreForUptMovie(mvid) {
    var list = document.getElementById("DivItemsSearchGenre");
    while (list.firstChild) {
        list.removeChild(list.firstChild);
    }
    axios.get('/api/get-genres-of-movie/' + mvid)
        .then(function (response) {
            var mvgenres = response.data.genres;
            document.getElementById("totalGenre").value = response.data.total;
            mvgenres.forEach(function (mvg) {
                if (mvg.mvgenre_id != "1") {
                    var listItem = document.createElement("li");
                    var div = document.createElement("div");
                    div.className = "ItemSearchGenre flex items-center p-2 rounded hover:bg-gray-100 dark:hover:bg-gray-600";
                    var checkbox = document.createElement("input");
                    checkbox.id = "uptgenre-" + mvg.mvgenre_id;
                    checkbox.type = "checkbox";
                    checkbox.value = mvg.mvgenre_id;
                    checkbox.name = "uptgenre-" + mvg.mvgenre_id;
                    checkbox.className = "w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500";

                    var label = document.createElement("label");
                    label.setAttribute("for", "checkbox-item-12");
                    label.className = "w-full ml-2 text-sm font-medium text-gray-900 rounded dark:text-gray-300";
                    label.textContent = mvg.mvgenre_vi_name + "/" + mvg.mvgenre_en_name;

                    if (mvg.movgen_id) {
                        checkbox.checked = true;
                    }
                    div.appendChild(checkbox);
                    div.appendChild(label);

                    listItem.appendChild(div);

                    list.appendChild(listItem);
                }
            });
        });
}

function inputSearchGenreOfMovie() {
    var list = document.getElementById("DivItemsSearchGenre");
    const searchInput = document.getElementById('input-group-search-genre');
    const mvgItems = list.getElementsByClassName('ItemSearchGenre');
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

function AddDataToChapterArray(mvid) {
    if (chaptertable) {
        chapterArray.splice(0, chapterArray.length);
        axios.get('/api/admin/movies/chapters/' + mvid + "/as/" + accId, {
            headers: headers
        })
            .then(function (response) {
                if (response.status === 200) {
                    if (response.data.success === true) {
                        var chapterlist = response.data.chapters;
                        chapterlist.forEach(function (ct) {
                            var ctItem = [
                                ct.chapter_id,
                                ct.movie_id,
                                ct.chapter_name,
                                ct.chapterURL
                            ];
                            chapterArray.push(ctItem);
                        });
                    }
                    if ($.fn.DataTable.isDataTable('#chaptertable')) {
                        $('#chaptertable').DataTable().destroy();
                    }
                    getChapterOfMovieList();
                    document.getElementById("numChapterOfMovie").textContent = response.data.totals;
                }
            });
    }
    else console.log('not found');
}

function getChapterOfMovieList() {
    while (chaptertable.firstChild) {
        chaptertable.removeChild(chaptertable.firstChild);
    }
    chapterArray.forEach(function (ct) {
        var newRow = chaptertable.insertRow();
        var idCell = newRow.insertCell(0);
        idCell.classList.add("text-center");
        idCell.textContent = ct[0];
        var nameCell = newRow.insertCell(1);
        nameCell.classList.add("text-center");
        nameCell.textContent = ct[2];
        var urlCell = newRow.insertCell(2);
        urlCell.classList.add("text-center");
        urlCell.textContent = ct[3];
        var actionCell = newRow.insertCell(3);
        actionCell.classList.add("text-center");
        var uptButton = document.createElement("button");
        uptButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        uptButton.title = "Update episode " + ct[0];
        uptButton.type = "button";
        var uptIcon = document.createElement("span");
        uptIcon.className = "material-icons";
        uptIcon.textContent = "edit";
        uptButton.style.color = "#1355c9";
        uptButton.appendChild(uptIcon);
        uptButton.onclick = function () {
            var newname;
            var newurl;
            Swal.fire({
                title: "Update chapter information - ID: " + ct[0],
                html: `
                    <form id="updateChapterForm">
                    <label for="uptchaptername">Name</label>
                    <input type="text" id="uptchaptername" name="uptchaptername" class="swal2-input" required value="${ct[2]}">
                    <label for="uptURL">Source</label>
                    <input type="text" id="uptURL" name="uptURL" class="swal2-input" required value="${ct[3]}">
                    <button type="button" onclick="uptCheckURL()" class="bg-[#66ccff] text-white p-2 rounded-lg";">Check chapter</button>
                    </form>
                    <iframe class="w-auto" id="iframeuptURL"
                    src="" frameborder="0" allowfullscreen></iframe>
                `,
                showCancelButton: true,
                confirmButtonText: "Update",
                cancelButtonText: "Cancel",
                showLoaderOnConfirm: true,
                preConfirm: () => {
                    const uptchaptername = document.getElementById("uptchaptername")
                        .value;
                    const uptURL = document.getElementById("uptURL")
                        .value;
                    newname = uptchaptername;
                    newurl = uptURL;
                    return fetch("/api/admin/chapters/" + ct[0] + "/as/" + accId, {
                        method: "PUT",
                        headers: {
                            Authorization: apiToken,
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: new URLSearchParams({
                            uptchaptername,
                            uptURL
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
                            title: response.message,
                            confirmButtonText: "OK",
                        }).then((result) => {
                            var uptItem = response.chapter;
                            uptItem = uptItem[0];

                            var ctItem = [
                                uptItem.chapter_id,
                                uptItem.movie_id,
                                uptItem.chapter_name,
                                uptItem.chapterURL
                            ];

                            for (var i = 0; i < chapterArray.length; i++) {
                                if (chapterArray[i][0] === ctItem[0]) {
                                    chapterArray[i][1] = ctItem[1];
                                    chapterArray[i][2] = ctItem[2];
                                    chapterArray[i][3] = ctItem[3];
                                    break;
                                }
                            }
                            if ($.fn.DataTable.isDataTable('#chaptertable')) {
                                $('#chaptertable').DataTable().destroy();
                            }
                            getChapterOfMovieList();

                            if (result.isConfirmed) {

                            }
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error!",
                            text: "Error: " + response.message
                        });
                    }
                }
            });
        }
        actionCell.appendChild(uptButton);
        var removeButton = document.createElement("button");
        removeButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
        removeButton.title = "Delete episode" + ct[0];
        removeButton.type = "button";
        var removeIcon = document.createElement("span");
        removeIcon.className = "material-icons";
        removeIcon.textContent = "delete";
        removeIcon.style.color = "#EF4444";
        removeButton.appendChild(removeIcon);
        removeButton.onclick = function () {
            Swal.fire({
                icon: 'warning',
                title: 'Are you sure you want to delete the chapter' + ct[0] + "?",
                html: 'When agree <span class="text-red-500 font-bold">DELETE</span>, the chapter will be deleted and <span class="text-red-500 font-bold">cannot</span> restore',
                showCancelButton: true,
                confirmButtonText: 'Delete',
                confirmButtonColor: 'red',
                cancelButtonText: 'Rethink'
            }).then((result) => {
                if (result.isConfirmed) {
                    var apiUrl = `/api/admin/chapters/${ct[0]}/as/${accId}`;

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
                                    'Deleted!',
                                    'Chapter deleted successfully!',
                                    'success'
                                );
                                for (var i = 0; i < chapterArray.length; i++) {
                                    if (chapterArray[i][0] === ct[0]) {
                                        chapterArray.splice(i, 1);
                                        break;
                                    }
                                }
                                if ($.fn.DataTable.isDataTable('#chaptertable')) {
                                    $('#chaptertable').DataTable().destroy();
                                }
                                getChapterOfMovieList();
                                document.getElementById("numChapterOfMovie").textContent = parseInt(document.getElementById("numChapterOfMovie").textContent) - 1;
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Unable to perform operation',
                                    html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                                    confirmButtonText: 'Re-Login',
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
        actionCell.appendChild(removeButton);
    });

    $('#chaptertable').DataTable({
        responsive: false,
        language: {
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
        },
        "order": [[0, 'desc']],
        lengthMenu: [5, 10, 15, 20],
    })
        .columns.adjust();
}

function changeInfoDivState() {
    const infodiv = document.getElementById("infoDiv");
    infodiv.hidden = !infodiv.hidden;
    const loadinfo = document.getElementById("loadInfo");
    loadinfo.hidden = !infodiv.hidden;
}

function changeChapterDivState() {
    const chapterdiv = document.getElementById("chapterDiv");
    chapterdiv.hidden = !chapterdiv.hidden;
    const loadchapter = document.getElementById("loadChapter");
    loadchapter.hidden = !chapterdiv.hidden;
}

function uptCheckURL() {
    var iframe = document.getElementById("iframeuptURL");
    var valueURL = document.getElementById("uptURL").value;
    iframe.src = valueURL;
}

function addCheckURL() {
    var iframe = document.getElementById("iframeaddURL");
    var valueURL = document.getElementById("chapterurl").value;
    iframe.src = valueURL;
}

function addNewChapter() {
    var mvid = document.getElementById("dtmvid").value;
    Swal.fire({
        title: "Add new chapter",
        html: `
            <form id="addNewChapterForm">
                <label for="mvid">Movie</label>
                <input type="text" id="mvid" name="mvid" class="swal2-input" value="${mvid}" required disabled>
                <label for="chaptername">Name</label>
                <input type="text" id="chaptername" name="chaptername" class="swal2-input" required>
                <label for="chapterurl">Source</label>
                <input type="text" id="chapterurl" name="chapterurl" class="swal2-input" required>
                <button type="button" onclick="addCheckURL()" class="bg-[#66ccff] text-white p-2 rounded-lg";">Check chapter</button>
            </form>
            <iframe class="w-auto" id="iframeaddURL"
            src="" frameborder="0" allowfullscreen></iframe>
                            `,
        showCancelButton: true,
        confirmButtonText: "Add",
        cancelButtonText: "Cancel",
        showLoaderOnConfirm: true,
        preConfirm: () => {
            const mvid = document.getElementById("mvid").value;
            const chaptername = document.getElementById("chaptername").value;
            const chapterurl = document.getElementById("chapterurl").value;

            return fetch("/api/admin/chapters/as/" + accId, {
                method: "POST",
                headers: {
                    Authorization: apiToken,
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: new URLSearchParams({
                    mvid,
                    chaptername,
                    chapterurl,
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
                var rpItem = response.chapter;
                rpItem = rpItem[0];
                var ctItem = [
                    rpItem.chapter_id,
                    rpItem.movie_id,
                    rpItem.chapter_name,
                    rpItem.chapterURL
                ];
                chapterArray.push(ctItem);
                console.log(chapterArray);
                if ($.fn.DataTable.isDataTable('#chaptertable')) {
                    $('#chaptertable').DataTable().destroy();
                }
                getChapterOfMovieList();
                document.getElementById("numChapterOfMovie").textContent = parseInt(document.getElementById("numChapterOfMovie").textContent) + 1;

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
                    title: "Error!",
                    text: "Error: " + response.message
                });
            }
        }
    });
}

function getAllMovieError() {
    movieErrorArray.splice(0, movieErrorArray.length);
    axios.get("/api/admin/report/movie/as/" + accId, {
        headers: headers
    })
        .then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    var errlist = response.data.errorList;
                    errlist.forEach(function (err) {
                        var errItem = [
                            err.err_id,
                            err.movie_id,
                            err.errContent,
                            err.isSolved,
                            err.createAt,
                            err.updateAt
                        ];
                        movieErrorArray.push(errItem);
                    });
                }
                if (document.getElementById("#movieErrTable")) {
                    if ($.fn.DataTable.isDataTable('#movieErrTable')) {
                        $('#movieErrTable').DataTable().destroy();
                    }
                }
                getMovieErrorList();
                reportOfErr = response.data.unsolvedCount;
                totalOfReport = totalOfReport + reportOfErr;
                checkErrorTotalInSidebar(totalOfReport);
                if (reportOfErr > 0) {
                    if (document.getElementById("rp-movieErrNoti"))
                        document.getElementById("rp-movieErrNoti").hidden = false;
                }
                else {
                    if (document.getElementById("rp-movieErrNoti"))
                        document.getElementById("rp-movieErrNoti").hidden = true;
                }
            }
        });
}

function getMovieErrorList() {
    if (movieErrorTable) {
        while (movieErrorTable.firstChild) {
            movieErrorTable.removeChild(movieErrorTable.firstChild);
        }
        movieErrorArray.forEach(function (mverr) {
            var newRow = movieErrorTable.insertRow();
            var idCell = newRow.insertCell(0);
            idCell.classList.add("text-center");
            idCell.textContent = mverr[0];
            var mvCell = newRow.insertCell(1);
            mvCell.classList.add("text-center");
            mvCell.textContent = mverr[1];
            var contentCell = newRow.insertCell(2);
            contentCell.classList.add("text-center");
            contentCell.textContent = mverr[2];
            var stateCell = newRow.insertCell(3);
            stateCell.classList.add("text-center", "font-bold");
            var createCell = newRow.insertCell(4);
            createCell.classList.add("text-center");
            createCell.textContent = mverr[4];
            var updateCell = newRow.insertCell(5);
            updateCell.classList.add("text-center");
            updateCell.textContent = mverr[5];
            var actionCell = newRow.insertCell(6);
            actionCell.classList.add("text-center");
            var checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.title = "Solved";
            var checkButton = document.createElement("button");
            checkButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
            checkButton.title = "Solved";
            checkButton.appendChild(checkbox);
            checkbox.onclick = function () {
                Swal.fire({
                    icon: 'question',
                    title: "Error resolved confirmation - code " + mverr[0],
                    html: 'Resolved this error? After confirmation it will not be possible restore',
                    confirmButtonText: 'Confirm',
                    confirmButtonColor: 'green',
                    showCancelButton: true,
                    cancelButtonText: 'Rethink',
                    cancelButtonColor: 'grey'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var apiUrl = `/api/admin/report/movie/${mverr[0]}/as/${accId}`;

                        fetch(apiUrl, {
                            method: "PUT",
                            headers: headers
                        })
                            .then(function (response) {
                                return response.json();
                            })
                            .then(function (data) {
                                if (data.success === true) {
                                    var uptItem = data.updatedItem;
                                    uptItem = uptItem[0];
                                    var errItem = [
                                        uptItem.err_id,
                                        uptItem.movie_id,
                                        uptItem.errContent,
                                        uptItem.isSolved,
                                        uptItem.createAt,
                                        uptItem.updateAt
                                    ];
                                    for (var i = 0; i < movieErrorArray.length; i++) {
                                        if (movieErrorArray[i][0] === errItem[0]) {
                                            movieErrorArray[i][3] = errItem[3];
                                            movieErrorArray[i][5] = errItem[5];
                                            break; // Sau khi xóa, bạn có thể thoát khỏi vòng lặp
                                        }
                                    }
                                    if ($.fn.DataTable.isDataTable('#movieErrTable')) {
                                        $('#movieErrTable').DataTable().destroy();
                                    }
                                    getMovieErrorList();

                                    if (document.getElementById("rp-movieErrNoti"))
                                        document.getElementById("rp-movieErrNoti").hidden = true;
                                    reportOfErr = 0;
                                    for (var i = 0; i < movieErrorArray.length; i++) {
                                        if (movieErrorArray[i][3] === 0) {
                                            reportOfErr++;
                                            if (document.getElementById("rp-movieErrNoti"))
                                                document.getElementById("rp-movieErrNoti").hidden = false;
                                            break;
                                        }
                                    };
                                    totalOfReport = reportOfErr + reportOfComment;
                                    checkErrorTotalInSidebar(totalOfReport);
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
                    else if (result.dismiss === Swal.DismissReason.cancel) {
                        checkbox.checked = false;
                    }
                });
            }
            if (mverr[3] == 1) {
                checkbox.checked = true;
                checkbox.disabled = true;
                stateCell.textContent = 'Solved';
                stateCell.classList.add("text-green-500");
            } else {
                stateCell.textContent = 'Not resolved';
                stateCell.classList.add("text-red-500");
            }
            actionCell.appendChild(checkButton);
        });

        $('#movieErrTable').DataTable({
            responsive: false,
            language: {
                /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
            },
            "order": [[3, 'asc']],
            lengthMenu: [5, 10, 15, 20],
        })
            .columns.adjust();
    }
}

function getAllReport() {
    commentReportArray.splice(0, commentReportArray.length);
    axios.get("/api/admin/report/comment/as/" + accId, {
        headers: headers
    })
        .then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    var rplist = response.data.reportList;
                    rplist.forEach(function (rp) {
                        var rpItem = [
                            rp.report_id,
                            rp.comment_id,
                            rp.comment,
                            rp.isSolved,
                            rp.createAt,
                            rp.updateAt
                        ];
                        commentReportArray.push(rpItem);
                    });
                }
                if (document.getElementById("#ReportCommentTable")) {
                    if ($.fn.DataTable.isDataTable('#ReportCommentTable')) {
                        $('#ReportCommentTable').DataTable().destroy();
                    }
                }
                getCommentReportList();
                reportOfComment = response.data.unsolvedCount;
                totalOfReport = totalOfReport + reportOfComment;
                checkErrorTotalInSidebar(totalOfReport);
                if (reportOfComment > 0) {
                    if (document.getElementById("rp-commentNoti"))
                        document.getElementById("rp-commentNoti").hidden = false;
                }
                else {
                    if (document.getElementById("rp-commentNoti"))
                        document.getElementById("rp-commentNoti").hidden = true;
                }
            }
        });
}

function getCommentReportList() {
    if (commentReportTable) {
        while (commentReportTable.firstChild) {
            commentReportTable.removeChild(commentReportTable.firstChild);
        }
        commentReportArray.forEach(function (cmtrp) {
            var newRow = commentReportTable.insertRow();
            var idCell = newRow.insertCell(0);
            idCell.classList.add("text-center");
            idCell.textContent = cmtrp[0];
            var cmtidCell = newRow.insertCell(1);
            cmtidCell.classList.add("text-center");
            cmtidCell.textContent = cmtrp[1];
            var cmtCell = newRow.insertCell(2);
            cmtCell.classList.add("text-center");
            cmtCell.textContent = cmtrp[2];
            var stateCell = newRow.insertCell(3);
            stateCell.classList.add("text-center", "font-bold");
            var createCell = newRow.insertCell(4);
            createCell.classList.add("text-center");
            createCell.textContent = cmtrp[4];
            var updateCell = newRow.insertCell(5);
            updateCell.classList.add("text-center");
            updateCell.textContent = cmtrp[5];
            var actionCell = newRow.insertCell(6);
            actionCell.classList.add("text-center", "flex", "justify-center");
            var checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.title = "Solved";
            checkbox.onclick = function () {
                Swal.fire({
                    icon: 'question',
                    title: "Report resolved confirmation - code" + cmtrp[0],
                    html: 'Resolved this report? After confirmation it will not be possible restore',
                    confirmButtonText: 'Confirm',
                    confirmButtonColor: 'green',
                    showCancelButton: true,
                    cancelButtonText: 'Rethink',
                    cancelButtonColor: 'grey'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var apiUrl = `/api/admin/report/comment/${cmtrp[0]}/as/${accId}`;

                        fetch(apiUrl, {
                            method: "PUT",
                            headers: headers
                        })
                            .then(function (response) {
                                return response.json();
                            })
                            .then(function (data) {
                                if (data.success === true) {
                                    var uptItem = data.updatedItem;
                                    uptItem = uptItem[0];
                                    var errItem = [
                                        uptItem.report_id,
                                        uptItem.comment_id,
                                        uptItem.comment,
                                        uptItem.isSolved,
                                        uptItem.createAt,
                                        uptItem.updateAt
                                    ];
                                    for (var i = 0; i < commentReportArray.length; i++) {
                                        if (commentReportArray[i][0] === errItem[0]) {
                                            commentReportArray[i][3] = errItem[3];
                                            commentReportArray[i][5] = errItem[5];
                                            break; // Sau khi xóa, bạn có thể thoát khỏi vòng lặp
                                        }
                                    }
                                    if ($.fn.DataTable.isDataTable('#ReportCommentTable')) {
                                        $('#ReportCommentTable').DataTable().destroy();
                                    }
                                    getCommentReportList();


                                    if (document.getElementById("rp-commentNoti"))
                                        document.getElementById("rp-commentNoti").hidden = true;
                                    reportOfComment = 0;
                                    for (var i = 0; i < commentReportArray.length; i++) {
                                        if (commentReportArray[i][3] === 0) {
                                            reportOfComment++;
                                            if (document.getElementById("rp-commentNoti"))
                                                document.getElementById("rp-commentNoti").hidden = false;
                                            break;
                                        }
                                    };
                                    totalOfReport = reportOfErr + reportOfComment;
                                    checkErrorTotalInSidebar(totalOfReport);
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Cannot delete',
                                        html: 'Because this comment does not exist or has been deleted',
                                    });
                                    checkbox.checked = true;
                                    checkbox.disabled = true;
                                    removeButton.disabled = true;
                                    removeIcon.style.color = "#DDDDDD";
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
                    else if (result.dismiss === Swal.DismissReason.cancel) {
                        checkbox.checked = false;
                    }
                });
            }

            var checkButton = document.createElement("button");
            checkButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
            checkButton.title = "Has reviewed";
            checkButton.appendChild(checkbox);

            var removeButton = document.createElement("button");
            removeButton.classList.add("border-2", "p-2", "rounded-lg", "bg-white", "m-1");
            removeButton.title = "Delete comment";
            var removeIcon = document.createElement("span");
            removeIcon.className = "material-icons";
            removeIcon.textContent = "delete";
            removeIcon.style.color = "#EF4444";
            removeButton.appendChild(removeIcon);
            removeButton.onclick = function () {
                Swal.fire({
                    icon: 'question',
                    title: "Confirm deletion of comment" + cmtrp[1],
                    html: 'Delete comment because it violates?',
                    confirmButtonText: 'Confirm',
                    confirmButtonColor: 'green',
                    showCancelButton: true,
                    cancelButtonText: 'Rethink',
                    cancelButtonColor: 'grey'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var apiUrl = `/api/admin/comment/${cmtrp[1]}/as/${accId}`;

                        fetch(apiUrl, {
                            method: "DELETE",
                            headers: headers
                        })
                            .then(function (response) {
                                return response.json();
                            })
                            .then(function (data) {
                                if (data.success === true) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Deleted successfully',
                                    });
                                    removeButton.disabled = true;
                                    removeIcon.style.color = "#DDDDDD";
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Cannot delete',
                                        html: 'Because this comment does not exist or has been deleted',
                                    });
                                    checkbox.checked = true;
                                    checkbox.disabled = true;
                                    removeButton.disabled = true;
                                    removeIcon.style.color = "#DDDDDD";
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

            if (cmtrp[3] == 1) {
                checkbox.checked = true;
                checkbox.disabled = true;
                checkButton.disabled = true;
                removeButton.disabled = true;
                removeIcon.style.color = "#DDDDDD";
                stateCell.textContent = 'Solved';
                stateCell.classList.add("text-green-500");
            } else {
                stateCell.textContent = 'Not resolved';
                stateCell.classList.add("text-red-500");
            }

            actionCell.appendChild(removeButton);
            actionCell.appendChild(checkButton);
        });

        $('#ReportCommentTable').DataTable({
            responsive: false,
            language: {
                /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
            },
            "order": [[3, 'asc']],
            lengthMenu: [5, 10, 15, 20],
        })
            .columns.adjust();
    }
}

function showReportTable(num) {
    switch (num) {
        case 1:
            if (cntNumClickError == 0) {
                //getAllMovieError();
            }
            if (document.getElementById("rpcmttb")) {
                document.getElementById("rpcmttb").hidden = true;
            }
            if (document.getElementById("mverrtb")) {
                document.getElementById("mverrtb").hidden = !document.getElementById("mverrtb").hidden;
            }
            cntNumClickError++;
            break;

        case 2:
            if (cntNumClickReport == 0) {
                //getAllReport();
            }
            if (document.getElementById("mverrtb")) {
                document.getElementById("mverrtb").hidden = true;
            }
            if (document.getElementById("rpcmttb")) {
                document.getElementById("rpcmttb").hidden = !document.getElementById("rpcmttb").hidden;
            }
            cntNumClickReport++;
            break;

        default:
            break;
    }
}

function checkErrorTotalInSidebar(cnt) {
    if (cnt > 0) {
        document.getElementById("sidebar-reportNotify").hidden = false;
    } else {
        document.getElementById("sidebar-reportNotify").hidden = true;
    }
}

function deleteReportError() {
    $('#deleteReportErrorForm').submit(function (e) {
        e.preventDefault();
        var dateFrom = document.getElementById("beforeDateErr").value;
        if (!dateFrom) {
            Swal.fire({
                icon: 'error',
                title: 'The information provided is not enough!',
                text: 'Please select a time and try again.'
            });
        }
        else {
            var apiUrl = `/api/admin/report/movie/as/${accId}`;
            fetch(apiUrl, {
                method: "DELETE",
                headers: headers,
                body: JSON.stringify({ beforeDate: dateFrom })
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    if (data.success === true) {
                        if ($.fn.DataTable.isDataTable('#movieErrTable')) {
                            $('#movieErrTable').DataTable().destroy();
                        }
                        getAllMovieError();
                        Swal.fire({
                            icon: 'success',
                            title: 'Deleted successfully',
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Cannot delete',
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
};

function deleteReportComment() {
    $('#deleteReportCommentForm').submit(function (e) {
        e.preventDefault();
        var dateFrom = document.getElementById("beforeDateCmt").value;
        if (!dateFrom) {
            Swal.fire({
                icon: 'error',
                title: 'The information provided is not enough!',
                text: 'Please select a time and try again.'
            });
        }
        else {
            var apiUrl = `/api/admin/report/comment/as/${accId}`;
            fetch(apiUrl, {
                method: "DELETE",
                headers: headers,
                body: JSON.stringify({ beforeDate: dateFrom })
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    if (data.success === true) {
                        if ($.fn.DataTable.isDataTable('#ReportCommentTable')) {
                            $('#ReportCommentTable').DataTable().destroy();
                        }
                        getAllReport();
                        Swal.fire({
                            icon: 'success',
                            title: 'Deleted successfully',
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Cannot delete',
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
};

function addDataToStatisticMovieArray() {

    axios.get('/api/admin/statistic/movie/as/' + accId, {
        headers: headers
    })
        .then(function (response) {
            if (response.status === 200) {
                if (response.data.success === true) {
                    document.getElementById("total-movie").textContent = response.data.totalMovies;
                    document.getElementById("total-view").textContent = response.data.totalViews;
                    document.getElementById("total-rating").textContent = response.data.totalRatings;

                    var movieList = response.data.movieList;
                    movieList.forEach(function (mv) {
                        var mvItem = [
                            mv.movie_id,
                            mv.title_vi,
                            mv.title_en,
                            mv.view,
                            mv.rating,
                            mv.ratePoint
                        ];
                        statisticMovieArray.push(mvItem);
                    });
                    getStatisticMovieList();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Failure!',
                        text: 'No data found'
                    });
                }
            } else if (response.status === 404 || response.status === 500) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: response.data.message
                });
            }
        })
        .catch(function (error) {
            console.error('Error while sending request:', error);
        });

}

function getStatisticMovieList() {
    statisticMovieArray.forEach(function (mv) {
        var newRow = statisticmovietable.insertRow();
        var mvidCell = newRow.insertCell(0);
        mvidCell.classList.add("text-center");
        mvidCell.textContent = mv[0];
        var mvViCell = newRow.insertCell(1);
        mvViCell.classList.add("text-center");
        mvViCell.textContent = mv[1];
        var mvEnCell = newRow.insertCell(2);
        mvEnCell.classList.add("text-center");
        mvEnCell.textContent = mv[2];
        var viewCell = newRow.insertCell(3);
        viewCell.classList.add("text-center");
        viewCell.textContent = mv[3];
        var ratingCell = newRow.insertCell(4);
        ratingCell.classList.add("text-center");
        ratingCell.textContent = mv[4];
        var detailIcon = document.createElement("span");
        detailIcon.className = "material-icons";
        detailIcon.textContent = "info";
        detailIcon.style.color = "#1355c9";
        newRow.onclick = function () {
            document.getElementById("chartMovie-modal").classList.remove("hidden");
            document.getElementById("dt-chart-name").textContent =mv[0] + "-" + mv[2];
            const overlay = document.querySelector('#overlay');
            overlay.style.display = 'block';
            var options;

            axios.get('/api/admin/statistic/movie/' + mv[0] + '/as/' + accId, {
                headers: headers
            })
                .then(function (response) {
                    if (response.status === 200) {
                        if (response.data.success === true) {
                            var detail = response.data.detail;
                            var r1, r2, r3, r4, r5;
                            r1 = response.data.rate1;
                            r2 = response.data.rate2;
                            r3 = response.data.rate3;
                            r4 = response.data.rate4;
                            r5 = response.data.rate5;
                            detail.forEach(function (dt) {
                                options = {
                                    title: {
                                        fontFamily: "tahoma",
                                        text: "Number of ratings: " + dt.total
                                    },
                                    subtitles: [{
                                        fontFamily: "arial",
                                        text: "Average point: " + mv[5]
                                    }],
                                    animationEnabled: true,
                                    data: [{
                                        type: "pie",
                                        startAngle: 40,
                                        toolTipContent: null,
                                        showInLegend: "true",
                                        legendText: "{label}",
                                        indexLabelFontSize: 16,
                                        indexLabel: "{label}: {x} votes ({y}%)",
                                        dataPoints: [
                                            {x: dt.numRating1, y: r1, label: "1 star"},
                                            {x: dt.numRating2, y: r2, label: "2 stars"},
                                            {x: dt.numRating3, y: r3, label: "3 stars"},
                                            {x: dt.numRating4, y: r4, label: "4 stars"},
                                            {x: dt.numRating5, y: r5, label: "5 stars"},
                                        ]
                                    }]
                                };
                                $("#chartContainer").CanvasJSChart(options);
                            })
                        }
                    }
                });
        }
        //ratingCell.appendChild(detailIcon);
        var pointCell = newRow.insertCell(5);
        pointCell.classList.add("text-center");
        pointCell.textContent = mv[5];
    });
    $('#statisticmovietable').DataTable({
        responsive: false,
        language: {
            /*"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json"*/"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/English.json"
        },
        lengthMenu: [5, 10, 15, 20],
        order: [0, 'desc'],
    })
        .columns.adjust();
}

function closeChartModal() {
    if (document.getElementById("chartMovie-modal")) {
        document.getElementById("chartMovie-modal").classList.add("hidden");
        const overlay = document.querySelector('#overlay');
        overlay.style.display = 'none';
    }
}
