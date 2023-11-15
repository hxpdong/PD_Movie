const isPageDashboard = document.getElementById("isAd-DashboardPage");
const isPageGenre = document.getElementById("isAd-GenrePage");
const isPageMovie = document.getElementById("isAd-MoviePage");
const isPageReport = document.getElementById("isAd-ReportPage");
const isPageSystem = document.getElementById("isSystemPage");
document.addEventListener("DOMContentLoaded", function() {
    if (isPageDashboard) {
        changeClickedTag("btn-dashboard");
        document.title = "Admin | Dashboard";
    }

    if (isPageGenre) {
        changeClickedTag("btn-genres");
        document.title = "Admin | Genres";
    }

    if (isPageMovie) {
        changeClickedTag("btn-movies");
        document.title = "Admin | Movies";
    }

    if (isPageReport) {
        changeClickedTag("btn-reports");
        document.title = "Admin | Reports";
    }
    if (isPageSystem) {
        changeClickedTag("btn-system");
        document.title = "Admin | System";
    }
});

function changeClickedTag(tagid){
    var btnDashboard = document.getElementById(tagid);
        btnDashboard.classList = [];
        btnDashboard.classList.add("flex", "items-center", "px-6", "py-2", "mt-4", "text-white", "bg-[#66ccff]", "bg-opacity-25");
}