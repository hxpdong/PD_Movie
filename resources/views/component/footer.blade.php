<script src="/js/global-function.js"></script>
<button id="to-top-button" onclick="goToTop()" title="Go To Top"
    class="hidden fixed z-90 bottom-8 right-8 border-4 w-16 h-16 rounded-full drop-shadow-md bg-[#66CCFF] text-white text-3xl font-bold border-white">
    <i class="fa-solid fa-arrow-up"></i>
</button>
<footer id="footerdiv" class="bg-[#2e8ebe] flex justify-center items-center flex-col w-full p-10 bottom-0 fixed">
    <div class="text-white">PDMovie</div>
    <div class="text-white">Xem những gì bạn thích</div>
</footer>
<script>
var toTopButton = document.getElementById("to-top-button");
var footerdiv = document.getElementById("footerdiv");
var cntScroll = 0;
window.onload = function() {
    footerdiv.classList.remove("bottom-0", "fixed");
    setTimeout(function() {
        // Kiểm tra xem có thanh cuộn trang hay không
        if (document.body.scrollHeight <= window.innerHeight) {
            // Nếu không có thanh cuộn, thêm lớp cho footerdiv
            footerdiv.classList.add("bottom-0", "fixed");
        }
    }, 1000); 
}

// When the user scrolls down 200px from the top of the document, show the button
window.onscroll = function() {
    if(cntScroll == 0) {
        footerdiv.classList.remove("bottom-0", "fixed");
        cntScroll++;
    }
    if (document.body.scrollTop > 1 || document.documentElement.scrollTop > 1) {
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