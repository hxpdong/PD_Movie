@include ('component.head-script')
@if(auth()->check())
<!-- Trang của bạn.blade.php -->
@include('auth.admin.navbar')

<div class="flex">
    @include('auth.admin.sidebar')

    <!-- Nội dung trang chính của bạn -->
    <div class="p-5" id="isAd-GenrePage">
        <div class="text-4xl font-bold">Genres</div>
    </div>
</div>
@include ('component.footer')
@endif
<script src="/js/checkAdminPage.js"></script>