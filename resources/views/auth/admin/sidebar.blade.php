@include ('component.head-script')
<!-- sidebar.blade.php -->
<aside  id="pdmv-sidebar" class="h-auto hidden md:block bg-gray-800 text-white p-4 transition-all duration-300">
    <!-- Sidebar content goes here -->
    <div>
        <div class="flex items-center justify-center mt-8">
            <div class="flex items-center">
                <div class="relative block w-8 h-8 overflow-hidden rounded-full shadow focus:outline-none">
                    <img class="object-cover w-full h-full" src="/img/fav-removebg.png" alt="Your avatar">
                </div>
                <span class="mx-2 text-2xl font-semibold text-white">PDMovie</span>
            </div>
        </div>
        <nav class="mt-10">
		<a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/dashboard" id="btn-dashboard">
                <i class="fa-solid fa-chart-pie fa-xl"></i>

                <span class="mx-3">Dashboard</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/genres" id="btn-genres">
                <i class="fa-solid fa-tags fa-xl"></i>

                <span class="mx-3">Genres</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/actors" id="btn-actors">
                <i class="fa-solid fa-user-tag fa-xl"></i>

                <span class="mx-3">Actors</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/movies" id="btn-movies">
                <i class="fa-solid fa-clapperboard fa-xl"></i>

                <span class="mx-3">Movies</span>
            </a>
        </nav>
    </div>
</aside>
<script>
var btnOpenSidebar = document.getElementById("btn-open-sidebar");
var sidebar = document.getElementById("pdmv-sidebar");
try {
    var btnOpenSidebar = document.getElementById("btn-open-sidebar");
    var sidebar = document.getElementById("pdmv-sidebar");
	var divsidebar = document.getElementById("div-sidebar");
    if (btnOpenSidebar && sidebar) {
        btnOpenSidebar.addEventListener("click", function() {
            if (sidebar.classList.contains("hidden")) {
                // Sidebar đang ẩn, nên chúng ta muốn hiển thị nó
                sidebar.classList.remove("hidden");
            } else {
                // Sidebar đang hiển thị, nên chúng ta muốn ẩn nó
                sidebar.classList.add("hidden");
            }
        });
    } else {
        console.error("btnOpenSidebar or sidebar element not found.");
    }
} catch (error) {
    console.error("An error occurred: " + error.message);
}
</script>