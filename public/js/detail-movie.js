let timer;
const defaultImageUrl = '/img/banner.png';
const constMvid = getMovieIdFromURL();
if (!constMvid) {
    window.location.href = "/";
}
document.addEventListener("DOMContentLoaded", function () {
    var movieId = getMovieIdFromURL();
    loadMovieDetail(movieId);
    getLatestMovies();
    if (accId) {
        const userId = accId;
        const numRecommendations = 6; // Thay đổi số lượng đề xuất theo nhu cầu của bạn

        fetch(`http://127.0.0.1:8300/recommend?user_id=${userId}&num_recommendations=${numRecommendations}`, {
            method: 'GET',
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                //console.log(data.itemId_list);
                // Gọi getMovies() ở đây nếu muốn
                getRecommendedMoviesFromPython(data.itemId_list);
            })
            .catch(error => {
                console.error('Error:', error);
                getRecommendedMovies();
            });
    }
    getRelatedMovies();

    var formReport = document.getElementById("reporterror");
    if (formReport) {
        var mid = getMovieIdFromURL();
        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "mId";
        input2.value = mid;
        formReport.appendChild(input2);

        formReport.addEventListener("submit", function (event) {
            event.preventDefault();
            var errorContentValue = document.getElementById("errorContent").value;
            if (!errorContentValue || errorContentValue.trim() === "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Report content is empty!',
                    text: 'Please fill in information to report'
                });
            }
            else {
                var postReportUrl = '/api/postreport';
                fetch(postReportUrl, {
                    method: "POST",
                    body: new FormData(formReport),
                })
                    .then(function (response) {
                        return response.json();
                    })
                    .then(function (data) {
                        if (data.success === true) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Successful report!',
                                text: 'Thank you for reporting'
                            });
                            errorContentValue.value = '';
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Server error!',
                                text: 'Please try again later'
                            });
                        }
                    })
                    .catch(function (error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'System error!',
                            text: 'Please try again later'
                        });
                    });
            }
        });
    }
});

function loadMovieDetail(movieId) {
    axios.get('/api/movies/' + movieId)
        .then(function (response) {
            var moviedt = response.data.movie_detail;
            var mvgenres = response.data.genres;
            console.log("loaded");
            if (moviedt) {
                updateMovieDetail(moviedt);
            } else {
                window.location.href = "/";
            };
            if (mvgenres) {
                var genresGroupElement = document.getElementById("mvdetail-genres-group");
                mvgenres.forEach(function (mvg) {
                    var spanElement = document.createElement('a');
                    spanElement.classList.add('bg-[#66CCFF]', 'text-blue-700', 'font-medium', 'rounded', 'dark:bg-blue-900', 'dark:text-blue-300', 'mr-2', 'mb-2', 'p-1', 'flex', 'justify-center', 'item-center');
                    spanElement.textContent = mvg.mvgenre_en_name;
                    spanElement.href = `/genres/mvg` + mvg.mvgenre_id + "-" + mvg.mvgenre_en_name;
                    genresGroupElement.appendChild(spanElement);
                });
            };
        })
        .catch(function (error) {
            console.log(error);
        });
}

