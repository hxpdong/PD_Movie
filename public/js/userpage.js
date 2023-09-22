var uid = null;
var currentCmtPage = 1;

document.addEventListener("DOMContentLoaded", function () {
    console.log('UID1: ', uid);
    var username = getUsernameFromURL();
    if (username) {
        getUserInfo(username);
    }
});

function getUsernameFromURL() {
    const url = window.location.href;
    const urlParts = url.split('/');
    const username = urlParts[urlParts.indexOf('users') + 1];
    return username;
}

function getUid() {
    console.log('UID-click: ', uid);
}

function getUserInfo(username) {
    axios.get('/api/users/by-username/' + username)
        .then(function (response) {
            var fullnameElement = document.getElementById("us-fullname");
            var usernameElement = document.getElementById("us-username");
            var uidElement = document.getElementById("us-uid");
            if (response.data.success) {
                var userInfo = response.data.userInfo[0];
                if (userInfo.fullname) {
                    fullnameElement.innerHTML = userInfo.fullname;
                    document.title = userInfo.fullname;
                } else {
                    fullnameElement.innerHTML = userInfo.usname;
                    document.title = userInfo.usname;
                }
                usernameElement.innerHTML = userInfo.usname;
                uidElement.innerHTML = userInfo.user_id;
                uid = userInfo.user_id;
                console.log('UID2: ', uid);
                getSimilarityUsers(uid);
                getCommentList(currentCmtPage, uid);
                getRatingList(uid);
                var listFavMovies = response.data.favmovies;
                var favoriteList = document.getElementById("us-favoriteList");
                var favoriteItem = document.getElementById("us-fsvoriteItem");
                favoriteList.removeChild(favoriteItem);
                if (listFavMovies && listFavMovies.length > 0) {
                    listFavMovies.forEach(function (movie) {
                        var link = document.createElement("a");
                        link.href = "/movies/mv" + movie.movie_id + "-" + movie.movie_url;
                        link.classList.add("border-gray-300", "border-2", "rounded-xl", "w-full", "py-7", "px-5", "m-2");

                        var card = document.createElement("div");
                        card.classList.add("grid", "grid-cols-6", "gap-3");

                        var imageContainer = document.createElement("div");
                        imageContainer.classList.add("col-span-1");

                        var image = document.createElement("img");
                        if (movie.posterURL != null)
                            image.src = movie.posterURL;
                        else image.src = "/img/banner.png";

                        var contentContainer = document.createElement("div");
                        contentContainer.classList.add("col-span-5");

                        var title = document.createElement("div");
                        title.classList.add("text-gray-700", "font-bold", "truncate");
                        title.textContent = movie.title_vi;

                        var ratingContainer = document.createElement("div");
                        ratingContainer.classList.add("flex", "justify-end", "items-end", "h-full");

                        var rating = document.createElement("div");
                        rating.classList.add("bg-[#f5e50b]", "font-bold", "rounded-xl", "p-2", "flex", "items-end");
                        rating.textContent = movie.rating + "/5.0";

                        ratingContainer.appendChild(rating);
                        contentContainer.appendChild(title);
                        contentContainer.appendChild(ratingContainer);
                        imageContainer.appendChild(image);
                        card.appendChild(imageContainer);
                        card.appendChild(contentContainer);
                        link.appendChild(card);

                        favoriteList.appendChild(link);
                    });
                } else {
                    document.getElementById("us-notfoundFavoriteMovies").innerHTML = "Không tìm thấy phim";
                }

                var usActivitiesElement = document.getElementById("us-activities");
                if (uid != accId) {
                    var usActItemElement = document.getElementById("us-act-item");
                    if (usActItemElement)
                        usActivitiesElement.removeChild(usActItemElement);
                }

            } else {
                window.location.href = "/";
            }
        })
        .catch(function (error) {
            console.log("Lỗi khi gửi yêu cầu: " + error);
            console.trace();
        });


}

