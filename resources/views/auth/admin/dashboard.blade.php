<html>
@include ('component.head-script')

<head>
    <!--Regular Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <!--Responsive Extension Datatables CSS-->
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">
    <style>
    /*Overrides for Tailwind CSS */

    /*Form fields*/
    .dataTables_wrapper select,
    .dataTables_wrapper .dataTables_filter input {
        color: #4a5568;
        /*text-gray-700*/
        padding-left: 1rem;
        /*pl-4*/
        padding-right: 1rem;
        /*pl-4*/
        padding-top: .5rem;
        /*pl-2*/
        padding-bottom: .5rem;
        /*pl-2*/
        line-height: 1.25;
        /*leading-tight*/
        border-width: 2px;
        /*border-2*/
        border-radius: .25rem;
        border-color: #edf2f7;
        /*border-gray-200*/
        background-color: #edf2f7;
        /*bg-gray-200*/
    }

    /*Row Hover*/
    table.dataTable.hover tbody tr:hover,
    table.dataTable.display tbody tr:hover {
        background-color: #ebf4ff;
        /*bg-indigo-100*/
    }

    /*Pagination Buttons*/
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Pagination Buttons - Current selected */
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        color: #fff !important;
        /*text-white*/
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
        /*shadow*/
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        background: #667eea !important;
        /*bg-indigo-500*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Pagination Buttons - Hover */
    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        color: #fff !important;
        /*text-white*/
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
        /*shadow*/
        font-weight: 700;
        /*font-bold*/
        border-radius: .25rem;
        /*rounded*/
        background: #667eea !important;
        /*bg-indigo-500*/
        border: 1px solid transparent;
        /*border border-transparent*/
    }

    /*Add padding to bottom border */
    table.dataTable.no-footer {
        border-bottom: 1px solid #e2e8f0;
        /*border-b-1 border-gray-300*/
        margin-top: 0.75em;
        margin-bottom: 0.75em;
    }

    /*Change colour of responsive icon*/
    table.dataTable.dtr-inline.collapsed>tbody>tr>td:first-child:before,
    table.dataTable.dtr-inline.collapsed>tbody>tr>th:first-child:before {
        background-color: #667eea !important;
        /*bg-indigo-500*/
    }
    </style>
</head>