function updateMovieDetail(movieDetail) {
    var titleElement = document.getElementById("mvdetail-title");
    var titleEnElement = document.getElementById("mvdetail-title-en");
    var directorElement = document.getElementById("mvdetail-directors");
    var actorsElement = document.getElementById("mvdetail-actors");
    var posterElement = document.getElementById("mvdetail-img");
    var contentElement = document.getElementById("mvdetail-content");
    var ratingElement = document.getElementById("mvdetail-rating");
    var numRatingElement = document.getElementById("mvdetail-numrating");
    var manufactureYearElement = document.getElementById("mvdetail-manufactureYear");
    var videoLengthElement = document.getElementById("mvdetail-videoLength");

    if (movieDetail) {
        movieDetail.forEach(function (movie) {
            titleElement.innerHTML = movie.title_en;
            titleEnElement.innerHTML = movie.title_vi;
            directorElement.innerHTML = movie.director;
            actorsElement.innerHTML = movie.actors;
            var content = movie.content;
            var urlRegex = /(\bhttps?:\/\/\S+)/gi;
            var replacedContent = content.replace(urlRegex, function(url) {
                return '<a href="' + url + '" target="_blank">' + url + '</a>';
            });
            contentElement.innerHTML = replacedContent;
            ratingElement.innerHTML = movie.mvpoint;
            numRatingElement.innerHTML = movie.numrating;
            manufactureYearElement.innerHTML = movie.manufactureYear;
            videoLengthElement.innerHTML = movie.videoLength;

            if (movie.posterURL != null) {
                if (movie.typeOfPosterURL == 0) {
                    posterElement.src = movie.posterURL;
                } else if (movie.typeOfPosterURL == 1) {
                    var movieIdz = movie.posterURL;
                    var xhrmv = new XMLHttpRequest();
                    xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieIdz), true);
                    xhrmv.onload = function () {
                        if (xhrmv.status === 200) {
                            // Chuyển đổi dữ liệu JSON từ phản hồi API
                            var response = JSON.parse(xhrmv.responseText);

                            // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                            posterElement.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                        } else {
                            // Xử lý trường hợp lỗi khi gọi API
                            console.error('Error calling the API.');
                        }
                    };
                    xhrmv.send();
                } else if (movie.typeOfPosterURL == 2) {
                    var movieIdz = movie.posterURL;
                    var xhrmv = new XMLHttpRequest();
                    xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieIdz), true);
                    xhrmv.onload = function () {
                        if (xhrmv.status === 200) {
                            // Chuyển đổi dữ liệu JSON từ phản hồi API
                            var response = JSON.parse(xhrmv.responseText);

                            // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                            posterElement.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                        } else {
                            // Xử lý trường hợp lỗi khi gọi API
                            console.error('Error calling the API.');
                        }
                    };
                    xhrmv.send();
                } else {
                    posterElement.src = defaultImageUrl;
                }
            }
            // posterElement.src = movie.posterURL;
            else posterElement.src = defaultImageUrl;
            posterElement.onerror = function () {
                // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0)
                        posterElement.src = movie.posterURL;
                    else posterElement.src = defaultImageUrl;
                } else posterElement.src = defaultImageUrl;
            };
            document.title = movie.title_en;
            window.history.pushState({}, '', "mv" + movie.movie_id + "-" + movie.movie_url);
            document.getElementById("linktorelatedpage").setAttribute("href", "/related/" + "mv" + movie.movie_id + "-" + movie.movie_url);
        });
        console.log("updated");
    }
    //link to director name
    const directorNames = directorElement.textContent.split(',').map(name => name.trim());
    while (directorElement.firstChild) {
        directorElement.removeChild(directorElement.firstChild);
    };
    directorNames.forEach((directorName, index) => {
        const directorLink = document.createElement('a');
        directorLink.textContent = directorName;
        directorLink.href = `/tags/${directorName.replace(/\s+/g, '-').toLowerCase()}`;
        directorElement.appendChild(directorLink);
        if (index !== directorNames.length - 1) {
            directorElement.appendChild(document.createTextNode(', ')); // Thêm dấu phẩy và khoảng trắng, trừ lần cuối
        }
    });
    //link to actor name
    const actorNames = actorsElement.textContent.split(',').map(name => name.trim());
    while (actorsElement.firstChild) {
        actorsElement.removeChild(actorsElement.firstChild);
    };
    actorNames.forEach((actorName, index) => {
        const actorLink = document.createElement('a');
        actorLink.textContent = actorName;
        actorLink.href = `/tags/${actorName.replace(/\s+/g, '-').toLowerCase()}`;
        actorsElement.appendChild(actorLink);
        if (index !== actorNames.length - 1) {
            actorsElement.appendChild(document.createTextNode(', ')); // Thêm dấu phẩy và khoảng trắng, trừ lần cuối
        }
    });
}

function getMovieIdFromURL() {
    var currentURL = window.location.href;
    var regexPattern = /\/movies\/mv(\d+)-/;
    var match = currentURL.match(regexPattern);
    if (match && match[1]) {
        return match[1]; // Trả về số sau dấu "-" cuối cùng trong URL
    }
    return null;
}

var currentCmtPage = 1;

