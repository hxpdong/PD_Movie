var currentPage = 1;
var defaultImageUrl = '/img/banner.png';

document.addEventListener("DOMContentLoaded", function () {
    var initialPage = getPageFromURL();
    getMovies(initialPage);
});

function getGenreIdFromURL() {
    var currentURL = window.location.href;
    var regexPattern = /\/genres\/mvg(\d+)-/;
    var match = currentURL.match(regexPattern);
    if (match && match[1]) {
        return match[1]; // Trả về số sau dấu "-" cuối cùng trong URL
    }
    return null;
}

