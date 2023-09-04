var currentPage = 1;
var defaultImageUrl = '/img/banner.png';

document.addEventListener("DOMContentLoaded", function () {
    var initialPage = getPageFromURL();
    getMovies(initialPage);
    // Lấy tất cả các .grid-item
    /*
    var form = document.getElementById("SignUpForm");
    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Ngăn form submit theo cách thông thường

        // Gửi request POST bằng AJAX hoặc Fetch API
        fetch(form.action, {
            method: "POST",
            body: new FormData(form),
        })
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                if (data.success === true) {
                    // Thực hiện hành động nếu success là true (VD: điều hướng hoặc hiển thị thông báo)
                    $newuser = data.newuser;
                    alert("Post successful!\n" + $newuser.usname);
                    //getMovies(getPageFromURL());
                } else {
                    // Xử lý trường hợp không thành công (VD: hiển thị thông báo lỗi)
                    alert("Post failed. Please try again.");
                }
            })
            .catch(function (error) {
                // Xử lý lỗi kết nối hoặc lỗi từ server
                alert("An error occurred. Please try again later.");
            });
    });*/
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
            redirectToWebsite("/movies/" + gridItem.querySelector('.mvurl').textContent + "-" +
            gridItem.querySelector('.mvid').textContent); // Thay URL bằng URL thích hợp
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

function getMovies(page) {

    axios.get('/api/movies?page=' + page)
        .then(function (response) {
            removeAllMovieItems();
            var movieList = document.getElementById("movie-list");
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
            // Cập nhật trạng thái của nút Previous và Next
            var prevButton = document.getElementById("prev-button");
            var nextButton = document.getElementById("next-button");
            prevButton.disabled = response.data.results.current_page === 1;
            nextButton.disabled = response.data.results.current_page === response.data.results.last_page;
            var pageButtons = document.getElementById("page-buttons");
            pageButtons.innerHTML = generatePageButtons(response.data.results.current_page, response.data.results.last_page);
            // Lưu trạng thái trang hiện tại
            currentPage = response.data.results.current_page;
        })
        .catch(function (error) {
            console.log(error);
        });
}

function prevPage() {
    if (currentPage > 1) {
        //getMovies(currentPage - 1);
        //updatePageURL(currentPage - 1);
        redirectToWebsite('/movies?page=' + (currentPage-1));
    }
}

function nextPage() {
    //getMovies(currentPage + 1);
    //updatePageURL(currentPage + 1);
    redirectToWebsite('/movies?page=' + (currentPage+1));
}

function generatePageButtons(currentPage, lastPage) {
    var pageButtons = '';
    for (var i = 1; i <= lastPage; i++) {
        if (i === currentPage) {
            // Nếu đây là trang hiện tại, thì không thêm sự kiện onclick
            pageButtons += '<button class="active" style="margin:2px">' + i + '</button>';
        } else {
            // Nếu không, thêm sự kiện onclick
            pageButtons += '<button onclick="gotoPage(' + i + ')" style="margin:2px">' + i + '</button>';
        }
    }
    return pageButtons;
}

function gotoPage(page) {
    //getMovies(page);
    //updatePageURL(page);
    redirectToWebsite('/movies?page=' + page);
}

function updatePageURL(page) {
    var newURL = window.location.origin + window.location.pathname + '?page=' + page;
    window.history.pushState({ page: page }, "Page " + page, newURL);
}
function getPageFromURL() {
    var urlParams = new URLSearchParams(window.location.search);
    return parseInt(urlParams.get('page')) || 1;
}

function getDriveFileId(url) {
    const match = url.match(/\/file\/d\/([a-zA-Z0-9_-]+)\//);
    if (match && match[1]) {
        return match[1];
    } else {
        console.error("Invalid Google Drive URL");
        return null;
    }
}

/*
const driveUrl = "https://drive.google.com/file/d/1Su46sVT_-n_87Hjz1KQls6KlAULNUrm3/view?usp=drive_link";
const fileId = getDriveFileId(driveUrl);
const fileURL = "https://drive.google.com/uc?id=" + fileId;
console.log("File ID:", fileId, "\n", "File URL: ", fileURL);
*/

function changeUrl() {
    const urlimg = document.getElementById("imageurl").value;
    const newurl = getDriveFileId(urlimg);
    const fileURL = "https://drive.google.com/uc?id=" + newurl;
    document.getElementById("url_storage_here").innerHTML = fileURL;
}

function redirectToWebsite(url) {
    window.location.href = url;
}

