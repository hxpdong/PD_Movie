@include ('component.head-script')
<!-- component -->
<header id="headerLoginInfo">
    <nav class="bg-gray-500 border-gray-200 px-4 lg:px-6 py-2.5 dark:bg-gray-800">
        <div class="block lg:hidden">
            <div class="flex items-center w-full justify-center">
                <a href="/" class="flex">
                    <img src="/img/fav-removebg.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                    <span class="self-center text-xl font-semibold whitespace-nowrap text-black">PDMovie</span>
                </a>
            </div>
        </div>
        <div class="flex flex-wrap justify-center items-center mx-auto max-w-screen-xl">
            <div class="flex items-center justify-center lg:order-2 w-full mt-3">
                @if(auth()->check())
                <div>
                    <nav>
                        <div @click.away="open = false" class="relative" x-data="{ open: false }">
                            <button @click="open = !open"
                                class="flex flex-row items-center space-x-2 w-full px-4 py-2 text-sm font-semibold text-left bg-transparent md:w-auto md:inline md:mt-0 md:ml-4 hover:bg-gray-200 focus:bg-[#66CCFF] focus:outline-none focus:shadow-outline">
                                <span>
                                    @if(auth()->user()->fullname)
                                    {{ auth()->user()->fullname }} ({{ auth()->user()->name }})
                                    @else
                                    {{ auth()->user()->name }}
                                    @endif
                                </span>
                                <svg fill="currentColor" viewBox="0 0 20 20"
                                    :class="{'rotate-180': open, 'rotate-0': !open}"
                                    class="inline w-4 h-4 transition-transform duration-200 transform">
                                    <path fill-rule="evenodd"
                                        d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                        clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div x-show="open" x-transition:enter="transition ease-out duration-100"
                                x-transition:enter-start="transform opacity-0 scale-95"
                                x-transition:enter-end="transform opacity-100 scale-100"
                                x-transition:leave="transition ease-in duration-75"
                                x-transition:leave-start="transform opacity-100 scale-100"
                                x-transition:leave-end="transform opacity-0 scale-95"
                                class="absolute right-0 w-full mt-2 origin-top-right rounded-md shadow-lg md:w-48">
                                <div
                                    class="py-2 bg-white text-blue-800 text-sm rounded-sm border border-main-color shadow-sm">
                                    <a class="block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline"
                                        href="/users/{{ auth()->user()->name }}">User profile</a>
                                    <button data-modal-toggle="profile-modal"
                                        class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">Settings</button>
                                    <button data-modal-toggle="password-modal"
                                        class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">Change
                                        password</button>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <a href="/logoutHeader"
                    class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">Đăng
                    xuất</a>
                <input type="hidden" id="authUserId" value="{{ auth()->user()->id }}">
                @else
                Khách!
                <input type="hidden" id="authUserId" value="">
                <button data-modal-toggle="authentication-modal"
                    class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">Đăng
                    nhập</button>
                <button data-modal-toggle="register-modal"
                    class="text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Đăng
                    ký</button>
                @endif


                <button data-collapse-toggle="mobile-menu-2" type="button"
                    class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 bg-white rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    aria-controls="mobile-menu-2" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="hidden justify-between items-center w-full lg:flex lg:w-auto lg:order-1" id="mobile-menu-2">
                <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0 lg:items-center">
                    <li>
                        <a href="/" class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto">
                            <img src="/img/fav-removebg.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                            <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">PDMovie</span>
                        </a>
<!--
                        <a href="/"
                        class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto"
                        aria-current="page">Trang chủ</a>
