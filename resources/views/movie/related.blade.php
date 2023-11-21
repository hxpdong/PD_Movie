@include('/component.header')
<!DOCTYPE html>
<html>
<head>
    <title>{{ __('relatemv') }}</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <div class="main-container">
        <button onclick="location.reload();" hidden>Reload</button>
        <img class="mx-auto rounded-3xl shadow-lg w-3/5 lg:w-1/5 md:w-1/3" id="movie-img" src="">
        <div class="text-white">
        {{ __('relatemv') }} {{ __('with') }} <b><span id="movie-title"></span></b>:
        </div>
        <div id="movie-list" class="grid-container">
        </div>
    </div>
    <script src="/js/main-test-related.js"></script>
</body>
</html>
@include ('component.footer')