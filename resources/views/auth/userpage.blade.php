@include ('component.header')
<html>

<head>
    <title>User Profile</title>
    <style>
    :root {
        --main-color: #4a76a8;
    }

    .bg-main-color {
        background-color: var(--main-color);
    }

    .text-main-color {
        color: var(--main-color);
    }

    .border-main-color {
        border-color: var(--main-color);
    }

    /* Thay đổi màu nền của thanh cuộn */
    ::-webkit-scrollbar {
        background-color: #f1f1f1;
    }

    /* Thay đổi màu sắc của thanh cuộn */
    ::-webkit-scrollbar-thumb {
        background-color: #66CCFF;
    }

    .no-select {
        user-select: none;
    }
    </style>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <link rel="stylesheet" href="/css/demofilm.css">
</head>

<body class="bg-[#3a3a3a]">
    <div class="container mx-auto my-5 p-5">
        <div class="lg:flex no-wrap lg:-mx-2 ">
            <!-- Left Side -->
            <div class="w-auto lg:w-3/12 lg:mx-2 pb-3 mb-3 border-2 border-[#66CCFF] rounded-xl bg-white">
                <!-- Profile Card -->
                <div class="bg-white p-3 border-t-4 border-[#66CCFF] rounded-xl">
                    <div class="image overflow-hidden">
                        <img class="w-1/3 mx-auto" src="/img/avtuser.jpg" alt="">
                    </div>
                    <h1 class="text-gray-900 font-bold text-xl leading-8 my-1 text-center" id="us-fullname">Fullname
                    </h1>
                    <h3 class="text-gray-600 font-lg text-semibold leading-6 text-center" id="us-username">Username</h3>
                    <div class="hidden" id="us-uid"></div>
                    {{--
                    <p class="text-sm text-gray-500 hover:text-gray-600 leading-6"></p>
                    <ul
                        class="bg-gray-100 text-gray-600 hover:text-gray-700 hover:shadow py-2 px-3 mt-3 divide-y rounded shadow-sm">
                        <li class="flex items-center py-3">
                            <span>Status</span>
                            <span class="ml-auto"><span
                                    class="bg-green-500 py-1 px-2 rounded text-white text-sm">Active</span></span>
                        </li>
                        <li class="flex items-center py-3">
                            <span>Member since</span>
                            <span class="ml-auto">Nov 07, 2016</span>
                        </li>
                    </ul>
                    --}}

                </div>
                <!-- End of profile card -->
                <div class="my-4"></div>
                <!-- Friends card -->
                <div class="bg-white p-2 hover:shadow border-2 m-3">
                    <div class="flex items-center space-x-3 font-semibold text-gray-900 text-xl leading-8">
                        <span class="text-[#66CCFF]">
                        <i class="fa-solid fa-people-group"></i>
                        </span>
                        <span>Người dùng tương đồng</span>
                    </div>
                    <div class="grid grid-cols-3" id="similarUser-list">
                    </div>
                    <div id="us-notfoundsimilaruser" class="text-justify"></div>
                </div>
                <!-- End of friends card -->
            </div>
            <!-- Right Side -->
            <div class="w-full lg:w-9/12 h-auto">
                <!-- Favorite Movie Section -->
                <div class="bg-white p-3 shadow-sm border-2 border-[#66CCFF] rounded-xl">
                    <div class="no-select flex items-center space-x-2 font-semibold text-gray-900 leading-8 p-3"
                        onclick="expandContentContainer('container-favoritemovies');">
                        <span clas="text-green-500">
                        <i class="fa-solid fa-thumbs-up fa-lg" style="color: #66ccff;"></i>
                        </span>
                        <span class="tracking-wide">Phim yêu thích</span>
                        <span id="expand-container-favoritemovies" style="display: none;">
                        <i class="fa-solid fa-caret-down fa-2xl"></i>
                        </span>
                        <span id="shrink-container-favoritemovies">
                        <i class="fa-solid fa-caret-up fa-2xl"></i>
                        </span>
                    </div>
                    <div class="text-gray-700" id="container-favoritemovies">
                        <div id="us-notfoundFavoriteMovies" class="text-center text-black"></div>
                        <div class="grid lg:grid-cols-2 text-sm overflow-y-scroll max-h-[300px] p-10"
                            id="us-favoriteList">
                            <a href="/movies" id="us-fsvoriteItem"
                                class="border-gray-300 border-2 rounded-xl w-full py-7 px-5 m-1">
                                <card>
                                    <div class="grid grid-cols-6 gap-3">
                                        <div class="col-span-1">
                                            <img src="/img/banner.png" />
                                        </div>
                                        <div class="col-span-5">
                                            <div class="text-gray-700 font-bold truncate"> Test </div>
                                            <div class="flex justify-end items-end h-full">
                                                <div class="bg-[#f5e50b] font-bold rounded-xl p-2 flex items-end">
                                                    4.0/5.0
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </card>
                            </a>
                        </div>
                    </div>
                    {{--
                        <button
                            class="block w-full text-blue-800 text-sm font-semibold rounded-lg hover:bg-gray-100 focus:outline-none focus:shadow-outline focus:bg-gray-100 hover:shadow-xs p-3 my-4">Show
                            Full Information</button>
                    --}}
                </div>
                <!-- End of favorite section -->
                <div class="my-4"></div>
                @if(auth()->check())
                <!-- User activity (check) -->
                <div id="us-activities">
                    <div class="bg-white p-3 shadow-sm border-2 border-[#66CCFF] rounded-xl" id="us-act-item">
                        <div class="flex items-center space-x-2 font-semibold text-gray-900 leading-8">
                            <span clas="text-green-500">
                            <i class="fa-solid fa-clock-rotate-left fa-lg" style="color: #66ccff"></i>
                            </span>
                            <span class="tracking-wide">Các tương tác</span>
                        </div>
                        <div class="grid grid-cols-1 lg:grid-cols-2">
                            <div class="border-2 p-2 m-2">
                                <div class="no-select flex items-center space-x-2 font-semibold text-gray-900 leading-8 mb-3 p-3"
                                    onclick="expandContentContainer('us-commentList')">
                                    <span clas="text-green-500">
                                    <i class="fa-regular fa-message fa-lg"></i>
                                    </span>
                                    <span class="tracking-wide">Bình luận</span>
                                    <span id="expand-us-commentList" style="display: none;">
                                    <i class="fa-solid fa-caret-down fa-2xl"></i>
                                    </span>
                                    <span id="shrink-us-commentList">
                                    <i class="fa-solid fa-caret-up fa-2xl"></i>
                                    </span>
                                </div>
                                <div id="us-notfoundcomment" class="text-center"></div>
                                <ul class="list-inside space-y-2 overflow-y-scroll max-h-[300px]" id="us-commentList">
                                </ul>
                                <div class="flex justify-center flex-col">
                                    <div id="endOfCommentList" class="flex justify-center"></div>
                                    <button onclick="loadMoreComment()" id="load-more-cmt-button" class="font-bold text-blue-500 border-2 px-2 rounded-lg mt-3">
                                        Tải thêm
                                    </button>
                                </div>
                            </div>
                            <div class="border-2 p-2 m-2">
                                <div class="no-select flex items-center space-x-2 font-semibold text-gray-900 leading-8 mb-3 p-3"
                                    onclick="expandContentContainer('us-ratingList')">
                                    <span clas="text-green-500">
                                    <i class="fa-regular fa-star fa-lg"></i>
                                    </span>
                                    <span class="tracking-wide">Đánh giá</span>
                                    <span id="expand-us-ratingList" style="display: none;">
                                    <i class="fa-solid fa-caret-down fa-2xl"></i>
                                    </span>
                                    <span id="shrink-us-ratingList">
                                    <i class="fa-solid fa-caret-up fa-2xl"></i>
                                    </span>
                                </div>
                                <div id="us-notfoundrating" class="text-center"></div>
                                <ul class="list-inside space-y-2 overflow-y-scroll max-h-[300px]" id="us-ratingList">
                                </ul>
                                <div class="flex justify-center flex-col">
                                    <div id="endOfRatingList" class="flex justify-center"></div>
                                    <button onclick="loadMoreRating()" id="load-more-rt-button" class="font-bold text-blue-500 border-2 px-2 rounded-lg mt-3">
                                        Tải thêm
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- End of User activity -->
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
    <script>
    function expandContentContainer(idOfContainer) {
        var container = document.getElementById(idOfContainer);
        var expand = document.getElementById("expand-" + idOfContainer);
        var shrink = document.getElementById("shrink-" + idOfContainer);
        if (container.style.display === "") {
            container.style.display = "none";
            expand.style.display = "";
            shrink.style.display = "none";
        } else if (container.style.display = "none") {
            container.style.display = "";
            expand.style.display = "none";
            shrink.style.display = "";
        }
    }
    </script>
    <script src="/js/userpage.js"></script>
</body>

</html>
@include('component.footer')