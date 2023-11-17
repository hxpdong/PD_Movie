<html>

<head>
    <!--Regular Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <!--Responsive Extension Datatables CSS-->
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">
    <style>
    #movieErrTable,
    #admintable {
        width: 100%;
        /* Đặt chiều rộng của bảng DataTable là 100% */
        table-layout: auto;
        /* Cho phép bảng tự động xác định kích thước cột */
    }

    #movieErrTable th:first-child,
    #ReportCommentTable th:first-child {
        position: sticky;
        left: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #C0C0C0;
    }

    #movieErrTable td:first-child,
    #ReportCommentTable td:first-child {
        position: sticky;
        left: 0;
        background-color: #C0C0C0;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff;
    }

    #movieErrTable th:last-child,
    #ReportCommentTable th:last-child {
        position: sticky;
        right: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-left: 1px solid #C0C0C0;
    }

    #movieErrTable td:last-child,
    #ReportCommentTable td:last-child {
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
    @if(auth()->check())
    <!-- Trang của bạn.blade.php -->
    @include('auth.admin.navbar')

    <div class="flex w-full bg-gray-200 h-auto">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isAd-ReportPage">
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold">{{ __('report') }}</h3>
                <div class="flex flex-wrap justify-center items-center">
                    <!--Movie tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showReportTable(1)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-4 bg-green-500 flex justify-center items-center h-16 rounded-full">
                                <i class="fa-solid fa-film fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700">{{ __('mverr') }}</h4>
                            </div>
                            <span class="bg-red-500 p-2 rounded-full" id="rp-movieErrNoti" hidden></span>
                        </div>
                    </div>
                    <!--end movie tag-->

                    <!--Comment tag-->
                    <div class="w-full px-6 sm:w-1/2 xl:w-1/3 my-2" onclick="showReportTable(2)">
                        <div class="flex items-center px-5 py-6 bg-white rounded-md shadow-sm">
                            <div class="p-4 bg-indigo-600 flex justify-center items-center h-16 rounded-full">
                                <i class="fa-solid fa-comment fa-2xl" style="color: #ffffff;"></i>
                            </div>

                            <div class="mx-5">
                                <h4 class="text-2xl font-semibold text-gray-700">{{ __('rpcmt') }}</h4>
                            </div>
                            <span class="bg-red-500 p-2 rounded-full" id="rp-commentNoti" hidden></span>
                        </div>
                    </div>
                    <!--end Comment tag-->
                </div>
                <div id="reporttable" class="flex flex-col mx-5">
                    <!--movieerr table-->
                    <div class="bg-white p-4 my-5" id="mverrtb" hidden>
                        <div class="font-bold text-xl mb-2">{{ __('mverr') }}</div>
                        @if(auth()->user()->acctype_id == 1)
                        <form id="deleteReportErrorForm" method="POST">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="bg-blue-500 text-white p-2 font-bold mb-2 rounded-lg">{{ __('delrp') }}
                            </button>
                            <input type="date" name="beforeDate" id="beforeDateErr" class="font-bold text-black rounded-lg p-2">
                        </form>
                        @endif
                        <div class="datatable-container">
                            <table id="movieErrTable" class="stripe hover"
                                style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                                <thead>
                                    <tr>
                                        <th data-priority="1">{{ __('errid') }}</th>
                                        <th data-priority="2">{{ __('dependmovie') }}</th>
                                        <th data-priority="3">{{ __('content') }}</th>
                                        <th data-priority="4">{{ __('state') }}</th>
                                        <th data-priority="5">{{ __('timecreate') }}</th>
                                        <th data-priority="6">{{ __('timesolve') }}</th>
                                        <th data-priority="7">{{ __('actions') }}</th>
                                    </tr>
                                </thead>
                                <tbody id="tbd-movieErrTable">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--end movieerr table-->
                    <!--reportcmt table-->
                    <div class="bg-white p-4 my-5" id="rpcmttb" hidden>
                        <div class="font-bold text-xl mb-2">{{ __('rpcmt') }}</div>
                        @if(auth()->user()->acctype_id == 1)
                        <form id="deleteReportCommentForm" method="POST">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="bg-blue-500 text-white p-2 font-bold mb-2 rounded-lg">{{ __('delrp') }}
                            </button>
                            <input type="date" name="beforeDate" id="beforeDateCmt" class="font-bold text-black rounded-lg p-2">
                        </form>
                        @endif
                        <div class="datatable-container">
                            <table id="ReportCommentTable" class="stripe hover"
                                style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                                <thead>
                                    <tr>
                                        <th data-priority="1">{{ __('rpid') }}</th>
                                        <th data-priority="2">{{ __('cmtid') }}</th>
                                        <th data-priority="3">{{ __('content') }}</th>
                                        <th data-priority="4">{{ __('state') }}</th>
                                        <th data-priority="5">{{ __('timecreate') }}</th>
                                        <th data-priority="6">{{ __('timesolve') }}</th>
                                        <th data-priority="7">{{ __('actions') }}</th>
                                    </tr>
                                </thead>
                                <tbody id="tbd-ReportCommentTable">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--end reportcmt table-->
                </div>
            </div>
        </div>
    </div>
    @include ('component.footer')
    @endif
    <script src="/js/checkAdminPage.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="/js/adminPage.js"></script>
</body>

</html>