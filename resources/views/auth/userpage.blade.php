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
    </style>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
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
                            <svg class="h-5 fill-current" xmlns="http://www.w3.org/2000/svg" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
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
                    <div class="flex items-center space-x-2 font-semibold text-gray-900 leading-8">
                        <span clas="text-green-500">
                            <img src="https://www.svgrepo.com/show/425554/like-rating-up.svg" class="w-5 h-5">
                        </span>
                        <span class="tracking-wide">Phim yêu thích</span>
                    </div>
                    <div class="text-gray-700">
                        <div class="grid lg:grid-cols-2 text-sm overflow-y-scroll max-h-[300px] p-10"
                            id="us-favoriteList">
                            <a href="/movies" id="us-fsvoriteItem" class="border-gray-300 border-2 rounded-xl w-full py-7 px-5 m-1">
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
                        <div id="us-notfoundFavoriteMovies" class="text-center"></div>
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
                                <img src="https://www.svgrepo.com/show/509175/note.svg" class="w-5 h-5">
                            </span>
                            <span class="tracking-wide">Các tương tác</span>
                        </div>
                        <div class="grid grid-cols-2">
                            <div class="border-2 p-2 m-2">
                                <div class="flex items-center space-x-2 font-semibold text-gray-900 leading-8 mb-3">
                                    <span clas="text-green-500">
                                        <img src="https://www.svgrepo.com/show/522073/comment-5.svg" class="w-5 h-5">
                                    </span>
                                    <span class="tracking-wide">Bình luận</span>
                                </div>
                                <ul class="list-inside space-y-2 overflow-y-scroll max-h-[300px]" id="us-commentList">
                                </ul>
                                <div id="us-notfoundcomment" class="text-center"></div>
                            </div>
                            <div class="border-2 p-2 m-2">
                                <div class="flex items-center space-x-2 font-semibold text-gray-900 leading-8 mb-3">
                                    <span clas="text-green-500">
                                        <img src="https://www.svgrepo.com/show/533052/star.svg" class="w-5 h-5">
                                    </span>
                                    <span class="tracking-wide">Đánh giá</span>
                                </div>
                                <ul class="list-inside space-y-2 overflow-y-scroll max-h-[300px]" id="us-ratingList">
                                </ul>
                                <div id="us-notfoundrating" class="text-center"></div>
                            </div>
                        </div>
                        <!-- End of User activity -->
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
    <script src="/js/userpage.js"></script>
</body>

</html>
@include('component.footer')