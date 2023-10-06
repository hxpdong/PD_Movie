function isValidId(accId) {
    if (accId && typeof accId === 'string' && accId.trim() !== '') {
        const idNumber = parseInt(accId, 10);
        if (!isNaN(idNumber) && idNumber > 0) {
            return true;
        }
    }
    return false;
}

function getRCMMoviesToLocalStorage() {
    var recommendedMoviesArray =[];
    var id;
    if (localStorage.getItem('accId')) {
        var localStorageId = localStorage.getItem('accId');
        if (isValidId(localStorageId)) {
            id = localStorageId;
        } else {
            id = accId || localStorageId;
        }
    } else if (accId) {
        id = accId;
    } else {
        id = null;
    }
    
    axios.get('/api/movies/recommended/' + id)
        .then(function (response) {
            var movies = response.data.results.recommendedmovies;
            movies.forEach(function (movie) {
                var mv = [
                    movie.movie_id, 
                    movie.title_vi, 
                    movie.title_en, 
                    movie.content, 
                    movie.director, 
                    movie.actors,
                    movie.manufactureYear,
                    movie.videoLength,
                    movie.typeOfPosterURL,
                    movie.posterURL,
                    movie.updateAt,
                    movie.movie_url,
                    movie.mvrating
                ];
                recommendedMoviesArray.push(mv);
            });
            localStorage.setItem("recommendedMoviesForLoggedUser", JSON.stringify(recommendedMoviesArray));
        })
        .catch(function (error) {
            console.log(error);
        });
}
