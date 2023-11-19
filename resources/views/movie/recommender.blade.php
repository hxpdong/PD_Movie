@include('/component.header')
<!DOCTYPE html>
<html>
<head>
    <title>{{ __('recommendedforyou') }}</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <div class="main-container">
        <button onclick="location.reload();" hidden>Reload</button>
        <div class="text-white">
        {{ __('recommendedforyou') }}:
        </div>
        <div id="movie-list" class="grid-container">
        </div>
    </div>
    <script src="/js/main-test-recommend.js"></script>
</body>
</html>
@include ('component.footer')