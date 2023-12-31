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
    #chaptertable {
        width: 100%;
        /* Đặt chiều rộng của bảng DataTable là 100% */
        table-layout: auto;
        /* Cho phép bảng tự động xác định kích thước cột */
    }

    #chaptertable th:first-child {
        position: sticky;
        left: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #C0C0C0;
    }

    #chaptertable td:first-child {
        position: sticky;
        left: 0;
        background-color: #C0C0C0;
        /* Màu nền cho cột cố định */
        border-right: 1px solid #fff;
        border-bottom: 1px solid #fff;
    }

    #chaptertable th:last-child {
        position: sticky;
        right: 0;
        z-index: 0;
        background-color: #fff;
        /* Màu nền cho cột cố định */
        border-left: 1px solid #C0C0C0;
    }

    #chaptertable td:last-child {
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
<div id="addnewMovie-modal" tabindex="-1" data-modal-backdrop="static"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-7xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-5 border-b rounded-t bg-[#66ccff]">
                <h3 class="text-xl font-medium text-white">
                    {{ __('addmovie')}}
                </h3>
                <button type="button" onclick="closeAddMovieModal()"
                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                    data-modal-hide="addnewMovie-modal">
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
                <form class="space-y-6" id="modalNewMovieForm">
                    @csrf
                    @method('POST')
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label for="newEnName"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('mvtitleen')}}</label>
                            <input type="text" name="newEnName" id="newEnName" required
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                        <div>
                            <label for="newViName"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('mvtitlevi')}}
                            <input type="text" name="newViName" id="newViName"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label for="newContent"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('content')}}</label>
                            <textarea name="newContent" id="newContent"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-40 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                        </div>
                        <div>
                            <div>
                                <label for="newDirector"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('directors')}} {{ __('notecomma')}}</label>
                                <textarea name="newDirector" id="newDirector"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-16 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                            </div>
                            <div>
                                <label for="newActor"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('actors')}} {{ __('notecomma')}}</label>
                                <textarea name="newActor" id="newActor"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-16 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="grid gap-4 grid-cols-2 md:grid-cols-4">
                        <div>
                            <label for="newYear"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('manuyear')}}</label>
                            <input type="number" name="newYear" id="newYear" required min="1800"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                        <div>
                            <label for="newVidLength"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('videolength')}}</label>
                            <input type="text" name="newVidLength" id="newVidLength" required
                                placeholder="xhym - 1h30m"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                        <div>
                            <label for="newTypePoster"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('typeof')}} poster</label>
                            <select name="newTypePoster" id="newTypePoster"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </select>
                        </div>
                        <div>
                            <label for="newPosterURL"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Poster URL ({{ __('or')}}
                                id)</label>
                            <input type="text" name="newPosterURL" id="newPosterURL"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                        </div>
                    </div>
                    <div class="grid grid-cols-2">
                        <div>
                            <button type="button"
                                class="bg-blue-200 p-4 rounded-lg mb-2 text-sm font-medium text-gray-900 dark:text-white"
                                onclick="checkNewPoster()">{{ __('check')}} poster
                            </button>
                            <div id="newIMGnotExists" class="text-red-500">{{ __('donthave')}} poster</div>
                        </div>
                        <img src="" id="newReviewIMG" class="w-48">
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="flex w-full justify-end">
                            <button type="submit"
                                class="w-1/2 text-white bg-[#66ccff] hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                {{ __('addmovie') }}
                            </button>
                        </div>
                        <div class="flex w-full justify-start">
                            <button type="button" data-modal-hide="addnewMovie-modal" onclick="closeAddMovieModal()"
                                class="w-1/2 text-white bg-gray-500 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                {{ __('cancel') }}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end addnewmoviemodal-->
<button hidden data-modal-target="addnewMovie-modal" data-modal-toggle="addnewMovie-modal"></button>

