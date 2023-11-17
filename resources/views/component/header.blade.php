@include ('component.head-script')
<!-- component -->
<header id="headerLoginInfo">
    @if(auth()->check())
    <input type="hidden" id="authUserId" value="{{ auth()->user()->id }}">
    @else

    <input type="hidden" id="authUserId" value="">
    @endif
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
            <div class="flex items-center justify-center lg:order-2 w-full mt-3 lg:hidden">
                @if(auth()->check())
                <div>
                    <nav>
                        <div @click.away="open = false" class="relative" x-data="{ open: false }">
                            <button @click="open = !open"
                                class="flex flex-row items-center space-x-2 w-full px-4 py-2 text-sm font-semibold text-left bg-transparent md:w-auto md:inline md:mt-0 md:ml-4 hover:bg-gray-200 focus:bg-[#66CCFF] focus:outline-none focus:shadow-outline">
                                <span>
                                    @if(auth()->user()->fullname)
                                    {{ auth()->user()->fullname }}
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
                                        href="/users/{{ auth()->user()->name }}">{{ __('userpage') }}</a>
                                    <button data-modal-toggle="profile-modal" onclick="openProfileModal()"
                                        class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                                        {{ __('editprofile') }}</button>
                                    <button data-modal-toggle="password-modal"
                                        class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                                        {{ __('changepassword') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <button onclick="window.location.href = '/logoutHeader'; localStorage.clear();"
                    class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">{{ __('logout') }}
                </button>

                @else
                {{ __('guest') }}!
                <button data-modal-toggle="authentication-modal"
                    class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">{{ __('login') }}</button>
                <button data-modal-toggle="register-modal"
                    class="text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">{{ __('register') }}</button>
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
                        <a href="/"
                            class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto">
                            <img src="/img/fav-removebg.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo" />
                            <span
                                class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">PDMovie</span>
                        </a>
                    </li>
                    <li>
                        <form class="mb-0">
                            <div class="relative">
                                <input type="search" id="default-search"
                                    class="lg:w-72 w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="{{ __('search') }}..." required name="kwsearch">
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
                        <div
                            class="flex justify-center rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-2 py-2.5 text-center items-center w-full lg:w-auto">
                            <span class="mr-2">{{ __('genres') }}</span>
                            <select class="w-48" id="genresList" onchange="redirectToGenre()">
                            </select>
                        </div>
                    </li>
                    @if(auth()->check())
                    <li>
                        <a href="/recommend"
                            class="rounded text-white lg:text-black hover:text-black hover:bg-gray-200 bg-gray-700 lg:bg-transparent  focus:ring-4 focus:outline-none focus:bg-[#66CCFF] font-medium px-5 py-2.5 text-center inline-flex items-center w-full lg:w-auto"
                            aria-current="page">{{ __('recommended') }}</a>
                    </li>
                    @endif
                    <li>
                        <div class="items-center justify-center lg:order-2 w-full hidden lg:flex">
                            @if(auth()->check())
                            <div>
                                <nav>
                                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                                        <button @click="open = !open"
                                            class="flex flex-row items-center space-x-2 w-full px-4 py-2 text-sm font-semibold text-left bg-transparent md:w-auto md:inline md:mt-0 md:ml-4 hover:bg-gray-200 focus:bg-[#66CCFF] focus:outline-none focus:shadow-outline">
                                            <span>
                                                @if(auth()->user()->fullname)
                                                {{ auth()->user()->fullname }}
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
                                                    href="/users/{{ auth()->user()->name }}">{{ __('userpage') }}</a>
                                                <button data-modal-toggle="profile-modal" onclick="openProfileModal()"
                                                    class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                                                    {{ __('editprofile') }}</button>
                                                <button data-modal-toggle="password-modal"
                                                    class="font-normal w-full text-left block px-4 py-2 mt-2 text-sm bg-white md:mt-0 focus:text-gray-900 hover:bg-indigo-100 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                                                    {{ __('changepassword') }}
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                            <button onclick="window.location.href = '/logoutHeader'; localStorage.clear();"
                                class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">{{ __('logout') }}
                            </button>
                            @else
                            {{ __('guest') }}!
                            <button data-modal-toggle="authentication-modal"
                                class="text-gray-800 bg-white mx-1 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800">{{ __('login') }}</button>
                            <button data-modal-toggle="register-modal"
                                class="text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">{{ __('register') }}</button>
                            @endif
                        </div>
                    </li>
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
                    <h3 class="text-xl font-medium text-white dark:text-white">{{ __('login') }}</h3>
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
                    <label for="email" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('username') }}</label>
                    <input type="text" name="mdusname" id="mdusname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="{{ __('username') }}">
                </div>
                <div>
                    <label for="password" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('password') }}</label>
                    <input type="password" name="mduspassword" id="mduspassword" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    {{ __('login') }}</button>
            </form>

            <div class="space-y-4 px-6 lg:px-8 pb-4">
                <div class="flex justify-between">
                    <p class="mt-2 text-sm text-black">
                        {{ __('forgotpassword') }}
                        <a class="text-blue-600 decoration-2 hover:underline font-medium" href="/forgot-password">
                            {{ __('resetpassword') }}
                        </a>
                    </p>
                </div>
                <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
                    {{ __('donthaveaccount') }} <button data-modal-toggle="register-modal"
                        class="text-blue-700 hover:underline dark:text-blue-500">{{ __('register') }}</button>
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
                    <h3 class="text-xl font-medium text-white dark:text-white">{{ __('register') }}</h3>
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
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('fullname') }}</label>
                    <input type="text" name="mdregfullname" id="mdregfullname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="{{ __('fullname') }}">
                </div>
                <div>
                    <label for="mdregemail"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Email</label>
                    <input type="email" name="mdregemail" id="mdregemail"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="email@gmail.com">
                </div>
                <div>
                    <label for="mdregusname" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('username') }}</label>
                    <input type="text" name="mdregusname" id="mdregusname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        placeholder="{{ __('username') }}">
                </div>
                <div>
                    <label for="mdreguspassword"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('password') }}</label>
                    <input type="password" name="mdreguspassword" id="mdreguspassword" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <div>
                    <label for="mdreguspassword-check"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">
                        {{ __('confirmpassword') }}
                    </label>
                    <input type="password" name="mdreguspassword-check" id="mdreguspassword-check"
                        placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    {{ __('register') }}</button>
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
                    <h3 class="text-xl font-medium text-white dark:text-white">{{ __('editprofile') }}</h3>
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
                @if(auth()->check())
                <div>
                    <input type="hidden" name="uptAccId" id="uptAccId"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        value="{{ auth()->user()->id }}">
                </div>
                <div>
                    <label for="mdpf1" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">{{ __('fullname') }}</label>
                    <input type="text" name="uptfullname" id="uptfullname"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        value="{{ auth()->user()->fullname }}">
                </div>
                <div>
                    <label for="mdpf2"
                        class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Email</label>
                    <input type="text" name="uptemail" id="uptemail"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        value="{{ auth()->user()->email }}">
                </div>

                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    {{ __('confirm') }}</button>
                @endif
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
                    <h3 class="text-xl font-medium text-white dark:text-white">{{ __('changepassword') }}</h3>
                </div>
                <button type="button" onclick="closeModalPassword()"
                    class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                    data-modal-toggle="password-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <form id="modalPasswordForm" class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                @csrf
                @if(auth()->check())
                <div>
                    <input type="hidden" name="changePassAccId" id="changePassAccId"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                        value="{{ auth()->user()->id }}">
                </div>
                @endif
                <div>
                    <label for="mdcp1" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">
                    {{ __('oldpassword') }}
                    </label>
                    <input type="password" name="uptoldpassword" id="uptoldpassword"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <div>
                    <label for="mdcp2" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">
                    {{ __('newpassword') }}
                    </label>
                    <input type="password" name="uptnewpassword" id="uptnewpassword"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>
                <div>
                    <label for="mdcp3" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">
                    {{ __('confirmpassword') }}
                    </label>
                    <input type="password" name="uptconfirmpassword" id="uptconfirmpassword"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
                </div>

                <button type="submit"
                    class="w-full text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    {{ __('changepassword') }}</button>
            </form>
        </div>
    </div>
