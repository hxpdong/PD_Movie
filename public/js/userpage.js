var uid = null;

document.addEventListener("DOMContentLoaded", function () {
    console.log('UID1: ', uid);
    var username = getUsernameFromURL();
    if(username){
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
                getCommentList(uid);
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
                    if(usActItemElement)
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

function getCommentList(user_id) {
    axios.get('/api/users/get-commentlist/' + user_id)
        .then(function (response) {
            var commentList = response.data.listcomment;
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
                        
                        var btnUpt = document.createElement("button");
                        btnUpt.type = "button";
                        btnUpt.className = "text-[#66ccff] px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnUpt.textContent = "Sửa";
                        btnUpt.onclick = function () {
                            uptComment(cmt.comment_id, "Nội dung mới");
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
                        ratingpoint.textContent = rt.rating;
                        var hrtag = document.createElement("hr");
                        hrtag.className = "border-1 cursor-pointer duration-500";
                        var link = document.createElement("a");
                        link.href = "/movies/mv" + rt.movie_id + "-" + rt.movie_url;
                        link.appendChild(movie);
                        var divBtn = document.createElement("div");
                        divBtn.className = "flex justify-end";
                        var btnDel = document.createElement("button");
                        btnDel.type = "button";
                        btnDel.className = "text-red-500 px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnDel.textContent = "Xóa";
                        btnDel.onclick = function () {
                            delRating(rt.rating_id); // Truyền rating_id cụ thể
                        };
                        var btnUpt = document.createElement("button");
                        btnUpt.type = "button";
                        btnUpt.className = "text-[#66ccff] px-3 rounded-xl mb-3 mx-1 font-medium border-2 border-red-500";
                        btnUpt.textContent = "Sửa";
                        btnUpt.onclick = function () {
                            uptRating(rt.rating_id, "Điểm mới"); // Truyền rating_id và điểm mới cụ thể
                        };
                        divBtn.appendChild(btnUpt);
                        divBtn.appendChild(btnDel);
                        li.appendChild(ratingtime);
                        li.appendChild(link);
                        li.appendChild(ratingpoint);
                        li.appendChild(divBtn);
                        li.appendChild(hrtag);
                        ratingListElement.appendChild(li);
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

function delComment(cmtId) {
    alert("Xóa comment: " + cmtId);
}
function delRating(ratId) {
    alert("Xóa rating: " + ratId);
}
function uptComment(cmtId, cmtContent) {
    alert("Cập nhật comment: " + cmtId + ", nội dung: " + cmtContent);
}
function uptRating(ratId, ratPoint) {
    alert("Cập nhật rating: " + ratId + ", điểm mới: " + ratPoint);
}
