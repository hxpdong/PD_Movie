var uid = null;

document.addEventListener("DOMContentLoaded", function () {
    console.log('UID1: ', uid);
    var username = getUsernameFromURL();
    getUserInfo(username);
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
                if(userInfo.fullname){
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

                var listFavMovies = response.data.favmovies;
                if (listFavMovies && listFavMovies.length > 0) {
                    var favoriteList = document.getElementById("us-favoriteList");
                    listFavMovies.forEach(function (movie) {
                        var link = document.createElement("a");
                        link.href = "/movies/mv" + movie.movie_id + "-" + movie.movie_url;
                        link.classList.add("border-gray-300", "border-2", "rounded-xl", "w-full", "py-7", "px-5", "m-1");

                        var card = document.createElement("div");
                        card.classList.add("grid", "grid-cols-6", "gap-3");

                        var imageContainer = document.createElement("div");
                        imageContainer.classList.add("col-span-1");

                        var image = document.createElement("img");
                        if(movie.posterURL != null)
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
                if(uid != accId){
                    var usActItemElement = document.getElementById("us-act-item");
                    usActivitiesElement.removeChild(usActItemElement);
                }
                
            } else {
                window.location.href = "/";
            }
        })
        .catch(function (error) {
            console.log("Lỗi khi gửi yêu cầu: " + error);
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
        });
}