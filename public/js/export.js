function exportRatingCSV() {
    // Gọi API sử dụng fetch hoặc Axios

    // Lấy ngày giờ hiện tại
    const currentDateTime = new Date();
    
    // Format ngày giờ thành chuỗi phù hợp để thêm vào tên file
    const formattedDateTime = `${currentDateTime.getFullYear()}${(currentDateTime.getMonth() + 1).toString().padStart(2, '0')}${currentDateTime.getDate()}${currentDateTime.getHours()}${currentDateTime.getMinutes()}${currentDateTime.getSeconds()}`;

    // Lưu vào file sử dụng FileSaver.js
    fetch('/api/exports/rating/csv')
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.blob();
        })
        .then(blob => {
            // Thêm ngày giờ vào tên file
            const fileName = `ratings_export_${formattedDateTime}.csv`;

            // Lưu file
            saveAs(blob, fileName);
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}