<!-- detailmoviemodal -->
<div id="detailMovie-modal" tabindex="-1" data-modal-backdrop="static"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 lg:px-32 md:pt-16 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative w-full max-w-screen-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-5 border-b rounded-t bg-[#66ccff]">
                <h3 class="text-xl font-medium text-white">
                    {{ __('moviedetail') }} |
                    <span id="dtMovieTitle">...</span>
                </h3>
                <button type="button" onclick="closeDetailModal()"
                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                    data-modal-hide="detailMovie-modal">
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
                <form class="space-y-6" id="modalUpdateMovieForm">
                    @method('PUT')
                    <div>
                        <button class='font-bold' type="button" onclick="changeInfoDivState()">{{ __('movieinfo') }}</button>
                    </div>
                    <div id="infoDiv">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label for="dtmvid"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('mvid') }}</label>
                                <input type="text" name="dtmvid" id="dtmvid"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                            <div class="grid grid-cols-1">
                                <label class="block mb-2 md:mb-0 text-sm font-medium text-gray-900 dark:text-white">{{ __('select') }}
                                    {{ __('genres')}}</label>
                                <input type="hidden" id="totalGenre" value="" name="totalGenre">
                                <button id="dropdownSearchButtonGenre" data-dropdown-toggle="dropdownSearchGenre"
                                    class="w-full h-full inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-center text-white bg-[#66ccff] rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button">{{ __('genres')}} <svg class="w-2.5 h-2.5 ml-2.5" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="m1 1 4 4 4-4" />
                                    </svg></button>

                                <!-- Dropdown menu -->
                                <div id="dropdownSearchGenre"
                                    class="z-10 hidden bg-white rounded-lg shadow w-auto dark:bg-gray-700">
                                    <div class="p-3">
                                        <label for="input-group-search-genre" class="sr-only">Tìm kiếm</label>
                                        <div class="relative">
                                            <div
                                                class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                                <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
                                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                                    <path stroke="currentColor" stroke-linecap="round"
                                                        stroke-linejoin="round" stroke-width="2"
                                                        d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                                </svg>
                                            </div>
                                            <input type="text" id="input-group-search-genre"
                                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                placeholder="{{ __('enter') }} {{ __('genre') }}...">
                                        </div>
                                    </div>
                                    <ul class="h-48 w-auto px-3 pb-3 overflow-y-auto text-sm text-gray-700 dark:text-gray-200"
                                        aria-labelledby="dropdownSearchButtonGenre" id="DivItemsSearchGenre">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="grid md:grid-cols-2 gap-4">
                            <div>
                                <label for="dtEnName"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('mvtitleen') }}</label>
                                <input type="text" name="dtEnName" id="dtEnName"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                            <div>
                                <label for="dtViName"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('mvtitlevi') }}</label>
                                <input type="text" name="dtViName" id="dtViName"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                        </div>
                        <div class="grid md:grid-cols-2 gap-4">
                            <div>
                                <label for="dtContent"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('content') }}</label>
                                <textarea name="dtContent" id="dtContent"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-40 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                            </div>
                            <div>
                                <div>
                                    <label for="dtDirector"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('directors') }}
                                        {{ __('notecomma') }}</label>
                                    <textarea name="dtDirector" id="dtDirector"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-16 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                                </div>
                                <div>
                                    <label for="dtActor"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('actors') }} {{ __('notecomma') }}</label>
                                    <textarea name="dtActor" id="dtActor"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 h-16 resize-y dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="grid gap-4 grid-cols-2 md:grid-cols-4">
                            <div>
                                <label for="dtYear"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('manuyear') }}</label>
                                <input type="number" name="dtYear" id="dtYear" min="1800"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                            <div>
                                <label for="dtVidLength"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('videolength') }}</label>
                                <input type="text" name="dtVidLength" id="dtVidLength" placeholder="xhym - 1h30m"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                            <div>
                                <label for="dtTypePoster"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ __('typeof') }}
                                    poster</label>
                                <select name="dtTypePoster" id="dtTypePoster"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                                </select>
                            </div>
                            <div>
                                <label for="dtPosterURL"
                                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Poster URL
                                    ({{ __('or') }}
                                    id)</label>
                                <input type="text" name="dtPosterURL" id="dtPosterURL"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                            </div>
                        </div>
                        <div class="grid grid-cols-2 mt-2">
                            <div class="h-72">
                                <button type="button"
                                    class="bg-blue-200 p-4 rounded-lg mb-2 text-sm font-medium text-gray-900 dark:text-white"
                                    onclick="checkNewPoster()">{{ __('check') }} poster
                                </button>
                                <div id="dtIMGnotExists" class="text-red-500">{{ __('donthave') }} poster</div>
                            </div>
                            <div>
                                <img src="" id="dtReviewIMG" class="w-48">
                            </div>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mt-2" id="btnDiv">
                            <div class="flex w-full justify-end">
                                <button type="submit"
                                    class="w-1/2 text-white bg-[#66ccff] hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    {{ __('update') }}
                                </button>
                            </div>
                            <div class="flex w-full justify-start">
                                <button type="button" data-modal-hide="detailMovie-modal" onclick="closeDetailModal()"
                                    class="w-1/2 text-white bg-gray-500 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    {{ __('close') }}
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="loadInfo" hidden><span class="material-icons">
                            expand_more
                        </span></div>
                </form>
                <div>
                    <button class='font-bold' type="button" onclick="changeChapterDivState()">{{ __('chapterlist')}}</button>
                </div>
                <div id="chapterDiv">
                    <div class="px-6 pb-6 lg:px-8">
                        <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">{{ __('amount') }}: <span
                                id="numChapterOfMovie">...</span> {{ __('chapter')}}</h3>
                        <button id="btnAddNewChapter" type="button" onclick="addNewChapter();"
                            class="bg-blue-500 text-white p-3 rounded-md mb-4 font-bold flex items-center">
                            <span class="material-icons">add</span>
                            {{ __('addchapter') }}
                        </button>
                        <!--MoveOfGenre table-->
                        <div class="bg-white p-4 my-5" id="chaptertb">
                            <div class="font-bold text-xl mb-4"></div>
                            <div class="datatable-container">
                                <table id="chaptertable" class="stripe hover"
                                    style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                                    <thead>
                                        <tr>
                                            <th data-priority="1">{{ __('ctid') }}</th>
                                            <th data-priority="2">{{ __('ctname') }}</th>
                                            <th data-priority="3">{{ __('cturl') }}</th>
                                            <th data-priority="4">{{ __('actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbd-chaptertable">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--end MoveOfGenre table-->
                    </div>
                </div>
                <div id="loadChapter" hidden><span class="material-icons">
                        expand_more
                    </span></div>
            </div>
        </div>
    </div>
</div>
<!-- end detailmoviemodal-->
<button hidden data-modal-target="detailMovie-modal" data-modal-toggle="detailMovie-modal"></button>

<body class="bg-gray-200">
    @include('auth.admin.navbar')

    <div class="flex w-full bg-gray-200 h-auto">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isAd-MoviePage">
        @include ('component.head-changeLang')
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold">{{ __('movie') }}</h3>
            </div>
            <div id="" class="flex flex-col mx-5">
                <div class="bg-white p-4 my-5" id="mvtb">
                    <div class="m-2">{{ __('amount') }}:
                        <span class="font-bold text-xl mb-4" id="numOfMovie">...</span> {{ __('movie') }}(s)
                    </div>
                    <button id="btnAddNewMovie" data-modal-target="addnewMovie-modal"
                        data-modal-toggle="addnewMovie-modal"
                        class="bg-blue-500 text-white p-3 rounded-md mb-4 font-bold flex items-center">
                        <span class="material-icons">add</span>
                        {{ __('addmovie') }}
                    </button>
                    <div class="datatable-container">
                        <table id="movietable" class="stripe hover"
                            style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                            <thead>
                                <tr>
                                    <th data-priority="1">{{ __('mvid') }}</th>
                                    <th data-priority="2">{{ __('mvtitlevi') }}</th>
                                    <th data-priority="3">{{ __('mvtitleen') }}</th>
                                    <th data-priority="4">{{ __('actions') }}</th>
                                </tr>
                            </thead>
                            <tbody id="tbd-movietable">
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
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="/js/adminPage.js"></script>
</body>

</html>