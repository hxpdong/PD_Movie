@include ('component.head-script')
@if(auth()->check())
<!-- Trang của bạn.blade.php -->
<body class="bg-gray-200">
    @include('auth.admin.navbar')

    <div class="flex w-full bg-gray-200 h-auto">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isAd-GenrePage">
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold">Thể Loại</h3>
            </div>
        </div>
    </div>
    @include ('component.footer')
    @endif
    <script src="/js/checkAdminPage.js"></script>
</body>