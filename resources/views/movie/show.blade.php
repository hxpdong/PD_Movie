@include('/component.header')
<!DOCTYPE html>
<html>

<head>
    <title>List of Movies</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/demofilm.css">
</head>

<body>
    <!-- Watch Movie modal -->
    <div id="watchMovieModal" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
        data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="relative w-full max-w-7xl max-h-full">
            <div class="fixed inset-0 bg-black opacity-50"></div>
            <!-- Modal content -->
            <form id="getMovieInfoForm">
                <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
                    <div class="flex justify-end p-2 bg-[#66CCFF]">
                        <div class="px-6 ">
                            <h3 class="text-xl font-medium text-white dark:text-white" id="watchmvtitle">{{ __('watchmovie') }}</h3>
                        </div>
                        <button type="button" onclick="closeModalWatchMovie()"
                            class="text-white bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                            data-modal-toggle="watchMovieModal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>
                    <div class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                        <div id="list-chapter-btns"></div>
                        <div class="responsive-container container mx-auto">
                            <iframe id="watchmovievideo" class="responsive-iframe"
                                src="" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="flex justify-center item-center px-3 pb-3">
        <div class="flex flex-col justify-center lg:w-4/5 items-center md:w-full">
            <div class="mvdetail-grid">
                <!--FILMDETAIL-->
                <div class="pt-3 sm:mx-auto mvdetail-grid-item">
                    <div class="bg-white shadow-lg border-gray-100 border rounded-3xl p-8 grid grid-cols-1 sm:grid-cols-2 sm:space-x-8">
                        <div class="flex justify-center h-auto">
                            <div class="w-full mx-auto text-center">
                                <img class="mx-auto rounded-3xl shadow-lg lg:w-3/5 w-full" id="mvdetail-img" src="">
                                <button data-modal-target="watchMovieModal" data-modal-toggle="watchMovieModal"
                                    class="mt-2 bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow"
                                    onclick="getMovieInfoToWatch()">
                                    {{ __('watchmovie') }}
                                </button>
                                <form class="my-6" id="reporterror">
                                    <div
                                        class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                                        <label for="errorContent" class="sr-only">Your report</label>
                                        <textarea id="errorContent" rows="5" cols="100" name="errorContent"
                                            class="resize-none h-auto px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                                            placeholder="{{ __('rpmverr') }}..."></textarea>
                                    </div>
                                    <div class="flex justify-center">
                                        <button type="submit"
                                            class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-[#ff6666] rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                                            {{ __('sendrp') }}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="flex flex-col space-y-4">
                            <div>
                                <span class="text-sm text-gray-400">{{ __('numrt') }}: </span><span
                                    class="text-sm text-gray-400" id="mvdetail-numrating"></span>
                            </div>
                            <div class="flex justify-between items-start">
                                <div class="text-3xl font-bold" id="mvdetail-title"></div>
                                <div class="bg-[#f5e50b] font-bold rounded-xl p-2"><span
                                        id="mvdetail-rating"></span>/5.0
                                </div>
                            </div>
                            <div>
                                <div class="text-1xl font-bold" id="mvdetail-title-en"></div>
                            </div>
                            <div class="grid grid-cols-2">
                                <div>
                                    <div class="text-sm text-gray-400">{{ __('manuyear') }}:</div>
                                    <div class="text-lg text-gray-800" id="mvdetail-manufactureYear"></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-400">{{ __('videolength') }}:</div>
                                    <div class="text-lg text-gray-800" id="mvdetail-videoLength"></div>
                                </div>
                            </div>
                            <div>
                                <div class="text-sm text-gray-400">{{ __('genres') }}:</div>
                                <div class="grid grid-cols-2" id="mvdetail-genres-group">
                                </div>
                            </div>
                            <div>
                                <div class="text-sm text-gray-400">{{ __('directors') }}:</div>
                                <div class="text-lg text-gray-800" id="mvdetail-directors"></div>
                            </div>
                            <div>
                                <div class="text-sm text-gray-400">{{ __('actors') }}:</div>
                                <div class="text-lg text-gray-800" id="mvdetail-actors"></div>
                            </div>
                            <div>
                                <div class="text-sm text-gray-400">{{ __('content') }}:</div>
                                <div class=" text-gray-800 text-justify max-h-48 overflow-auto pr-2" id="mvdetail-content"></div>

                                <div class="flex text-2xl font-bold text-a"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--COMMENTS-->
                <div class="pt-3 mvdetail-grid-item mx-0 md:mx-1">
                    <section class="bg-white shadow-lg border-gray-100 border rounded-3xl p-8 flex space-x-8">
                        <div class="max-w-2xl mx-auto px-4  w-full">
                            <div class="flex justify-between items-center mb-6">
                                <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">{{ __('cmt') }}
                                    (<span id="numofcmt">0</span>)
                                </h2>
                            </div>
                            @if(auth()->check())
                            <div class="star-rating">
                                <input type="radio" name="rating" id="star5" value="5" />
                                <label for="star5" title="Rất hay"></label>
                                <input type="radio" name="rating" id="star4" value="4" />
                                <label for="star4" title="Hay"></label>
                                <input type="radio" name="rating" id="star3" value="3" />
                                <label for="star3" title="Bình thường"></label>
                                <input type="radio" name="rating" id="star2" value="2" />
                                <label for="star2" title="Tệ"></label>
                                <input type="radio" name="rating" id="star1" value="1" />
                                <label for="star1" title="Rất tệ"></label>
                            </div>
                            <div id="starpoint"></div>
                            <form class="mb-6" id="postcmt">
                                <div
                                    class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                                    <label for="comment" class="sr-only">Your comment</label>
                                    <textarea id="comment" rows="6" cols="100" name="comment"
                                        class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                                        placeholder="{{ __('entercmt') }}..." required></textarea>
                                </div>
                                <div class="flex justify-center">
                                    <button type="submit"
                                        class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-[#66CCFF] rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                                        {{ __('sendcmt') }}
                                    </button>
                                </div>
                            </form>
                            @else
                            <form class="flex justify-center">
                                <button
                                    class="block text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button" data-modal-toggle="authentication-modal">
                                    {{ __('login') }} {{ __('to') }} {{ __('sendrating') }}/{{ __('sendcmt') }}
                                </button>
                            </form>
                            @endif
                            <div id="comment-list">
                                {{--
                                <article
                                    class="p-6 mb-6 text-base bg-white border-t border-gray-200 dark:border-gray-700 dark:bg-gray-900">
                                    <footer class="flex justify-between items-center mb-2">
                                        <div class="flex items-center">
                                            <img class="mr-2 w-6 h-6 rounded-full" src="/img/fav.png" alt="Bonnie Green">
                                            <p class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white">
                                                Bonnie Green</p>
                                            <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate
                                                    datetime="2022-03-12" title="March 12th, 2022">Mar. 12, 2022</time></p>
                                        </div>
                                        <button id="dropdownComment3Button" data-dropdown-toggle="dropdownComment3"
                                            class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-400 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                            type="button">
                                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z">
                                                </path>
                                            </svg>
                                            <span class="sr-only">Comment settings</span>
                                        </button>
                                        <!-- Dropdown menu -->
                                        <div id="dropdownComment3"
                                            class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                            <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                                aria-labelledby="dropdownMenuIconHorizontalButton">
                                                <li>
                                                    <a href="#"
                                                        class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                                </li>
                                                <li>
                                                    <a href="#"
                                                        class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                                </li>
                                                <li>
                                                    <a href="#"
                                                        class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </footer>
                                    <p class="text-gray-500 dark:text-gray-400">The article covers the essentials,
                                        challenges,
                                        myths and stages the UX designer should consider while creating the design strategy.
                                    </p>
                                </article>
                                --}}
                            </div>
                            <div id="pagination">
                                <button id="load-prev-cmt-button" onclick="loadPrevComment()"
                                    class="m-2 bg-white hover:bg-[#66CCFF] hover:text-white text-gray-800 py-2 px-4 border border-gray-400 rounded shadow"><i
                                        class="fa fa-angle-double-left" aria-hidden="true"></i></button>
                                <button id="load-next-cmt-button" onclick="loadNextComment()"
                                    class="m-2 bg-white hover:bg-[#66CCFF] hover:text-white text-gray-800 py-2 px-4 border border-gray-400 rounded shadow"><i
                                        class="fa fa-angle-double-right" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="w-full pt-3 md:pt-1">
                <div class="bg-white shadow-lg border-gray-100 border rounded-3xl p-4">
                    <div class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">{{ __('relatemv') }}</div>
                    <div class="bg-[#3a3a3a] p-4 border rounded-3xl mb-2 flex justify-center flex-col">
                        <div id="related-list">
                        </div>
                        <div class="w-full flex justify-center">
                            <a href="" id="linktorelatedpage"
                                class="mt-3 px-5 py-2 bg-cyan-500 text-white duration-300 hover:bg-cyan-700">{{ __('showmore') }}</a>
                        </div>
                    </div>
                    @if(auth()->check())
                        <div class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">{{ __('recommendedforyou') }}</div>
                        <div class="bg-[#3a3a3a] p-4 border rounded-3xl mb-2 flex justify-center flex-col">
                            <div id="recommended-list">
                            </div>
                            <div class="w-full flex justify-center">
                                <a href="/recommend"
                                    class="mt-3 px-5 py-2 bg-cyan-500 text-white duration-300 hover:bg-cyan-700">{{ __('showmore') }}</a>
                            </div>
                        </div>
                    @endif
                    <div class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">{{ __('latestmv') }}</div>
                    <div class="bg-[#3a3a3a] p-4 border rounded-3xl mb-2 flex justify-center flex-col">
                        <div id="new-list">
                        </div>
                        <div class="w-full flex justify-center">
                            <a href="/"
                                class="mt-3 px-5 py-2 bg-cyan-500 text-white duration-300 hover:bg-cyan-700">{{ __('showmore') }}</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="/js/detail-movie.js"></script>
</body>

</html>
@include ('component.footer')