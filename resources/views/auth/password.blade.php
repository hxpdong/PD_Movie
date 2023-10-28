<html>
@include ('component.head-script')
<head></head>

<body>
    <main id="content" role="main" class="w-full  max-w-md mx-auto p-6">
        <div
            class="mt-7 bg-white  rounded-xl shadow-lg dark:bg-gray-800 dark:border-gray-700 border-2 border-indigo-300">
            <div class="p-4 sm:p-7">
                <div class="text-center">
                    <h1 class="block text-2xl font-bold text-gray-800 dark:text-white">Quên mật khẩu?</h1>
                    <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                        Đã nhớ mật khẩu?
                        <a class="text-blue-600 decoration-2 hover:underline font-medium" href="/login">
                            Đăng nhập
                        </a>
                    </p>
                </div>

                <div class="mt-5">
                    <form>
                        <div class="grid gap-y-4">
                            <div>
                                <label for="email" class="block text-sm font-bold ml-1 mb-2 dark:text-white">Email đăng ký với tài khoản</label>
                                <div class="relative">
                                    <input type="email" id="email" name="email"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        required aria-describedby="email-error">
                                </div>
                                <p class="hidden text-xs text-red-600 mt-2" id="email-error">Hãy nhập đúng email mà bạn đã đăng ký khi tạo tài khoản, để chúng tôi có thể gửi xác nhận đến bạn thông qua email!</p>
                            </div>
                            <button type="submit"
                                class="py-3 px-4 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-blue-500 text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm dark:focus:ring-offset-gray-800">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <p class="mt-3 flex justify-center items-center text-center divide-x divide-gray-300 dark:divide-gray-700">
            <a class="pr-3.5 inline-flex items-center gap-x-2 text-sm text-gray-600 decoration-2 hover:underline hover:text-blue-600 dark:text-gray-500 dark:hover:text-gray-200"
                href="/">
                Trang chủ
            </a>
            <a class="pl-3 inline-flex items-center gap-x-2 text-sm text-gray-600 decoration-2 hover:underline hover:text-blue-600 dark:text-gray-500 dark:hover:text-gray-200"
                href="/">

                Liên hệ chúng tôi!
            </a>
        </p>
    </main>
</body>

</html>