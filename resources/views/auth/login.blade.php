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
                <form method="post" enctype="multipart/form-data" id="LoginForm">
                    @csrf
                    <div class="mb-4 text-lg">
                        <input
                            class="rounded-3xl border-none bg-white bg-opacity-50 px-6 py-2 text-black text-start text-inherit placeholder-black shadow-lg outline-none backdrop-blur-md"
                            type="text" name="mdusname" placeholder="tên đăng nhập" />
                    </div>

                    <div class="mb-4 text-lg">
                        <input
                            class="rounded-3xl border-none bg-white bg-opacity-50 px-6 py-2 text-black text-start text-inherit placeholder-black shadow-lg outline-none backdrop-blur-md"
                            type="Password" name="mduspassword" placeholder="mật khẩu" />
                    </div>
                    <div class="mt-8 flex justify-center text-lg text-black">
                        <button type="submit"
                            class="rounded-3xl bg-[#66ccff] bg-opacity-50 px-10 py-2 text-white shadow-xl backdrop-blur-md transition-colors duration-300 hover:bg-blue-800">Đăng
                            nhập</button>
                    </div>
                </form>
                <div class="text-sm font-medium text-white dark:text-white text-center">
                <a href="/" class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-white bg-[#66ccff] rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900">
                    Trang chủ
                    <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                    </svg>
                </a>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/js/storeRecommend.js"></script>
<script>
    $('#LoginForm').submit(function(e) {
        e.preventDefault();

        // Serialize the form data
        const formData = $(this).serialize();

        // Send a POST request with Axios
        axios.post('{{ route('modalLogin') }}', formData)
            .then(response => {
                if (response.data.success) {
                    const newToken = response.data.api_token;
                    // Lưu newToken vào Local Storage hoặc Cookie
                    localStorage.setItem('log_token', newToken);
                    localStorage.setItem('accId', response.data.accid);
                    Swal.close();
                    getRCMMoviesToLocalStorage();
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Không thể đăng nhập',
                        text: response.data.message
                    });
                }
            })
            .catch(error => {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi',
                    text: 'Đã xảy ra lỗi trong quá trình xử lý yêu cầu.' + error
                });
            });
    });
</script>
</html>