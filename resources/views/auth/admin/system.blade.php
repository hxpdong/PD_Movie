@if(auth()->check())
<html>

<head>

</head>
<!-- Trang của bạn.blade.php -->

<body class="bg-gray-200">
    @include('auth.admin.navbar')

    <div class="flex w-full bg-gray-200 h-auto">
        @include('auth.admin.sidebar')

        <!-- Nội dung trang chính của bạn -->
        <div class="p-5 w-full flex-1 overflow-x-hidden overflow-y-auto" id="isSystemPage">
            <div class="container mx-auto w-full">
                <h3 class="text-4xl font-bold mb-4">Hệ thống</h3>
                <button id="btnDivHidden" class="bg-blue-500 text-white font-bold p-2 m-1 rounded-md"
                    onclick="exportRatingCSV()">Xuất Thông tin Đánh giá</button>

                <form id="uploadForm" enctype="multipart/form-data" class="bg-white p-2">
                    <input type="file" name="file" accept=".csv" required>
                    <button type="button" onclick="uploadFile()"
                        class="bg-blue-500 text-white p-2 rounded-lg font-bold">Nhập dữ liệu Đánh giá</button>
                </form>
                <!-- Hiển thị thông báo -->
                <div id="message"></div>
            </div>
        </div>
    </div>
    @include ('component.footer')
    @endif
    <script src="/js/checkAdminPage.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.5/dist/FileSaver.min.js"></script>
    <script src="/js/export.js"></script>
    <script>
    function uploadFile() {
        // Lấy đối tượng input file
        const fileInput = document.querySelector('input[name="file"]');

        // Kiểm tra xem có file đã được chọn hay không
        if (fileInput.files.length > 0) {
            // Tạo FormData để chứa dữ liệu và file
            const formData = new FormData();

            // Thêm file vào FormData
            formData.append('file', fileInput.files[0]);

            // Gửi request POST sử dụng Fetch API
            fetch('/api/imports/rating/csv', {
                    method: 'POST',
                    body: formData,
                })
                .then(response => response.json())
                .then(data => {
                    // Hiển thị thông báo
                    const messageDiv = document.getElementById('message');
                    if (data.success) {
                        messageDiv.innerText = 'Cập nhật đánh giá thành công!';
                    } else {
                        messageDiv.innerText = 'Cập nhật thất bại.';
                    }
                })
                .catch(error => console.error('Error:', error));
        } else {
            // Hiển thị thông báo nếu không có file nào được chọn
            const messageDiv = document.getElementById('message');
            messageDiv.innerText = 'Vui lòng chọn tệp Đánh giá đã được xuất.';
        }
    }
    </script>
</body>

</html>