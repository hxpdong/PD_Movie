var currentPage = 1;
var defaultImageUrl = '/img/banner.png';

document.addEventListener("DOMContentLoaded", function () {
    getMoviesFrom();
});

function getMovies() {

    axios.get('/api/movies/recommended/' + accId)
        .then(function (response) {
            removeAllMovieItems();
            var movieList = document.getElementById("movie-list");
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
                    if (movie.typeOfPosterURL == 0) {
                        var posterUrl = '/movie/poster/' + movie.movie_id;
                        var cacheKey = 'movie_poster_' + movie.movie_id;
                        if (localStorage.getItem(cacheKey)) {
                            //console.log("hinh cũ");
                            // Nếu có trong cache, sử dụng dữ liệu từ cache
                            var cachedImageData = localStorage.getItem(cacheKey);
                            image.src = cachedImageData;
                        } else {
                            //console.log("hinh moi");
                            // Nếu không có trong cache, tải hình ảnh từ URL
                            axios.get(posterUrl, { responseType: 'blob' }).then(function (response) {
                                var blob = new Blob([response.data]);
                                var objectURL = URL.createObjectURL(blob);

                                // Lưu hình ảnh vào cache
                                localStorage.setItem(cacheKey, objectURL);

                                // Đặt src của hình ảnh poster bằng URL từ cache
                                image.src = objectURL;
                            }).catch(function (error) {
                                console.error(error);
                            });
                        }
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
                    } else {
                        image.src =defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        image.src = movie.posterURL;
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

function getMoviesFrom() {
    removeAllMovieItems();
    var movieList = document.getElementById("movie-list");
    var parsedArray = [];
    var retrievedData = localStorage.getItem("recommendedMoviesForLoggedUser");
    if (retrievedData) {
        parsedArray = JSON.parse(retrievedData);
    }
    var movies = parsedArray;
    // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
    movies.forEach(function (movie) {
        var movieItem = document.createElement("div");
        movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

        // Tạo thẻ <img> để hiển thị hình ảnh phim
        var image = document.createElement("img");
        image.alt = movie[1];
        image.style.width = '100%';
        image.style.objectFit = "cover";
        image.className = "rounded-t-lg";
        if (movie[9] != null) {
            if (movie[8] == 0) {
                var posterUrl = '/movie/poster/' + movie[0];
                var cacheKey = 'movie_poster_' + movie[0];
                if (localStorage.getItem(cacheKey)) {
                    //console.log("hinh cũ");
                    // Nếu có trong cache, sử dụng dữ liệu từ cache
                    var cachedImageData = localStorage.getItem(cacheKey);
                    image.src = cachedImageData;
                } else {
                    //console.log("hinh moi");
                    // Nếu không có trong cache, tải hình ảnh từ URL
                    axios.get(posterUrl, { responseType: 'blob' }).then(function (response) {
                        var blob = new Blob([response.data]);
                        var objectURL = URL.createObjectURL(blob);

                        // Lưu hình ảnh vào cache
                        localStorage.setItem(cacheKey, objectURL);

                        // Đặt src của hình ảnh poster bằng URL từ cache
                        image.src = objectURL;
                    }).catch(function (error) {
                        console.error(error);
                    });
                }
            } else if (movie[8] == 1) {
                var movieId = movie[9];
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
            } else {
                image.src =defaultImageUrl;
            }
        }
        else image.src = defaultImageUrl;
        image.onerror = function () {
            // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
            if (movie[9] != null) {
                image.src = movie[9];
            } else image.src = defaultImageUrl;
        };
        movieItem.insertAdjacentElement('afterbegin', image);

        // Tạo thẻ <h3> để hiển thị tiêu đề phim
        var mid = document.createElement("h6");
        mid.textContent = movie[0];
        mid.className = "text-ellipsis mvid";
        mid.style.height = "0px";
        movieItem.appendChild(mid);
        // Tạo thẻ <h3> để hiển thị tiêu đề phim
        var murl = document.createElement("h5");
        murl.textContent = movie[11];
        murl.className = "text-ellipsis mvurl";
        murl.style.height = "0px";
        movieItem.appendChild(murl);

        // Tạo thẻ <h3> để hiển thị tiêu đề phim
        var title = document.createElement("h3");
        title.textContent = movie[1];
        title.className = "text-ellipsis mb-2 text-lg font-semibold";
        movieItem.appendChild(title);

        // Tạo thẻ <p> để hiển thị đạo diễn
        var director = document.createElement("p");
        director.textContent = "Năm: " + movie[6];
        director.className = "text-ellipsis";
        movieItem.appendChild(director);

        // Tạo thẻ <p> để hiển thị danh sách diễn viên
        var actors = document.createElement("p");
        actors.textContent = "Thời lượng: " + movie[7];
        actors.className = "text-ellipsis";
        movieItem.appendChild(actors);

        // Thêm thông tin về bộ phim vào danh sách
        movieList.appendChild(movieItem);

    });
    addTooltip();
}