function getSimilarityUsers(user_id) {
    axios.get('/api/users/similarity-users/' + user_id)
        .then(function (response) {
            var similarUsers = response.data.sameUsers;
            if (similarUsers && similarUsers.length > 0) {
                //console.log("Kết quả tương đồng:");
                var similarUsersList = document.getElementById("similarUser-list");
                similarUsers.forEach(function (user) {
                    /*
                    console.log("STT: " + user.user_stt);
                    console.log("User ID: " + user.user_id);
                    console.log("Độ tương đồng cosine: " + user.cosine_similarity);
                    console.log("------------------");
                    */
                    var containerDiv = document.createElement("div");
                    containerDiv.className = "text-center my-2";

                    var imageLink = document.createElement("a");
                    imageLink.href = "/users/" + user.usname;

                    var image = document.createElement("img");
                    image.className = "h-16 w-16 rounded-full mx-auto";
                    image.src = "/img/avtuser.jpg";
                    image.alt = "";
                    imageLink.appendChild(image);

                    var usernameLink = document.createElement("a");
                    usernameLink.href = "/users/" + user.usname;
                    usernameLink.className = "text-main-color";
                    usernameLink.textContent = user.usname;

                    var cosineSimilarity = parseFloat(user.cosine_similarity).toFixed(2);
                    var similarRate = document.createElement("div");
                    similarRate.textContent = " (" + cosineSimilarity + "%) ";

                    containerDiv.appendChild(imageLink);
                    containerDiv.appendChild(usernameLink);
                    containerDiv.appendChild(similarRate);

                    similarUsersList.appendChild(containerDiv);
                });
            } else {
                document.getElementById("us-notfoundsimilaruser").innerHTML = "Không tìm thấy người dùng tương tự do người dùng chưa thực hiện đánh giá";
            }
        })
        .catch(function (error) {
            console.log("Lỗi khi gửi yêu cầu: " + error);
            console.trace();
        });
}

function getCommentList(page, user_id) {
    axios.get('/api/users/get-commentlist/' + user_id +"?page=" + page)
        .then(function (response) {
            var commentList = response.data.listcomment.comments;
            if (commentList && commentList.length > 0) {
                var commentListElement = document.getElementById("us-commentList");
                if (commentListElement) {
                    commentList.forEach(function (cmt) {
                        var li = document.createElement("li");
                        li.className = "px-2";
                        var cmttime = document.createElement("div");
                        cmttime.className = "text-teal-600";
                        cmttime.textContent = cmt.commentTime;
                        var movie = document.createElement("div");
                        movie.className = "text-teal-600 font-bold";
                        movie.textContent = cmt.title_vi;
                        var contentcmt = document.createElement("div");
                        contentcmt.className = "text-black text-xs text-justify px-5 mb-2";
                        contentcmt.textContent = cmt.comment;
                        var hrtag = document.createElement("hr");
                        hrtag.className = "border-1 cursor-pointer duration-500";
                        var link = document.createElement("a");
                        link.href = "/movies/mv" + cmt.movie_id + "-" + cmt.movie_url;
                        link.appendChild(movie);
                        var divBtn = document.createElement("div");
                        divBtn.className = "flex justify-end";
                        var btnDel = document.createElement("button");
                        btnDel.type = "button";
                        btnDel.className = "text-red-500 px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnDel.textContent = "Xóa";
                        btnDel.onclick = function () {
                            console.log("Xóa button clicked!");
                            Swal.fire({
                                title: 'Bạn muốn xóa bình luận?',
                                showCancelButton: true,
                                confirmButtonText: 'Xóa',
                                cancelButtonText: 'Suy nghĩ lại'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    var commentId = cmt.comment_id;
                                    var apiUrl = `/api/dropcomment/${commentId}`;
                                    fetch(apiUrl, {
                                        method: "DELETE"
                                    })
                                        .then(function (response) {
                                            return response.json();
                                        })
                                        .then(function (data) {
                                            if (data.success === true) {
                                                Swal.fire(
                                                    'Đã xóa!',
                                                    'Xóa bình luận thành công!',
                                                    'success'
                                                );
                                                if (li && li.parentNode) {
                                                    li.parentNode.removeChild(li);
                                                }
                                            } else {
                                                Swal.fire(
                                                    'Xóa thất bại!',
                                                    'Xóa bình luận thất bại!',
                                                    'error'
                                                );
                                                console.log("xoa that bai");
                                            }
                                        })
                                        .catch(function (error) {
                                            alert("An error occurred. Please try again later." + error);
                                            console.trace();
                                        });
                                }
                            });
                        };
                        var btnUpt = document.createElement("button");
                        btnUpt.type = "button";
                        btnUpt.className = "text-[#66ccff] px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnUpt.textContent = "Sửa";
                        btnUpt.onclick = function () {
                            console.log("Sửa button clicked!");
                            btnUpt.disabled = true;
                            contentcmt.style.display = "none";
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
                            textarea.placeholder = "Viết bình luận...";
                            textarea.textContent = contentcmt.textContent;
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
                            submitButton.textContent = "Sửa bình luận";
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
                                })
                                    .then(function (response) {
                                        return response.json();
                                    })
                                    .then(function (data) {
                                        if (data.success === true) {
                                            contentcmt.style.display = "";
                                            contentcmt.textContent = document.getElementById("editComment" + cmt.comment_id).value;
                                            divBtn.removeChild(form);
                                            btnUpt.disabled = false;
                                        } else {
                                            alert("Post failed. Please try again.");
                                        }
                                    })
                                    .catch(function (error) {
                                        alert("An error occurred. Please try again later." + error);
                                        console.trace();
                                    });
                            });

                            divBtn.appendChild(form);
                        };
                        divBtn.appendChild(btnUpt);
                        divBtn.appendChild(btnDel);
                        li.appendChild(cmttime);
                        li.appendChild(link);
                        li.appendChild(contentcmt);
                        li.appendChild(divBtn);
                        li.appendChild(hrtag);
                        commentListElement.appendChild(li);
                    });
                }

            } else {
                var element = document.getElementById("us-notfoundcomment");
                if (element !== null) {
                    element.innerHTML = "Không tìm thấy bình luận";
                }
            }
            if(document.getElementById("load-more-cmt-button")){
                document.getElementById("load-more-cmt-button").disabled = response.data.listcomment.current_page ===
                response.data.listcomment.last_page;
            if(response.data.listcomment.current_page ===
                response.data.listcomment.last_page)
                {
                    document.getElementById("endOfCommentList").innerHTML = "Đã đến cuối danh sách";
                    document.getElementById("load-more-cmt-button").style.display = "none";
                }
            }
        })
        .catch(function (error) {
            console.log("Lỗi khi gửi yêu cầu: " + error);
            console.trace();
        });
}

