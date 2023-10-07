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

    .datatable-container {
        width: 100%; /* Thiết lập chiều rộng của khung DataTable */
        overflow-x: auto; /* Tạo thanh cuộn ngang khi cần thiết */
    }

    #usertable, #admintable {
        width: 100%; /* Đặt chiều rộng của bảng DataTable là 100% */
        table-layout: auto; /* Cho phép bảng tự động xác định kích thước cột */
    }

    #usertable th:first-child, #admintable th:first-child {
        position: sticky;
        left: 0;
        z-index: 1;
        background-color: #fff; /* Màu nền cho cột cố định */
        border-right: 1px solid #C0C0C0;
    }
    #usertable td:first-child, #admintable td:first-child {
        position: sticky;
        left: 0;
        background-color: #C0C0C0; /* Màu nền cho cột cố định */
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff; 
    }

    #usertable th:last-child, #admintable th:last-child {
        position: sticky;
        right: 0;
        z-index: 1;
        background-color: #fff; /* Màu nền cho cột cố định */
        border-left: 1px solid #C0C0C0;
    }
    #usertable td:last-child, #admintable td:last-child {
        position: sticky;
        right: 0;
        background-color: #C0C0C0; /* Màu nền cho cột cố định */
        border-left: 1px solid #fff;
        border-bottom: 1px solid #fff; 
        ; 
    }
    </style>
</head>

<body class="bg-gray-200">
    <script>
    var userName = "{{ auth()->user()->name }}";
    </script>
    @if(auth()->check())
    <!-- Trang của bạn.blade.php -->
    @include('auth.admin.navbar')
    <div class="flex w-full bg-gray-200 h-auto">
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
                <div id="acctable" class="flex flex-col mx-5">
                    @if(auth()->user()->acctype_id == 1)
                    <!--admin table-->
                    <div class="bg-white p-4 my-5" id="amtb" hidden>
                        <div class="font-bold text-xl mb-4">Quản trị viên</div>
                        <button id="btnAddNewAdmin" class="bg-blue-500 text-white p-3 rounded-md mb-4 font-bold flex items-center">
                            <span class="material-icons">add</span>
                            Thêm quản trị viên
                        </button>
                        <div class="datatable-container">
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
                    </div>
                    <!--end admin table-->
                    @endif
                    <!--User table-->
                    <div class="bg-white p-4 my-5" id="ustb" hidden>
                        <div class="font-bold text-xl mb-4">Người dùng</div>
                        <div class="datatable-container">
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
                    </div>
                    <!--end user table-->
                </div>
            </div>
        </div>
    </div>
    @include ('component.footer')
    @endif
    <script src="/js/checkAdminPage.js"></script>
    <!--Datatables -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="/js/adminPage.js"></script>
</body>

</html>