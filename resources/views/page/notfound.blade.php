@include('/component.header')
<!DOCTYPE html>
<html>

<head>
    <title>{{ __('notfound') }}</title>
    <link rel="stylesheet" href="/css/main.css">
</head>

<body class="bg-gray-200">
    <div class="flex flex-grow items-center justify-center">
        <div class="rounded-lg bg-white p-8 text-center shadow-xl">
            <div class="w-full flex justify-center">
                <img src="img/not-found.png" class="h-48" />
            </div>
            <h1 class="mb-4 text-4xl font-bold">404</h1>
            <p class="text-gray-600">{{ __('notfoundmss') }} <i class="fas fa-sad-tear fa-lg"></i></p>
            <a href="/"
                class="mt-4 inline-block rounded bg-blue-500 px-4 py-2 font-semibold text-white hover:bg-blue-600">
                {{ __('gotohome') }} </a>
        </div>
    </div>
</body>

</html>