function getComments(mid, page) {
    axios.get('/api/comments/' + mid + '?page=' + page)
        .then(function (response) {
            removeAllCommentItems();
            var commentList = document.getElementById("comment-list");
            var comments = response.data.results.comments;

            comments.forEach(function (cmt) {
                var cntcmt = cmt.comment_id;
                var commentItem = document.createElement("article");
                commentItem.className =
                    "p-6 mb-6 text-base bg-white border-t border-gray-200 dark:border-gray-700 dark:bg-gray-900";

                var footer = document.createElement("footer");
                footer.className = "flex justify-between items-center mb-2";

                // Tạo phần tử div trong footer
                var divFooter = document.createElement("div");
                divFooter.className = "flex items-center";

                // Tạo phần tử img trong divFooter
                var img = document.createElement("img");
                img.className = "mr-2 w-6 h-6 rounded-full";
                img.src = "/img/avt-user.png";
                img.alt = cmt.user_id;

                // Tạo phần tử p trong divFooter cho tên tác giả
                var authorName = document.createElement("p");
                authorName.className =
                    "inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white";
                authorName.textContent = cmt.usname;

                var linkToUser = document.createElement("a");
                linkToUser.setAttribute('href', '/users/' + cmt.usname);
                linkToUser.appendChild(authorName);

                var linkToUserImg = document.createElement("a");
                linkToUserImg.setAttribute('href', '/users/' + cmt.usname);
                linkToUserImg.appendChild(img);

                // Tạo phần tử p trong divFooter cho ngày đăng
                var publishDate = document.createElement("p");
                publishDate.className = "text-sm text-gray-600 dark:text-gray-400";
                var time = document.createElement("time");
                //time.setAttribute("pubdate", "");
                time.setAttribute("datetime", "2022-03-12");
                time.setAttribute("title", "March 12th, 2022");
                time.textContent = cmt.commentTime;
                publishDate.appendChild(time);

                // Gắn các phần tử con vào divFooter
                divFooter.appendChild(linkToUserImg);
                divFooter.appendChild(linkToUser);
                divFooter.appendChild(publishDate);

                // Gắn các phần tử con vào footer
                footer.appendChild(divFooter);

                // Tạo phần tử p cho nội dung bài viết
                var articleContent = document.createElement("p");
                articleContent.className = "text-gray-500 dark:text-gray-400 text-justify";
                articleContent.textContent = cmt.comment;

                if (accId == cmt.user_id) {
                    var divContent = document.createElement("div");
                    divContent.className = 'dropdownCommentContainer my-2 flex justify-end';
                    var divContent2 = document.createElement("div");
                    divContent2.className = 'flex justify-end';

                    var buttonDropDown = document.createElement("button");
                    buttonDropDown.id = "dropdownCommentButton" + cmt.comment_id;
                    buttonDropDown.setAttribute("data-dropdown-toggle", "dropdownComment" + cmt.comment_id);
                    buttonDropDown.classList.add(
                        "inline-flex",
                        "items-center",
                        "p-2",
                        "text-sm",
                        "font-medium",
                        "text-center",
                        "text-white",
                        "dark:text-gray-400",
                        "bg-gray-500",
                        "rounded-lg",
                        "hover:bg-gray-700",
                        "hover:text-white",
                        "focus:ring-4",
                        "focus:outline-none",
                        "focus:ring-gray-50",
                    );
                    buttonDropDown.type = "button";
                    // Thêm nội dung vào nút button
                    const svg = document.createElement("svg");
                    svg.classList.add("w-4", "h-4");
                    svg.setAttribute("aria-hidden", "true");
                    svg.setAttribute("xmlns", "http://www.w3.org/2000/svg");
                    svg.setAttribute("fill", "currentColor");
                    svg.setAttribute("viewBox", "0 0 16 3");

                    const path = document.createElement("path");
                    path.setAttribute("d", "M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z");

                    svg.appendChild(path);
                    buttonDropDown.appendChild(svg);

                    const span = document.createElement("span");
                    span.classList.add("sr-only");
                    span.textContent = "Comment settings";
                    buttonDropDown.appendChild(span);

                    divContent.appendChild(buttonDropDown);

                    var dropdownDiv = document.createElement("div");
                    dropdownDiv.id = "dropdownComment" + cmt.comment_id;
                    dropdownDiv.classList.add(

                        "z-10",
                        "w-full",
                        "bg-white",
                        "rounded",
                        "divide-y",
                        "divide-gray-100",
                        "shadow",
                    );
                    var ul = document.createElement("ul");
                    ul.classList.add("py-1", "text-sm", "text-gray-700", "text-gray-200");
                    ul.setAttribute("aria-labelledby", "dropdownMenuIconHorizontalButton");
                    var menuItems = ["Edit", "Delete"];
                    var cnt = 0;
                    menuItems.forEach((itemText) => {
                        const li = document.createElement("li");
                        const a = document.createElement("button");
                        a.classList.add(
                            "block",
                            "py-2",
                            "px-4",
                            "hover:bg-gray-100",
                            "w-full"

                        );
                        a.textContent = itemText;
                        a.type = "button";
                        if (cnt == 0) {
                            a.onclick = function () {
                                console.log("Edit button clicked!");
                                a.disabled = true;
                                articleContent.style.display = "none";
                                var form = document.createElement("form");
                                form.classList.add("mb-6");
                                form.id = "editcmt";
                                var div1 = document.createElement("div");
                                div1.classList.add(
                                    "py-2",
                                    "px-4",
                                    "mb-4",
                                    "bg-white",
                                    "rounded-lg",
                                    "rounded-t-lg",
                                    "border",
                                    "border-gray-200",
                                    "dark:bg-gray-800",
                                    "dark:border-gray-700"
                                );
                                var label = document.createElement("label");
                                label.htmlFor = "comment";
                                label.classList.add("sr-only");
                                label.textContent = "Your comment";

                                // Tạo phần tử textarea
                                var textarea = document.createElement("textarea");
                                textarea.id = "editComment" + cmt.comment_id;
                                textarea.rows = "6";
                                textarea.cols = "100";
                                textarea.name = "editComment";
                                textarea.classList.add(
                                    "px-0",
                                    "w-full",
                                    "text-sm",
                                    "text-gray-900",
                                    "border-0",
                                    "focus:ring-0",
                                    "focus:outline-none",
                                    "dark:text-white",
                                    "dark:placeholder-gray-400",
                                    "dark:bg-gray-800"
                                );
                                textarea.placeholder = "Write a comment...";
                                textarea.textContent = cmt.comment;
                                textarea.required = true;

                                // Thêm label và textarea vào div đầu tiên
                                div1.appendChild(label);
                                div1.appendChild(textarea);

                                // Tạo phần tử div thứ hai
                                var div2 = document.createElement("div");
                                div2.classList.add("flex", "justify-center");

                                // Tạo nút submit
                                var submitButton = document.createElement("button");
                                submitButton.type = "submit";
                                submitButton.classList.add(
                                    "inline-flex",
                                    "items-center",
                                    "py-2.5",
                                    "px-4",
                                    "text-xs",
                                    "font-medium",
                                    "text-center",
                                    "text-white",
                                    "bg-[#66CCFF]",
                                    "rounded-lg",
                                    "focus:ring-4",
                                    "focus:ring-primary-200",
                                    "dark:focus:ring-primary-900",
                                    "hover:bg-primary-800"
                                );
                                submitButton.textContent = "Edit comment";
                                submitButton.onclick = function () {

                                }
                                // Thêm nút submit vào div thứ hai
                                div2.appendChild(submitButton);

                                // Thêm div1 và div2 vào biểu mẫu form
                                form.appendChild(div1);
                                form.appendChild(div2);

                                form.addEventListener("submit", function (event) {
                                    event.preventDefault(); // Ngăn form submit theo cách thông thường
                                    var editCommentUrl = '/api/editcomment/' + cmt.comment_id + "?editComment=" + document.getElementById("editComment" + cmt.comment_id).value;

                                    // Gửi request POST bằng AJAX hoặc Fetch API
                                    fetch(editCommentUrl, {
                                        method: "PUT",
                                        body: new FormData(form),
                                        headers: headers
                                    })
                                        .then(function (response) {
                                            return response.json();
                                        })
                                        .then(function (data) {
                                            if (data.success === true) {
                                                getComments(mid, currentCmtPage);
                                            } else {
                                                // Xử lý trường hợp không thành công (VD: hiển thị thông báo lỗi)
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Unable to perform operation',
                                                    html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                                                    confirmButtonText: 'Re-Login',
                                                    allowOutsideClick: false,
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        window.location.href = '/logoutHeader';
                                                    }
                                                });
                                            }
                                        })
                                        .catch(function (error) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'An error occurred: ' + error,
                                                html: 'Please try again later',
                                            });
                                        });
                                });

                                commentItem.appendChild(form);
                            };
                        }
                        if (cnt == 1) {
                            a.onclick = function () {
                                console.log("Delete button clicked!");
                                Swal.fire({
                                    title: 'Do you want to delete your comment?',
                                    showCancelButton: true,
                                    confirmButtonText: 'Delete',
                                    cancelButtonText: 'Rethink',
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        var commentId = cmt.comment_id;
                                        var apiUrl = `/api/dropcomment/${commentId}`;

                                        fetch(apiUrl, {
                                            method: "DELETE",
                                            headers: headers
                                        })
                                            .then(function (response) {
                                                return response.json();
                                            })
                                            .then(function (data) {
                                                if (data.success === true) {

                                                    Swal.fire(
                                                        'Deleted!',
                                                        'Comment deleted successfully!',
                                                        'success'
                                                    );
                                                    currentCmtPage = 1;
                                                    getComments(mid, currentCmtPage);
                                                } else {
                                                    // Xử lý trường hợp không thành công (VD: hiển thị thông báo lỗi)
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Unable to perform operation',
                                                        html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                                                        confirmButtonText: 'Re-Login',
                                                        allowOutsideClick: false,
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            window.location.href = '/logoutHeader';
                                                        }
                                                    });
                                                }
                                            })
                                            .catch(function (error) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'An error occurred: ' + error,
                                                    html: 'Please try again later',
                                                });
                                            });
                                    }
                                });
                            };
                        }
                        // Thêm phần tử a vào phần tử li
                        li.appendChild(a);

                        // Thêm phần tử li vào phần tử ul
                        ul.appendChild(li);
                        cnt++;
                    });
                    // Thêm phần tử ul vào phần tử div
                    dropdownDiv.appendChild(ul);

                    divContent2.appendChild(dropdownDiv);

                }
                else {
                    var divContentReport = document.createElement("div");
                    divContentReport.className = 'flex justify-end';
                    var btnReportCmt = document.createElement("button");
                    btnReportCmt.style.backgroundColor = "#ff6666";
                    var reportIcon = document.createElement("span");
                    reportIcon.className = "material-icons";
                    reportIcon.textContent = "flag";
                    reportIcon.style.color = "#fff";
                    btnReportCmt.appendChild(reportIcon);
                    btnReportCmt.title = "Report comments";
                    btnReportCmt.style.padding = '4px';
                    btnReportCmt.onclick = function () {
                        Swal.fire({
                            title: 'Do you want to report a comment?',
                            html: 'At ' + cmt.commentTime + ", account " + cmt.usname + " posted: </br>" + "<b>" + cmt.comment + "</b>",
                            showCancelButton: true,
                            confirmButtonText: 'Report',
                            cancelButtonText: 'Cancel'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                var postReportUrl = '/api/comment/report?commentId=' + cmt.comment_id;
                                fetch(postReportUrl, {
                                    method: "POST"
                                })
                                    .then(function (response) {
                                        return response.json();
                                    })
                                    .then(function (data) {
                                        if (data.success === true) {
                                            Swal.fire({
                                                icon: 'success',
                                                title: 'Comment report successful!',
                                                text: 'Thank you for reporting, we will look into this comment'
                                            });
                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Server error!',
                                                text: 'Please try again later'
                                            });
                                        }
                                    })
                                    .catch(function (error) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'System error!' + error,
                                            text: 'Please try again later'
                                        });
                                    });
                            }
                        });
                    }
                    footer.appendChild(btnReportCmt);
                }
                // Gắn các phần tử con vào article
                commentItem.appendChild(footer);
                commentItem.appendChild(articleContent);

                if (accId == cmt.user_id) {
                    //commentItem.appendChild(divContent);
                    commentItem.appendChild(divContent2);
                }
                else {
                    commentItem.appendChild(divContentReport);
                }

                commentList.appendChild(commentItem);

            });
            document.getElementById("load-prev-cmt-button").disabled = response.data.results.current_page === 1;
            document.getElementById("load-next-cmt-button").disabled = response.data.results.current_page ===
                response.data.results.last_page;
            document.getElementById("numofcmt").innerHTML = response.data.results.total;
        });
}

