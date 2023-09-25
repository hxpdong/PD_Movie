@include('/component.header')
<!DOCTYPE html>
<html>
<head>
    <title>PDMovie</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <div class="main-container">
        <div class="text-white mb-2">Phim theo tag: 
            <span id="tagname">...</span>
        </div>
        <div class="text-lg text-white">
            (Tìm thấy 
                <span id="numoftagfounded">...</span>
            Kết quả)
        </div>
        <div class="hidden" id="isTagPage"></div>
        <div id="movie-list" class="grid-container">
        </div>
        <div id="pagination">
            <button id="prev-button" onclick="prevPage()"><i class="fa fa-angle-double-left" aria-hidden="true"></i></button>
            <span id="page-buttons"></span>
            <button id="next-button" onclick="nextPage()"><i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
        </div>
    </div>
    <script src="/js/main.js"></script>
</body>
</html>
@include ('component.footer')