<body>
    <script>
    var userName = "{{ auth()->user()->name }}";
    console.log("day ne: " + userName);
    </script>
    @if(auth()->check())
    <!-- Trang của bạn.blade.php -->
    @include('auth.admin.navbar')
    <div class="flex w-full bg-gray-200 h-full">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isAd-DashboardPage">
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold">Dashboard</h3>
                <div class="flex flex-wrap justify-center items-center">
                    @if(auth()->user()->acctype_id == 1)
                    <!--Admin tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showAccTable(1)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-3 bg-green-500 flex justify-center items-center h-16 rounded-full">
                                <i class="fa-solid fa-users-gear fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700" id="numOfAdmin">...</h4>
                                <div class="text-gray-500">Quản trị viên</div>
                            </div>
                        </div>
                    </div>
                    <!--end admin tag-->
                    @endif
                    <!--User tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showAccTable(2)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-3 bg-indigo-600 flex justify-center items-center h-16 rounded-full">
                                <i class="fa-solid fa-users fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700" id="numOfUser">...</h4>
                                <div class="text-gray-500">Người dùng</div>
                            </div>
                        </div>
                    </div>
                    <!--end User tag-->
                </div>
                <div id="acctable" class="flex flex-col mx-10">
                    <!--User table-->
                    <div class="bg-white p-4 my-5" id="ustb">
                        <div class="font-bold text-xl pb-4">Người dùng</div>
                        <table id="usertable" class="stripe hover"
                            style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                            <thead>
                                <tr>
                                    <th data-priority="1">Họ tên</th>
                                    <th data-priority="2">Tên tài khoản</th>
                                    <th data-priority="3">Email</th>
                                    <th data-priority="4">Trạng thái</th>
                                    <th data-priority="5">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody id="tbd-usertable">
                            </tbody>
                        </table>
                    </div>
                    <!--end user table-->
                    @if(auth()->user()->acctype_id == 1)
                    <!--admin table-->
                    <div class="bg-white p-4 my-5" id="amtb">
                        <div class="font-bold text-xl pb-4">Quản trị viên</div>
                        <table id="admintable" class="stripe hover"
                            style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                            <thead>
                                <tr>
                                    <th data-priority="1">Họ tên</th>
                                    <th data-priority="2">Tên tài khoản</th>
                                    <th data-priority="3">Email</th>
                                    <th data-priority="4">Số điện thoại</th>
                                    <th data-priority="5">Trạng thái</th>
                                    <th data-priority="6">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody id="tbd-admintable">
                            </tbody>
                        </table>
                    </div>
                    <!--end admin table-->
                    @endif
                </div>
            </div>
        </div>
    </div>
    @endif
    <script src="/js/checkAdminPage.js"></script>
    <!--Datatables -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script>
    var usertable = document.getElementById("tbd-usertable");
    var admintable = document.getElementById("tbd-admintable");
    var usertb = document.getElementById("ustb");
    var admintb = document.getElementById("amtb");
    if (usertable) {
        axios.get('/api/admin/get-users/as/' + accId, {
                headers: headers
            })
            .then(function(response) {
                if (response.status === 200) {
                    if (response.data.success === true) {
                        var usl = response.data.usersList;
                        usl.forEach(function(us) {
                            var newRow = usertable.insertRow();
                            var nameCell = newRow.insertCell(0);
                            nameCell.classList.add("text-center");
                            if (us.fullname)
                                nameCell.textContent = us.fullname;
                            else {
                                nameCell.textContent = "_";
                                nameCell.classList.add("italic");
                            }
                            var usernameCell = newRow.insertCell(1);
                            usernameCell.textContent = us.usname;
                            usernameCell.classList.add("text-center");
                            var emailCell = newRow.insertCell(2);
                            emailCell.textContent = us.email;
                            emailCell.classList.add("text-center");
                            var stateCell = newRow.insertCell(3);
                            if (us.isLocked == 1) {
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
                            updateButton.onclick = function() {
                                
                            }
                            actionCell.appendChild(updateButton);

                            // Tạo nút Đổi mật khẩu
                            var changePasswordButton = document.createElement("button");
                            changePasswordButton.classList.add("border-2", "p-2", "rounded-lg");
                            changePasswordButton.title = "Cập nhật mật khẩu";
                            var changePasswordIcon = document.createElement("span");
                            changePasswordIcon.className = "material-icons";
                            changePasswordIcon.textContent = "password";
                            changePasswordIcon.style.color = "#ffc800";
                            changePasswordButton.appendChild(changePasswordIcon);
                            changePasswordButton.onclick = function() {

                            }
                            actionCell.appendChild(changePasswordButton);

                            // Tạo nút Xóa
                            var deleteButton = document.createElement("button");
                            deleteButton.classList.add("border-2", "p-2", "rounded-lg");
                            var deleteIcon = document.createElement("span");
                            deleteIcon.className = "material-icons";
                            if (us.isLocked == 1) {
                                deleteButton.title = "Mở khóa người dùng";
                                deleteIcon.textContent = "lock_open";
                                deleteIcon.classList.add('text-green-500');
                            } else {
                                deleteButton.title = "Khóa người dùng";
                                deleteIcon.textContent = "lock";
                                deleteIcon.classList.add('text-red-500');
                            }
                            deleteButton.appendChild(deleteIcon);
                            deleteButton.onclick = function() {
                                var url = '/api/admin/lock-user/' + us.user_id + '/as/' + accId;
                                $.ajax({
                                    url: url,
                                    type: 'PUT',
                                    headers: headers,
                                    success: function(response) {
                                        if (response.currentState == 0) {
                                            stateCell.textContent = 'Hoạt động';
                                            stateCell.classList.remove('text-red-500');
                                            stateCell.classList.add('text-green-500');

                                            deleteButton.title = "Khóa người dùng";
                                            deleteIcon.textContent = "lock";
                                            deleteIcon.classList.remove('text-green-500');
                                            deleteIcon.classList.add('text-red-500');
                                        } else if (response.currentState == 1) {
                                            stateCell.textContent = 'Bị khóa';
                                            stateCell.classList.remove('text-green-500');
                                            stateCell.classList.add('text-red-500');

                                            deleteButton.title = "Mở khóa người dùng";
                                            deleteIcon.textContent = "lock_open";
                                            deleteIcon.classList.remove('text-red-500');
                                            deleteIcon.classList.add('text-green-500');
                                        }
                                    },
                                    error: function(error) {
                                        console.log("error: " + error);
                                    }
                                });
                            }
                            actionCell.appendChild(deleteButton);

                        });
                        $('#usertable').DataTable({
                                responsive: true,
                                language: {
                                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json" // URL của tệp ngôn ngữ tiếng Việt
                                },
                                lengthMenu: [5, 10, 15, 20],
                                responsive: {
                                    details: {
                                        display: $.fn.dataTable.Responsive.display.modal({
                                            header: function(row) {
                                                var data = row.data();
                                                return 'Thông tin của ' + data[2];
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
            .catch(function(error) {
                console.error('Lỗi trong quá trình gửi yêu cầu:', error);
            });
    }
    if (admintable) {
        axios.get('/api/admin/get-admins/as/' + accId, {
                headers: headers
            })
            .then(function(response) {
                if (response.status === 200) {
                    if (response.data.success === true) {
                        var usl = response.data.adminsList;
                        usl.forEach(function(us) {
                            var newRow = admintable.insertRow();
                            var nameCell = newRow.insertCell(0);
                            nameCell.classList.add("text-center");
                            if (us.fullname)
                                nameCell.textContent = us.fullname;
                            else {
                                nameCell.textContent = "_";
                                nameCell.classList.add("italic");
                            }
                            var usernameCell = newRow.insertCell(1);
                            usernameCell.textContent = us.usname;
                            usernameCell.classList.add("text-center");
                            var emailCell = newRow.insertCell(2);
                            emailCell.textContent = us.email;
                            emailCell.classList.add("text-center");
                            var phoneCell = newRow.insertCell(3);
                            phoneCell.textContent = us.phone;
                            phoneCell.classList.add("text-center");
                            var stateCell = newRow.insertCell(4);
                            if (us.isLocked == 1) {
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
                            actionCell.appendChild(updateButton);

                            // Tạo nút Đổi mật khẩu
                            var changePasswordButton = document.createElement("button");
                            changePasswordButton.classList.add("border-2", "p-2", "rounded-lg");
                            changePasswordButton.title = "Cập nhật mật khẩu";
                            var changePasswordIcon = document.createElement("span");
                            changePasswordIcon.className = "material-icons";
                            changePasswordIcon.textContent = "password";
                            changePasswordIcon.style.color = "#ffc800";
                            changePasswordButton.appendChild(changePasswordIcon);
                            actionCell.appendChild(changePasswordButton);

                            // Tạo nút Xóa
                            var deleteButton = document.createElement("button");
                            deleteButton.classList.add("border-2", "p-2", "rounded-lg");
                            var deleteIcon = document.createElement("span");
                            deleteIcon.className = "material-icons";
                            if (us.isLocked == 1) {
                                deleteButton.title = "Mở khóa người dùng";
                                deleteIcon.textContent = "lock_open";
                                deleteIcon.classList.add('text-green-500');
                            } else {
                                deleteButton.title = "Khóa người dùng";
                                deleteIcon.textContent = "lock";
                                deleteIcon.classList.add('text-red-500');
                            }
                            deleteButton.appendChild(deleteIcon);
                            deleteButton.onclick = function() {
                                var url = '/api/admin/lock-admin/' + us.admin_id + '/as/' + accId;
                                $.ajax({
                                    url: url,
                                    type: 'PUT',
                                    headers: headers,
                                    success: function(response) {
                                        if (response.currentState == 0) {
                                            stateCell.textContent = 'Hoạt động';
                                            stateCell.classList.remove('text-red-500');
                                            stateCell.classList.add('text-green-500');

                                            deleteButton.title = "Khóa người dùng";
                                            deleteIcon.textContent = "lock";
                                            deleteIcon.classList.remove('text-green-500');
                                            deleteIcon.classList.add('text-red-500');
                                        } else if (response.currentState == 1) {
                                            stateCell.textContent = 'Bị khóa';
                                            stateCell.classList.remove('text-green-500');
                                            stateCell.classList.add('text-red-500');

                                            deleteButton.title = "Mở khóa người dùng";
                                            deleteIcon.textContent = "lock_open";
                                            deleteIcon.classList.remove('text-red-500');
                                            deleteIcon.classList.add('text-green-500');
                                        }
                                    },
                                    error: function(error) {
                                        console.log("error: " + error);
                                    }
                                });
                            }
                            actionCell.appendChild(deleteButton);

                        });
                        $('#admintable').DataTable({
                                responsive: true,
                                language: {
                                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Vietnamese.json" // URL của tệp ngôn ngữ tiếng Việt
                                },
                                lengthMenu: [5, 10, 15, 20],
                                responsive: {
                                    details: {
                                        display: $.fn.dataTable.Responsive.display.modal({
                                            header: function(row) {
                                                var data = row.data();
                                                return 'Thông tin của ' + data[2];
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
            .catch(function(error) {
                console.error('Lỗi trong quá trình gửi yêu cầu:', error);
            });
    }

    function showAccTable(num) {
        switch (num) {
            case 1:

                break;

            case 2:

                break;

            default:
                break;
        }

    }
    </script>
</body>
@include ('component.footer')

</html>