</div>
@include ('component.head-changeLang')
<!-- end of change password modal -->
<script src="/js/storeRecommend.js"></script>
<script>
const apiToken = localStorage.getItem('log_token');
var accId = document.getElementById("authUserId").value;
const headers = {
    'Authorization': apiToken,
    'Content-Type': 'application/json'
};
var oldFullname = document.getElementById("uptfullname");
if (oldFullname) oldFullname = oldFullname.value;
var oldEmail = document.getElementById("uptemail");
if (oldEmail) oldEmail = oldEmail.value;
$(document).ready(function() {
    getGenreList2();
    $('#modalLoginForm').submit(function(e) {
        e.preventDefault();

        // Serialize the form data
        const formData = $(this).serialize();

        // Send a POST request with Axios
        axios.post('/modalLogin', formData)
            .then(response => {
                if (response.data.success) {
                    const newToken = response.data.api_token;
                    // Lưu newToken vào Local Storage hoặc Cookie
                    localStorage.setItem('log_token', newToken);
                    localStorage.setItem('accId', response.data.accid);
                    Swal.close();
                    getRCMMoviesToLocalStorage();
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cannot login',
                        text: response.data.message
                    });
                }
            })
            .catch(error => {
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'An error occurred while processing the request.'
                });
            });
    });

    $('#modalRegisterForm').submit(function(e) {
        e.preventDefault();
        var passwordField = document.getElementById("mdreguspassword");
        var confirmPasswordField = document.getElementById("mdreguspassword-check");
        var password = passwordField.value;
        var confirmPassword = confirmPasswordField.value;
        if (password === "" || confirmPassword === "") {
            Swal.fire({
                icon: 'error',
                title: 'Required information is not enough!',
                text: 'Please fill in all information and try again.'
            });
        } else if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Password and confirmation password do not match!',
                text: 'Please check your password and re-enter it.'
            });
        } else {
            // Serialize the form data
            const formData = $(this).serialize();

            // Send a POST request with Axios
            axios.post('/modalRegister', formData)
                .then(response => {
                    Swal.close();
                    if (response.data.success) {
                        const newToken = response.data.api_token;
                        // Lưu newToken vào Local Storage hoặc Cookie
                        localStorage.setItem('log_token', newToken);
                        localStorage.setItem('accId', response.data.accid);
                        getRCMMoviesToLocalStorage();
                        Swal.fire({
                            icon: 'success',
                            title: 'Register Success',
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        });
                    } else if (response.data.error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Register Fail',
                            text: response.data.message
                        });
                    }
                })
                .catch(error => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: 'An error occurred while processing the request.'
                    });
                });
        }
    });

    $('#modalProfileForm').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: 'PUT',
            url: '/api/users/update',
            data: $(this).serialize(),
            beforeSend: function(xhr) {
                // Đặt mã token vào tiêu đề "Authorization" của yêu cầu AJAX
                xhr.setRequestHeader('Authorization', apiToken);

                Swal.fire({
                    title: `{{ __('executing') }}`,
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
                        title: 'Successfully updated!',
                        confirmButtonText: 'OK',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        };
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'The operation cannot be performed!',
                        html: response.message,
                    });
                }
            },
            error: function(error) {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'An error occurred while sending the request.'
                });
            }
        });
    });

    $('#modalPasswordForm').submit(function(e) {
        e.preventDefault();
        var passwordField = document.getElementById("uptnewpassword");
        var confirmPasswordField = document.getElementById("uptconfirmpassword");
        var oldPasswordField = document.getElementById("uptoldpassword");
        var password = passwordField.value;
        var confirmPassword = confirmPasswordField.value;
        var oldPassword = oldPasswordField.value;
        if (password === "" || confirmPassword === "" || oldPassword === "") {
            Swal.fire({
                icon: 'error',
                title: 'The information provided is not enough!',
                text: 'Please fill in all information and try again.'
            });
        } else if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Password and confirmation password do not match!',
                text: 'Please check your password and re-enter it.'
            });
        } else {
            $.ajax({
                type: 'PUT',
                url: '/api/users/changepassword',
                data: $(this).serialize(),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Authorization', apiToken);
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
                            title: response.message,
                            confirmButtonText: 'OK',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            };
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'The operation cannot be performed!',
                            html: response.message,
                        });
                    }
                }
            })
        }
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
    $('#mdreguspassword-check').val('')
};