function removeAllCommentItems() {
    var commentList = document.getElementById("comment-list");
    while (commentList.firstChild) {
        commentList.removeChild(commentList.firstChild);
    }
}


document.addEventListener("DOMContentLoaded", function () {
    var mid = getMovieIdFromURL();
    getComments(mid, currentCmtPage);

    var form = document.getElementById("postcmt");
    if (form) {
        axios.get('/api/ratings/' + accId + '/' + mid)
            .then(function (response) {
                var rating = response.data.rating;
                if (rating) {
                    rating.forEach(function (rt) {
                        var ratingValue = parseFloat(rt.rating);
                        switch (ratingValue) {
                            case 1.0:
                                // Xử lý khi rating là 1
                                document.getElementById("star1").checked = true;
                                break;
                            case 2.0:
                                // Xử lý khi rating là 2
                                document.getElementById("star2").checked = true;
                                break;
                            case 3.0:
                                // Xử lý khi rating là 3
                                document.getElementById("star3").checked = true;
                                break;
                            case 4.0:
                                // Xử lý khi rating là 4
                                document.getElementById("star4").checked = true;
                                break;
                            case 5.0:
                                // Xử lý khi rating là 5
                                document.getElementById("star5").checked = true;
                                break;
                            default:

                                break;
                        }
                    });
                }
            });

        const stars = document.getElementsByName('rating');
        const ratingOutput = document.getElementById(
            'starpoint'); // Thay 'rating-output' bằng ID của phần tử hiển thị số sao đã chọn

        stars.forEach(star => star.addEventListener('click', () => {
            var selectedRating = event.target.value;
            var acclogged = accId;
            var currentmov = getMovieIdFromURL();
            ratingOutput.innerText = `Rate: ${selectedRating} stars`;
            console.log('danhgia: ' + selectedRating);
            sendRatingToAPI(selectedRating, acclogged, currentmov);
        }));

        function sendRatingToAPI(rating, acclogged, currentmov) {
            const apiUrl = '/api/postrating';
            const nums = 6;
            const pythonUrl = `http://127.0.0.1:8300/recommend?user_id=${acclogged}&movie_id=${currentmov}&ratingpoint=${rating}&num_recommendations=${nums}`;
            const data = {
                accId: acclogged,
                mId: currentmov,
                ratingpoint: rating
            };
            fetch(apiUrl, {
                method: 'POST',
                headers: headers,
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(function (data) {
                    if (data.success === false) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Unable to perform operation',
                            html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                            confirmButtonText: 'Re-Login',
                            allowOutsideClick: false,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/logoutHeader';
                            }
                        });
                    }
                    else {
                        localStorage.removeItem("recommendedMoviesForLoggedUser");
                        getRCMMoviesToLocalStorage();
                        var ratingElement = document.getElementById("mvdetail-rating");
                        var numRatingElement = document.getElementById("mvdetail-numrating");
                        ratingElement.innerHTML = data.mvpoint;
                        numRatingElement.innerHTML = data.numrating;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });

            fetch(pythonUrl, {
                method: 'POST',
            })
                .then(response => response.json())
                .then(data => {
                    // Handle the response data here
                    console.log(data);
                })
                .catch(error => {
                    // Handle errors here
                    console.error('Error:', error);
                });
        }

        // Thêm một trường input ẩn vào biểu mẫu để chứa giá trị accId
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = "accId"; // Đặt tên trường input tùy theo yêu cầu của bạn
        input.value = accId;
        // Thêm trường input vào biểu mẫu
        form.appendChild(input);


        var mid = getMovieIdFromURL();
        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "mId";
        input2.value = mid;
        form.appendChild(input2);

        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn form submit theo cách thông thường
            var postCommentUrl = '/api/postcomment';
            // Gửi request POST bằng AJAX hoặc Fetch API

            // Lấy dữ liệu từ form và chuyển đổi thành đối tượng JavaScript
            const formData = new FormData(form);
            const formDataObject = {};
            formData.forEach((value, key) => {
                formDataObject[key] = value;
            });
            // Chuyển đổi đối tượng JavaScript thành chuỗi JSON
            const jsonData = JSON.stringify(formDataObject);


            fetch(postCommentUrl, {
                method: "POST",
                body: jsonData,
                headers: headers
            })
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    if (data.success === true) {

                        document.getElementById("comment").value = '';
                        currentCmtPage = 1;
                        getComments(mid, currentCmtPage);
                    } else {
                        // Xử lý trường hợp không thành công (VD: hiển thị thông báo lỗi)

                        Swal.fire({
                            icon: 'error',
                            title: 'Unable to perform operation',
                            html: 'Because you do not have permission or the account is being logged in somewhere else.<br/> Please log in again!',
                            confirmButtonText: 'Re-Login',
                            allowOutsideClick: false,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/logoutHeader';
                            }
                        });

                    }
                })
                .catch(function (error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'An error occurred: ' + error,
                        html: 'Please try again later',
                    });
                });
        });
    }

});

