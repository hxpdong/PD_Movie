const isPageDashboard = document.getElementById("isAd-DashboardPage");
const isPageChapter = document.getElementById("isAd-ChapterPage");
const isPageGenre = document.getElementById("isAd-GenrePage");
const isPageMovie = document.getElementById("isAd-MoviePage");

document.addEventListener("DOMContentLoaded", function() {
    if (isPageDashboard) {
        changeClickedTag("btn-dashboard");
        document.title = "Admin | Dashboard";
    }

    if (isPageChapter) {
        changeClickedTag("btn-chapters");
        document.title = "Admin | Chapters";
    }

    if (isPageGenre) {
        changeClickedTag("btn-genres");
        document.title = "Admin | Genres";
    }

    if (isPageMovie) {
        changeClickedTag("btn-movies");
        document.title = "Admin | Movies";
    }
});

function changeClickedTag(tagid){
    var btnDashboard = document.getElementById(tagid);
        btnDashboard.classList = [];
        btnDashboard.classList.add("flex", "items-center", "px-6", "py-2", "mt-4", "text-white", "bg-[#66ccff]", "bg-opacity-25");
}