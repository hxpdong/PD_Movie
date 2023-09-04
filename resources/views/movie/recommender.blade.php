@include('/component.header')
<!DOCTYPE html>
<html>
<head>
    <title>Gợi ý cho bạn</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <div class="main-container">
        <div class="text-white">
            Có thể bạn sẽ thích:
        </div>
        <div id="movie-list" class="grid-container">
        </div>
    </div>
    <script src="/js/main-test-recommend.js"></script>
</body>
</html>
@include ('component.footer')