var currentPage = 1;
var defaultImageUrl = '/img/banner.png';

document.addEventListener("DOMContentLoaded", function () {
    getMovies();
    // Lấy tất cả các .grid-item

});

function addTooltip() {
    var gridItems = document.querySelectorAll('.grid-item');

    // Lặp qua từng .grid-item để thêm sự kiện hover
    gridItems.forEach(function (gridItem) {
        var tooltip = document.createElement('div');
        tooltip.className = 'tooltip';

        // Lấy thông tin bộ phim từ các phần tử con của .grid-item
        var title = gridItem.querySelector('h3').textContent;

        // Hiển thị thông tin trong tooltip
        tooltip.innerHTML = '<h3>' + title + '</h3>';

        // Thêm tooltip vào .grid-item
        gridItem.appendChild(tooltip);
    });
    // Tiếp theo, lặp qua từng phần tử để gán sự kiện "onclick"
    gridItems.forEach(function (gridItem) {
        gridItem.onclick = function () {
            // Truyền URL bạn muốn chuyển hướng vào hàm redirectToWebsite
            redirectToWebsite("/movies/" + gridItem.querySelector('.mvid').textContent + "@title=" +
            gridItem.querySelector('.mvurl').textContent); // Thay URL bằng URL thích hợp
        };
    });
}

// Xóa tất cả các phần tử con trong danh sách phim
function removeAllMovieItems() {
    var movieList = document.getElementById("movie-list");
    while (movieList.firstChild) {
        movieList.removeChild(movieList.firstChild);
    }
}

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


function redirectToWebsite(url) {
    window.location.href = url;
}

