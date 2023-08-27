@include('/component.header')
<!DOCTYPE html>
<html>

<head>
    <title>List of Movies</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/demofilm.css">
</head>

<body>
    {{--
    <div id="bd-mvdetail">
        <div class="mvdetail-container">
            <div id="mvdetail-grid">
                <div class="mvdetail-grid-item">
                    <img id="mvdetail-img" src="">
                </div>
                <div class="mvdetail-grid-item">
                    <div id="mvdetail-title"></div>
                    <div id="mvdetail-directors"></div>
                    <div id="mvdetail-actors"></div>
                </div>
            </div>
        </div>
    </div>
    --}}
    <!-- Watch Movie modal -->
    <div id="watchMovieModal" aria-hidden="true"
        class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full"
        data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="relative w-full max-w-7xl max-h-full">
            <!-- Modal content -->
            <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
                <div class="flex justify-end p-2">
                    <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                        data-modal-toggle="watchMovieModal">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </div>
                <div class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8">
                    @csrf
                    <h3 class="text-xl font-medium text-gray-900 dark:text-white">Xem phim</h3>
                    <div class="responsive-container container mx-auto">
                        <iframe class="responsive-iframe" src="https://player.vimeo.com/video/854102726" frameborder="0"
                            allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="flex flex-col justify-center">
        <div id="mvdetail-grid">
            <!--FILMDETAIL-->
            <div class="py-3 sm:mx-auto mvdetail-grid-item">
                <div class="bg-white shadow-lg border-gray-100 border rounded-3xl p-8 flex space-x-8">
                    <div class="w-1/2 flex justify-center h-screen">
                        <div class="w-full mx-auto text-center">
                            <img class="mx-auto rounded-3xl shadow-lg" id="mvdetail-img" src="">
                            <button data-modal-target="watchMovieModal" data-modal-toggle="watchMovieModal"
                                class="mt-2 bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">
                                Xem phim
                            </button>
                        </div>
                    </div>
                    <div class="flex flex-col w-1/2 space-y-4">
                        <div>
                            <span class="text-sm text-gray-400">Số lượt đánh giá: </span><span
                                class="text-sm text-gray-400" id="mvdetail-numrating"></span>
                        </div>
                        <div class="flex justify-between items-start">
                            <div class="text-3xl font-bold" id="mvdetail-title"></div>
                            <div class="bg-[#f5e50b] font-bold rounded-xl p-2"><span id="mvdetail-rating"></span>/5.0
                            </div>
                        </div>
                        <div>
                            <div class="text-1xl font-bold" id="mvdetail-title-en"></div>
                        </div>
                        <div>
                            <div class="text-sm text-gray-400">Đạo diễn:</div>
                            <div class="text-lg text-gray-800" id="mvdetail-directors"></div>
                        </div>
                        <div>
                            <div class="text-sm text-gray-400">Diễn viên:</div>
                            <div class="text-lg text-gray-800" id="mvdetail-actors"></div>
                        </div>
                        <div>
                            <div class="text-sm text-gray-400">Nội dung:</div>
                            <div class=" text-gray-800 text-justify" id="mvdetail-content">
                                </divp>
                            </div>

                            <div class="flex text-2xl font-bold text-a"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--COMMENTS-->
            <div class="py-3 sm:mx-auto mvdetail-grid-item">
                <section class="bg-white shadow-lg border-gray-100 border rounded-3xl p-8 flex space-x-8">
                    <div class="max-w-2xl mx-auto px-4  w-full">
                        <div class="flex justify-between items-center mb-6">
                            <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">Bình luận
                                (<span id="numofcmt">0</span>)
                            </h2>
                        </div>
                        @if(auth()->check())
                        <div class="star-rating">
                            <input type="radio" name="rating" id="star5" value="5" />
                            <label for="star5" title="Rất tốt"></label>
                            <input type="radio" name="rating" id="star4" value="4" />
                            <label for="star4" title="Tốt"></label>
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
                                    placeholder="Viết bình luận..." required></textarea>
                            </div>
                            <div class="flex justify-center">
                                <button type="submit"
                                    class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-[#66CCFF] rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                                    Gửi đánh giá
                                </button>
                            </div>
                        </form>
                        @else
                        <form class="flex justify-center">
                            <button
                                class="block text-white bg-[#66CCFF] hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                type="button" data-modal-toggle="authentication-modal">
                                Đăng nhập để gửi đánh giá
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
    </div>
    <script src="/js/detail-movie.js"></script>

    <script>
    var currentCmtPage = 1;

    function getComments(mid, page) {
        axios.get('/api/comments/' + mid + '?page=' + page)
            .then(function(response) {
                removeAllCommentItems();
                var commentList = document.getElementById("comment-list");
                var comments = response.data.results.comments;

                comments.forEach(function(cmt) {
                    var cntcmt = cmt.comment_id;
                    commentItem = document.createElement("article");
                    commentItem.className =
                        "p-6 mb-6 text-base bg-white border-t border-gray-200 dark:border-gray-700 dark:bg-gray-900";

                    var footer = document.createElement("footer");
                    footer.className = "flex justify-between items-center mb-2";

                    // Tạo phần tử div trong footer
                    var divFooter = document.createElement("div");
                    divFooter.className = "flex items-center";

                    // Tạo phần tử img trong divFooter
                    var img = document.createElement("img");
                    img.className = "mr-2 w-6 h-6 rounded-full";
                    img.src = "/img/fav.png";
                    img.alt = cmt.user_id;

                    // Tạo phần tử p trong divFooter cho tên tác giả
                    var authorName = document.createElement("p");
                    authorName.className =
                        "inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white";
                    authorName.textContent = cmt.usname;

                    // Tạo phần tử p trong divFooter cho ngày đăng
                    var publishDate = document.createElement("p");
                    publishDate.className = "text-sm text-gray-600 dark:text-gray-400";
                    var time = document.createElement("time");
                    //time.setAttribute("pubdate", "");
                    time.setAttribute("datetime", "2022-03-12");
                    time.setAttribute("title", "March 12th, 2022");
                    time.textContent = cmt.commentTime;
                    publishDate.appendChild(time);

                    // Gắn các phần tử con vào divFooter
                    divFooter.appendChild(img);
                    divFooter.appendChild(authorName);
                    divFooter.appendChild(publishDate);

                    // Gắn các phần tử con vào footer
                    footer.appendChild(divFooter);

                    // Tạo phần tử p cho nội dung bài viết
                    var articleContent = document.createElement("p");
                    articleContent.className = "text-gray-500 dark:text-gray-400 text-justify";
                    articleContent.textContent = cmt.comment;

                    // Gắn các phần tử con vào article
                    commentItem.appendChild(footer);
                    commentItem.appendChild(articleContent);

                    commentList.appendChild(commentItem);

                });
                document.getElementById("load-prev-cmt-button").disabled = response.data.results.current_page === 1;
                document.getElementById("load-next-cmt-button").disabled = response.data.results.current_page ===
                    response.data.results.last_page;
                document.getElementById("numofcmt").innerHTML = response.data.results.total;
            });
    }

    function removeAllCommentItems() {
        var commentList = document.getElementById("comment-list");
        while (commentList.firstChild) {
            commentList.removeChild(commentList.firstChild);
        }
    }


    document.addEventListener("DOMContentLoaded", function() {
        var mid = getMovieIdFromURL();
        getComments(mid, currentCmtPage);

        var form = document.getElementById("postcmt");
        if (form) {
            axios.get('/api/ratings/' + accId + '/' + mid)
                .then(function(response) {
                    var rating = response.data.rating;
                    if (rating) {
                        rating.forEach(function(rt) {
                            var ratingValue = parseFloat(rt.rating);
                            switch (ratingValue) {
                                case 1.0:
                                    // Xử lý khi rating là 1
                                    document.getElementById("star1").checked = true;
                                    break;
                                case 2.0:
                                    // Xử lý khi rating là 2
                                    document.getElementById("star2").checked = true;
                                    break;
                                case 3.0:
                                    // Xử lý khi rating là 3
                                    document.getElementById("star3").checked = true;
                                    break;
                                case 4.0:
                                    // Xử lý khi rating là 4
                                    document.getElementById("star4").checked = true;
                                    break;
                                case 5.0:
                                    // Xử lý khi rating là 5
                                    document.getElementById("star5").checked = true;
                                    break;
                                default:

                                    break;
                            }
                        });
                    }
                });

            const stars = document.getElementsByName('rating');
            const ratingOutput = document.getElementById(
                'starpoint'); // Thay 'rating-output' bằng ID của phần tử hiển thị số sao đã chọn

            stars.forEach(star => star.addEventListener('click', () => {
                var selectedRating = event.target.value;
                var acclogged = accId;
                var currentmov = getMovieIdFromURL();
                ratingOutput.innerText = `Đánh giá: ${selectedRating} sao`;
                console.log('danhgia: ' + selectedRating);
                sendRatingToAPI(selectedRating, acclogged, currentmov);
            }));

            function sendRatingToAPI(rating, acclogged, currentmov) {
                axios.post('/api/postrating', {
                        accId: acclogged,
                        mId: currentmov,
                        ratingpoint: rating
                    })
                    .then(function(response) {
                        // Xử lý phản hồi từ API nếu cần
                    })
                    .catch(function(error) {
                        console.error(error);
                    });
            }



            // Thêm một trường input ẩn vào biểu mẫu để chứa giá trị accId
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "accId"; // Đặt tên trường input tùy theo yêu cầu của bạn
            input.value = accId;
            // Thêm trường input vào biểu mẫu
            form.appendChild(input);


            var mid = getMovieIdFromURL();
            var input2 = document.createElement("input");
            input2.type = "hidden";
            input2.name = "mId";
            input2.value = mid;
            form.appendChild(input2);

            form.addEventListener("submit", function(event) {
                event.preventDefault(); // Ngăn form submit theo cách thông thường
                var postCommentUrl = '/api/postcomment';
                // Gửi request POST bằng AJAX hoặc Fetch API
                fetch(postCommentUrl, {
                        method: "POST",
                        body: new FormData(form),
                    })
                    .then(function(response) {
                        return response.json();
                    })
                    .then(function(data) {
                        if (data.success === true) {
                            // Thực hiện hành động nếu success là true (VD: điều hướng hoặc hiển thị thông báo)
                            //alert("Post successful!\n");
                            //getMovies(getPageFromURL());
                            document.getElementById("comment").value = '';
                            currentCmtPage = 1;
                            getComments(mid, currentCmtPage);
                        } else {
                            // Xử lý trường hợp không thành công (VD: hiển thị thông báo lỗi)
                            alert("Post failed. Please try again.");
                        }
                    })
                    .catch(function(error) {
                        // Xử lý lỗi kết nối hoặc lỗi từ server
                        alert("An error occurred. Please try again later.");
                    });
            });
        }

    });

    function loadNextComment() {
        var mid = getMovieIdFromURL();
        currentCmtPage = currentCmtPage + 1;
        getComments(mid, currentCmtPage);
    }

    function loadPrevComment() {
        if (currentCmtPage > 1) {

            var mid = getMovieIdFromURL();
            currentCmtPage = currentCmtPage - 1;
            getComments(mid, currentCmtPage);
        }
    }

    function getMovieIdFromURL() {
        var currentURL = window.location.href;
        var regexPattern = /\/movies\/([a-zA-Z0-9\-_]+)/;
        var match = currentURL.match(regexPattern);
        if (match && match[1]) {
            return match[1]; // Trả về chuỗi từ regex match
        }
        return null;
    }
    </script>
</body>

</html>