const defaultImageUrl = '/img/banner.png';
const constMvid = getMovieIdFromURL();
if (!constMvid) {
    window.location.href = "/";
}
document.addEventListener("DOMContentLoaded", function () {
    loadMovieDetail(constMvid);
    getRelatedMovies();
});

function getMovieIdFromURL() {
    var currentURL = window.location.href;
    var regexPattern = /\/related\/mv(\d+)-/;
    var match = currentURL.match(regexPattern);
    if (match && match[1]) {
        return match[1]; // Trả về số sau dấu "-" cuối cùng trong URL
    }
    return null;
}

function loadMovieDetail(movieId) {
    axios.get('/api/movies/' + movieId)
        .then(function (response) {
            var moviedt = response.data.movie_detail;
            console.log("loaded");
            if (moviedt) {
                moviedt.forEach(function (movie) {
                    document.getElementById("movie-title").textContent = movie.title_en;
                    document.getElementById("movie-img").onclick = function(){
                        window.location.href = "/movies/mv" + movie.movie_id + "-" + movie.movie_url;
                    }
                    posterElement = document.getElementById("movie-img");
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0) {
                            posterElement.src = movie.posterURL;
                        } else if (movie.typeOfPosterURL == 1) {
                            var movieIdz = movie.posterURL;
                            var xhrmv = new XMLHttpRequest();
                            xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieIdz), true);
                            xhrmv.onload = function () {
                                if (xhrmv.status === 200) {
                                    // Chuyển đổi dữ liệu JSON từ phản hồi API
                                    var response = JSON.parse(xhrmv.responseText);

                                    // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                    posterElement.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                                } else {
                                    // Xử lý trường hợp lỗi khi gọi API
                                    console.error('Error calling the API.');
                                }
                            };
                            xhrmv.send();
                        } else if (movie.typeOfPosterURL == 2) {
                            var movieIdz = movie.posterURL;
                            var xhrmv = new XMLHttpRequest();
                            xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieIdz), true);
                            xhrmv.onload = function () {
                                if (xhrmv.status === 200) {
                                    // Chuyển đổi dữ liệu JSON từ phản hồi API
                                    var response = JSON.parse(xhrmv.responseText);

                                    // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                    posterElement.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                                } else {
                                    // Xử lý trường hợp lỗi khi gọi API
                                    console.error('Error calling the API.');
                                }
                            };
                            xhrmv.send();
                        } else {
                            posterElement.src = defaultImageUrl;
                        }
                    }
                    // posterElement.src = movie.posterURL;
                    else posterElement.src = defaultImageUrl;
                    posterElement.onerror = function () {
                        // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                        if (movie.posterURL != null) {
                            if (movie.typeOfPosterURL == 0)
                                posterElement.src = movie.posterURL;
                            else posterElement.src = defaultImageUrl;
                        } else posterElement.src = defaultImageUrl;
                    };
                });
            } else {
                window.location.href = "/";
            };
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getRelatedMovies() {
    axios.get('/api/movies/recommended-by-movie/' + constMvid + "?num=99" + "&userid=" + accId)
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("movie-list");
            var movies = response.data.recommended_movies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_en;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0) {
                        image.src = movie.posterURL;
                    } else if (movie.typeOfPosterURL == 1) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else if (movie.typeOfPosterURL == 2) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else {
                        image.src = defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0)
                            image.src = movie.posterURL;
                        else image.src = defaultImageUrl;
                    } else image.src = defaultImageUrl;
                };
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height = "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height = "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_en;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Year: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Length: " + movie.videoLength;
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