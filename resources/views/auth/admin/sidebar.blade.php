@include ('component.head-script')
<!-- sidebar.blade.php -->
<aside  id="pdmv-sidebar" class="min-h-screen hidden md:block bg-gray-800 text-white p-4 transition-all duration-300">
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
                href="/admin/movies" id="btn-movies">
                <i class="fa-solid fa-film fa-xl"></i>

                <span class="mx-3">{{ __('movie')}}</span>
            </a>
            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/genres" id="btn-genres">
                <i class="fa-solid fa-tags fa-xl"></i>

                <span class="mx-3">{{ __('genre')}}</span>
            </a>
            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/reports" id="btn-reports">
                <i class="fa-solid fa-flag fa-xl"></i>
                <span class="mx-3">{{ __('report')}}</span>
                <span class="bg-red-500 p-1 rounded-full" id="sidebar-reportNotify" hidden></span>
            </a>
            {{-- 
            <a class="flex items-center px-6 py-2 mt-4 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100"
                href="/admin/system" id="btn-system">
                <i class="fa-solid fa-gear fa-xl"></i>
                <span class="mx-3">{{ __('system')}}</span>
            </a>
            --}}
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