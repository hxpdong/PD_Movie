@include ('component.head-script')
<html>

<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Trang đăng nhập</title>
</head>

<body class="font-mono bg-gray-400">
    <div class="flex h-screen w-full items-center justify-center bg-cover bg-no-repeat"
        style="background-image: url('/img/background-login.png')">
        <div class="rounded-xl bg-gray-600 px-16 py-10 shadow-lg max-sm:px-8 bg-opacity-50 backdrop-blur-md">
            <div class="text-black">
                <div class="mb-8 flex flex-col items-center">
                    <img src="/img/fav-removebg.png" width="150" alt="" srcset="" />
                    <h1 class="mb-2 text-2xl text-gray-300">PDMovie</h1>
                    <span class="text-gray-300">Đăng nhập hệ thống</span>
                </div>
                <form method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="mb-4 text-lg">
                        <input
                            class="rounded-3xl border-none bg-white bg-opacity-50 px-6 py-2 text-black text-start text-inherit placeholder-black shadow-lg outline-none backdrop-blur-md"
                            type="text" name="name" placeholder="tên đăng nhập" />
                    </div>

                    <div class="mb-4 text-lg">
                        <input
                            class="rounded-3xl border-none bg-white bg-opacity-50 px-6 py-2 text-black text-start text-inherit placeholder-black shadow-lg outline-none backdrop-blur-md"
                            type="Password" name="password" placeholder="mật khẩu" />
                    </div>
                    <div class="mt-8 flex justify-center text-lg text-black">
                        <button type="submit"
                            class="rounded-3xl bg-blue-400 bg-opacity-50 px-10 py-2 text-white shadow-xl backdrop-blur-md transition-colors duration-300 hover:bg-yellow-600">Đăng
                            nhập</button>
                    </div>
                </form>
                <div class="text-sm font-medium text-white dark:text-white text-center">
                    Chưa có tài khoản? <a href="/register" class="text-blue-700 hover:underline dark:text-blue-500">Đăng ký</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>