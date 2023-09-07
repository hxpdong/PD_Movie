function redirectToWebsite(url) {
    window.location.href = url;
}

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
            redirectToWebsite("/movies/mv" + gridItem.querySelector('.mvid').textContent + "-" +
            gridItem.querySelector('.mvurl').textContent); // Thay URL bằng URL thích hợp
        };
    });
}

// Xóa tất cả các phần tử con trong danh sách phim
function removeAllMovieItems() {
    var movieList = document.getElementById("movie-list");
    if(movieList){
        while (movieList.firstChild) {
            movieList.removeChild(movieList.firstChild);
        }
    }

    var movieRecommendedList = document.getElementById("recommended-list");
    if(movieRecommendedList){
        while (movieRecommendedList.firstChild) {
            movieRecommendedList.removeChild(movieRecommendedList.firstChild);
        }
    }
}
