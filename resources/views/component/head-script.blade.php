<!--
<script src="https://cdn.tailwindcss.com"></script>
-->
@vite('resources/css/app.css')

<head>
    <link rel="icon" href="/img/fav-removebg.png" type="image/x-icon">
    <link rel="shortcut icon" href="/img/fav-removebg.png" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    var apiUrl = "/api/system/get-api/movie";
    var apiUrlTV = "/api/system/get-api/tv";
    var apiUrlFromThemoviedb;
    var apiUrlFromThemoviedbTV;
    fetch(apiUrl)
        .then(function(response) {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(function(data) {
            apiUrlFromThemoviedb = data.themoviedbLINK;
        })
        .catch(function(error) {
            // Xử lý lỗi nếu có
            console.error("Lỗi: " + error.message);
        });
    fetch(apiUrlTV)
        .then(function(response) {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(function(data) {
            apiUrlFromThemoviedbTV = data.themoviedbLINK;
        })
        .catch(function(error) {
            // Xử lý lỗi nếu có
            console.error("Lỗi: " + error.message);
        });
</script>