function getRatingList(user_id) {
    axios.get('/api/users/get-ratinglist/' + user_id)
        .then(function (response) {
            var ratingList = response.data.listrating;
            if (ratingList && ratingList.length > 0) {
                var ratingListElement = document.getElementById("us-ratingList");
                if (ratingListElement) {
                    ratingList.forEach(function (rt) {
                        var li = document.createElement("li");
                        li.className = "px-2";
                        var ratingtime = document.createElement("div");
                        ratingtime.className = "text-teal-600";
                        ratingtime.textContent = rt.ratingTime;
                        var movie = document.createElement("div");
                        movie.className = "text-teal-600 font-bold";
                        movie.textContent = rt.title_vi;
                        var ratingpoint = document.createElement("div");
                        ratingpoint.className = "text-gray-500 font-bold mb-2";
                        ratingpoint.id = 'ratingpoint' + rt.rating_id;
                        ratingpoint.textContent = rt.rating;
                        ratingpoint.style.display = "none";
                        var hrtag = document.createElement("hr");
                        hrtag.className = "border-1 cursor-pointer duration-500";
                        var link = document.createElement("a");
                        link.href = "/movies/mv" + rt.movie_id + "-" + rt.movie_url;
                        link.appendChild(movie);
                        var divEditRat = document.createElement("div");
                        //divEditRat.style.display = "none";
                        var divBtn = document.createElement("div");
                        divBtn.className = "flex justify-end";
                        var btnDel = document.createElement("button");
                        btnDel.type = "button";
                        btnDel.className = "text-red-500 px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnDel.textContent = "Xóa";
                        btnDel.onclick = function () {
                            console.log("Xóa button clicked!");
                            Swal.fire({
                                title: 'Bạn muốn xóa đánh giá?',
                                showCancelButton: true,
                                confirmButtonText: 'Xóa',
                                cancelButtonText: 'Suy nghĩ lại'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    var ratingId = rt.rating_id;
                                    var apiUrl = `/api/droprating/${ratingId}`;
                                    fetch(apiUrl, {
                                        method: "DELETE"
                                    })
                                        .then(function (response) {
                                            return response.json();
                                        })
                                        .then(function (data) {
                                            if (data.success === true) {
                                                Swal.fire(
                                                    'Đã xóa!',
                                                    'Xóa đánh giá thành công!',
                                                    'success'
                                                );
                                                if (li && li.parentNode) {
                                                    li.parentNode.removeChild(li);
                                                }
                                            } else {
                                                Swal.fire(
                                                    'Xóa thất bại!',
                                                    'Xóa bình luận thất bại!',
                                                    'error'
                                                );
                                                console.log("xoa that bai");
                                            }
                                        })
                                        .catch(function (error) {
                                            alert("An error occurred. Please try again later." + error);
                                            console.trace();
                                        });
                                }
                            });
                        };
                        var btnUpt = document.createElement("button");
                        btnUpt.type = "button";
                        btnUpt.className = "text-[#66ccff] px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnUpt.textContent = "Sửa";
                        btnUpt.onclick = function () {
                            console.log("Sửa button clicked!");
                            btnUpt.disabled = true;
                            divEditRat.style.display = "";
                        };
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

                        var starRatingDiv = document.createElement("div");
                        starRatingDiv.className = "star-rating";
                        var starTitles = ["Rất tệ", "Tệ", "Bình thường", "Tốt", "Rất tốt"];
                        for (var i = 5; i >= 1; i--) {
                            var starInput = document.createElement("input");
                            starInput.type = "radio";
                            starInput.name = "rating" + rt.rating_id;
                            starInput.id = "star" + rt.rating_id + "-" + i;
                            starInput.value = i;

                            var starLabel = document.createElement("label");
                            starLabel.htmlFor = "star" + rt.rating_id + "-" + i;
                            starLabel.title = starTitles[i - 1];
                            starRatingDiv.appendChild(starInput);
                            starRatingDiv.appendChild(starLabel);
                        }
                        var starPointDiv = document.createElement("div");
                        starPointDiv.id = "starpoint";
                        div1.appendChild(starRatingDiv);
                        div1.appendChild(starPointDiv);

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
                        submitButton.onclick = function () {
                            btnUpt.disabled = false;
                            divEditRat.style.display = "none";
                        }
                        submitButton.textContent = "Đóng";
                        // Thêm nút submit vào div thứ hai
                        //div2.appendChild(submitButton);
                        //thuc hien danh gia
                        axios.get('/api/ratings/' + accId + '/' + rt.movie_id)
                            .then(function (response) {
                                var rating = response.data.rating;
                                if (rating) {
                                    rating.forEach(function (rt) {
                                        var ratingValue = parseFloat(rt.rating);
                                        switch (ratingValue) {
                                            case 1.0:
                                                document.getElementById("star" + rt.rating_id + "-1").checked = true;
                                                break;
                                            case 2.0:
                                                document.getElementById("star" + rt.rating_id + "-2").checked = true;
                                                break;
                                            case 3.0:
                                                document.getElementById("star" + rt.rating_id + "-3").checked = true;
                                                break;
                                            case 4.0:
                                                document.getElementById("star" + rt.rating_id + "-4").checked = true;
                                                break;
                                            case 5.0:
                                                document.getElementById("star" + rt.rating_id + "-5").checked = true;
                                                break;
                                            default:
                                                break;
                                        }
                                    });
                                }
                            });

                        divEditRat.appendChild(div1);
                        divEditRat.appendChild(div2);
                        //divBtn.appendChild(btnUpt);
                        divBtn.appendChild(btnDel);
                        li.appendChild(ratingtime);
                        li.appendChild(link);
                        li.appendChild(ratingpoint);
                        li.appendChild(divEditRat);
                        li.appendChild(divBtn);
                        li.appendChild(hrtag);
                        ratingListElement.appendChild(li);

                        console.log("Đã thêm rating thứ: " + rt.rating_id);
                        //xử lý sự kiện khi đánh giá thay đổi
                        var rtName = 'rating' + rt.rating_id;
                        console.log(rtName);
                        const stars = document.getElementsByName(rtName);
                        if (stars.length == 0) console.log("Mảng stars rỗng: " + rtName);
                        const ratingOutput = document.getElementById(
                            'ratingpoint' + rt.rating_id);
                        stars.forEach(star => star.addEventListener('click', () => {
                            console.log('clicked');
                            var selectedRating = event.target.value;
                            var acclogged = accId;
                            var currentmov = rt.movie_id;
                            ratingOutput.textContent = `Đánh giá: ${selectedRating} sao`;
                            console.log('danhgia: ' + selectedRating);
                            sendRatingToAPI(selectedRating, acclogged, currentmov);
                        }));
                        function sendRatingToAPI(rating, acclogged, currentmov) {
                            axios.post('/api/postrating', {
                                accId: acclogged,
                                mId: currentmov,
                                ratingpoint: rating
                            })
                                .then(function (response) {
                                    // Xử lý phản hồi từ API nếu cần
                                })
                                .catch(function (error) {
                                    console.error(error);
                                });
                        }
                    });
                }
            } else {
                var element = document.getElementById("us-notfoundrating");
                if (element !== null) {
                    element.innerHTML = "Không tìm thấy đánh giá";
                }
            }
        })
        .catch(function (error) {
            console.log("Lỗi khi gửi yêu cầu: " + error);
            console.trace();
        });
}

function loadMoreComment() {
    currentCmtPage = currentCmtPage + 1;
    getCommentList(currentCmtPage, uid);
}