function loadNextComment() {
    var mid = getMovieIdFromURL();
    currentCmtPage = currentCmtPage + 1;
    getComments(mid, currentCmtPage);
}

function loadPrevComment() {
    if (currentCmtPage > 1) {

        var mid = getMovieIdFromURL();
        currentCmtPage = currentCmtPage - 1;
        getComments(mid, currentCmtPage);
    }
}

function getMovieInfoToWatch() {
    var movieId = getMovieIdFromURL();
    var chapterBtn = document.getElementById("list-chapter-btns");
    while (chapterBtn.firstChild) {
        chapterBtn.removeChild(chapterBtn.firstChild);
    }
    var chapterSrc = "";
    axios.get('/api/movies/' + movieId)
        .then(function (response) {
            var moviedt = response.data.movie_detail;
            if (moviedt) {
                moviedt.forEach(function (movie) {
                    var mvtitleText = movie.title_en + " (" + movie.title_vi + ")";
                    $('#watchmvtitle').text(mvtitleText);
                });
                var chapters = response.data.chapters;
                if (chapters) {
                    var cnt = 0;
                    chapters.forEach(function (chapter) {
                        var button = document.createElement("button");
                        button.type = "button";
                        button.className = "chapterBtn mt-2 hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow";
                        button.textContent = chapter.chapter_name;
                        button.addEventListener("click", function () {
                            var btnGroup = document.getElementsByClassName("chapterBtn");
                            var btnArray = Array.from(btnGroup);
                            btnArray.forEach(function (btn) {
                                btn.classList.remove("bg-[#66CCFF]", "text-white");
                                btn.disabled = false;
                            });
                            $('#watchmovievideo').attr('src', chapter.chapterURL);
                            button.classList.add("bg-[#66CCFF]", "text-white");
                            button.disabled = true;
                        });
                        chapterBtn.appendChild(button);
                        if (cnt == 0) {
                            $('#watchmovievideo').attr('src', chapter.chapterURL);
                            button.classList.add("bg-[#66CCFF]", "text-white");
                            button.disabled = true;
                        }
                        cnt++;
                        console.log('cnt: ' + cnt);
                    });
                    startTimer();
                }
            }
        });
}

