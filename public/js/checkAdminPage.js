var isPageDashboard = document.getElementById("isAd-DashboardPage");
var isPageActor = document.getElementById("isAd-ActorPage");
var isPageGenre = document.getElementById("isAd-GenrePage");
var isPageMovie = document.getElementById("isAd-MoviePage");

document.addEventListener("DOMContentLoaded", function() {
    var isPageDashboard = document.getElementById("isAd-DashboardPage");
    var isPageActor = document.getElementById("isAd-ActorPage");
    var isPageGenre = document.getElementById("isAd-GenrePage");
    var isPageMovie = document.getElementById("isAd-MoviePage");

    if (isPageDashboard) {
        changeClickedTag("btn-dashboard");
        document.title = "Admin | Dashboard";
    }

    if (isPageActor) {
        changeClickedTag("btn-actors");
        document.title = "Admin | Actors";
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