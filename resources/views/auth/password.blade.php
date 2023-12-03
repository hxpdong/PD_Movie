<html>
@include ('component.head-script')
@include ('component.head-changeLang')
<head></head>
<title>{{ __('resetpassword') }}</title>

<body>
    <main id="content" role="main" class="w-full  max-w-md mx-auto p-6">
        <div
            class="mt-7 bg-white  rounded-xl shadow-lg dark:bg-gray-800 dark:border-gray-700 border-2 border-indigo-300">
            <div class="p-4 sm:p-7">
                <div class="text-center">
                    <h1 class="block text-2xl font-bold text-gray-800 dark:text-white">{{ __('forgotpassword') }}</h1>
                    <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                        {{ __('rememberpassword') }}
                        <a class="text-blue-600 decoration-2 hover:underline font-medium" href="/login">
                            {{ __('login') }}
                        </a>
                    </p>
                </div>

                <div class="mt-5">
                    <form id="sendemailForm" method="POST">
                        @method('PUT')
                        <div class="grid gap-y-4">
                            <div>
                                <label for="email" class="block text-sm font-bold ml-1 mb-2 dark:text-white">{{ __('registedemail') }}</label>
                                <div class="relative">
                                    <input type="email" id="registed_email" name="registed_email"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        required aria-describedby="email-error">
                                </div>
                                <p hidden class="text-xs text-red-600 mt-2" id="email-error">{{ __('wrongemail') }}</p>
                            </div>
                            <button type="submit"
                                class="py-3 px-4 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-blue-500 text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm dark:focus:ring-offset-gray-800">
                                {{ __('send') }} email
                            </button>
                        </div>
                    </form>
                    <form id="resetPasswordForm" method="POST" hidden>
                        @method('PUT')
                        <div class="grid gap-y-4">
                            <div>
                                <label for="email"
                                    class="block text-sm font-bold ml-1 mb-2 dark:text-white">Email</label>
                                <div class="relative">
                                    <input type="email" id="email" name="email"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        aria-describedby="email-error-2">
                                </div>
                                <label for="otp" class="block text-sm font-bold ml-1 mb-2 dark:text-white">OTP</label>
                                <div class="relative">
                                    <input type="text" id="otp" name="otp"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        aria-describedby="otp-error">
                                </div>
                                <label for="password" class="block text-sm font-bold ml-1 mb-2 dark:text-white">{{ __('newpassword') }}</label>
                                <div class="relative">
                                    <input type="password" id="password" name="password"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        aria-describedby="password-error">
                                </div>
                                <label for="confirm-password"
                                    class="block text-sm font-bold ml-1 mb-2 dark:text-white">{{ __('confirmpassword') }}</label>
                                <div class="relative">
                                    <input type="password" id="confirm-password" name="confirm-password"
                                        class="py-3 px-4 block w-full border-2 border-gray-200 rounded-md text-sm focus:border-blue-500 focus:ring-blue-500 shadow-sm"
                                        aria-describedby="confirm-password-error">
                                </div>
                                <p hidden class="text-xs text-red-600 mt-2" id="email-error-2">{{ __('wrongemail') }}</p>
                            </div>
                            <button type="submit"
                                class="py-3 px-4 inline-flex justify-center items-center gap-2 rounded-md border border-transparent font-semibold bg-blue-500 text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all text-sm dark:focus:ring-offset-gray-800">{{ __('confirm') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <p class="mt-3 flex justify-center items-center text-center divide-x divide-gray-300 dark:divide-gray-700">
            <a class="pr-3.5 inline-flex items-center gap-x-2 text-sm text-gray-600 decoration-2 hover:underline hover:text-blue-600 dark:text-gray-500 dark:hover:text-gray-200"
                href="/">
                {{ __('homepage') }}
            </a>
<!--
            <a class="pl-3 inline-flex items-center gap-x-2 text-sm text-gray-600 decoration-2 hover:underline hover:text-blue-600 dark:text-gray-500 dark:hover:text-gray-200"
                href="/contact">
               {{ __('contactus') }}
            </a>
-->
        </p>
    </main>
    <script>
    $('#sendemailForm').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: 'PUT',
            url: '/api/users/forgot-password/send-email',
            data: $(this).serialize(),
            beforeSend: function(xhr) {
                Swal.fire({
                    title: `{{ __('executing') }}`,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    allowOutsideClick: false,
                    onBeforeOpen: () => {
                        Swal.showLoading();
                    },
                    onClose: () => {
                        Swal.hideLoading();
                    }
                });
            },
            success: function(response) {
                Swal.close();
                if (response.success) {
                    Swal.fire({
                        icon: 'success',
                        title: response.message,
                        confirmButtonText: 'OK',
                        allowOutsideClick: false,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById("resetPasswordForm").hidden = false;
                            document.getElementById("sendemailForm").hidden = true;
                            document.getElementById("email").value = document
                                .getElementById("registed_email").value;
                        };
                    });
                } else {
                    document.getElementById("email-error").hidden = false;
                    Swal.fire({
                        icon: 'error',
                        title: 'The operation cannot be performed!',
                        html: response.message,
                    });
                }
            },
            error: function(error) {
                Swal.close();
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'An error occurred while sending the request.'
                });
            }
        });
    });
    $('#resetPasswordForm').submit(function(e) {
        e.preventDefault();
        var passwordField = document.getElementById("password");
        var confirmPasswordField = document.getElementById("confirm-password");
        var password = passwordField.value;
        var confirmPassword = confirmPasswordField.value;
        if (password === "" || confirmPassword === "") {
            Swal.fire({
                icon: 'error',
                title: 'The information provided is not enough!',
                text: 'Please fill in all information and try again.'
            });
        } else if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Password and confirmation password do not match!',
                text: 'Please check your password and re-enter it'
            });
        } else {
            $.ajax({
                type: 'PUT',
                url: '/api/users/forgot-password/reset-password',
                data: $(this).serialize(),
                beforeSend: function(xhr) {
                    Swal.fire({
                        title: `{{ __('executing') }}`,
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: false,
                        onBeforeOpen: () => {
                            Swal.showLoading();
                        },
                        onClose: () => {
                            Swal.hideLoading();
                        }
                    });
                },
                success: function(response) {
                    Swal.close();
                    if (response.success) {
                        Swal.fire({
                            icon: 'success',
                            title: 'New password updated!',
                            background: '#ffffff',
                            backdrop: false,
                            confirmButtonText: 'Re-login',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/login';
                            };
                        });
                    } else {
                        document.getElementById("email-error").hidden = false;
                        Swal.fire({
                            icon: 'error',
                            title: 'The operation cannot be performed!',
                            html: response.message,
                        });
                    }
                },
                error: function(error) {
                    Swal.close();
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: 'An error occurred while sending the request.'
                    });
                }
            });
        }
    });
    </script>
</body>

</html>