function closeModalWatchMovie() {
    $("#watchMovieModal").modal('hide');
    $('#watchmvtitle').text('');
    $('#watchmovievideo').attr('src', '');
    var chapterBtn = document.getElementById("list-chapter-btns");
    while (chapterBtn.firstChild) {
        chapterBtn.removeChild(chapterBtn.firstChild);
    }
    stopTimer();
}

function getLatestMovies() {

    axios.get('/api/movies?num=6')
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("new-list");
            var movies = response.data.results.movies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_en;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0) {
                        image.src = movie.posterURL;
                    } else if (movie.typeOfPosterURL == 1) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else if (movie.typeOfPosterURL == 2) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else {
                        image.src = defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0)
                            image.src = movie.posterURL;
                        else image.src = defaultImageUrl;
                    } else image.src = defaultImageUrl;
                };
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height = "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height = "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_en;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Year: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Length: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getRecommendedMovies() {

    axios.get('/api/movies/recommended/' + accId + "?num=6")
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("recommended-list");
            var movies = response.data.results.recommendedmovies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_en;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0) {
                        image.src = movie.posterURL;
                    } else if (movie.typeOfPosterURL == 1) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else if (movie.typeOfPosterURL == 2) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else {
                        image.src = defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0)
                            image.src = movie.posterURL;
                        else image.src = defaultImageUrl;
                    } else image.src = defaultImageUrl;
                };
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height = "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height = "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_en;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Year: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Length: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getRelatedMovies() {

    axios.get('/api/movies/recommended-by-movie/' + getMovieIdFromURL() + "?num=6" + "&userid=" + accId)
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("related-list");
            var movies = response.data.recommended_movies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_en;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0) {
                        image.src = movie.posterURL;
                    } else if (movie.typeOfPosterURL == 1) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else if (movie.typeOfPosterURL == 2) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else {
                        image.src = defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0)
                            image.src = movie.posterURL;
                        else image.src = defaultImageUrl;
                    } else image.src = defaultImageUrl;
                };
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height = "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height = "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_en;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Year: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Length: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}