function redirectToGenre() {
    var selectedOption = document.getElementById("genresList").value;
    if (selectedOption) {
        var mvgenre_id = selectedOption.split("-")[0];
        var mvgenre_en_name = selectedOption.split("-")[1];
        window.location.href = "/genres/mvg" + mvgenre_id + "-" + mvgenre_en_name;
    }
}

function getGenreList() {
    axios.get('/api/genres?type=1')
        .then(function(response) {
            var genList = document.getElementById("genresList");
            while (genList.firstChild) {
                genList.removeChild(genList.firstChild);
            }
            var mvgenres = response.data.genres;
            mvgenres.forEach(function(mvg) {
                var opt = document.createElement("option");
                opt.value = mvg.mvgenre_id + "-" + mvg.mvgenre_en_name;
                opt.textContent = mvg.mvgenre_vi_name + "/" + mvg.mvgenre_en_name;
                genList.appendChild(opt);
            });
            $('#genresList').select2();
        });
};

function getGenreList2() {
    axios.get('/api/genres?type=1')
        .then(function(response) {
            var genList = document.getElementById("genresList");
            while (genList.firstChild) {
                genList.removeChild(genList.firstChild);
            }
            var mvgenres = response.data.genres;

            var optgroupVi = document.createElement("optgroup");
            optgroupVi.label = "Tiếng Việt";

            var optgroupEn = document.createElement("optgroup");
            optgroupEn.label = "English";

            mvgenres.forEach(function(mvg) {
                var optVi = document.createElement("option");
                optVi.value = mvg.mvgenre_id + "-" + mvg.mvgenre_en_name;
                optVi.textContent = mvg.mvgenre_vi_name;
                optgroupVi.appendChild(optVi);

                var optEn = document.createElement("option");
                optEn.value = mvg.mvgenre_id + "-" + mvg.mvgenre_en_name;
                optEn.textContent = mvg.mvgenre_en_name;
                optgroupEn.appendChild(optEn);
            });

            genList.appendChild(optgroupEn);
            genList.appendChild(optgroupVi);

            // Thiết lập select2
            $('#genresList').select2();
        });
};


function closeModalEditProfile() {
    $('#uptfullname').val(oldFullname);
    $('#uptemail').val(oldEmail);
};

function closeModalPassword() {
    $('#uptoldpassword').val('');
    $('#uptnewpassword').val('');
    $('#uptconfirmpassword').val('');
};

function openProfileModal() {
    // Fill in the input fields with user data from Laravel


    // Show the modal
    document.getElementById('profile-modal').classList.remove('hidden');
}
</script>