-->
                    </li>
                    <li>
                        <form class="mb-0">
                            <div class="relative">
                                <input type="search" id="default-search"
                                    class="lg:w-96 w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="tìm kiếm..." required name="kwsearch">
                                <button type="submit"
                                    class="text-white absolute right-2.5 bottom-2.5 bg-[#66CCFF] hover:bg-[#00aaff] focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    <svg class="w-4 h-4 text-white dark:text-white" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </li>
                    <li>
                        <div>
                            <button id="dropdownDefaultButton" data-dropdown-toggle="dropdown"
                                class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto"
                                type="button">Thể loại <svg class="w-2.5 h-2.5 ml-2.5" aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2" d="m1 1 4 4 4-4" />
                                </svg></button>
                            <!-- Dropdown menu -->
                            <div id="dropdown"
                                class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-4/5 md:w-44 dark:bg-gray-700">
                                <ul class="max-h-48 w-auto overflow-y-auto py-2 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="dropdownDefaultButton" id="genresList">
                                </ul>
                            </div>
                        </div>
                    </li>
                    @if(auth()->check())
                    <li>
                        <a href="/recommend"
                        class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto"
                        aria-current="page">Đề xuất cho bạn</a>
                    </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- Login modal -->
<div id="authentication-modal" aria-hidden="true"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="relative w-full max-w-md px-4 h-full md:h-auto">
        <div class="fixed inset-0 bg-black opacity-50"></div>
        <!-- Modal content -->
        <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
            <div class="flex justify-end p-2 bg-[#66CCFF]">
                <div class="px-6">
                    <h3 class="text-xl font-medium text-white dark:text-white">Đăng nhập</h3>
                </div>
                <button type="button" onclick="closeModalLogin()"
                    class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-toggle="authentication-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <form id="modalLoginForm" class="space-y-6 px-6 lg:px-8">
                @csrf
                <div>
                    <label for="email" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Tên
                        đăng
                        nhập</label>
                    <input type="text" name="mdusname" id="mdusname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="tên đăng nhập">
                </div>
                <div>
                    <label for="password" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Mật
                        khẩu</label>
                    <input type="password" name="mduspassword" id="mduspassword" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Đăng nhập</button>
            </form>

            <div class="space-y-4 px-6 lg:px-8 pb-4">
                <div class="flex justify-between">
                    <a href="#" class="text-sm text-blue-700 hover:underline dark:text-blue-500">Quên mật khẩu?</a>
                </div>
                <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
                    Chưa có tài khoản? <button data-modal-toggle="register-modal"
                        class="text-blue-700 hover:underline dark:text-blue-500">Đăng ký</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Register modal -->
<div id="register-modal" aria-hidden="true"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="relative w-full max-w-md px-4 h-full md:h-auto">
        <div class="fixed inset-0 bg-black opacity-50"></div>
        <!-- Modal content -->
        <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
            <div class="flex justify-end p-2 bg-[#66CCFF]">
                <div class="px-6">
                    <h3 class="text-xl font-medium text-white dark:text-white">Đăng ký</h3>
                </div>
                <button type="button" onclick="closeModalRegister()"
                    class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-toggle="register-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <form id="modalRegisterForm" class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                @csrf
                <div>
                    <label for="mdregfullname"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Họ tên</label>
                    <input type="text" name="mdregfullname" id="mdregfullname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="họ tên">
                </div>
                <div>
                    <label for="mdregemail"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Email</label>
                    <input type="email" name="mdregemail" id="mdregemail"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="email@gmail.com">
                </div>
                <div>
                    <label for="mdregusname" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Tên
                        đăng
                        nhập</label>
                    <input type="text" name="mdregusname" id="mdregusname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="tên đăng nhập">
                </div>
                <div>
                    <label for="mdreguspassword"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Mật
                        khẩu</label>
                    <input type="password" name="mdreguspassword" id="mdreguspassword" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Đăng ký</button>
            </form>
        </div>
    </div>
