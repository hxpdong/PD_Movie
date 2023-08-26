// Optional: Nếu muốn hiển thị số sao đã chọn sau khi người dùng click
const stars = document.getElementsByName('rating');
const ratingOutput = document.getElementById(
    'starpoint'); // Thay 'rating-output' bằng ID của phần tử hiển thị số sao đã chọn

stars.forEach(star => star.addEventListener('click', () => {
    const selectedRating = star.value;
    ratingOutput.innerText = `Đánh giá: ${selectedRating} sao`;
    console.log('danhgia: ' + selectedRating);
}));

function getVimeoVideoId(url) {
    const match = url.match(/\/vimeo.com\/(\d+)/);

    // Nếu có kết quả từ biểu thức chính quy và có ít nhất một kết quả khớp
    if (match && match[1]) {
        return match[1];
    } else {
        console.error("Invalid Vimeo URL");
        return null;
    }
}

function changeVimeoUrl() {
    const url = document.getElementById("videourl").value;
    const videoId = getVimeoVideoId(url);

    if (videoId) {
        const videoURL = "https://player.vimeo.com/video/" + videoId;
        console.log("id url: " + videoURL);
        document.getElementById("url_storage_here_movie").innerHTML = videoURL;
    } else {
        console.log("id url ERROR ");
        document.getElementById("url_storage_here_movie").innerHTML = "Invalid Vimeo URL";
    }
}

function getDriveFileId(url) {
    const match = url.match(/\/d\/([a-zA-Z0-9_-]+)\/view/);
    if (match && match[1]) {
        return match[1];
    } else {
        console.error("Invalid Google Drive URL");
        return null;
    }
}

function changeUrl() {
    const urlimg = document.getElementById("imageurl").value;
    const newurl = getDriveFileId(urlimg);
    const fileURL = "https://drive.google.com/uc?id=" + newurl;
    document.getElementById("url_storage_here").innerHTML = fileURL;
}