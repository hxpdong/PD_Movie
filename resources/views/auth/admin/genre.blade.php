@if(auth()->check())
<!-- Trang của bạn.blade.php -->
<html>
<div class="custom-overlay" id="overlay"></div>

<head>
    <!--Regular Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <!--Responsive Extension Datatables CSS-->
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">
    <style>
    #tbd-movie-genre-table {
        width: 100%;
        /* Đặt chiều rộng của bảng DataTable là 100% */
        table-layout: auto;
        /* Cho phép bảng tự động xác định kích thước cột */
    }

    #tbd-movie-genre-table th:first-child {
        position: sticky;
        left: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #C0C0C0;
    }

    #tbd-movie-genre-table td:first-child {
        position: sticky;
        left: 0;
        background-color: #C0C0C0;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff;
    }

    #tbd-movie-genre-table th:last-child {
        position: sticky;
        right: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-left: 1px solid #C0C0C0;
    }

    #tbd-movie-genre-table td:last-child {
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
<!-- addnewmoviemodal -->
<div id="addnewGenre-modal" tabindex="-1" data-modal-backdrop="static"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-5 border-b rounded-t bg-[#66ccff]">
                <h3 class="text-xl font-medium text-white">
                    Thể loại mới
                </h3>
                <button type="button" onclick="closeAddGenreModal()"
                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                    data-modal-hide="addnewGenre-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <div class="px-6 py-6 lg:px-8">
                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white"></h3>
                <form class="space-y-6" id="modalNewGenreForm">
                    @csrf
                    @method('POST')
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label for="newEnGenre"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên
                                tiếng Anh</label>
                            <input type="text" name="newEnGenre" id="newEnGenre" required
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                        <div>
                            <label for="newViGenre"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên
                                tiếng Việt</label>
                            <input type="text" name="newViGenre" id="newViGenre"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="flex w-full justify-end">
                            <button type="submit"
                                class="w-1/2 text-white bg-[#66ccff] hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                Thêm thể loại
                            </button>
                        </div>
                        <div class="flex w-full justify-start">
                            <button type="button" data-modal-hide="addnewGenre-modal" onclick="closeAddGenreModal()"
                                class="w-1/2 text-white bg-gray-500 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                Đóng
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end addnewmoviemodal-->
<button hidden data-modal-target="addnewGenre-modal" data-modal-toggle="addnewGenre-modal"></button>

<!-- listmoviemodal -->
<div id="listMovieGenre-modal" tabindex="-1" data-modal-backdrop="static"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-8xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-5 border-b rounded-t bg-[#66ccff]">
                <h3 class="text-xl font-medium text-white" id="listmvofgenre">
                    ...
                </h3>
                <button type="button" onclick="closeListMovieGenreModal()"
                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                    data-modal-hide="listMovieGenre-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <div class="px-6 py-6 lg:px-8">
                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Số lượng: <span  id="numMVOfthisGenre">...</span> phim</h3>
                <!--MoveOfGenre table-->
                <div class="bg-white p-4 my-5" id="mv-genre-tb">
                    <div class="font-bold text-xl mb-4"></div>
                    <div class="datatable-container">
                        <table id="movie-genre-table" class="stripe hover"
                            style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                            <thead>
                                <tr>
                                    <th data-priority="1">Mã phim</th>
                                    <th data-priority="2">Tựa tiếng Việt</th>
                                    <th data-priority="3">Tựa tiếng Anh</th>
                                    <th data-priority="4">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody id="tbd-movie-genre-table">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--end MoveOfGenre table-->
                <div class="flex w-full justify-center">
                    <button type="button" data-modal-hide="listMovieGenre-modal" onclick="closeListMovieGenreModal()"
                        class="w-1/2 text-white bg-gray-500 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Đóng
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end addnewmoviemodal-->
<button hidden data-modal-target="listMovieGenre-modal" data-modal-toggle="listMovieGenre-modal"></button>

<body class="bg-gray-200">
    @include('auth.admin.navbar')

    <div class="flex w-full bg-gray-200 h-auto">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isAd-GenrePage">
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold">Thể Loại</h3>
            </div>
            <button id="btnAddNewGenre" data-modal-target="addnewGenre-modal" data-modal-toggle="addnewGenre-modal"
                class="bg-blue-500 text-white p-3 rounded-md mb-4 font-bold flex items-center m-2">
                <span class="material-icons">add</span>
                Thêm thể loại
            </button>
            <div id="mvgList" class="flex flex-wrap justify-center items-center">
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