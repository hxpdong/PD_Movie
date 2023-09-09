<script src="/js/global-function.js"></script>
<button id="to-top-button" onclick="goToTop()" title="Go To Top"
    class="hidden fixed z-90 bottom-8 right-8 border-4 w-16 h-16 rounded-full drop-shadow-md bg-[#66CCFF] text-white text-3xl font-bold border-white">&uarr;</button>
<script>
    var toTopButton = document.getElementById("to-top-button");

    // When the user scrolls down 200px from the top of the document, show the button
    window.onscroll = function() {
        if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            toTopButton.classList.remove("hidden");
        } else {
            toTopButton.classList.add("hidden");
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function goToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
</script>
<footer class="bg-[#2e8ebe] flex justify-center items-center flex-col w-full p-10">
    <div class="text-white">PDMovie</div>
    <div class="text-white">Xem những gì bạn thích</div>
</footer>