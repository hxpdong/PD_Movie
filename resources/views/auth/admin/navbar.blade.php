@include ('component.head-script')
<!-- navbar.blade.php -->
<!-- component -->
<header id="pdmv-navbar">
    @if(auth()->check())
    <input type="hidden" id="authUserId" value="{{ auth()->user()->id }}">
    @else

    <input type="hidden" id="authUserId" value="">
    @endif
    <nav class="bg-gray-500 border-gray-200 px-4 md:px-6 py-2.5 dark:bg-gray-800">

        <div class="block md:hidden">
            <div class="flex items-center w-full justify-center">
                <a href="/" class="flex">
                    <img src="/img/fav-removebg.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                    <span class="self-center text-xl font-semibold whitespace-nowrap text-black">PDMovie</span>
                </a>
            </div>
        </div>
        <div class="flex flex-wrap justify-center items-center mx-auto max-w-screen-xl">
            <div class="flex w-full">
                <div class="flex items-left justify-left md:order-2 mt-3 md:hidden">
                    <button data-collapse-toggle="mobile-menu-2" type="button" id="btn-open-sidebar"
                        class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 bg-white rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
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
                <div class="flex items-center justify-center md:order-2 w-full mt-3 md:hidden">
                    @if(auth()->check())
                    <div class="px-5">
                        <nav>
                            <div>
                                <span class="font-medium">
                                    @if(auth()->user()->fullname)
                                    {{ auth()->user()->fullname }} ({{ auth()->user()->name }})
                                    @else
                                    {{ auth()->user()->name }}
                                    @endif
                                </span>
                            </div>
                        </nav>
                    </div>
                    <a href="/logoutHeader"
                                class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 md:px-5 py-2 md:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">Đăng
                                xuất</a>
                    @endif
                </div>
            </div>


            <div class="hidden justify-between items-center w-full md:flex md:w-auto md:order-1" id="mobile-menu-2">
                <ul class="flex flex-col mt-4 font-medium md:flex-row md:space-x-8 md:mt-0 md:items-center">
                    <li>
                        <a href="/"
                            class="rounded text-white md:text-black hover:text-black hover:bg-gray-200 bg-gray-700 md:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full md:w-auto">
                            <img src="/img/fav-removebg.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                            <span
                                class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">PDMovie</span>
                        </a>
                    </li>
                    <li>
                        <form class="mb-0">
                            <div class="relative">
                                <input type="search" id="default-search"
                                    class="md:w-72 w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
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
                        <div class="items-center justify-center md:order-2 w-full hidden md:flex">
                            @if(auth()->check())
                            <div>
                                <nav>
                                    <div>

                                        <span>
                                            @if(auth()->user()->fullname)
                                            {{ auth()->user()->fullname }} ({{ auth()->user()->name }})
                                            @else
                                            {{ auth()->user()->name }}
                                            @endif
                                        </span>


                                    </div>
                                </nav>
                            </div>
                            <a href="/logoutHeader"
                                class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 md:px-5 py-2 md:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">Đăng
                                xuất</a>
                            @endif
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>