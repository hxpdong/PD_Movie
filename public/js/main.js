var currentPage = 1;
var defaultImageUrl = '/img/banner.png';
var isPageMovie = document.getElementById("isMoviePage");
var isPageGenre = document.getElementById("isGenrePage");
var isPageTag = document.getElementById("isTagPage");

document.addEventListener("DOMContentLoaded", function () {
    var initialPage = getPageFromURL();
    if (isPageMovie) {
        var kwSearch = getKeywordSearchFromCurrentURL();
        getMovies(initialPage, kwSearch);
    }
    else if (isPageGenre) {
        var mvgid = getMovieGenreFromURL();
        getMovieListOfGenre(mvgid, initialPage);
    }
    else if (isPageTag) {
        var kwtag = extractTagFromCurrentURL();
        getMovieListOfTag(kwtag, initialPage);
    }
});

function getMovies(page, kwSearch) {

    axios.get('/api/movies?page=' + page + "&num=12" + "&kwsearch=" + kwSearch)
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
                    } else {
                        image.src =defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if(movie.typeOfPosterURL == 0)
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
            document.getElementById("numofmoviefounded").innerHTML = response.data.results.total;

            var kwdiv = document.getElementById("keyw");
            if(getKeywordSearchFromCurrentURL()){
                kwdiv.hidden = false;
                document.title = "Tìm kiếm | " + getKeywordSearchFromCurrentURL().replaceAll("+", " ");
                document.getElementById("keywk").innerHTML = getKeywordSearchFromCurrentURL().replaceAll("+", " ");
            } else {
                kwdiv.hidden = true;
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}

function prevPage() {
    if (currentPage > 1) {
        const newPage = currentPage - 1;
        const currentURL = new URL(window.location.href);
        currentURL.searchParams.set('page', newPage);
        //window.history.replaceState({}, document.title, currentURL);
        //getMovies(currentURL.searchParams.get('page'), getKeywordSearchFromCurrentURL());
        redirectToWebsite(currentURL);
    }
}
function nextPage() {
    const newPage = currentPage + 1;
    const currentURL = new URL(window.location.href);
    currentURL.searchParams.set('page', newPage);
    //window.history.replaceState({}, document.title, currentURL);    
    //getMovies(currentURL.searchParams.get('page'), getKeywordSearchFromCurrentURL());
    redirectToWebsite(currentURL);
}


function generatePageButtons(currentPage, lastPage) {
    var pageButtons = '';
    var maxButtonsToShow = 5; // Số lượng nút trước và sau trang hiện tại để hiển thị

    // Hiển thị nút trang đầu tiên
    if(currentPage == 1){
        pageButtons += '<button disabled style="margin:2px">Trang đầu</button>';
    } else pageButtons += '<button onclick="gotoPage(1)" style="margin:2px">Trang đầu</button>';
    
    // Hiển thị nút "..." nếu currentPage > maxButtonsToShow + 2
    if (currentPage > maxButtonsToShow + 2) {
        pageButtons += '<button disabled style="margin:2px">...</button>';
    }

    // Hiển thị nút các trang trước trang hiện tại
    for (var i = Math.max(currentPage - maxButtonsToShow, 2); i < currentPage; i++) {
        pageButtons += '<button onclick="gotoPage(' + i + ')" style="margin:2px">' + i + '</button>';
    }

    // Hiển thị nút trang hiện tại
    pageButtons += '<button class="active" style="margin:2px">' + currentPage + '</button>';

    // Hiển thị nút các trang sau trang hiện tại
    for (var i = currentPage + 1; i <= Math.min(currentPage + maxButtonsToShow, lastPage - 1); i++) {
        pageButtons += '<button onclick="gotoPage(' + i + ')" style="margin:2px">' + i + '</button>';
    }

    // Hiển thị nút "..." nếu cần
    if (currentPage + maxButtonsToShow < lastPage - 1) {
        pageButtons += '<button disabled style="margin:2px">...</button>';
    }

    // Hiển thị nút trang cuối cùng
    if(currentPage == lastPage){
        pageButtons += '<button disabled style="margin:2px">' + "Trang cuối" + '</button>';
    } else pageButtons += '<button onclick="gotoPage(' + lastPage + ')" style="margin:2px">' + "Trang cuối" + '</button>';

    return pageButtons;
}


function gotoPage(page) {
    const newPage = page;
    const currentURL = new URL(window.location.href);
    currentURL.searchParams.set('page', newPage);
    //window.history.replaceState({}, document.title, currentURL);
    //getMovies(page, getKeywordSearchFromCurrentURL());
    redirectToWebsite(currentURL);
}

function updatePageURL(page) {
    var newURL = window.location.origin + window.location.pathname + '?page=' + page;
    window.history.pushState({ page: page }, "Page " + page, newURL);
}
function getPageFromURL() {
    var urlParams = new URLSearchParams(window.location.search);
    return parseInt(urlParams.get('page')) || 1;
}

function getKeywordSearchFromCurrentURL() {
    const currentURL = window.location.href;
    const startIndex = currentURL.indexOf('?kwsearch=');
    if (startIndex !== -1) {
        const startIndexCopy = startIndex + 10; // Độ dài của '?kwsearch='
        const pattern = /(?:(?:&)|$)/; // Tìm '&' hoặc kết thúc chuỗi
        const endIndex = currentURL.indexOf('&', startIndexCopy);
        const keyword = endIndex !== -1
            ? currentURL.substring(startIndexCopy, endIndex)
            : currentURL.substring(startIndexCopy).replace(pattern, '');

        if (keyword.trim() === '' || /^(\+)+$/.test(keyword)) {
            return null;
        }
        return decodeURIComponent(keyword);
    }
    return null; // Trả về null nếu không tìm thấy cụm 'kwsearch='
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

function getMovieGenreFromURL() {
    var currentURL = window.location.href;
    var regexPattern = /\/genres\/mvg(\d+)-/;
    var match = currentURL.match(regexPattern);
    if (match && match[1]) {
        return match[1]; // Trả về số sau dấu "-" cuối cùng trong URL
    }
    return null;
}

function getMovieListOfGenre(mvgid, page) {

    axios.get('/api/genres/' + mvgid + '?page=' + page)
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
                    } else {
                        image.src =defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if(movie.typeOfPosterURL == 0)
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
            document.getElementById("numofgenrefounded").innerHTML = response.data.results.total;
            document.getElementById("genrename").innerHTML = response.data.infogenre.mvgenre_vi_name;
            document.title = "Thể loại | " + response.data.infogenre.mvgenre_vi_name;
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getMovieListOfTag(tagkw, page) {
    tagkw = decodeURIComponent(tagkw);
    axios.get('/api/tags/' + tagkw + '?page=' + page)
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
                    } else {
                        image.src =defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if(movie.typeOfPosterURL == 0)
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
            document.getElementById("numoftagfounded").innerHTML = response.data.results.total;
            document.getElementById("tagname").innerHTML = tagkw;
            document.title = "Tag | " + tagkw;
        })
        .catch(function (error) {
            console.log(error);
        });
}

function extractTagFromCurrentURL() {
    // Lấy URL hiện tại của trình duyệt
    const currentURL = window.location.href;

    // Sử dụng cùng một logic như ở ví dụ trước để trích xuất tag từ URL
    const urlObj = new URL(currentURL);
    const path = urlObj.pathname;
    const pathParts = path.split('/');
    const tag = pathParts[pathParts.length - 1];

    return tag;
}