function getRecommendedMoviesFrom() {
    var movieList = document.getElementById("recommended-list");
    var parsedArray = [];
    var retrievedData = localStorage.getItem("recommendedMoviesForLoggedUser");
    if (retrievedData) {
        parsedArray = JSON.parse(retrievedData);
    }
    var movies = parsedArray.slice(0, 6);

    movies.forEach(function (movie) {
        var movieItem = document.createElement("div");
        movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

        var image = document.createElement("img");
        image.alt = movie[1];
        image.style.width = '100%';
        image.style.objectFit = "cover";
        image.className = "rounded-t-lg";
        if (movie[9] != null) {
            if (movie[8] == 0) {
                image.src = movie[9];
            } else if (movie[8] == 1) {
                var movieId = movie[9];
                var xhrmv = new XMLHttpRequest();
                xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                xhrmv.onload = function () {
                    if (xhrmv.status === 200) {
                        var response = JSON.parse(xhrmv.responseText);
                        image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                    } else {
                        console.error('Error calling the API.');
                    }
                };
                xhrmv.send();
            } else if (movie[8] == 2) {
                var movieId = movie[9];
                var xhrmv = new XMLHttpRequest();
                xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                xhrmv.onload = function () {
                    if (xhrmv.status === 200) {
                        var response = JSON.parse(xhrmv.responseText);
                        image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                    } else {
                        console.error('Error calling the API.');
                    }
                };
                xhrmv.send();
            } else {
                image.src = defaultImageUrl;
            }
        }
        else image.src = defaultImageUrl;
        image.onerror = function () {
            if (movie[9] != null) {
                if (movie[8] == 0)
                    image.src = movie[9];
                else image.src = defaultImageUrl;
            } else image.src = defaultImageUrl;
        };
        movieItem.insertAdjacentElement('afterbegin', image);

        var mid = document.createElement("h6");
        mid.textContent = movie[0];
        mid.className = "text-ellipsis mvid";
        mid.style.height = "0px";
        movieItem.appendChild(mid);

        var murl = document.createElement("h5");
        murl.textContent = movie[11];
        murl.className = "text-ellipsis mvurl";
        murl.style.height = "0px";
        movieItem.appendChild(murl);

        var title = document.createElement("h3");
        title.textContent = movie[1];
        title.className = "text-ellipsis mb-2 text-lg font-semibold";
        movieItem.appendChild(title);

        var director = document.createElement("p");
        director.textContent = "Year: " + movie[6];
        director.className = "text-ellipsis";
        movieItem.appendChild(director);

        var actors = document.createElement("p");
        actors.textContent = "Length: " + movie[7];
        actors.className = "text-ellipsis";
        movieItem.appendChild(actors);


        movieList.appendChild(movieItem);

    });
    addTooltip();
}

