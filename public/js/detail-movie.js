const defaultImageUrl = '/img/banner.png';
document.addEventListener("DOMContentLoaded", function () {
    var movieId = getMovieIdFromURL();
    loadMovieDetail(movieId);
    getLatestMovies();
    if(accId){
        getRecommendedMovies();
    }
});

function loadMovieDetail(movieId) {
    axios.get('/api/movies/' + movieId)
        .then(function (response) {
            var moviedt = response.data.movie_detail;
            console.log("đã load");
            if (moviedt) {
                updateMovieDetail(moviedt);
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}

function updateMovieDetail(movieDetail) {
    var titleElement = document.getElementById("mvdetail-title");
    var titleEnElement = document.getElementById("mvdetail-title-en");
    var directorElement = document.getElementById("mvdetail-directors");
    var actorsElement = document.getElementById("mvdetail-actors");
    var posterElement = document.getElementById("mvdetail-img");
    var contentElement = document.getElementById("mvdetail-content");
    var ratingElement = document.getElementById("mvdetail-rating");
    var numRatingElement = document.getElementById("mvdetail-numrating");
    if (movieDetail) {
        movieDetail.forEach(function (movie) {
            titleElement.innerHTML = movie.title_vi;
            titleEnElement.innerHTML = movie.title_en;
            directorElement.innerHTML = movie.director;
            actorsElement.innerHTML = movie.actors;
            contentElement.innerHTML = movie.content;
            ratingElement.innerHTML = movie.mvpoint;
            numRatingElement.innerHTML = movie.numrating;
            if (movie.posterURL != null)
                posterElement.src = movie.posterURL;
            else posterElement.src = defaultImageUrl;
            document.title = movie.title_vi;
        });
        console.log("đã update");
    }
    //link to director name
    const directorNames = directorElement.textContent.split(',').map(name => name.trim());
    while (directorElement.firstChild) {
        directorElement.removeChild(directorElement.firstChild);
    };
    directorNames.forEach((directorName, index) => {
        const directorLink = document.createElement('a');
        directorLink.textContent = directorName;
        directorLink.href = `/tags/directors/${directorName.replace(/\s+/g, '-').toLowerCase()}`;
        directorElement.appendChild(directorLink);
        if (index !== directorNames.length - 1) {
            directorElement.appendChild(document.createTextNode(', ')); // Thêm dấu phẩy và khoảng trắng, trừ lần cuối
        }
    });
    //link to actor name
    const actorNames = actorsElement.textContent.split(',').map(name => name.trim());
    while (actorsElement.firstChild) {
        actorsElement.removeChild(actorsElement.firstChild);
    };
    actorNames.forEach((actorName, index) => {
        const actorLink = document.createElement('a');
        actorLink.textContent = actorName;
        actorLink.href = `/tags/actors/${actorName.replace(/\s+/g, '-').toLowerCase()}`;
        actorsElement.appendChild(actorLink);
        if (index !== actorNames.length - 1) {
            actorsElement.appendChild(document.createTextNode(', ')); // Thêm dấu phẩy và khoảng trắng, trừ lần cuối
        }
    });
}

function getMovieIdFromURL() {
    var currentURL = window.location.href;
    var regexPattern = /\/movies\/mv(\d+)-/;
    var match = currentURL.match(regexPattern);
    if (match && match[1]) {
        return match[1]; // Trả về số sau dấu "-" cuối cùng trong URL
    }
    return null;
}

var currentCmtPage = 1;

function getComments(mid, page) {
    axios.get('/api/comments/' + mid + '?page=' + page)
        .then(function (response) {
            removeAllCommentItems();
            var commentList = document.getElementById("comment-list");
            var comments = response.data.results.comments;

            comments.forEach(function (cmt) {
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


document.addEventListener("DOMContentLoaded", function () {
    var mid = getMovieIdFromURL();
    getComments(mid, currentCmtPage);

    var form = document.getElementById("postcmt");
    if (form) {
        axios.get('/api/ratings/' + accId + '/' + mid)
            .then(function (response) {
                var rating = response.data.rating;
                if (rating) {
                    rating.forEach(function (rt) {
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
                .then(function (response) {
                    // Xử lý phản hồi từ API nếu cần
                })
                .catch(function (error) {
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

        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn form submit theo cách thông thường
            var postCommentUrl = '/api/postcomment';
            // Gửi request POST bằng AJAX hoặc Fetch API
            fetch(postCommentUrl, {
                method: "POST",
                body: new FormData(form),
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
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
                .catch(function (error) {
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

function getMovieInfoToWatch() {
    var movieId = getMovieIdFromURL();
    var chapterBtn = document.getElementById("list-chapter-btns");
    var chapterSrc = "";
    axios.get('/api/movies/' + movieId)
        .then(function (response) {
            var moviedt = response.data.movie_detail;
            if (moviedt) {
                moviedt.forEach(function (movie) {
                    var mvtitleText = movie.title_vi + " (" + movie.title_en + ")";                    
                    $('#watchmvtitle').text(mvtitleText);
                });
                var chapters = response.data.chapters;
                if(chapters){
                    var cnt = 0;
                    chapters.forEach(function (chapter) {
                        var button = document.createElement("button");
                        button.type = "button";
                        button.className = "chapterBtn mt-2 hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow";
                        button.textContent = chapter.chapter_name;
                        button.addEventListener("click", function() {
                            var btnGroup = document.getElementsByClassName("chapterBtn");
                            var btnArray = Array.from(btnGroup);
                            btnArray.forEach(function (btn) {
                                btn.classList.remove("bg-[#66CCFF]", "text-white");
                                btn.disabled = false;
                            });
                            $('#watchmovievideo').attr('src', chapter.chapterURL);
                            button.classList.add("bg-[#66CCFF]", "text-white");
                            button.disabled = true;
                        });
                        chapterBtn.appendChild(button);
                        if(cnt == 0) {
                            $('#watchmovievideo').attr('src', chapter.chapterURL);
                            button.classList.add("bg-[#66CCFF]", "text-white");
                            button.disabled = true;
                        }
                        cnt++;
                        console.log('cnt: ' + cnt);
                    });
                }
            }
        });
}

function closeModalWatchMovie() {
    $("#watchMovieModal").modal('hide');
    $('#watchmvtitle').text('');
    $('#watchmovievideo').attr('src', '');
    var chapterBtn = document.getElementById("list-chapter-btns");
    while (chapterBtn.firstChild) {
        chapterBtn.removeChild(chapterBtn.firstChild);
    }
}

function getLatestMovies() {

    axios.get('/api/movies?num=6')
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("new-list");
            var movies = response.data.results.movies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_vi;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    image.src = movie.posterURL;
                }
                else image.src = defaultImageUrl;
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height= "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height= "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_vi;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Năm: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Thời lượng: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getRecommendedMovies() {

    axios.get('/api/movies/recommended/' + accId + "?num=6")
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("recommended-list");
            var movies = response.data.results.recommendedmovies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_vi;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    image.src = movie.posterURL;
                }
                else image.src = defaultImageUrl;
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height= "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height= "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_vi;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Năm: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Thời lượng: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}