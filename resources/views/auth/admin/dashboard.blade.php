<html>

<head>
    <!--Regular Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <!--Responsive Extension Datatables CSS-->
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">
    <style>
    #usertable,
    #admintable,
    #statisticmovietable {
        width: 100%;
        /* Đặt chiều rộng của bảng DataTable là 100% */
        table-layout: auto;
        /* Cho phép bảng tự động xác định kích thước cột */
    }

    #usertable th:first-child,
    #admintable th:first-child,
    #statisticmovietable th:first-child {
        position: sticky;
        left: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #C0C0C0;
    }

    #usertable td:first-child,
    #admintable td:first-child,
    #statisticmovietable td:first-child {
        position: sticky;
        left: 0;
        background-color: #C0C0C0;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff;
    }

    #usertable th:last-child,
    #admintable th:last-child {
        position: sticky;
        right: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-left: 1px solid #C0C0C0;
    }

    #usertable td:last-child,
    #admintable td:last-child {
        position: sticky;
        right: 0;
        background-color: #C0C0C0;
        /* Màu nền cho cột cố định */
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
                <div class="flex flex-wrap justify-start items-center">
                    @if(auth()->user()->acctype_id == 1)
                    <!--Admin tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showAccTable(1)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-3 bg-green-500 flex justify-center items-center h-16 rounded-full">
                                <i class="fa-solid fa-users-gear fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700">Quản trị viên</h4>
                                <div class="text-gray-500" id="numOfAdmin"></div>
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
                                <h4 class="text-2xl font-semibold text-gray-700">Người dùng</h4>
                                <div class="text-gray-500" id="numOfUser"></div>
                            </div>
                        </div>
                    </div>
                    <!--end User tag-->
                    <!--statistic movie tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showAccTable(3)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-3 bg-green-700 flex justify-center items-center h-16 rounded-md">
                                <i class="fa-solid fa-chart-bar fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700" id="">Phim</h4>
                                <div class="text-gray-500">Thống kê</div>
                            </div>
                        </div>
                    </div>
                    <!--end statistic movie tag-->
                </div>
                <div class='w-full flex justify-end px-5'>
                    <button hidden id="btnDivHidden" class="bg-blue-500 text-white font-bold p-2 m-1 rounded-md"
                        onclick="showAccTable(0)">Đóng</button>
                </div>
                <div id="acctable" class="flex flex-col mx-5">
                    @if(auth()->user()->acctype_id == 1)
                    <!--admin table-->
                    <div class="bg-white p-4 my-5 divHidden" id="amtb" hidden>
                        <div class="font-bold text-xl mb-4">Quản trị viên</div>
                        <button id="btnAddNewAdmin"
                            class="bg-blue-500 text-white p-3 rounded-md mb-4 font-bold flex items-center">
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
                    <div class="bg-white p-4 my-5 divHidden" id="ustb" hidden>
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
                <div class="bg-white p-4 my-5 mx-5 divHidden" hidden id="statistic-movie">
                    <div class="relative overflow-x-auto flex justify-center">
                        <table class="w-1/2 text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead
                                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        Thống kê
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Số lượng
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        Tổng số phim
                                    </th>
                                    <td class="px-6 py-4 text-lg" id="total-movie">
                                        0
                                    </td>
                                </tr>
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        Tổng lượt xem
                                    </th>
                                    <td class="px-6 py-4 text-lg" id="total-view">
                                        0
                                    </td>
                                </tr>
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        Tổng đánh giá
                                    </th>
                                    <td class="px-6 py-4 text-lg" id="total-rating">
                                        0
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="font-bold text-xl mb-4">Danh sách phim</div>
                    <div class="datatable-container">
                        <table id="statisticmovietable" class="stripe hover"
                            style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                            <thead>
                                <tr>
                                    <th data-priority="1">Mã phim</th>
                                    <th data-priority="2">Tựa (tiếng Việt)</th>
                                    <th data-priority="3">Tựa (tiếng Anh)</th>
                                    <th data-priority="4">Số lượt xem</th>
                                    <th data-priority="5">Số lượt đánh giá</th>
                                    <th data-priority="6">Điểm (/5.0)</th>
                                </tr>
                            </thead>
                            <tbody id="tbd-statisticmovietable">
                            </tbody>
                        </table>
                    </div>
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