function getRecommendedMoviesFromPython(ids) {

    axios.get('/api/recommended-python?id_list=' + ids)
        .then(function (response) {
            //removeAllMovieItems();
            var movieList = document.getElementById("recommended-list");
            var movies = response.data.results.recommendedmovies;

            // Lặp qua danh sách phim và tạo các thẻ <li> để hiển thị thông tin về mỗi bộ phim
            movies.forEach(function (movie) {
                var movieItem = document.createElement("div");
                movieItem.className = "grid-item rounded-lg bg-white shadow-lg";

                // Tạo thẻ <img> để hiển thị hình ảnh phim
                var image = document.createElement("img");
                image.alt = movie.title_en;
                image.style.width = '100%';
                image.style.objectFit = "cover";
                image.className = "rounded-t-lg";
                if (movie.posterURL != null) {
                    if (movie.typeOfPosterURL == 0) {
                        image.src = movie.posterURL;
                    } else if (movie.typeOfPosterURL == 1) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedb.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else if (movie.typeOfPosterURL == 2) {
                        var movieId = movie.posterURL;
                        var xhrmv = new XMLHttpRequest();
                        xhrmv.open('GET', apiUrlFromThemoviedbTV.replace('{movie_id}', movieId), true);
                        xhrmv.onload = function () {
                            if (xhrmv.status === 200) {
                                // Chuyển đổi dữ liệu JSON từ phản hồi API
                                var response = JSON.parse(xhrmv.responseText);

                                // Lấy URL của ảnh bộ phim từ phản hồi API và gán cho defaultImageUrl
                                image.src = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2' + response.poster_path;
                            } else {
                                // Xử lý trường hợp lỗi khi gọi API
                                console.error('Error calling the API.');
                            }
                        };
                        xhrmv.send();
                    } else {
                        image.src = defaultImageUrl;
                    }
                }
                else image.src = defaultImageUrl;
                image.onerror = function () {
                    // Sử dụng hình ảnh mặc định nếu xảy ra lỗi
                    if (movie.posterURL != null) {
                        if (movie.typeOfPosterURL == 0)
                            image.src = movie.posterURL;
                        else image.src = defaultImageUrl;
                    } else image.src = defaultImageUrl;
                };
                movieItem.insertAdjacentElement('afterbegin', image);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var mid = document.createElement("h6");
                mid.textContent = movie.movie_id;
                mid.className = "text-ellipsis mvid";
                mid.style.height = "0px";
                movieItem.appendChild(mid);
                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var murl = document.createElement("h5");
                murl.textContent = movie.movie_url;
                murl.className = "text-ellipsis mvurl";
                murl.style.height = "0px";
                movieItem.appendChild(murl);

                // Tạo thẻ <h3> để hiển thị tiêu đề phim
                var title = document.createElement("h3");
                title.textContent = movie.title_en;
                title.className = "text-ellipsis mb-2 text-lg font-semibold";
                movieItem.appendChild(title);

                // Tạo thẻ <p> để hiển thị đạo diễn
                var director = document.createElement("p");
                director.textContent = "Year: " + movie.manufactureYear;
                director.className = "text-ellipsis";
                movieItem.appendChild(director);

                // Tạo thẻ <p> để hiển thị danh sách diễn viên
                var actors = document.createElement("p");
                actors.textContent = "Length: " + movie.videoLength;
                actors.className = "text-ellipsis";
                movieItem.appendChild(actors);

                // Thêm thông tin về bộ phim vào danh sách
                movieList.appendChild(movieItem);

            });
            addTooltip();
        })
        .catch(function (error) {
            console.log(error);
        });
}

function startTimer() {
    //3 phut dem nguoc
    timer = setTimeout(function () {
        var movieId = getMovieIdFromURL();
        fetch(`/api/postview/${movieId}`, {
            method: 'PUT',
        })
            .then(response => {

            })
            .catch(error => {
                console.error('Lỗi khi gọi API PUT:', error);
            });
    }, 1 * 60 * 1000); // 1 phút
}
function stopTimer() {
    clearTimeout(timer);
}