</div>
<!-- Edit profile modal -->
<div id="profile-modal" aria-hidden="true"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="relative w-full max-w-md px-4 h-full md:h-auto">
        <div class="fixed inset-0 bg-black opacity-50"></div>
        <!-- Modal content -->
        <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
            <div class="flex justify-end p-2 bg-[#66CCFF]">
                <div class="px-6">
                    <h3 class="text-xl font-medium text-white dark:text-white">Thông tin cá nhân</h3>
                </div>
                <button type="button" onclick="closeModalEditProfile()"
                    class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-toggle="profile-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <form id="modalProfileForm" class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                @csrf
                <div>
                    <label for="mdpf1" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Họ
                        tên</label>
                    <input type="text" name="mdpf1" id="mdpf1"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="họ tên">
                </div>
                <div>
                    <label for="mdpf2"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Email</label>
                    <input type="text" name="mdpf2" id="mdpf2"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="email@gmail.com">
                </div>
                <div>
                    <label for="mdpf3" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Tên
                        đăng
                        nhập</label>
                    <input type="text" name="mdpf3" id="mdpf3"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="tên đăng nhập">
                </div>

                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Đăng ký</button>
            </form>
        </div>
    </div>
</div>
<!-- end of edit profile modal -->
<!-- Change Password modal -->
<div id="password-modal" aria-hidden="true"
    class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="relative w-full max-w-md px-4 h-full md:h-auto">
        <div class="fixed inset-0 bg-black opacity-50"></div>
        <!-- Modal content -->
        <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
            <div class="flex justify-end p-2 bg-[#66CCFF]">
                <div class="px-6">
                    <h3 class="text-xl font-medium text-white dark:text-white">Đổi mật khẩu</h3>
                </div>
                <button type="button" onclick=""
                    class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-toggle="password-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <form id="modalPasswirdForm" class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                @csrf
                <div>
                    <label for="mdcp1" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Họ
                        tên</label>
                    <input type="text" name="mdcp1" id="mdcp1"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="họ tên">
                </div>
                <div>
                    <label for="mdcp2"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Email</label>
                    <input type="text" name="mdcp2" id="mdcp2"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="email@gmail.com">
                </div>
                <div>
                    <label for="mdcp3" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Tên
                        đăng
                        nhập</label>
                    <input type="text" name="mdcp3" id="mdcp3"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="tên đăng nhập">
                </div>

                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Đăng ký</button>
            </form>
        </div>
    </div>
</div>
<!-- end of change password modal -->
<script>
var accId = document.getElementById("authUserId").value;
$(document).ready(function() {
    getGenreList();
    $('#modalLoginForm').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{{ route('modalLogin') }}',
            data: $(this).serialize(),
            beforeSend: function() {
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
            },
            success: function(response) {
                Swal.close();
                if (response.success) {
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Không thể đăng nhập',
                        text: response.message
                    });
                }
            }
        })
    });

    $('#modalRegisterForm').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{{ route('modalRegister') }}',
            data: $(this).serialize(),
            beforeSend: function() {
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
            },
            success: function(response) {
                Swal.close();
                if (response.success) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Đăng ký thành công',
                        confirmButtonText: 'OK',
                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        if (result.isConfirmed) {
                            location.reload();
                        };
                    });
                } else if (response.error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Không thể đăng ký',
                        text: response.message
                    });
                }
            },
        })
    });
});

function closeModalLogin() {
    $('#authentication-modal').modal('hide');
    $('#mdusname').val('');
    $('#mduspassword').val('');
};

function closeModalRegister() {
    $('#register-modal').modal('hide');
    $('#mdregfullname').val('');
    $('#mdregemail').val('');
    $('#mdregusname').val('');
    $('#mdreguspassword').val('');
};

function getGenreList() {
    axios.get('/api/genres?type=1')
        .then(function(response) {
            var genList = document.getElementById("genresList");
            while (genList.firstChild) {
                genList.removeChild(genList.firstChild);
            }
            var mvgenres = response.data.genres;
            mvgenres.forEach(function(mvg) {
                var li = document.createElement("li");
                var link = document.createElement("a");
                link.href = "/genres/mvg" + mvg.mvgenre_id + "-" + mvg.mvgenre_en_name;
                link.className =
                    "block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white";
                link.textContent = mvg.mvgenre_vi_name;
                li.appendChild(link);
                genList.appendChild(li);
            });
        });
};

function closeModalEditProfile() {

};
</script>