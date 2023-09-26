@include ('component.head-script')
<!-- sidebar.blade.php -->
<aside  id="pdmv-sidebar" class="h-screen hidden lg:block bg-gray-800 text-white p-4 transition-all duration-300">
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
                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg>

                <span class="mx-3">Dashboard</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/genres" id="btn-genres">
                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M17 14v6m-3-3h6M6 10h2a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v2a2 2 0 002 2zm10 0h2a2 2 0 002-2V6a2 2 0 00-2-2h-2a2 2 0 00-2 2v2a2 2 0 002 2zM6 20h2a2 2 0 002-2v-2a2 2 0 00-2-2H6a2 2 0 00-2 2v2a2 2 0 002 2z">
                    </path>
                </svg>

                <span class="mx-3">Genres</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/actors" id="btn-actors">
                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                    </path>
                </svg>

                <span class="mx-3">Actors</span>
            </a>

            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/movies" id="btn-movies">
                <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                    </path>
                </svg>

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