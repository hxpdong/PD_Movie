DROP DATABASE IF EXISTS rcm_movie;
CREATE DATABASE rcm_movie;
USE rcm_movie;
CREATE TABLE pdmv_acctypes (
  	acctype_id INT PRIMARY KEY AUTO_INCREMENT,
  	ustype_name NVARCHAR(50) NOT NULL
);

INSERT INTO pdmv_acctypes(acctype_id, ustype_name)
VALUES
    (1, 'Super admin'),
    (2, 'Admin'),
	(3, 'Người dùng');

CREATE TABLE pdmv_accounts (
    acc_id INT PRIMARY KEY AUTO_INCREMENT,
    usname VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    acctype_id INT NOT NULL,
    FOREIGN KEY (acctype_id) REFERENCES pdmv_acctypes(acctype_id)
);

INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES
    (1, 'super_admin', '$2a$12$byfCCx7oYDKa/dWbhcWe3uED.axUgpQyPalUVgxgrq9Nj.bC012zm', 1),
    (2, 'admin1', '$2a$12$/LaZVO6PLZabWbQ.KIjXLe1ert5NADqHmn3O7rVSAJA238jD.MSH2', 2);

INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES
    (3, 'user1', '$2a$12$UFJvUQw2xgkT/7zfyrFOPOti21ZCKQlEJ5XsmBI3J0rNXlts5GK8u', 3),
    (4, 'user2', '$2a$12$zEmzK8riL3hBnyCBI/w2NOyPuKZMCwbZHdO3QcqcXjhBYokAuoOGe', 3),
    (5, 'user3', '$2a$12$DmglMMn1ZssL5clMgTV.Su1MUuk9/qEB9/XILPctegCuKghxOJN.S', 3),
    (6, 'user4', '$2a$12$AX58xBJ2volzc188soqFOu0nRK1UTx0m0HdipLlOJluAnIPUn/U7S', 3),
    (7, 'user5', '$2a$12$scPK7eS9y0nB0hw8k8co7eHoC4VFYtckhPyG9tAQdLTQB9SyGU7TS', 3),
    (8, 'user6', '$2a$12$9T/G5ZmkDRsEgzJhFfcHaOzjZgN.tNTf3WV7V0GJFu4znrd3MZE06', 3),
    (9, 'user7', '$2a$12$jqzr.IOZ7CSr61oKT5OHjeQIvWDlNrGz1UXAwV4p.yBCGgMEVYtwC', 3),
    (10, 'user8', '$2a$12$UksEi2MpAMPM4qaZmywnpufplUZsWexEucwwAPSsm2n/VrLev6q0y', 3),
    (11, 'user9', '$2a$12$cEPBfpb2TloPDf.u20NMbu.YhUTt.wBYehzoaEoNu8B6GmqszLJ5K', 3),
    (12, 'user10', '$2a$12$.W17ufmC1SDSs7xPjlk3A.qH15bNBZScSkRZ3o7I97UVzK5GflHi.', 3);

INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES
    (13, 'user11', '$2a$12$8Vmdk3ThJczlkCqDEjFVoew4qy/tp3gR7uhygsVBbLIlfW/BEDgku', 3),
    (14, 'user12', '$2a$12$35Qr5MIOzDvQBg2S9k1wWO9BukmOHe.Fn6hLYgFn7coSl/R7/3dyW', 3),
    (15, 'user13', '$2a$12$SgeYnUYW/yiv4DAZp6dAseCYduH0FNsFD86lQ9mAeYROKXzY8aZIS', 3),
    (16, 'user14', '$2a$12$KjBEnhbJz621ZQni.VI8juzWOcbX/kolv3Xf2enDfK96crO3FObii', 3),
    (17, 'user15', '$2a$12$bYk3MkZoVqRPNh/EjI0uvu9u/jmsA7r7lJy9P2HISN65AacfegCFC', 3),
    (18, 'user16', '$2a$12$yBABnygnhmU5Fw0mDkF8dObXMoONvyYYWqfcI1GwW.vZzBQUyf3yC', 3),
    (19, 'user17', '$2a$12$bqY2w/R3Ym/ABtFB25dUiuP15xGq7yB6S/gD9zeK6ZdMODzPPOAC2', 3),
    (20, 'user18', '$2a$12$BpqcfohjzaBjF2uB53pN5eoy7d2n2vQVB18beqJi/q83YEK0ZtrxK', 3),
    (21, 'user19', '$2a$12$tjJBYOo1dzvwrVqcjiXo..8Mrhq/YXNodar7zFkV3aXlEerfOGXCC', 3),
    (22, 'user20', '$2a$12$En.J.JukkauiplHkT05J6ez3TT30QtNz.FZ/GXLiZrq9ngOnq4jvu', 3);

INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES
    (23, 'admin2', '$2a$12$6JSoqCopS690iF28oqnLHezcUhvmIQPybb42DLQqtQpU7qLCXO/9i', 2),
	(24, 'admin3', '$2a$12$u0miCRQRDDBD/Tc.qjEuZuvlLe43vg6CRB9j00UDRbPPuuXR2HKI6', 2);

CREATE TABLE pdmv_users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
	fullname VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES pdmv_accounts(acc_id)
);

INSERT INTO pdmv_users (user_id, email)
VALUES
    (3, 'user1@gmail.com'),
    (4, 'user2@gmail.com'),
    (5, 'user3@gmail.com'),
    (6, 'user4@gmail.com'),
    (7, 'user5@gmail.com'),
    (8, 'user6@gmail.com'),
    (9, 'user7@gmail.com'),
    (10, 'user8@gmail.com'),
    (11, 'user9@gmail.com'),
    (12, 'user10@gmail.com');

INSERT INTO pdmv_users (user_id, email, fullname)
VALUES
    (13, 'user11@gmail.com', 'Người Dùng 13'),
    (14, 'user12@gmail.com', 'Người Dùng 14'),
    (15, 'user13@gmail.com', 'Người Dùng 15'),
    (16, 'user14@gmail.com', 'Người Dùng 16'),
    (17, 'user15@gmail.com', 'Người Dùng 17'),
    (18, 'user16@gmail.com', 'Người Dùng 18'),
    (19, 'user17@gmail.com', 'Người Dùng 19'),
    (20, 'user18@gmail.com', 'Người Dùng 20'),
    (21, 'user19@gmail.com', 'Người Dùng 21'),
    (22, 'user20@gmail.com', 'Người Dùng 22');

CREATE TABLE pdmv_mvgenres (
	mvgenre_id INT PRIMARY KEY AUTO_INCREMENT,
	mvgenre_vi_name NVARCHAR(255) NOT NULL,
	mvgenre_en_name NVARCHAR(255) NOT NULL
);

INSERT INTO pdmv_mvgenres (mvgenre_id, mvgenre_vi_name, mvgenre_en_name)
VALUES
    (1, 'Khác', 'Others'),
    (2, '2D','2D'),
    (3, 'Khoa học viễn tưởng', 'Sci-fi'),
	(4, 'Kinh dị','Horror'),
	(5, 'Tình cảm','Romance'),
	(6, 'Ca nhạc','Musical'),
	(7, 'Hành động','Action'),
	(8, 'Hoạt hình','Animation'),
	(9, 'Trinh thám','Detective'),
    (10, 'Kịch', 'Drama'),
    (11, 'Giả tưởng', 'Fiction'),
    (12, 'Huyền bí', 'Mystery'),
    (13, 'Phiêu lưu', 'Adventure'),
    (14, 'Giật gân', 'Thriller'),
    (15, 'Thảm họa', 'Disaster'),
    (16, 'Trẻ em', 'Children'),
    (17, 'Hài kịch', 'Comedy'),
    (18, 'Tội phạm', 'Crime'),
    (19, 'Huyền ảo', 'Fantasy'),
    (20, 'IMAX', 'IMAX'),
    (21, 'Tài liệu', 'Documentary'),
    (22, 'Chiến tranh', 'War'),
    (23, 'Viễn Tây', 'Western'),
    (24, 'Phim Noir', 'Film-Noir');

CREATE TABLE pdmv_api (
    api_id INT PRIMARY KEY,
    api_name NVARCHAR(100)
);

INSERT INTO pdmv_api (api_id, api_name)
VALUES
    (0, 'Google Drive'),
    (1, 'TheMovieDB/www.themoviedb.org');

CREATE TABLE pdmv_movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
	title_vi NVARCHAR(255) NOT NULL,
    title_en NVARCHAR(255) NOT NULL,
	content TEXT,
    director TEXT,
    actors TEXT,
	manufactureYear INT,
	videoLength NVARCHAR(100),
    typeOfPosterURL INT DEFAULT 0,
	posterURL TEXT,
	updateAt DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (typeOfPosterURL) REFERENCES pdmv_api(api_id)
);

INSERT INTO pdmv_movies (movie_id, title_vi, title_en, content, director, actors, manufactureYear, videoLength)
VALUES
    (301, 'Harry Potter 1 - Harry Potter và Hòn đá Phù thủy', 'Harry Potter and the Philosopher Stone',
    'Harry Potter và Hòn Đá Phù Thủy là bộ phim đầu tiên trong series phim “Harry Potter” được xây dựng dựa trên tiểu thuyết của nhà văn J.K.Rowling. Nhân vật chính của phim, Harry Potter : cậu bé 11 tuổi sau khi mồ côi cha mẹ đã bị gửi đến nhà chú và dì dượng của mình, gia đình Dursley. Tuy nhiên, cậu bé bị ngược đãi và không hề biết về thân phận thực sự của mình. Vào sinh nhật thứ 11 của Harry, một người lai khổng lồ là Rubeus Hagrid đã đến tìm cậu bé để đưa cậu về trường Pháp Thuật Hogwarts. Lúc này, Harry mới biết được mình là phù thủy và một phần câu chuyện về cha mẹ mình, những người đã bị Voldemort giết hại. Cùng với trí thông minh và lòng dũng cảm, cậu bé đã cùng những người bạn của mình khám phá những điều bí mật nguy hiểm về thế giới của phép thuật...',
    'Chris Columbus', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2001', '2h32m'),
    (302, 'Harry Potter 2 - Harry Potter và Phòng chứa Bí mật', 'Harry Potter and the Chamber of Secrets',
    'Dựa trên tập thứ hai thuộc loạt sách ăn khách của tác giả J.K. Rowling, bộ phim kể lại cuộc sống của cậu bé Harry Potter trong năm học thứ hai tại trường phù thủy Hogwarts. Mong ngóng trở lại ngôi trường thân yêu của Harry bị một sinh vật kỳ lạ phá tan tành. Chú gia tinh Dobby đã mang tới lời cảnh báo về những nguy cơ tiềm ẩn đang chờ cậu và tìm cách ép Harry nghỉ học. Bất chấp điều đó, Harry vẫn trở lại nơi cậu coi là mái ấm thực sự. Tuy nhiên, Hogwarts có nguy cơ bị đóng cửa vĩnh viễn khi một chuỗi sự kiện kỳ lạ bắt đầu xảy ra: Những vệt máu lạ trên tường, học sinh các Nhà lần lượt hóa đá, câu chuyện thần bí và rùng rợn về "phòng chứa bí mật"... Rồi Harry phát hiện ra mình nghe thấy giọng nói lạ, phát ra từ đâu đó bên trong bức tường...',
    'Chris Columbus', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2002', '2h41m'),
    (303, 'Harry Potter 3 - Harry Potter và tên tù nhân ngục Azkaban', 'Harry Potter and the Prisoner of Azkaban',
    'Mùa hè trước khi Harry bước vào năm 3 ở trường Hogwarts, trong cơn nóng giận không kềm chế được, Harry đã làm phép với bà cô khó chịu và cậu sợ hãi bỏ trốn khỏi nhà trên chuyến xe bus hiệp sĩ. Tại đây, cậu nghe nói về Sirius Black, tên phù thuỷ trốn khỏi ngục Azkaban. Nhưng Harry không ngờ, Sirius Black trốn ngục là để truy tìm cậu...',
    'Alfonso Cuarón', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2004', '2h19m'),
    (304, 'Harry Potter 4 - Harry Potter và Chiếc cốc lửa', 'Harry Potter and the Goblet of Fire',
    'Cuộc thi đấu Tam pháp thuật diễn ra giữa ba trường phù thuỷ nổi tiếng thế giới của Bungary, Pháp và Anh. Tại vòng thi đấu Tam Pháp Thuật, Harry Potter bất ngờ được Chiếc cốc lửa chọn là thí sinh thứ tư, một trường hợp ngoại lệ hy hữu vì thứ nhất, mỗi trường chỉ có một người được chọn, và thứ hai, cậu bé chưa đủ tuổi để tham gia. Cuộc thi đấu khá cam go, nguy hiểm chết người. Trong cuộc thi cuối cùng trong mê cung, Harry và người bạn thi đấu cùng trường Cedric đã phải đối mặt với chúa tể Hắc ám Voldemort...',
    'Mike Newell', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2005', '2h37m'),
    (305, 'Harry Potter 5 - Harry Potter và Hội Phượng hoàng', 'Harry Potter and the Order of the Phoenix',
    'Trong kỳ nghỉ hè tại gia đình dì dượng Dursley trước khi bước vào năm thứ 5 tại Hogwarts, Harry Potter không nhận được nhiều tin tức từ thế giới phù thủy. Harry rất bực mình vì Voldemort vừa mới được sống dậy mà hai người bạn của Harry, Hermione Granger và Ron Weasley cứ úp mở trong các thư từ họ gửi. Trong lúc kình cãi với Dursley trong khi về nhà từ công viên, Harry bị hai giám ngục Azkaban tấn công. Với phép Expacto Patronum, Harry đã đẩy lùi bọn chúng nhưng Dudley đã bị tấn công. Một người hàng xóm, Arabella Figg, đến để giúp đỡ Harry, và tiết lộ rằng bà đã được Albus Dumbledore yêu cầu canh giữ Harry. Về đến nhà, Harry nhận một lá thư cho biết rằng cậu ta đã bị đuổi khỏi trường Hogwarts (vì học sinh không được phép dùng pháp thuật khi còn dưới 17 tuổi), và phải ra toà tại Bộ Pháp thuật để giải thích hành động của mình...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2007', '2h18m'),
    (306, 'Harry Potter 6 - Harry Potter và Hoàng tử lai', 'Harry Potter and the Half-Blood Prince',
    'Năm học thứ sáu của Harry Potter ở Hogwarts hóa ra lại là một năm đầy thú vị. Điều thú vị đầu tiên là việc chào đón một giáo sư mới tại Hogwarts, thầy Horace Slughorn, người dạy cho Harry nhiều điều thú vị trong môn độc dược của thầy Snape hắc ám. Thầy Slughorn còn cho Harry mượn đồ dùng của trường học, và trong số đó có một quyển sách cũ nát thuộc về chủ nhân tên là Hoàng Tử Lai. Quyển sách có nhiều ghi chú nguệch ngoạc ở lề mỗi trang giấy, và đây lại là người khuyên giúp Harry có thể tiến bộ trong pháp thuật của mình. Cũng trong năm học này, thầy Dumbledore mở một lớp học riêng cho Harry. Ở đó, thầy cho Harry xem những kí ức về những bí mật đen tối của quá khứ Voldermort, với hy vọng rằng Harry có thể lợi dụng những điểm yểu của Voldermort để đánh bại hắn trong trận chiến cuối cùng. Draco Malfoy, kẻ thù không đội trời chung của Harry, có nhiều hành động khả nghi, luôn lén lút đi khắp trường. Vì thế, Harry cho rằng Draco là nội gián của Voldermort và quyết tâm tìm hiểu chính xác chuyện gì đang xảy ra...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2009', '2h33m'),
    (307, 'Harry Potter 7 - Harry Potter và Bảo bối Tử thần – Phần 1', 'Harry Potter and the Deathly Hallows – Part 1',
    'Chúa tể Voldemort cùng đám tay chân của hắn đang âm mưu tấn công Harry Potter khi cậu rời khỏi ngôi nhà của gia đình Dursley lần cuối cùng. Ngay trước khi phép bảo vệ cho Harry tại gia đình Dursley hết hiệu lực vào thời điểm Harry bước qua tuổi 17, người của Hội Phượng hoàng đến để hộ tống cậu tới một nơi ở mới an toàn. Mặc dù đã dùng sáu người nguỵ trang thành Harry, Harry thật vẫn bị Voldemort cùng các Tử thần Thực tử phát hiện ra trên đường đi và bị tấn công...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2010', '2h26m'),
    (308, 'Harry Potter 7 - Harry Potter và Bảo bối Tử thần – Phần 2', 'Harry Potter and the Deathly Hallows – Part 2',
    'Kết thúc phần 1 là khi nhóm bạn Harry Potter, Ron và Hermione quay trở lại trường Hogwarts để tìm và tiêu diệt Trường Sinh Linh Giá cuối cùng của Voldemort. Nhưng Voldemort đã phát hiện ra nhiệm vụ của họ, và trận chiến pháp thuật lớn nhất trong lịch sử đã diễn ra ở đây, nơi mà biết bao người ngã xuống, nơi mà tất cả các pháp sư dũng cảm sẵn sàng đánh đổi cuộc sống của mình để tiêu diệt tận cùng thế lực hắc ám. Giáo sư Dumbledore mặc dù đã mất từ tập 6, nhưng ở phần cuối ông vẫn đóng vai trò quan trọng trong việc dẫn đường chỉ lối cho Harry chiến đấu với phù thủy hắc ám mạnh nhất mọi thời đại...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2011', '2h10m'),
    (309, 'Sát thủ John Wick', 'John Wick', 
	'Bộ phim hành động nổi tiếng "John Wick" không thể bỏ qua. Câu chuyện xoay quanh John Wick, một sát thủ sống cùng chú chó héo của người vợ đã qua đời. Một ngày nọ, một băng nhóm xã hội đen do Isoef Tarasov cầm đầu tấn công John Wick vì không được mua chiếc xe Mustang của ông. Nhưng họ không ngờ rằng John Wick không phải là người dễ bị đánh bại và hậu quả của hành động đó làm dấy lên một thế giới ngầm đen tối với những luật lệ khắc nghiệt và các nhân vật sâu sắc tâm lý.', 
	'Chad Stahelski', 'Keanu Reeves, Alfie Allen', '2014', '1h41m'),
    (310, 'Nhiệm vụ bất khả thi 7', 'Mission: Impossible 7', 
	'Mission Impossible 7 đã gặp khó khăn trong quá trình sản xuất do dịch bệnh COVID-19. Kế hoạch ghi hình tại Italy đã bị hoãn từ tháng 7 năm trước. Paramount Pictures thông báo rằng bộ phim sẽ được ra mắt vào tháng 5 năm 2023. Mong chờ sự thành công của bộ phim hành động đình đám này!',
	'Christopher McQuarrie', 'Tom Cruise, Hayley Atwell, Rebecca Ferguson', '2023', '2h44m'),
	(311, 'Sát thủ đối đầu', 'Bullet Train', 
	'Sát thủ đối đầu là bộ phim ăn khách và đáng mong chờ nhất. Cốt truyện xoay quanh một cuộc đối đầu căng thẳng trên chuyến tàu cao tốc ở Nhật Bản. Nhóm sát thủ đụng độ và tranh chấp, tạo nên những pha hành động kịch tính và đầy căng thẳng. Hãy thưởng thức bộ phim này để trải nghiệm những pha hành động đáng nhớ nhất.',
	'David Leitch', 'Brad Pitt, Joey King', '2022', '2h6m'),
    (312, 'Thor: Tình yêu và sấm sét', 'Thor: Love & Thunder', 
	'Thor: Love and Thunder là một bộ phim lẻ hay của Mỹ sau sự kiện Avengers: Endgame. Sau khi Thanos bị đánh bại, Thor bắt đầu cuộc hành trình xuyên không gian theo Vệ binh dải ngân hà. Phim đã nhận được nhiều lời khen về kỹ xảo và diễn xuất, tuy nhiên cũng có những góp ý về âm sắc và kịch bản không nhất quán. Hãy xem để khám phá thêm!',
	'Taika Waititi', 'Chris Hemsworth, Natalie Portman, Chris Pratt', '2022', '2h6m'),
    (313, 'Minions: Sự trỗi dậy của Gru', 'Minions: The Rise Of Gru', 
	'Minions: The Rise Of Gru là bộ phim hoạt hình vui nhộn tập trung vào những Minions gây cười. Bộ phim là phần tiếp theo của Despicable Me, xoay quanh cuộc sống của Gru và ước mơ trở thành một ác nhân vĩ đại. Bị chế nhạo bởi bạn bè và không được quan tâm từ mẹ, Gru thể hiện tài năng khi thành công trong các nhiệm vụ của Vicious 6. Bên cạnh mối quan hệ chủ-tớ, Gru và Minions tạo nên một tình bạn đẹp và đầy cảm động. Hãy thưởng thức câu chuyện này và cười thả ga cùng Minions!',
	'Kyle Balda, Brad Ableson, Jonathan del Val', 'Steve Carell, Lucy Lawless, Michelle Yeoh', '2022', '1h28m'),
    (314, 'Black Adam', 'Black Adam', 
	'Black Adam là bộ phim siêu anh hùng DC duy nhất được xác nhận ra mắt vào năm 2022. Được sở hữu sức mạnh phi thường từ Wizard Shasm, Black Adam trở thành siêu anh hùng mạnh nhất trong vũ trụ DC. Tuy nhiên, thay vì bảo vệ thế giới, Black Adam quyết định trả thù những người đã gây ra khổ đau cho anh. Đón xem hành trình đầy hấp dẫn của Black Adam trong bộ phim này!',
	'Jaume Collet-Serra', 'Dwayne Johnson, Noah Centineo, Sarah Shahi, Aldis Hodge', '2022', '2h5m'),
    (315, 'The Flash', 'The Flash', 
	'Với các fan hâm mộ phim hành động Mỹ, The Flash là một trong những bộ phim lẻ hay nhất trong năm 2022. Tập trung vào nhân vật chính Barry Allen, một siêu anh hùng có khả năng chạy nhanh vượt qua tốc độ ánh sáng, The Flash khám phá sự mất mát và sự hối tiếc của Barry Allen trong quá khứ. Bộ phim dự kiến mang đến câu chuyện cảm động khi Barry cố gắng sửa chữa những sai lầm của mình. Đồng thời, The Flash cũng đánh dấu sự xuất hiện đáng chú ý của Supergirl. Hãy chờ đón bộ phim này vào cuối năm nay!', 
	'Andy Muschietti', 'Ezra Miller', '2023', '2h24m'),
    (316, 'Godzilla đại chiến Kong', 'Godzilla vs. Kong', 
	'Godzilla và Kong, hai quái vật huyền thoại, lại tiếp tục đối đầu nhau trong cuộc chiến gay cấn. Khi Godzilla bất ngờ tấn công trụ sở công ty Apex, lo ngại về sự hòa thuận giữa con người và quái vật nổi lên. Apex quyết định đối mặt với Godzilla và tìm cách chống lại sức mạnh hủy diệt của nó. Trong khi đó, Kong được đưa đến một khu nuôi dưỡng nhân tạo để bảo vệ, nhưng khi Kong và Godzilla chạm trán trên biển, cuộc chiến bùng nổ. Đây thực sự là một bộ phim hành động Mỹ đáng xem nhất mà bạn không thể bỏ qua.', 
	'Adam Wingard', 'Alexander Skarsgård, Millie Bobby Brown, Rebecca Hall', '2021', '1h53m'),
    (317, 'Quá nhanh quá nguy hiểm 9', 'Fast & Furious 9', 
	'Bộ phim hành động Mỹ "Fast & Furious 9" tái xuất với sự góp mặt của John Cena, Cardi B và Han Lue. Sự xuất hiện của các ngôi sao này là điểm nhấn và làm cho series "Fast And Furious" ngày càng nóng hơn. Trailer đã hé lộ vai trò đặc biệt của những nhân vật đình đám, hứa hẹn mang đến những phút giây căng thẳng đến ngừng thở. Cuộc sống hạnh phúc của Dominic Toretto và gia đình cũng được thể hiện trong đoạn trailer. ', 
	' Justin Lin', 'Vin Diesel, Michelle Rodriguez', '2021', '2h23m'),
    (318, 'Góa phụ đen', 'Black Widow', 
	'Phim "Black Widow" diễn ra sau cuộc nội chiến siêu anh hùng và trước khi Natasha Romanoff hy sinh trong "End Game". Natasha đang bị truy nã và tình cờ gặp lại Yelena - em gái nuôi của mình. Hai chị em phải đối mặt với nhiều nguy hiểm và đối đầu với kẻ đã gây chia rẽ họ. Kẻ thủ ác đó là người khiến cuộc sống của họ thay đổi hoàn toàn.', 
	'Cate Shortland', 'Scarlett Johansson, Florence Pugh', '2021', '2h13m'),
    (319, 'Ký sinh trùng (2019)', 'Parasite (2019)', 
	'"Parasite - Ký sinh trùng" là một bộ phim Hàn Quốc nổi tiếng về chủ đề tình cảm và xã hội. Phim đã giành nhiều giải thưởng danh giá, bao gồm cả giải Oscar. Câu chuyện xoay quanh sự phân biệt giàu nghèo trong xã hội Hàn Quốc, khi một gia đình nghèo khó tham gia vào cuộc sống của một gia đình giàu có thông qua công việc gia sư. Nhưng những bí mật sẽ dần dần được tiết lộ và gây ra những biến cố không ngờ.', 
	'Bong Joon Ho', 'Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-shik, Park So-dam', '2019', '2h12m'),
    (320, 'Điều Kỳ Diệu Ở Phòng Giam Số 7', 'Miracle in Cell No. 7', 
	'"Điều kỳ diệu ở phòng giam số 7" là một bộ phim lẻ Hàn Quốc cảm động và đầy ý nghĩa. Câu chuyện tập trung vào Yong Goo, một người cha thiểu năng trí tuệ, và con gái Ye Seung đáng yêu của anh. Sau khi bị oan sai và giam vào tù, Yong Goo lập nên một mối quan hệ đặc biệt với những tù nhân khác, nhờ đó anh có cơ hội gặp lại Ye Seung bằng cách đưa cô bé vào sống trong tù. Bộ phim này được đánh giá cao về kịch bản xuất sắc của Hàn Quốc và đã chinh phục trái tim của nhiều khán giả.', 
	'Lee Hwan-Kyung', 'Ryoo Seung-Ryong, Park Shin Hye, Kal So-Won', '2013', '2h7m'),
	(321, 'Chuyến tàu sinh tử', 'Train To Busan', 
	'"Train To Busan" là một bộ phim zombie đánh dấu sự trở lại của thể loại này trên màn ảnh rộng. Câu chuyện diễn ra trên một chuyến tàu đi từ Seoul tới thành phố an toàn Busan, với sự hiện diện của một người cha cùng con gái, một đôi vợ chồng chuẩn bị sinh con và một nhóm học sinh cấp 3. Khi đại dịch zombie bùng phát trên tàu, họ phải đấu tranh để bảo vệ những người thân yêu và chiến đấu để sống sót trên hành trình dài 453km đầy nguy hiểm.', 
	'Yeon Sang Ho', 'Ma Dong-Seok, Gong Yoo, Jung Yu Mi', '2016', '1h58m'),
    (322, 'Thử Thách Thần Chết 2', 'Along with the Gods: The Last 49 Days', 
	'Phần 2 của loạt phim "Thử Thách Thần Chết" tiếp tục mở rộng câu chuyện về chàng trai Su Hong, người được chọn làm linh hồn thuần khiết thứ 49. Trên thời hạn 49 ngày cuối cùng, nhiệm vụ của ba vệ thần là giúp đỡ Su Hong hoàn thành sứ mệnh của mình. Trong quá trình này, bí mật về thân phận của ba vệ thần dần được tiết lộ, và tình tiết phim trở nên căng thẳng hơn khi họ khám phá lại kí ức từ kiếp trước.', 
	'Kim Yong-hwa', 'Ha Jung-woo, Ju Ji-hoon, Kim Hyang-gi, Ma Dong-seok, Kim Dong-wook', '2018', '2h22m'),
    (323, 'Đại Dịch Cúm (2013)', 'Flu (2013)', 
	'Bộ phim xoay quanh chuyến tàu chở những người di cư trái phép sang Hàn Quốc, không hề hay biết rằng họ mang trong mình mầm bệnh nguy hiểm. Khi bùng phát dịch bệnh, chỉ còn một người sống sót duy nhất. Kim In Hae, trong hành trình tìm cách tìm ra loại virus và cứu con gái mình khỏi hiểm nguy, phát hiện ra rằng cô bé cũng đã mắc phải virus đáng sợ này. Câu chuyện xoay quanh việc cô phải làm gì để bảo vệ con gái và đối mặt với những nguy hiểm không ngừng.', 'Kim Sung-Su', 'Hyuk Jang, Soo-Ae, Park Min-Ha', '2013', '2h2m'),
    (324, 'Lối Thoát Trên Không (2019)', 'Exit (2019)',
	'Lối thoát trên không kể về Lee Yong-nam, một chàng trai nổi tiếng với kỹ năng leo núi nhưng không có công việc và không ai để ý tới. Trong một ngày đặc biệt, khi một thảm họa xảy ra, anh phải dùng tất cả khả năng leo núi của mình để cứu sống gia đình và mọi người. Bộ phim mang đến nhiều cung bậc cảm xúc, từ lòng cao thượng và tình yêu gia đình đến những tình huống hài hước và hấp dẫn. Exit - Lối thoát trên không là một bộ phim Hàn Quốc đầy cuốn hút không thể bỏ qua.', 
	'Lee Sang Geun', 'Jo Jong-suk, Im Yoon-ah', '2019', '1h44m'),
    (325, 'Nghề siêu khó (2019)', 'Extreme Job (2019)', 
	'Extreme Job - Phi Vụ Bá Đạo là một bộ phim Hàn Quốc phát hành vào năm 2019, gây sốt tại phòng vé. Câu chuyện xoay quanh 5 trinh sát thuộc đội phòng chống ma túy. Họ cải trang thành nhân viên quán gà rán để tiến hành điều tra một băng nhóm tội phạm. Tuy nhiên, việc nhà hàng trở nên nổi tiếng và đông khách gây ra nhiều rắc rối. Tuy vậy, đội trinh sát không bỏ cuộc và vẫn đoàn kết để truy bắt tội phạm. Phim cũng đề cao tình cảm đồng đội, gia đình và sự đoàn kết giữa những người cùng chí hướng. Extreme Job - Phi Vụ Bá Đạo là một bộ phim hấp dẫn và độc đáo.', 
	'Lee Byeong-heon', 'Ryu Seung-ryong, Lee Hanee, Jin Seon-kyu, Lee Dong-hwi, Gong Myung', '2019', '1h51m'),
    (326, 'Cờ Thái cực giương cao', 'Tae Guk Gi: The Brotherhood of War (2004)', 
	'Tae Guk Gi: The Brotherhood of War là một bộ phim hành động và tâm lý đặc sắc của Hàn Quốc do đạo diễn Kang Je-gyu chỉ đạo. Phim diễn ra ở Seoul vào những năm 1950 và kể về hai anh em Jin Tae và Jin Suk, sống trong một gia đình lao động nghèo khó. Jin Tae, người anh yêu thương em trở thành nguồn động lực để cung cấp cho em một tương lai tốt đẹp hơn. Khi chiến tranh bùng nổ, cả hai anh em gia nhập lực lượng quân đội Đại Hàn Dân Quốc. Tin rằng em trai đã hy sinh trong chiến trường, Jin Tae quyết định đầu quân cho Triều Tiên để trả thù cho quê hương và người em đã mất. Tuy nhiên, Jin Suk vẫn còn sống và phải đối mặt với anh trên chiến tuyến đối nghịch.', 
	'Kang Je-gyu', 'Jang Dong-gun, Won Bin, Lee Eun-ju, Kong Hyeong-jin, Lee Yeong-ran, Jeon Jae-hyeong', '2004', '2h20m'),
    (327, 'Ngoài Vòng Pháp Luật', 'The Outlaws (2017)',
	'Ngoài Vòng Pháp Luật là một bộ phim hành động đặc sắc của Hàn Quốc, với sự tham gia của hai diễn viên Ma Dong-seok và Yoon Kye-sang. Cốt truyện xoay quanh thế giới tội phạm đen tối ở Seoul và sự đối đầu giữa các băng nhóm xã hội đen. Ma Dong-seok đảm nhận vai một sĩ quan cảnh sát can đảm và quyết tâm, nhận nhiệm vụ giải quyết tất cả trong vòng 10 ngày. ', 
	'Kang Yoon-Sung', 'Yoon Kye-sang, Ma Dong-seok', '2017', '2h1m'),
    (328, 'Ác Nữ Báo Thù', 'The Villainess (2017)', 
	'The Villainess - Ác Nữ Báo Thù là một bộ phim hành động Hàn Quốc ra mắt năm 2017. Sook-hee, một cô gái từ nhỏ đã chứng kiến cái chết của cha mẹ và trở thành một sát thủ tàn nhẫn. Phim không chỉ có những pha hành động mãn nhãn mà còn chứa đựng những bí mật và tình tiết gây cấn không ngờ tới phút cuối.', 
	'Jung Byung-gil', 'Shin Ha-kyun, Kim Ok-bin, Sung Jun', '2017', '2h4m'),
    (329, 'Bố Già (2021)', 'Bố Già (2021)', 
	'"Bố Già" là một bộ phim lẻ Việt Nam ý nghĩa năm 2021. Cốt truyện tập trung vào mối quan hệ cha con của ông Sang và Quắn. Ông Sang là người cẩn thận và quan tâm đến mọi người xung quanh, nhưng sự can thiệp quá mức của ông đã mang lại rắc rối cho gia đình. Trái ngược với ông, Quắn là một chàng trai trẻ nổi loạn. Sự khác biệt thế hệ đã tạo ra mâu thuẫn giữa hai cha con. Với thông điệp sâu sắc, "Bố Già" đã thu hút khán giả và trở thành phim có doanh thu cao nhất ở Việt Nam.',
	'Trấn Thành, Vũ Ngọc Đãng', 'Trấn Thành, Tuấn Trần, NSND Ngọc Giàu, Ngân Chi, Quốc Khánh, Hoàng Mèo, Lê Giang, Lan Phương, La Thành, Lê Trang', '2021', '2h8m'),
    (330, 'Gái Già Lắm Chiêu 3 (2020)', 'Gái Già Lắm Chiêu 3 (2020)', 
	'"Gái Già Lắm Chiêu 3" là một bộ phim lẻ Việt Nam năm 2020 hấp dẫn. Cốt truyện xoay quanh mối quan hệ mẹ chồng - nàng dâu giữa hai người phụ nữ nổi tiếng trong giới showbiz. Thái Tuyết Mai, một cựu minh tinh gây tai tiếng, và một nữ hoàng scandal đang nổi tiếng với chương trình phanh phui bí mật showbiz. Bộ phim mang đến những tình huống thú vị và hài hước trong cuộc sống của hai nhân vật chính.', 
	'Bảo Nhân, Namcito', 'NSND Hồng Vân, NSND Lê Khanh, Ninh Dương Lan Ngọc, Jun Vũ, Lê Xuân Tiến', '2020', '2h00m'),
	(331, 'Tiệc Trăng Máu (2020)', 'Tiệc Trăng Máu (2020)', 
	'"Tiệc Trăng Máu" là một bộ phim lẻ Việt Nam ý nghĩa và hấp dẫn. Bối cảnh bắt đầu từ một bữa tiệc tại một căn penthouse xa hoa, những người bạn thân thiết chơi trò chơi tiết lộ tất cả tin nhắn và cuộc gọi. Những bí mật về sự lừa dối, phản bội dần được vạch trần trong câu chuyện. Bộ phim mang đến những cung bậc cảm xúc thú vị và những điều bất ngờ.', 
	'Nguyễn Quang Dũng', 'Thái Hòa, Đức Thịnh, Hồng Ánh, Thu Trang, Kiều Minh Tuấn, Hứa Vĩ Văn, Kaity Nguyễn', '2020', '1h59m'),
    (332, 'Mắt Biếc (2019)', 'Mắt Biếc (2019)', 
	'"Mắt Biếc" là một bộ phim lẻ đặc sắc của Việt Nam, dựa trên tiểu thuyết cùng tên của nhà văn Nguyễn Nhật Ánh. Câu chuyện bắt đầu với tình yêu ngây thơ và tươi đẹp của Ngạn và Hà Lan tại ngôi làng Đo Đo. Khi Hà Lan rời làng và yêu Dũng, cuộc hôn nhân của cô không được hạnh phúc. Hà Lan quyết định gửi con gái Trà Long trở về làng Đo Đo, nơi Ngạn vẫn mãi nhớ nhung. Tuy nhiên, khúc mắc xảy ra khi Trà Long lớn lên và phát sinh tình cảm với Ngạn...', 
	'Victor Vũ', ' Trúc Anh, Trần Nghĩa, Đỗ Khánh Vân, Trần Phong', '2019', '1h57m'),
    (333, 'Hai Phượng (2019)', 'Hai Phượng (2019)', 
	'"Hai Phượng" là một bộ phim lẻ đặc sắc của Việt Nam, mang đậm dấu ấn của diễn viên Ngô Thanh Vân. Cô vào vai Hai Phượng, một võ sư tài ba với quá khứ nổi tiếng, nhưng sau khi mang thai vô tình, cô quyết định trở về quê và sống một cuộc sống bình dị. Tuy nhiên, khi con gái 10 tuổi của cô, bé Mai, bị bắt đi bởi một nhóm người lạ, Hai Phượng bắt đầu cuộc hành trình đầy mạo hiểm để cứu con trong vòng 48 giờ. Liệu cô có thành công không? ',
	'Lê Văn Kiệt', 'Ngô Thanh Vân, Yaya Trương Nhi, Mai Cát Vi, Phan Thanh Nhiên, Pom', '2019', '1h40m'),
    (334, 'Birds of Prey: Cuộc lột xác huy hoàng của Harley Quinn', 'Harley Quinn: Birds Of Prey',
	'Harley Quinn: Birds of Prey là một trong những bộ phim lẻ hay 2020 được đánh giá cao và đáng xem. Được đạo diễn bởi Cathy Yan và xếp thứ 8 trong vũ trụ điện ảnh DC, bộ phim kể về cuộc lột xác của Harley Quinn sau khi chia tay Joker vào năm 2016. Cô nàng đã gặp và kết bạn với những người bạn mới, có tính cách lập dị và phong cách riêng, không muốn phụ thuộc vào bạn trai như trước đây.Bên cạnh cốt truyện hấp dẫn, Birds of Prey còn được đánh giá cao về doanh thu phòng vé và tiếng vang của nó trong thị trường điện ảnh. Mặc dù phải cạnh tranh với vũ trụ Marvel, bộ phim vẫn thu hút được sự chú ý của khán giả nhờ hướng đi mới và sáng tạo. Nếu bạn đang tìm kiếm một bộ phim hành động kịch tính và đầy cảm xúc, Harley Quinn: Birds of Prey chắc chắn là một lựa chọn tuyệt vời.',
	'Cathy Yan', 'Margot Robbie', '2020', '1h49m'),
    (335, 'Hoa Mộc Lan', 'Mulan', 
	'Hoa Mộc Lan là một câu chuyện quen thuộc với rất nhiều người, và bộ phim Mulan năm 2020 đã mang đến nhiều điều mới mẻ và thú vị. Câu chuyện kể về cô gái Mộc Lan, người đã giả trai và thay cha mình nhập ngũ để bảo vệ đất nước và đem lại vinh quang cho gia tộc.Mặc dù bị phát hiện là nữ giả nam trang, nhưng cô vẫn được phân công bảo vệ quân đội cùng với đội trưởng Tung. Bộ phim này không chỉ là một bộ phim hành động, mà còn là một bộ phim kiếm hiệp đầy hấp dẫn của Trung Quốc.Nếu bạn đang muốn tìm kiếm một bộ phim đầy cảm xúc với một câu chuyện lôi cuốn và đầy sức mạnh, thì Mulan chắc chắn là một lựa chọn tuyệt vời. Hãy bỏ qua các bộ phim hành động của Mỹ và khám phá thế giới kiếm hiệp của Trung Quốc với Mulan.', 
	'Tony Bancroft, Barry Cook', 'Ôn Minh Na', '2020', '1h55m'),
    (336, 'Mưa Tình Đầu', 'Classic Again', 
	'Năm 2020 đã chứng kiến rất nhiều bộ phim hay 2020 lẻ đáng xem, trong đó không thể bỏ qua Cơn Mưa Tình Đầu – Classic Again của đạo diễn Thatchaphong Suphasri và Tatchapong Supasri. Bộ phim kể về mối tình tay ba giữa Bota, cô bạn thân và Non - chàng trai mà cả hai đều yêu thích tại trường học. Tuy nhiên, khi biết rằng Poppy - người bạn của Bota cũng thích Non, cô đã lựa chọn che giấu tình cảm của mình để để cho Poppy tỏ tình trước.Một ngày nọ, Bota tình cờ đọc được những tấm thư của mẹ mình về mối tình đầu tiên. Những điều mà mẹ Bota viết về tình yêu khiến cô suy nghĩ nhiều hơn về bản thân và quan hệ tình cảm của mình. Cô nhận ra rằng bản thân và mẹ có nhiều điểm chung về tình yêu. Vậy sau đó, Bota sẽ có đủ dũng khí để thổ lộ tình cảm của mình với Non hay không?Nếu bạn đang tìm kiếm một bộ phim lãng mạn và đầy cảm động, hãy thử xem Cơn Mưa Tình Đầu – Classic Again, một trong những bộ phim lẻ hay nhất của năm 2020.',
	'Thatchaphong Suphasri, Tatchapong Supasri', 'Actor 11, Actor 2', '2020', '2h03m'),
    (337, 'Vua Sư Tử', 'The Lion King',
	'Bộ phim lấy bối cảnh trong khu rừng già châu Phi. Nhân vật chính là chú sư tử con Simba – con trai của vua Mufasa. Cuộc sống yêu đời, hạnh phúc bên cạnh cha mẹ và cô bạn Nala của cậu sớm kết thúc khi người chú ruột Scar có mưu đồ chiếm lấy ngai vàng của cha cậu.Người cha qua đời khi cứu Simba khỏi đám linh cẩu khiến cậu luôn cảm thấy ân hận. Sau khi biết được nguyên nhân cái chết của cha mình là do Scar, Simba đã cùng những người bạn của mình là lợn rừng Pumbaa và chồn đất Timon vạch trần thủ đoạn. Cậu trở lại đàn và tiếp tục nối nghiệp cha quản lý thảo nguyên. Cuộc sống yên bình đã trở lại với khu rừng.',
	'Roger Allers, Rob Minkoff', 'Robert Guillaume, Jeremy Irons, Matthew Broderick, James Earl Jones, Jonathan Taylor Thomas, Nathan Lane, Ernie Sabell, Moira Kelly', '1994', '1h28m'),
    (338, 'Đi tìm Nemo', 'Finding Nemo', 
	'Cốt chuyện xoay quanh hành trình đi tìm con trai Nemo của chú cá Marlin. Sau khi vợ và ổ trứng của anh bị ăn thịt và chỉ còn 1 quả trứng khác. Khi trứng nở, anh đặt tên con là Nemo và luôn bảo vệ con quá mức cần thiết vì sợ mất đi người thân duy nhất.Tuy nhiên, Nemo thích khám phá nên không nghe lời bố và vô tình bị lạc. Sau đó, cậu bị thợ lặn bắt đi, cho vào bể cá. Cậu cùng những con cá khác đang lên kế hoạch bỏ trốn. Trong khi đó, ông bố Marlin vượt đại dương, bám theo các manh mối để tìm con mình. Trên đường đi, Marlin gặp nhiều khó khăn và đôi lúc muốn bỏ cuộc nhưng ông nhận được nhiều sự giúp đỡ và động viên từ những người bạn mới. Đặc biệt là cô cá đồng hành Dory cực kỳ đãng trí.Cuối cùng, 2 cha con được đoàn tụ. Marlin cũng không còn là nhút nhát hay sợ hãi như trước. Anh được hàng xóm kính trọng vì đã dám dũng cảm đương đầu với những thử thách để tìm lại con trai.', 
	'Andrew Stanton, Lee Unkrich', 'Albert Brooks, Ellen DeGeneres, Alexander Gould, Willem Dafo, Brad Garrett, Joe Ranft, Allison Janne, Vicki Lewis', '2003', '1h40m'),
    (339, 'Câu chuyện đồ chơi 3', 'Toy Story 3',
	'Series phim xoay quanh một nhóm các đồ chơi có hành động và cảm xúc giống con người nhưng giả vờ vô tri vô giác. Trong phần 3, cậu bé Andy ngày nào nay đã lớn và sắp nhập học ở trường đại học. Đứng trước nguy cơ bị vứt bỏ, các món đồ chơi khác tìm đến nhà trẻ Sunnyside với hy vọng được sử dụng mãi mãi mặc dù Woody ra sức khuyên can.Được chào đón rất nhiệt tình, họ nghĩ rằng đây là lựa chọn thông minh và sáng suốt. Tuy nhiên, các món đồ chơi của Andy đã vỡ mộng về nơi này ngay trong ngày đầu tiên.Chúng bị bạo hành và đối xử tàn bạo. Đồng thời còn phải đối đầu với tên gấu bông xấu xa Lotso. Các món đồ chơi tìm đường về với chủ của mình sau khi được Woody giải thích. Khi Andy nhập học, các món đồ chơi đã được tặng cho Bonnie. Anh chàng cũng thường xuyên đến thăm cô bé và những người bạn đồ chơi thân thiết của mình. ', 
	'Lee Unkrich', 'Tom Hanks, Tim Allen, Don Rickles, Michael Keaton, Joan Cusack, Ned Beatty', '2010', '1h43m'),
    (340, 'Vút bay', 'Up', 
	'Carl Fredricksen từ nhỏ vốn nhút nhát nhưng lại mê phiêu lưu. Khi lớn lên anh lập gia đình với Ellie – người bạn từ nhỏ có cùng đam mê. Không may, họ chưa thực hiện được mục tiêu phiêu lưu đến Nam Mỹ cũng nhau thì Ellie qua đời.Nhiều năm về sau, Carl đã 78 tuổi và quyết phải hoàn thành chuyến hành trình tới Thác thiên đường Nam Mỹ đã cùng vợ ấp ủ. Ông nghĩ ra cách dùng hàng nghìn quả bóng bay để kéo cho ngôi nhà bay lên như một khinh khí cầu. Khi lên đến bầu trời, ông mới phát hiện ra có thêm cậu bé Russell ngoài hiên. Cậu bé trở thành người đồng hành bất đắc dĩ của ông. Một cuộc phiêu lưu trắc trở nhưng cũng rất vui nhộn, đầy xúc cảm sẽ đưa trí tưởng tượng của người xem bay cao.', 
	'Pete Docter, Bob Peterson', 'Edward Asner, Jordan Nagai, Bob Peterson, Pete Docter, Christopher Plummer', '2009', '1h36m');

UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1Su46sVT_-n_87Hjz1KQls6KlAULNUrm3' WHERE movie_id = 301;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1FPGTEpoicvq9XYq944Bqj1uwlrHogHpr' WHERE movie_id = 302;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1r1nPtIgJi7AozTmzEoi7Ivk9M16MsuLS' WHERE movie_id = 303;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1ikX5MBXx3L2CoKjDJG8z9fOIIwXQUaiJ' WHERE movie_id = 304;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1kqctca11Jm7K84ZF2TuEahZ8danf2D9f' WHERE movie_id = 305;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=18lapQ1wlgX7YgPf1bNwiQRD4DxWOVV44' WHERE movie_id = 306;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1ztrAwAeZPQqvZyzcIoghjU0Q0TKzUmY-' WHERE movie_id = 307;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1UgrVfHdkuBPBUB1SS-9CVmYiXhxN3C3k' WHERE movie_id = 308;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1eKflQHoGhkpYVTg_sHK7tHrB3rDkB4Th' WHERE movie_id = 309;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1CLKPWI0d1My9b-EUdoDXe28snbMotOXU' WHERE movie_id = 310;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1WFPjBzVUlT0g-5e-4H1MJsLa7c-pE6An' WHERE movie_id = 311;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1VvZpBQUBBSfRZnxmaDwpY_hp7SW2dhXY' WHERE movie_id = 312;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1OHEPDrhal8hv3iZxEB3PkNzg2Q0tyv-K' WHERE movie_id = 313;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1cE1720uNGeXjEqGqmPETTrMNXj7m23M4' WHERE movie_id = 314;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=18z32wdwQucwksjYRYkckO6BgoDhTHDbp' WHERE movie_id = 315;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1nFO6isiyg5nmZPTz5yZ_9IMtbJwGv9v_' WHERE movie_id = 316;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1hRfJm3mqFUa2A_C1TNaRqxoMUr9EjITf' WHERE movie_id = 317;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1NTZPMQcSe6uRM41dcG2vdi-eAHGtZ5E7' WHERE movie_id = 318;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1hOlzX4rM-CQEOuSjYMWP7RncVRGpJjci' WHERE movie_id = 319;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1Mb2ax0YsAUfvd_ep59Ao4vlBwGsoPTqc' WHERE movie_id = 320;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1sHb1--QPEa11-YuW-oo4ndIJ6mhxvoy_' WHERE movie_id = 321;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1yeZAXOEhQjyFEGzh27PiWdVX2w9JJqb8' WHERE movie_id = 322;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=11Y9FOZIXciYrj3IjtuEB88hYlxR86bg_' WHERE movie_id = 329;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1JZP90RfsWKXm_LW7kTFGC9E8OdkF20eF' WHERE movie_id = 332;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1wEQEU0ScQSQfiw_nvZZmWftdaZdtbEbk' WHERE movie_id = 334;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1NIpmg66DEHtM0RcxcUTO5mvT5s1MOahJ' WHERE movie_id = 335;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1rzpY_ZWcBFY9IKyzLPMWfdLqKv_SjKTQ' WHERE movie_id = 337;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1eOu9C2vbYhRh1fZzj-eKm0ODgkXjfa99' WHERE movie_id = 338;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1OkRfkFsxjMUiGF6xn7fKYbMTfLrzb_tk' WHERE movie_id = 339;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1I_f-vLgeLTtwJ0Yw9H88lN0O-3llVzv1' WHERE movie_id = 340;

CREATE TABLE pdmv_mvchapters (
	chapter_id INT PRIMARY KEY AUTO_INCREMENT,
	movie_id INT NOT NULL,
	chapter_name NVARCHAR(255) NOT NULL,
	chapterURL TEXT,
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

INSERT INTO pdmv_mvchapters(movie_id, chapter_name, chapterURL)
VALUES
    (301, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (302, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (303, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (304, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (305, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (306, 'FULL', 'https://player.vimeo.com/video/854102726'),
	(307, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (308, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (309, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (310, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (311, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (312, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (313, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (314, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (315, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (316, 'FULL', 'https://player.vimeo.com/video/862448685'),
	(317, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (318, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (319, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (320, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (321, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (322, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (323, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (324, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (325, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (326, 'FULL', 'https://player.vimeo.com/video/854102726'),
	(327, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (328, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (329, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (330, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (331, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (332, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (333, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (334, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (335, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (336, 'FULL', 'https://player.vimeo.com/video/862448685'),
	(337, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (338, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (339, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (340, 'FULL-VN', 'https://player.vimeo.com/video/862448685'),
    (340, 'FULL-EN', 'https://player.vimeo.com/video/854102726');

CREATE TABLE pdmv_movies_genres (
    movgen_id INT PRIMARY KEY AUTO_INCREMENT,
	movie_id INT NOT NULL,
	mvgenre_id INT NOT NULL,
	FOREIGN KEY (mvgenre_id) REFERENCES pdmv_mvgenres(mvgenre_id),
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id),
	UNIQUE (mvgenre_id, movie_id)
);

INSERT INTO pdmv_movies_genres (movie_id, mvgenre_id)
VALUES
	(301, 10),
	(301, 11),
    (301, 12),
    (301, 14),
    (302, 10),
	(302, 11),
    (302, 12),
    (302, 14),
    (303, 10),
	(303, 11),
    (303, 12),
    (303, 14),
    (304, 10),
	(304, 11),
    (304, 12),
    (304, 14),
    (305, 10),
	(305, 11),
    (305, 12),
    (305, 14),
    (306, 10),
	(306, 11),
    (306, 12),
    (306, 14),
    (307, 10),
	(307, 11),
    (307, 12),
    (307, 14),
    (308, 10),
	(308, 11),
    (308, 12),
    (308, 14),
    (309, 7),
    (309, 14),
    (310, 7),
    (310, 13),
    (310, 14),
    (311, 17),
    (311, 13),
    (311, 7),
    (312, 7),
    (312, 3),
    (313, 8),
    (313, 17),
    (313, 13),
    (314, 7),
    (314, 13),
    (315, 7),
    (315, 13),
    (316, 3),
    (316, 7),
    (317, 7),
    (317, 13),
    (318, 3),
    (318, 7),
    (319, 14),
    (319, 10),
    (320, 17),
    (320, 10),
    (321, 4),
    (321, 7),
    (322, 7),
    (322, 10),
    (323, 10),
    (323, 3),
    (324, 17),
    (324, 15),
    (325, 17),
    (326, 7),
    (327, 7),
    (328, 7),
    (328, 14),
    (329, 17),
    (329, 10),
    (330, 17),
    (330, 10),
    (330, 5),
    (331, 10),
    (332, 5),
    (333, 7),
    (334, 7),
    (335, 7),
    (335, 10),
    (336, 10),
    (336, 5),
    (337, 8),
    (337, 13),
    (338, 8),
    (338, 13),
    (339, 8),
    (339, 13),
    (340, 8),
    (340, 13);


CREATE TABLE pdmv_ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating DECIMAL(3,1) NOT NULL,
	ratingTime DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES pdmv_users(user_id),
    FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id),
	UNIQUE(user_id, movie_id)
);

INSERT INTO pdmv_ratings (user_id, movie_id, rating)
VALUES
    (3, 301, 3.0),
	(3, 305, 5.0),
	(3, 302, 4.0),
	(3, 304, 3.0),
	(3, 316, 5.0),
	(3, 331, 5.0),
	(3, 326, 4.0),
	(3, 336, 5.0),
	(3, 323, 5.0),
	(3, 321, 4.0),
    (4, 303, 3.0),
	(4, 301, 5.0),
	(4, 304, 2.0),
	(4, 313, 5.0),
	(4, 332, 5.0),
	(4, 335, 3.0),
	(4, 307, 2.0),
	(4, 340, 3.0),
	(4, 329, 4.0),
    (5, 303, 4.0),
	(5, 302, 5.0),
	(5, 336, 4.0),
    (6, 313, 4.0),
	(6, 321, 5.0),
	(6, 314, 4.0),
	(6, 315, 4.0),
	(6, 334, 3.0),
	(6, 335, 3.0),
	(6, 322, 5.0),
	(6, 303, 4.0),
    (7, 303, 4.0),
	(7, 313, 3.0),
	(7, 323, 4.0),
	(7, 333, 4.0),
    (7, 312, 4.0),
	(7, 321, 5.0),
	(7, 334, 5.0),
	(7, 315, 3.0),
	(7, 316, 4.0),
	(7, 317, 4.0),
	(7, 311, 3.0),
	(7, 329, 5.0),
    (7, 340, 5.0),
	(7, 326, 2.0),
	(7, 327, 2.0),
	(7, 331, 5.0),
	(7, 307, 5.0),
	(8, 303, 4.0),
	(8, 313, 3.0),
	(8, 323, 4.0),
	(8, 333, 4.0),
    (8, 312, 4.0),
	(8, 321, 5.0),
	(8, 334, 5.0),
	(8, 315, 3.0),
	(8, 316, 4.0),
	(8, 317, 4.0),
	(8, 311, 3.0),
	(8, 329, 5.0),
    (8, 340, 5.0),
	(8, 326, 2.0),
	(8, 327, 2.0),
	(8, 331, 5.0),
    (9, 303, 5.0),
	(9, 313, 4.0),
    (10, 303, 5.0),
	(10, 301, 4.0),
	(10, 333, 4.0),
    (11, 301, 3.0),
	(11, 315, 3.0),
    (12, 316, 4.0),
	(12, 326, 5.0),
	(12, 306, 3.0),
	(12, 336, 3.0),
    (13, 304, 4.0),
	(13, 337, 4.0),
    (14, 304, 5.0),
	(14, 314, 4.0),
    (15, 304, 5.0),
	(15, 324, 4.0),
	(16, 305, 3.0),
	(16, 319, 4.0),
    (17, 306, 4.0),
	(17, 321, 4.0),
    (18, 304, 4.0),
	(18, 324, 5.0),
    (19, 304, 5.0),
	(19, 333, 3.0),
	(19, 322, 5.0),
    (20, 304, 5.0);

DELIMITER //
CREATE FUNCTION Collab_SimilarityCosine(user1 INT, user2 INT) RETURNS DECIMAL(10, 5)
BEGIN
    DECLARE cosine_similarity DECIMAL(10, 5);
    
    SELECT SUM(r1.rating * r2.rating) / (m1.magnitude * m2.magnitude) INTO cosine_similarity
    FROM pdmv_ratings r1
    INNER JOIN pdmv_ratings r2 ON r1.movie_id = r2.movie_id
    CROSS JOIN (
        SELECT SQRT(SUM(rating * rating)) AS magnitude
        FROM pdmv_ratings
        WHERE user_id = user1
    ) m1
    CROSS JOIN (
        SELECT SQRT(SUM(rating * rating)) AS magnitude
        FROM pdmv_ratings
        WHERE user_id = user2
    ) m2
    WHERE r1.user_id = user1 AND r2.user_id = user2;
    IF cosine_similarity IS NULL THEN
	RETURN 0.0;
	END IF;
    RETURN cosine_similarity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Collab_SimilarityUsers (IN user1 INT)
BEGIN
	DECLARE is_done INTEGER DEFAULT 0;
    DECLARE uid INTEGER default 0;
    DECLARE similar DECIMAL(10, 5) default 0.0;
    DECLARE cursor_users CURSOR FOR SELECT user_id FROM pdmv_users WHERE user_id <> user1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done = 1;
    DROP TABLE IF EXISTS USER_LIST;
    CREATE TABLE USER_LIST 
      (
		user_stt int default 0,
        user_id INT,
        cosine_similarity DECIMAL(10, 5)
      )ENGINE=InnoDB DEFAULT CHARSET=utf8;
    OPEN cursor_users;
    get_list: LOOP
    FETCH cursor_users INTO uid;
    IF is_done = 1 THEN LEAVE get_list;
    END IF;
    SELECT Collab_SimilarityCosine(user1, uid) INTO similar;
    INSERT INTO USER_LIST(user_id, cosine_similarity) values(uid, similar);
    END LOOP get_list;
    CLOSE cursor_users;
	SET @row_number = 0;
	UPDATE USER_LIST
	SET user_stt = (@row_number:=@row_number + 1)
	ORDER BY cosine_similarity DESC;
    SELECT ul.*, pa.usname FROM USER_LIST ul
    JOIN pdmv_accounts pa ON ul.user_id = pa.acc_id
    WHERE cosine_similarity > 0 ORDER BY cosine_similarity DESC;
	DROP TABLE USER_LIST;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Collab_RecommendedMovies (IN user1 INT, IN numoffilm INT)
BEGIN
	DECLARE is_done INTEGER DEFAULT 0;
    DECLARE uid INTEGER default 0;
    DECLARE similar DECIMAL(10, 5) default 0.0;
    DECLARE cursor_users CURSOR FOR SELECT user_id FROM pdmv_users WHERE user_id <> user1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done = 1;
    DROP TABLE IF EXISTS USER_LIST;
    CREATE TABLE USER_LIST 
      (
		user_stt int default 0,
        user_id INT,
        cosine_similarity DECIMAL(10, 5)
      )ENGINE=InnoDB DEFAULT CHARSET=utf8;
    OPEN cursor_users;
    get_list: LOOP
    FETCH cursor_users INTO uid;
    IF is_done = 1 THEN LEAVE get_list;
    END IF;
    SELECT Collab_SimilarityCosine(user1, uid) INTO similar;
    INSERT INTO USER_LIST(user_id, cosine_similarity) values(uid, similar);
    END LOOP get_list;
    CLOSE cursor_users;
	SET @row_number = 0;
	UPDATE USER_LIST
	SET user_stt = (@row_number:=@row_number + 1)
	ORDER BY cosine_similarity DESC;
	SELECT
		pdmv_movies.*, COALESCE(AVG(pdmv_ratings.rating), 0) AS mvrating
	FROM
		pdmv_movies
	INNER JOIN
		pdmv_ratings ON pdmv_movies.movie_id = pdmv_ratings.movie_id
	INNER JOIN
		(
			SELECT * from USER_LIST ORDER BY user_stt ASC
		) AS similar_users ON pdmv_ratings.user_id = similar_users.user_id
	WHERE
		pdmv_ratings.user_id <> user1
		AND pdmv_ratings.movie_id NOT IN (SELECT movie_id FROM pdmv_ratings WHERE user_id = user1)
		AND pdmv_ratings.rating >= 4.0
	GROUP BY
		pdmv_movies.movie_id
	ORDER BY
		similar_users.user_stt ASC, pdmv_ratings.rating DESC , AVG(pdmv_ratings.rating) DESC
		LIMIT numoffilm;
    DROP TABLE USER_LIST;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_login (IN username VARCHAR(50), IN userpassword VARCHAR(100))
BEGIN
	SELECT usname, acc_id, acctype_id FROM pdmv_accounts 
    WHERE usname=username AND password=userpassword 
    LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_list ()
BEGIN
	SELECT *
	FROM pdmv_movies
	ORDER BY movie_id DESC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_showdetail (IN mvid INT)
BEGIN
	SELECT mv.*, ROUND(COALESCE(AVG(rt.rating), 0), 1) as mvpoint, COUNT(rt.rating) as numrating
	FROM pdmv_movies mv
	LEFT JOIN pdmv_ratings rt ON mv.movie_id = rt.movie_id
	WHERE mv.movie_id = mvid
	GROUP BY mv.movie_id, rt.movie_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_showdetailByURL (IN mvurl VARCHAR(255))
BEGIN
	SELECT mv.*, ROUND(COALESCE(AVG(rt.rating), 0), 1) as mvpoint, COUNT(rt.rating) as numrating
	FROM pdmv_movies mv
	LEFT JOIN pdmv_ratings rt ON mv.movie_id = rt.movie_id
	WHERE mv.movie_url = mvurl
	GROUP BY mv.movie_id, rt.movie_id;
END//
DELIMITER ;

CREATE TABLE pdmv_comments (
	comment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    comment TEXT,
	commentTime DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES pdmv_users(user_id),
    FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

INSERT INTO pdmv_comments (user_id, movie_id, comment)
VALUES
    (7, 337, 'Phim này hay tuyệt'),
	(8, 337, 'Khá hay');

CREATE TABLE pdmv_errors (
	err_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
	errContent TEXT,
    isSolved TINYINT DEFAULT 0,
    FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

ALTER TABLE pdmv_movies
ADD COLUMN movie_url VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci UNIQUE;

DELIMITER //
CREATE FUNCTION convertToURL (inputText VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE outputText VARCHAR(255);
  SET outputText = LOWER(inputText);
  
  -- Chuyển chữ tiếng Việt có dấu thành không dấu
  -- a
  SET outputText = REPLACE(outputText, 'á', 'a');
  SET outputText = REPLACE(outputText, 'à', 'a');
  SET outputText = REPLACE(outputText, 'ả', 'a');
  SET outputText = REPLACE(outputText, 'ã', 'a');
  SET outputText = REPLACE(outputText, 'ạ', 'a');
  -- ă
  SET outputText = REPLACE(outputText, 'ă', 'a');
  SET outputText = REPLACE(outputText, 'ắ', 'a');
  SET outputText = REPLACE(outputText, 'ằ', 'a');
  SET outputText = REPLACE(outputText, 'ẳ', 'a');
  SET outputText = REPLACE(outputText, 'ẵ', 'a');
  SET outputText = REPLACE(outputText, 'ặ', 'a');
  -- â
  SET outputText = REPLACE(outputText, 'â', 'a');
  SET outputText = REPLACE(outputText, 'ấ', 'a');
  SET outputText = REPLACE(outputText, 'ầ', 'a');
  SET outputText = REPLACE(outputText, 'ẩ', 'a');
  SET outputText = REPLACE(outputText, 'ẫ', 'a');
  SET outputText = REPLACE(outputText, 'ậ', 'a');
  -- đ
  SET outputText = REPLACE(outputText, 'đ', 'd');
  -- e
  SET outputText = REPLACE(outputText, 'é', 'e');
  SET outputText = REPLACE(outputText, 'è', 'e');
  SET outputText = REPLACE(outputText, 'ẻ', 'e');
  SET outputText = REPLACE(outputText, 'ẽ', 'e');
  SET outputText = REPLACE(outputText, 'ẹ', 'e');
  -- ê
  SET outputText = REPLACE(outputText, 'ê', 'e');
  SET outputText = REPLACE(outputText, 'ế', 'e');
  SET outputText = REPLACE(outputText, 'ề', 'e');
  SET outputText = REPLACE(outputText, 'ể', 'e');
  SET outputText = REPLACE(outputText, 'ễ', 'e');
  SET outputText = REPLACE(outputText, 'ệ', 'e');
  -- o
  SET outputText = REPLACE(outputText, 'ó', 'o');
  SET outputText = REPLACE(outputText, 'ò', 'o');
  SET outputText = REPLACE(outputText, 'ỏ', 'o');
  SET outputText = REPLACE(outputText, 'õ', 'o');
  SET outputText = REPLACE(outputText, 'ọ', 'o');
  -- ô
  SET outputText = REPLACE(outputText, 'ô', 'o');
  SET outputText = REPLACE(outputText, 'ố', 'o');
  SET outputText = REPLACE(outputText, 'ồ', 'o');
  SET outputText = REPLACE(outputText, 'ổ', 'o');
  SET outputText = REPLACE(outputText, 'ỗ', 'o');
  SET outputText = REPLACE(outputText, 'ộ', 'o');
  -- ơ
  SET outputText = REPLACE(outputText, 'ơ', 'o');
  SET outputText = REPLACE(outputText, 'ớ', 'o');
  SET outputText = REPLACE(outputText, 'ờ', 'o');
  SET outputText = REPLACE(outputText, 'ở', 'o');
  SET outputText = REPLACE(outputText, 'ỡ', 'o');
  SET outputText = REPLACE(outputText, 'ợ', 'o');
  -- u
  SET outputText = REPLACE(outputText, 'ú', 'u');
  SET outputText = REPLACE(outputText, 'ù', 'u');
  SET outputText = REPLACE(outputText, 'ủ', 'u');
  SET outputText = REPLACE(outputText, 'ũ', 'u');
  SET outputText = REPLACE(outputText, 'ụ', 'u');
  -- ư
  SET outputText = REPLACE(outputText, 'ư', 'u');
  SET outputText = REPLACE(outputText, 'ứ', 'u');
  SET outputText = REPLACE(outputText, 'ừ', 'u');
  SET outputText = REPLACE(outputText, 'ử', 'u');
  SET outputText = REPLACE(outputText, 'ữ', 'u');
  SET outputText = REPLACE(outputText, 'ự', 'u');
  -- Thêm các quy tắc chuyển đổi cho các ký tự tiếng Việt khác tùy theo nhu cầu
  
  -- Loại bỏ các ký tự đặc biệt
  SET outputText = REGEXP_REPLACE(outputText, '[^a-zA-Z0-9]+', '-');
  
  -- Loại bỏ dấu hai chấm (:)
  SET outputText = REPLACE(outputText, ':', '');

  -- Loại bỏ dấu ngoặc đơn và ngoặc đôi
  SET outputText = REPLACE(outputText, '(', '');
  SET outputText = REPLACE(outputText, ')', '');
  SET outputText = REPLACE(outputText, '/', '');
  -- Loại bỏ khoảng trắng thừa ở đầu và cuối
  SET outputText = TRIM(BOTH '-' FROM outputText);

  RETURN outputText;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listHighestRatingMovies(IN numofmovie INT)
BEGIN
    SELECT
		pdmv_movies.*, AVG(pdmv_ratings.rating) as mvrating
	FROM
		pdmv_movies
	INNER JOIN
		pdmv_ratings ON pdmv_movies.movie_id = pdmv_ratings.movie_id
	GROUP BY
		pdmv_movies.movie_id
	ORDER BY
		AVG(pdmv_ratings.rating) DESC
		LIMIT numofmovie;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listChaptersOfMovie (IN mvid INT)
BEGIN
	SELECT *
    FROM pdmv_mvchapters
    WHERE movie_id = mvid;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listGenresOfMovie (IN mvid INT)
BEGIN
	SELECT *
    FROM pdmv_movies_genres mv
    INNER JOIN pdmv_mvgenres g ON mv.mvgenre_id = g.mvgenre_id
    WHERE movie_id = mvid;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_listGenres (IN viOrEn INT)
BEGIN
    CASE viOrEn
        WHEN 1 THEN
            SELECT *
            FROM pdmv_mvgenres
            ORDER BY mvgenre_vi_name ASC;
        WHEN 2 THEN
            SELECT *
            FROM pdmv_mvgenres
            ORDER BY mvgenre_en_name ASC;
        ELSE
            SELECT *
            FROM pdmv_mvgenres
            ORDER BY mvgenre_id ASC;
    END CASE;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_getGenre (IN p_mvgid INT)
BEGIN
    SELECT * FROM pdmv_mvgenres WHERE mvgenre_id = p_mvgid;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_listMovieOfGenre (IN mvgid INT)
BEGIN
    SELECT * 
    FROM pdmv_movies mv
    JOIN pdmv_movies_genres mvg ON mv.movie_id = mvg.movie_id
    WHERE mvg.mvgenre_id = mvgid
    ORDER BY mv.movie_id DESC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listWithSearch (IN kw VARCHAR(255))
BEGIN
    SET @search_term = CONCAT('%', kw, '%');
    SELECT *
    FROM pdmv_movies
    WHERE title_vi COLLATE utf8_unicode_ci LIKE @search_term
    OR title_en COLLATE utf8_unicode_ci LIKE @search_term
    ORDER BY movie_id DESC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE comment_drop (IN cmtid INT)
BEGIN
    DELETE FROM pdmv_comments WHERE comment_id = cmtid; 
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listCommentOfMovie(IN movie_id INT)
BEGIN
    SELECT cmt.*, acc.*
    FROM pdmv_comments cmt
    JOIN pdmv_accounts acc ON cmt.user_id = acc.acc_id
    WHERE cmt.movie_id = movie_id
    ORDER BY cmt.comment_id DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE comment_post(IN uid INT, IN mvid INT, IN cmtcontent TEXT)
BEGIN
    INSERT INTO pdmv_comments (user_id, movie_id, comment)
    VALUES (uid, mvid, cmtcontent);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_getRatingOf(IN uid INT, IN mvid INT)
BEGIN
    SELECT *
    FROM pdmv_ratings
    WHERE user_id = uid AND movie_id = mvid;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE rating_post(IN uid INT, IN mvid INT, IN p_rating DECIMAL(3,2))
BEGIN
    DECLARE record_count INT;
    
    -- Kiểm tra xem cặp (uid, mvid) đã tồn tại trong bảng hay chưa
    SELECT COUNT(*) INTO record_count
    FROM pdmv_ratings
    WHERE user_id = uid AND movie_id = mvid;

    -- Nếu đã tồn tại, thực hiện lệnh UPDATE
    IF record_count > 0 THEN
        UPDATE pdmv_ratings
        SET rating = p_rating
        WHERE user_id = uid AND movie_id = mvid;
    ELSE
        -- Nếu chưa tồn tại, thực hiện lệnh INSERT
        INSERT INTO pdmv_ratings (user_id, movie_id, rating)
        VALUES (uid, mvid, p_rating);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE rating_drop(IN p_rating_id INT)
BEGIN
    DECLARE record_count INT;
    SELECT COUNT(*) INTO record_count
    FROM pdmv_ratings
    WHERE rating_id = p_rating_id;
    IF record_count > 0 THEN
        DELETE FROM pdmv_ratings WHERE rating_id = p_rating_id;
        SELECT 1 AS isDeleted;
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE comment_get(IN comment_id INT)
BEGIN
    SELECT * FROM pdmv_comments WHERE comment_id = comment_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE comment_edit(IN cmtid INT, IN new_comment TEXT)
BEGIN
    UPDATE pdmv_comments SET comment = new_comment WHERE comment_id = cmtid;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_register(IN p_usname VARCHAR(255), IN p_passwd VARCHAR(255), IN p_email VARCHAR(255), IN p_fullname VARCHAR(255))
BEGIN
    DECLARE numaccid INT;
    
    INSERT INTO pdmv_accounts (usname, password, acctype_id) VALUES (p_usname, p_passwd, 3);
    
    SELECT MAX(acc_id) INTO numaccid FROM pdmv_accounts WHERE acctype_id = 3;

    INSERT INTO pdmv_users (user_id, email, fullname) VALUES (numaccid, p_email, p_fullname);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE account_getUid(IN p_usname VARCHAR(255))
BEGIN
    SELECT acc_id
    FROM pdmv_accounts
    WHERE usname = p_usname
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_get(IN p_uid INT)
BEGIN
    SELECT pa.usname, pa.acctype_id, pu.*
    FROM pdmv_users pu JOIN pdmv_accounts pa ON pu.user_id = pa.acc_id
    WHERE pu.user_id = p_uid
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_getByUsername(IN p_usname VARCHAR(255))
BEGIN
    SELECT pa.usname, pa.acctype_id, pu.*
    FROM pdmv_users pu JOIN pdmv_accounts pa ON pu.user_id = pa.acc_id
    WHERE pa.usname = p_usname
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_getAll()
BEGIN
    SELECT pa.usname, pa.acctype_id, pa.isLocked, pu.*
    FROM pdmv_users pu JOIN pdmv_accounts pa ON pu.user_id = pa.acc_id;
END //
DELIMITER ;

CREATE TABLE pdmv_admins (
    admin_id INT PRIMARY KEY,
    fullname VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(10),
    FOREIGN KEY (admin_id) REFERENCES pdmv_accounts(acc_id)
);

INSERT INTO pdmv_admins (admin_id, fullname, email, phone)
VALUES
    (2, 'Quản Trị Viên A','quantrivien1@gmail.com', '0774839113'),
    (23, 'Quản Trị Viên B', 'quantrivien2@gmail.com', '0889004549'),
    (24, 'Quản Trị Viên C', 'quantrivien3@gmail.com', '0123654978');

DELIMITER //
CREATE PROCEDURE admin_getAll()
BEGIN
    SELECT pa.usname, pa.acctype_id, pa.isLocked, pu.*
    FROM pdmv_admins pu JOIN pdmv_accounts pa ON pu.admin_id = pa.acc_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_getFavoriteMovies(IN p_uid INT)
BEGIN
    SELECT *
    FROM pdmv_ratings pr
    JOIN pdmv_movies pm ON pr.movie_id = pm.movie_id
    WHERE user_id = p_uid AND rating >= 4.0
    ORDER BY rating DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_getCommentList(IN p_uid INT)
BEGIN
    SELECT pc.*, pm.title_vi, pm.title_en, pm.movie_url
    FROM pdmv_comments pc
    JOIN pdmv_movies pm ON pc.movie_id = pm.movie_id
    WHERE user_id = p_uid
	ORDER BY commentTime DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_getRatingList(IN p_uid INT)
BEGIN
    SELECT pr.*, pm.title_vi, pm.title_en, pm.movie_url
    FROM pdmv_ratings pr
    JOIN pdmv_movies pm ON pr.movie_id = pm.movie_id
    WHERE user_id = p_uid
    ORDER BY ratingTime DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_update(
    IN p_user_id INT,
    IN p_email VARCHAR(255),
    IN p_fullname VARCHAR(255)
)
BEGIN
    -- Kiểm tra xem user_id có tồn tại trong bảng pdmv_users không
    IF EXISTS (SELECT 1 FROM pdmv_users WHERE user_id = p_user_id) THEN
        -- Cập nhật email và fullname cho user
        UPDATE pdmv_users
        SET email = p_email,
            fullname = p_fullname
        WHERE user_id = p_user_id;
        
        SELECT 'Cập nhật thông tin thành công' AS result;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE admin_update(
    IN p_admin_id INT,
    IN p_email VARCHAR(255),
    IN p_fullname VARCHAR(255),
    IN p_phone VARCHAR(255)
)
BEGIN
    -- Kiểm tra xem user_id có tồn tại trong bảng pdmv_users không
    IF EXISTS (SELECT 1 FROM pdmv_admins WHERE admin_id = p_admin_id) THEN
        -- Cập nhật email và fullname cho user
        UPDATE pdmv_admins
        SET email = p_email,
            fullname = p_fullname,
            phone = p_phone
        WHERE admin_id = p_admin_id;
        
        SELECT 'Cập nhật thông tin thành công' AS result;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE user_changePassword(
    IN p_user_id INT,
    IN p_newpassword VARCHAR(255)
)
BEGIN
    -- Kiểm tra xem user_id có tồn tại trong bảng pdmv_users không
    IF EXISTS (SELECT 1 FROM pdmv_accounts WHERE acc_id = p_user_id) THEN
        -- Cập nhật mật khẩu cho tài khoản
        UPDATE pdmv_accounts
        SET password = p_newpassword
        WHERE acc_id = p_user_id;
        
        SELECT 'Cập nhật mật khẩu thành công' AS result;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE error_post(
    IN p_mvid INT,
    IN p_error_content TEXT
)
BEGIN
    INSERT INTO pdmv_errors(movie_id, errContent)
    VALUES(p_mvid, p_error_content);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_listByTag (IN kw TEXT)
BEGIN
    SET @search_term = REPLACE(kw, '-', ' '); -- Loại bỏ gạch nối và thay thế bằng khoảng trắng
    SELECT *
    FROM pdmv_movies
    WHERE REPLACE(director, '-', ' ') COLLATE utf8mb4_unicode_ci LIKE CONCAT('%', @search_term, '%')
    OR REPLACE(actors, '-', ' ') COLLATE utf8mb4_unicode_ci LIKE CONCAT('%', @search_term, '%')
    ORDER BY movie_id DESC;
END//
DELIMITER ;

DELIMITER //

CREATE FUNCTION CalculateHammingDistance(
    input_string1 VARCHAR(255),
    input_string2 VARCHAR(255)
)
RETURNS INT
BEGIN
    DECLARE len1 INT;
    DECLARE len2 INT;
    DECLARE min_len INT;
    DECLARE i INT;
    DECLARE hamming_distance INT;

    SET len1 = LENGTH(input_string1);
    SET len2 = LENGTH(input_string2);
    
    IF len1 < len2 THEN
        SET min_len = len1;
    ELSE
        SET min_len = len2;
    END IF;
    
    SET hamming_distance = 0;
    SET i = 1;
        
    WHILE i <= min_len DO
        IF SUBSTRING(input_string1, i, 1) != SUBSTRING(input_string2, i, 1) THEN
            SET hamming_distance = hamming_distance + 1;
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SET hamming_distance = hamming_distance + ABS(len1 - len2);  -- Thêm sự chênh lệch độ dài
    
    RETURN hamming_distance;
END;
//
DELIMITER ;

ALTER TABLE pdmv_accounts
ADD COLUMN isLocked TINYINT(1) DEFAULT 0;

UPDATE pdmv_accounts
SET isLocked = 1
WHERE acc_id IN (19, 22, 24);


DELIMITER //
CREATE PROCEDURE account_changeLock (IN p_uid TEXT)
BEGIN
    UPDATE pdmv_accounts
    SET isLocked = CASE WHEN isLocked = 0 THEN 1 ELSE 0 END
    WHERE acc_id = p_uid;
    
    SELECT isLocked FROM pdmv_accounts WHERE acc_id = p_uid;
END//
DELIMITER ;


/*
LẦN 2
*/
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(1, 'Toy Story (1995)', 'Toy Story (1995)', 'content', 'Director 7, Director 13', 'Actor 1, Actor 12, Actor 34', '1995', '1h33m', 1, '862');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(2, 'Jumanji (1995)', 'Jumanji (1995)', 'content', 'Director 10, Director 14', 'Actor 8, Actor 15, Actor 40', '1995', '1h30m', 1, '8844');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(3, 'Grumpier Old Men (1995)', 'Grumpier Old Men (1995)', 'content', 'Director 8, Director 12', 'Actor 9, Actor 27, Actor 36', '1995', '1h50m', 1, '15602');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(4, 'Waiting to Exhale (1995)', 'Waiting to Exhale (1995)', 'content', 'Director 1, Director 15', 'Actor 9, Actor 23, Actor 36', '1995', '2h24m', 1, '31357');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(5, 'Father of the Bride Part II (1995)', 'Father of the Bride Part II (1995)', 'content', 'Director 7, Director 15', 'Actor 4, Actor 11, Actor 37', '1995', '2h19m', 1, '11862');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(6, 'Heat (1995)', 'Heat (1995)', 'content', 'Director 1, Director 17', 'Actor 4, Actor 17, Actor 38', '1995', '2h30m', 1, '949');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(7, 'Sabrina (1995)', 'Sabrina (1995)', 'content', 'Director 6, Director 16', 'Actor 9, Actor 20, Actor 32', '1995', '2h40m', 1, '11860');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(8, 'Tom and Huck (1995)', 'Tom and Huck (1995)', 'content', 'Director 6, Director 17', 'Actor 1, Actor 28, Actor 35', '1995', '2h21m', 1, '45325');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(9, 'Sudden Death (1995)', 'Sudden Death (1995)', 'content', 'Director 2, Director 16', 'Actor 1, Actor 27, Actor 39', '1995', '2h22m', 1, '9091');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(10, 'GoldenEye (1995)', 'GoldenEye (1995)', 'content', 'Director 3, Director 17', 'Actor 7, Actor 23, Actor 34', '1995', '2h27m', 1, '710');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(11, 'American President, The (1995)', 'American President, The (1995)', 'content', 'Director 7, Director 17', 'Actor 3, Actor 14, Actor 32', '1995', '1h34m', 1, '9087');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(12, 'Dracula: Dead and Loving It (1995)', 'Dracula: Dead and Loving It (1995)', 'content', 'Director 4, Director 14', 'Actor 6, Actor 28, Actor 37', '1995', '2h44m', 1, '12110');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(13, 'Balto (1995)', 'Balto (1995)', 'content', 'Director 4, Director 18', 'Actor 10, Actor 21, Actor 38', '1995', '2h30m', 1, '21032');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(14, 'Nixon (1995)', 'Nixon (1995)', 'content', 'Director 1, Director 14', 'Actor 7, Actor 23, Actor 33', '1995', '2h14m', 1, '10858');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(15, 'Cutthroat Island (1995)', 'Cutthroat Island (1995)', 'content', 'Director 2, Director 17', 'Actor 2, Actor 26, Actor 34', '1995', '1h36m', 1, '1408');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(16, 'Casino (1995)', 'Casino (1995)', 'content', 'Director 3, Director 16', 'Actor 5, Actor 23, Actor 33', '1995', '2h43m', 1, '524');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(17, 'Sense and Sensibility (1995)', 'Sense and Sensibility (1995)', 'content', 'Director 4, Director 15', 'Actor 1, Actor 29, Actor 40', '1995', '2h12m', 1, '4584');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(18, 'Four Rooms (1995)', 'Four Rooms (1995)', 'content', 'Director 2, Director 18', 'Actor 3, Actor 21, Actor 40', '1995', '1h17m', 1, '5');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(19, 'Ace Ventura: When Nature Calls (1995)', 'Ace Ventura: When Nature Calls (1995)', 'content', 'Director 2, Director 11', 'Actor 6, Actor 18, Actor 33', '1995', '1h37m', 1, '9273');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(20, 'Money Train (1995)', 'Money Train (1995)', 'content', 'Director 5, Director 14', 'Actor 5, Actor 19, Actor 36', '1995', '2h49m', 1, '11517');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(21, 'Get Shorty (1995)', 'Get Shorty (1995)', 'content', 'Director 4, Director 18', 'Actor 7, Actor 29, Actor 34', '1995', '1h45m', 1, '8012');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(22, 'Copycat (1995)', 'Copycat (1995)', 'content', 'Director 7, Director 15', 'Actor 6, Actor 30, Actor 39', '1995', '1h38m', 1, '1710');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(23, 'Assassins (1995)', 'Assassins (1995)', 'content', 'Director 4, Director 14', 'Actor 3, Actor 15, Actor 35', '1995', '1h45m', 1, '9691');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(24, 'Powder (1995)', 'Powder (1995)', 'content', 'Director 8, Director 20', 'Actor 5, Actor 27, Actor 39', '1995', '1h25m', 1, '12665');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(25, 'Leaving Las Vegas (1995)', 'Leaving Las Vegas (1995)', 'content', 'Director 8, Director 12', 'Actor 4, Actor 13, Actor 35', '1995', '2h12m', 1, '451');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(26, 'Othello (1995)', 'Othello (1995)', 'content', 'Director 6, Director 11', 'Actor 5, Actor 22, Actor 39', '1995', '2h10m', 1, '16420');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(27, 'Now and Then (1995)', 'Now and Then (1995)', 'content', 'Director 6, Director 11', 'Actor 5, Actor 26, Actor 35', '1995', '2h38m', 1, '9263');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(28, 'Persuasion (1995)', 'Persuasion (1995)', 'content', 'Director 10, Director 17', 'Actor 2, Actor 14, Actor 38', '1995', '2h32m', 1, '17015');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(29, 'City of Lost Children, The (CitÃ© des enfants perdus, La) (1995)', 'City of Lost Children, The (CitÃ© des enfants perdus, La) (1995)', 'content', 'Director 1, Director 12', 'Actor 5, Actor 22, Actor 32', '1995', '2h15m', 1, '902');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(30, 'Shanghai Triad (Yao a yao yao dao waipo qiao) (1995)', 'Shanghai Triad (Yao a yao yao dao waipo qiao) (1995)', 'content', 'Director 4, Director 11', 'Actor 2, Actor 29, Actor 32', '1995', '2h48m', 1, '37557');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(31, 'Dangerous Minds (1995)', 'Dangerous Minds (1995)', 'content', 'Director 7, Director 17', 'Actor 2, Actor 22, Actor 33', '1995', '2h41m', 1, '9909');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(32, 'Twelve Monkeys (a.k.a. 12 Monkeys) (1995)', 'Twelve Monkeys (a.k.a. 12 Monkeys) (1995)', 'content', 'Director 7, Director 18', 'Actor 5, Actor 14, Actor 37', '1995', '1h23m', 1, '63');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(33, 'Wings of Courage (1995)', 'Wings of Courage (1995)', 'content', 'Director 4, Director 15', 'Actor 9, Actor 30, Actor 39', '1995', '2h39m', 1, '78802');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(34, 'Babe (1995)', 'Babe (1995)', 'content', 'Director 4, Director 16', 'Actor 9, Actor 30, Actor 39', '1995', '2h43m', 1, '9598');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(35, 'Carrington (1995)', 'Carrington (1995)', 'content', 'Director 7, Director 14', 'Actor 8, Actor 24, Actor 32', '1995', '2h14m', 1, '47018');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(36, 'Dead Man Walking (1995)', 'Dead Man Walking (1995)', 'content', 'Director 7, Director 13', 'Actor 4, Actor 21, Actor 34', '1995', '1h35m', 1, '687');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(37, 'Across the Sea of Time (1995)', 'Across the Sea of Time (1995)', 'content', 'Director 1, Director 16', 'Actor 8, Actor 23, Actor 40', '1995', '1h24m', 1, '139405');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(38, 'It Takes Two (1995)', 'It Takes Two (1995)', 'content', 'Director 4, Director 16', 'Actor 5, Actor 24, Actor 39', '1995', '2h50m', 1, '33689');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(39, 'Clueless (1995)', 'Clueless (1995)', 'content', 'Director 10, Director 14', 'Actor 6, Actor 11, Actor 40', '1995', '1h30m', 1, '9603');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(40, 'Cry, the Beloved Country (1995)', 'Cry, the Beloved Country (1995)', 'content', 'Director 2, Director 19', 'Actor 2, Actor 24, Actor 39', '1995', '2h12m', 1, '34615');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(41, 'Richard III (1995)', 'Richard III (1995)', 'content', 'Director 7, Director 17', 'Actor 10, Actor 26, Actor 31', '1995', '1h18m', 1, '31174');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(42, 'Dead Presidents (1995)', 'Dead Presidents (1995)', 'content', 'Director 1, Director 11', 'Actor 6, Actor 20, Actor 33', '1995', '2h30m', 1, '11443');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(43, 'Restoration (1995)', 'Restoration (1995)', 'content', 'Director 3, Director 11', 'Actor 10, Actor 25, Actor 33', '1995', '2h35m', 1, '35196');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(44, 'Mortal Kombat (1995)', 'Mortal Kombat (1995)', 'content', 'Director 4, Director 20', 'Actor 1, Actor 23, Actor 32', '1995', '2h45m', 1, '9312');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(45, 'To Die For (1995)', 'To Die For (1995)', 'content', 'Director 4, Director 17', 'Actor 4, Actor 16, Actor 36', '1995', '1h31m', 1, '577');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(46, 'How to Make an American Quilt (1995)', 'How to Make an American Quilt (1995)', 'content', 'Director 5, Director 17', 'Actor 1, Actor 25, Actor 38', '1995', '1h48m', 1, '11861');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(47, 'Seven (a.k.a. Se7en) (1995)', 'Seven (a.k.a. Se7en) (1995)', 'content', 'Director 9, Director 13', 'Actor 5, Actor 28, Actor 34', '1995', '2h31m', 1, '807');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(48, 'Pocahontas (1995)', 'Pocahontas (1995)', 'content', 'Director 2, Director 19', 'Actor 2, Actor 18, Actor 32', '1995', '2h34m', 1, '10530');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(49, 'When Night Is Falling (1995)', 'When Night Is Falling (1995)', 'content', 'Director 6, Director 15', 'Actor 9, Actor 22, Actor 39', '1995', '1h14m', 1, '8391');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(50, 'Usual Suspects, The (1995)', 'Usual Suspects, The (1995)', 'content', 'Director 2, Director 18', 'Actor 2, Actor 21, Actor 38', '1995', '2h24m', 1, '629');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(51, 'Guardian Angel (1994)', 'Guardian Angel (1994)', 'content', 'Director 7, Director 14', 'Actor 7, Actor 25, Actor 36', '1994', '2h20m', 1, '117164');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(52, 'Mighty Aphrodite (1995)', 'Mighty Aphrodite (1995)', 'content', 'Director 9, Director 17', 'Actor 7, Actor 18, Actor 37', '1995', '1h14m', 1, '11448');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(53, 'Lamerica (1994)', 'Lamerica (1994)', 'content', 'Director 9, Director 19', 'Actor 8, Actor 12, Actor 31', '1994', '2h33m', 1, '49133');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(54, 'Big Green, The (1995)', 'Big Green, The (1995)', 'content', 'Director 3, Director 18', 'Actor 5, Actor 24, Actor 34', '1995', '2h27m', 1, '26441');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(55, 'Georgia (1995)', 'Georgia (1995)', 'content', 'Director 5, Director 20', 'Actor 7, Actor 22, Actor 36', '1995', '1h50m', 1, '97406');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(56, 'Kids of the Round Table (1995)', 'Kids of the Round Table (1995)', 'content', 'Director 3, Director 15', 'Actor 1, Actor 27, Actor 33', '1995', '2h33m', 1, '124057');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(57, 'Home for the Holidays (1995)', 'Home for the Holidays (1995)', 'content', 'Director 5, Director 17', 'Actor 9, Actor 21, Actor 33', '1995', '1h17m', 1, '9089');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(58, 'Postman, The (Postino, Il) (1994)', 'Postman, The (Postino, Il) (1994)', 'content', 'Director 7, Director 17', 'Actor 6, Actor 16, Actor 39', '1994', '1h30m', 1, '11010');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(59, 'Confessional, The (Confessionnal, Le) (1995)', 'Confessional, The (Confessionnal, Le) (1995)', 'content', 'Director 9, Director 13', 'Actor 7, Actor 20, Actor 35', '1995', '2h16m', 1, '99040');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(60, 'Indian in the Cupboard, The (1995)', 'Indian in the Cupboard, The (1995)', 'content', 'Director 6, Director 18', 'Actor 7, Actor 27, Actor 40', '1995', '2h35m', 1, '11359');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(61, 'Eye for an Eye (1996)', 'Eye for an Eye (1996)', 'content', 'Director 9, Director 14', 'Actor 1, Actor 22, Actor 33', '1996', '2h50m', 1, '17182');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(62, 'Mr. Holland Opus (1995)', 'Mr. Holland Opus (1995)', 'content', 'Director 5, Director 17', 'Actor 1, Actor 24, Actor 37', '1995', '1h43m', 1, '2054');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(63, 'Dont Be a Menace to South Central While Drinking Your Juice in the Hood (1996)', 'Dont Be a Menace to South Central While Drinking Your Juice in the Hood (1996)', 'content', 'Director 9, Director 15', 'Actor 8, Actor 26, Actor 39', '1996', '1h37m', 1, '10607');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(64, 'Two if by Sea (1996)', 'Two if by Sea (1996)', 'content', 'Director 3, Director 14', 'Actor 9, Actor 11, Actor 31', '1996', '2h14m', 1, '19760');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(65, 'Bio-Dome (1996)', 'Bio-Dome (1996)', 'content', 'Director 5, Director 14', 'Actor 5, Actor 26, Actor 35', '1996', '2h28m', 1, '9536');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(66, 'Lawnmower Man 2: Beyond Cyberspace (1996)', 'Lawnmower Man 2: Beyond Cyberspace (1996)', 'content', 'Director 7, Director 15', 'Actor 10, Actor 11, Actor 33', '1996', '2h42m', 1, '11525');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(67, 'Two Bits (1995)', 'Two Bits (1995)', 'content', 'Director 1, Director 17', 'Actor 5, Actor 25, Actor 40', '1995', '1h13m', 1, '40628');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(68, 'French Twist (Gazon maudit) (1995)', 'French Twist (Gazon maudit) (1995)', 'content', 'Director 10, Director 11', 'Actor 9, Actor 24, Actor 32', '1995', '1h39m', 1, '4482');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(69, 'Friday (1995)', 'Friday (1995)', 'content', 'Director 7, Director 16', 'Actor 6, Actor 21, Actor 37', '1995', '1h25m', 1, '10634');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(70, 'From Dusk Till Dawn (1996)', 'From Dusk Till Dawn (1996)', 'content', 'Director 10, Director 20', 'Actor 5, Actor 30, Actor 39', '1996', '2h48m', 1, '755');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(71, 'Fair Game (1995)', 'Fair Game (1995)', 'content', 'Director 10, Director 19', 'Actor 8, Actor 24, Actor 40', '1995', '1h35m', 1, '11859');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(72, 'Kicking and Screaming (1995)', 'Kicking and Screaming (1995)', 'content', 'Director 5, Director 14', 'Actor 3, Actor 17, Actor 33', '1995', '2h19m', 1, '28387');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(73, 'MisÃ©rables, Les (1995)', 'MisÃ©rables, Les (1995)', 'content', 'Director 9, Director 16', 'Actor 6, Actor 13, Actor 32', '1995', '1h32m', 1, '48750');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(74, 'Bed of Roses (1996)', 'Bed of Roses (1996)', 'content', 'Director 10, Director 18', 'Actor 3, Actor 18, Actor 33', '1996', '1h35m', 1, '20927');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(75, 'Big Bully (1996)', 'Big Bully (1996)', 'content', 'Director 4, Director 19', 'Actor 2, Actor 21, Actor 40', '1996', '1h33m', 1, '36929');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(76, 'Screamers (1995)', 'Screamers (1995)', 'content', 'Director 6, Director 20', 'Actor 10, Actor 28, Actor 32', '1995', '1h43m', 1, '9102');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(77, 'Nico Icon (1995)', 'Nico Icon (1995)', 'content', 'Director 6, Director 14', 'Actor 6, Actor 28, Actor 37', '1995', '1h35m', 1, '124626');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(78, 'Crossing Guard, The (1995)', 'Crossing Guard, The (1995)', 'content', 'Director 9, Director 17', 'Actor 6, Actor 14, Actor 33', '1995', '1h18m', 1, '27526');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(79, 'Juror, The (1996)', 'Juror, The (1996)', 'content', 'Director 4, Director 14', 'Actor 10, Actor 17, Actor 35', '1996', '2h26m', 1, '9623');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(80, 'White Balloon, The (Badkonake sefid) (1995)', 'White Balloon, The (Badkonake sefid) (1995)', 'content', 'Director 4, Director 18', 'Actor 8, Actor 20, Actor 34', '1995', '2h22m', 1, '46785');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(81, 'Things to Do in Denver When You are Dead (1995)', 'Things to Do in Denver When You are Dead (1995)', 'content', 'Director 4, Director 19', 'Actor 4, Actor 15, Actor 36', '1995', '1h37m', 1, '400');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(82, 'Antonia Line (Antonia) (1995)', 'Antonia Line (Antonia) (1995)', 'content', 'Director 8, Director 11', 'Actor 8, Actor 14, Actor 32', '1995', '2h17m', 1, '880');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(83, 'Once Upon a Time... When We Were Colored (1995)', 'Once Upon a Time... When We Were Colored (1995)', 'content', 'Director 2, Director 17', 'Actor 10, Actor 22, Actor 37', '1995', '1h40m', 1, '146599');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(84, 'Last Summer in the Hamptons (1995)', 'Last Summer in the Hamptons (1995)', 'content', 'Director 2, Director 12', 'Actor 2, Actor 28, Actor 31', '1995', '2h12m', 1, '188588');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(85, 'Angels and Insects (1995)', 'Angels and Insects (1995)', 'content', 'Director 7, Director 11', 'Actor 8, Actor 28, Actor 33', '1995', '1h38m', 1, '8447');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(86, 'White Squall (1996)', 'White Squall (1996)', 'content', 'Director 10, Director 14', 'Actor 6, Actor 12, Actor 36', '1996', '2h40m', 1, '10534');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(87, 'Dunston Checks In (1996)', 'Dunston Checks In (1996)', 'content', 'Director 9, Director 20', 'Actor 10, Actor 22, Actor 38', '1996', '1h27m', 1, '17414');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(88, 'Black Sheep (1996)', 'Black Sheep (1996)', 'content', 'Director 6, Director 13', 'Actor 3, Actor 17, Actor 34', '1996', '2h16m', 1, '13997');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(89, 'Nick of Time (1995)', 'Nick of Time (1995)', 'content', 'Director 3, Director 15', 'Actor 6, Actor 20, Actor 39', '1995', '1h17m', 1, '2086');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(90, 'The Journey of August King (1995)', 'The Journey of August King (1995)', 'content', 'Director 7, Director 17', 'Actor 3, Actor 29, Actor 39', '1995', '2h21m', 1, '61548');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(91, 'Movie 91 (2016)', 'Movie 91 (2016)', 'content', 'Director 8, Director 13', '', '2016', '2h15m', 0, '');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(92, 'Mary Reilly (1996)', 'Mary Reilly (1996)', 'content', 'Director 2, Director 15', 'Actor 3, Actor 27, Actor 36', '1996', '2h32m', 1, '9095');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(93, 'Vampire in Brooklyn (1995)', 'Vampire in Brooklyn (1995)', 'content', 'Director 4, Director 14', 'Actor 8, Actor 24, Actor 38', '1995', '2h41m', 1, '12158');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(94, 'Beautiful Girls (1996)', 'Beautiful Girls (1996)', 'content', 'Director 1, Director 18', 'Actor 7, Actor 27, Actor 40', '1996', '2h13m', 1, '9283');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(95, 'Broken Arrow (1996)', 'Broken Arrow (1996)', 'content', 'Director 7, Director 14', 'Actor 4, Actor 15, Actor 39', '1996', '1h12m', 1, '9208');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(96, 'In the Bleak Midwinter (1995)', 'In the Bleak Midwinter (1995)', 'content', 'Director 10, Director 18', 'Actor 5, Actor 26, Actor 33', '1995', '2h23m', 1, '40154');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(97, 'Hate (Haine, La) (1995)', 'Hate (Haine, La) (1995)', 'content', 'Director 9, Director 14', 'Actor 1, Actor 27, Actor 37', '1995', '2h39m', 1, '406');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(98, 'Shopping (1994)', 'Shopping (1994)', 'content', 'Director 6, Director 18', 'Actor 10, Actor 25, Actor 31', '1994', '2h24m', 1, '45549');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(99, 'Heidi Fleiss: Hollywood Madam (1995)', 'Heidi Fleiss: Hollywood Madam (1995)', 'content', 'Director 9, Director 17', 'Actor 2, Actor 12, Actor 33', '1995', '1h22m', 1, '63076');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(100, 'City Hall (1996)', 'City Hall (1996)', 'content', 'Director 9, Director 12', 'Actor 7, Actor 18, Actor 32', '1996', '2h48m', 1, '11062');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(101, 'Bottle Rocket (1996)', 'Bottle Rocket (1996)', 'content', 'Director 1, Director 16', 'Actor 8, Actor 18, Actor 37', '1996', '2h26m', 1, '13685');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(102, 'Mr. Wrong (1996)', 'Mr. Wrong (1996)', 'content', 'Director 1, Director 11', 'Actor 4, Actor 23, Actor 37', '1996', '2h17m', 1, '47475');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(103, 'Unforgettable (1996)', 'Unforgettable (1996)', 'content', 'Director 6, Director 18', 'Actor 5, Actor 12, Actor 40', '1996', '1h45m', 1, '2045');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(104, 'Happy Gilmore (1996)', 'Happy Gilmore (1996)', 'content', 'Director 4, Director 18', 'Actor 2, Actor 25, Actor 38', '1996', '2h11m', 1, '9614');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(105, 'Bridges of Madison County, The (1995)', 'Bridges of Madison County, The (1995)', 'content', 'Director 6, Director 17', 'Actor 10, Actor 26, Actor 37', '1995', '1h32m', 1, '688');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(106, 'Nobody Loves Me (Keiner liebt mich) (1994)', 'Nobody Loves Me (Keiner liebt mich) (1994)', 'content', 'Director 8, Director 17', 'Actor 1, Actor 18, Actor 38', '1994', '1h27m', 1, '11907');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(107, 'Muppet Treasure Island (1996)', 'Muppet Treasure Island (1996)', 'content', 'Director 3, Director 20', 'Actor 7, Actor 22, Actor 35', '1996', '2h31m', 1, '10874');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(108, 'Catwalk (1996)', 'Catwalk (1996)', 'content', 'Director 5, Director 12', 'Actor 3, Actor 13, Actor 40', '1996', '2h34m', 1, '89333');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(109, 'Headless Body in Topless Bar (1995)', 'Headless Body in Topless Bar (1995)', 'content', 'Director 6, Director 12', 'Actor 7, Actor 12, Actor 36', '1995', '1h31m', 1, '96357');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(110, 'Braveheart (1995)', 'Braveheart (1995)', 'content', 'Director 4, Director 13', 'Actor 2, Actor 29, Actor 32', '1995', '1h38m', 1, '197');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(111, 'Taxi Driver (1976)', 'Taxi Driver (1976)', 'content', 'Director 9, Director 19', 'Actor 1, Actor 15, Actor 39', '1976', '1h21m', 1, '103');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(112, 'Rumble in the Bronx (Hont faan kui) (1995)', 'Rumble in the Bronx (Hont faan kui) (1995)', 'content', 'Director 3, Director 12', 'Actor 6, Actor 15, Actor 34', '1995', '2h43m', 1, '33542');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(113, 'Before and After (1996)', 'Before and After (1996)', 'content', 'Director 2, Director 18', 'Actor 8, Actor 12, Actor 37', '1996', '2h38m', 1, '43566');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(114, 'Margaret Museum (1995)', 'Margaret Museum (1995)', 'content', 'Director 7, Director 13', 'Actor 1, Actor 21, Actor 33', '1995', '1h19m', 1, '71754');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(115, 'Happiness Is in the Field (Bonheur est dans le prÃ©, Le) (1995)', 'Happiness Is in the Field (Bonheur est dans le prÃ©, Le) (1995)', 'content', 'Director 3, Director 11', 'Actor 7, Actor 12, Actor 34', '1995', '2h26m', 1, '43612');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(116, 'Anne Frank Remembered (1995)', 'Anne Frank Remembered (1995)', 'content', 'Director 8, Director 16', 'Actor 3, Actor 12, Actor 35', '1995', '1h46m', 1, '51352');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(117, 'Young Poisoner Handbook, The (1995)', 'Young Poisoner Handbook, The (1995)', 'content', 'Director 8, Director 18', 'Actor 7, Actor 30, Actor 33', '1995', '2h48m', 1, '16934');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(118, 'If Lucy Fell (1996)', 'If Lucy Fell (1996)', 'content', 'Director 5, Director 13', 'Actor 8, Actor 27, Actor 33', '1996', '2h24m', 1, '10324');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(119, 'Steal Big, Steal Little (1995)', 'Steal Big, Steal Little (1995)', 'content', 'Director 2, Director 18', 'Actor 3, Actor 25, Actor 39', '1995', '2h21m', 1, '78406');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(120, 'Race the Sun (1996)', 'Race the Sun (1996)', 'content', 'Director 1, Director 16', 'Actor 8, Actor 23, Actor 38', '1996', '1h43m', 1, '55731');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(121, 'Boys of St. Vincent, The (1992)', 'Boys of St. Vincent, The (1992)', 'content', 'Director 3, Director 17', 'Actor 2, Actor 21, Actor 36', '1992', '1h17m', 1, '32119');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(122, 'Boomerang (1992)', 'Boomerang (1992)', 'content', 'Director 8, Director 13', 'Actor 5, Actor 26, Actor 35', '1992', '2h19m', 1, '11066');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(123, 'Chungking Express (Chung Hing sam lam) (1994)', 'Chungking Express (Chung Hing sam lam) (1994)', 'content', 'Director 9, Director 20', 'Actor 2, Actor 25, Actor 33', '1994', '1h29m', 1, '11104');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(124, 'Star Maker, The (Uomo delle stelle, L) (1995)', 'Star Maker, The (Uomo delle stelle, L) (1995)', 'content', 'Director 5, Director 12', 'Actor 4, Actor 15, Actor 37', '1995', '1h16m', 1, '37975');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(125, 'Flirting With Disaster (1996)', 'Flirting With Disaster (1996)', 'content', 'Director 3, Director 15', 'Actor 6, Actor 19, Actor 33', '1996', '1h24m', 1, '2074');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(126, 'NeverEnding Story III, The (1994)', 'NeverEnding Story III, The (1994)', 'content', 'Director 4, Director 15', 'Actor 4, Actor 21, Actor 40', '1994', '2h40m', 1, '27793');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(127, 'Silences of the Palace, The (Saimt el Qusur) (1994)', 'Silences of the Palace, The (Saimt el Qusur) (1994)', 'content', 'Director 6, Director 20', 'Actor 2, Actor 19, Actor 37', '1994', '1h39m', 1, '44284');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(128, 'Jupiter Wife (1994)', 'Jupiter Wife (1994)', 'content', 'Director 6, Director 17', 'Actor 10, Actor 27, Actor 33', '1994', '2h17m', 1, '290157');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(129, 'Pie in the Sky (1996)', 'Pie in the Sky (1996)', 'content', 'Director 8, Director 11', 'Actor 9, Actor 22, Actor 33', '1996', '2h22m', 1, '110972');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(130, 'Angela (1995)', 'Angela (1995)', 'content', 'Director 8, Director 12', 'Actor 4, Actor 29, Actor 37', '1995', '2h28m', 1, '32622');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(131, 'Frankie Starlight (1995)', 'Frankie Starlight (1995)', 'content', 'Director 8, Director 16', 'Actor 4, Actor 23, Actor 40', '1995', '1h21m', 1, '73067');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(132, 'Jade (1995)', 'Jade (1995)', 'content', 'Director 7, Director 14', 'Actor 5, Actor 25, Actor 34', '1995', '1h43m', 1, '11863');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(133, 'Nueba Yol (1995)', 'Nueba Yol (1995)', 'content', 'Director 9, Director 12', 'Actor 1, Actor 28, Actor 34', '1995', '2h17m', 1, '55475');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(134, 'Sonic Outlaws (1995)', 'Sonic Outlaws (1995)', 'content', 'Director 2, Director 15', 'Actor 10, Actor 16, Actor 36', '1995', '1h39m', 1, '124636');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(135, 'Down Periscope (1996)', 'Down Periscope (1996)', 'content', 'Director 8, Director 17', 'Actor 4, Actor 29, Actor 36', '1996', '1h38m', 1, '9101');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(136, 'From the Journals of Jean Seberg (1995)', 'From the Journals of Jean Seberg (1995)', 'content', 'Director 10, Director 19', 'Actor 8, Actor 15, Actor 36', '1995', '1h21m', 1, '123360');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(137, 'Man of the Year (1995)', 'Man of the Year (1995)', 'content', 'Director 7, Director 19', 'Actor 8, Actor 26, Actor 33', '1995', '2h16m', 1, '5757');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(138, 'Neon Bible, The (1995)', 'Neon Bible, The (1995)', 'content', 'Director 7, Director 17', 'Actor 4, Actor 12, Actor 40', '1995', '1h20m', 1, '39428');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(139, 'Target (1995)', 'Target (1995)', 'content', 'Director 6, Director 15', 'Actor 6, Actor 29, Actor 31', '1995', '1h27m', 1, '31600');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(140, 'Up Close and Personal (1996)', 'Up Close and Personal (1996)', 'content', 'Director 9, Director 12', 'Actor 6, Actor 28, Actor 35', '1996', '2h11m', 1, '9302');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(141, 'Birdcage, The (1996)', 'Birdcage, The (1996)', 'content', 'Director 7, Director 18', 'Actor 5, Actor 28, Actor 33', '1996', '1h40m', 1, '11000');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(142, 'Shadows (Cienie) (1988)', 'Shadows (Cienie) (1988)', 'content', 'Director 9, Director 15', 'Actor 4, Actor 26, Actor 38', '1988', '1h38m', 1, '525153');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(143, 'Gospa (1995)', 'Gospa (1995)', 'content', 'Director 4, Director 19', 'Actor 10, Actor 14, Actor 40', '1995', '1h31m', 1, '249882');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(144, 'Brothers McMullen, The (1995)', 'Brothers McMullen, The (1995)', 'content', 'Director 9, Director 20', 'Actor 8, Actor 23, Actor 33', '1995', '1h18m', 1, '16388');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(145, 'Bad Boys (1995)', 'Bad Boys (1995)', 'content', 'Director 9, Director 18', 'Actor 7, Actor 26, Actor 34', '1995', '1h49m', 1, '9737');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(146, 'Amazing Panda Adventure, The (1995)', 'Amazing Panda Adventure, The (1995)', 'content', 'Director 10, Director 12', 'Actor 3, Actor 30, Actor 39', '1995', '1h40m', 1, '30765');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(147, 'Basketball Diaries, The (1995)', 'Basketball Diaries, The (1995)', 'content', 'Director 5, Director 11', 'Actor 9, Actor 26, Actor 31', '1995', '1h46m', 1, '10474');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(148, 'Awfully Big Adventure, An (1995)', 'Awfully Big Adventure, An (1995)', 'content', 'Director 9, Director 14', 'Actor 7, Actor 25, Actor 31', '1995', '1h25m', 1, '22279');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(149, 'Amateur (1994)', 'Amateur (1994)', 'content', 'Director 2, Director 19', 'Actor 10, Actor 19, Actor 32', '1994', '1h49m', 1, '30157');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(150, 'Apollo 13 (1995)', 'Apollo 13 (1995)', 'content', 'Director 3, Director 17', 'Actor 9, Actor 20, Actor 39', '1995', '2h45m', 1, '568');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(151, 'Rob Roy (1995)', 'Rob Roy (1995)', 'content', 'Director 5, Director 17', 'Actor 2, Actor 16, Actor 36', '1995', '2h31m', 1, '11780');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(152, 'Addiction, The (1995)', 'Addiction, The (1995)', 'content', 'Director 5, Director 14', 'Actor 3, Actor 26, Actor 34', '1995', '2h47m', 1, '34996');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(153, 'Batman Forever (1995)', 'Batman Forever (1995)', 'content', 'Director 4, Director 16', 'Actor 7, Actor 15, Actor 33', '1995', '2h12m', 1, '414');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(154, 'Beauty of the Day (Belle de jour) (1967)', 'Beauty of the Day (Belle de jour) (1967)', 'content', 'Director 7, Director 17', 'Actor 9, Actor 14, Actor 33', '1967', '2h35m', 1, '649');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(155, 'Beyond Rangoon (1995)', 'Beyond Rangoon (1995)', 'content', 'Director 10, Director 13', 'Actor 3, Actor 30, Actor 33', '1995', '1h40m', 1, '1873');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(156, 'Blue in the Face (1995)', 'Blue in the Face (1995)', 'content', 'Director 2, Director 17', 'Actor 2, Actor 25, Actor 32', '1995', '1h30m', 1, '5894');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(157, 'Canadian Bacon (1995)', 'Canadian Bacon (1995)', 'content', 'Director 6, Director 11', 'Actor 1, Actor 24, Actor 38', '1995', '1h35m', 1, '1775');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(158, 'Casper (1995)', 'Casper (1995)', 'content', 'Director 6, Director 17', 'Actor 10, Actor 28, Actor 32', '1995', '1h15m', 1, '8839');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(159, 'Clockers (1995)', 'Clockers (1995)', 'content', 'Director 5, Director 15', 'Actor 3, Actor 26, Actor 33', '1995', '2h28m', 1, '20649');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(160, 'Congo (1995)', 'Congo (1995)', 'content', 'Director 6, Director 12', 'Actor 7, Actor 24, Actor 36', '1995', '1h20m', 1, '10329');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(161, 'Crimson Tide (1995)', 'Crimson Tide (1995)', 'content', 'Director 9, Director 17', 'Actor 7, Actor 20, Actor 36', '1995', '1h29m', 1, '8963');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(162, 'Crumb (1994)', 'Crumb (1994)', 'content', 'Director 5, Director 16', 'Actor 8, Actor 18, Actor 34', '1994', '2h35m', 1, '26564');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(163, 'Desperado (1995)', 'Desperado (1995)', 'content', 'Director 1, Director 13', 'Actor 1, Actor 22, Actor 38', '1995', '1h30m', 1, '8068');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(164, 'Devil in a Blue Dress (1995)', 'Devil in a Blue Dress (1995)', 'content', 'Director 6, Director 12', 'Actor 7, Actor 23, Actor 33', '1995', '1h20m', 1, '8512');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(165, 'Die Hard: With a Vengeance (1995)', 'Die Hard: With a Vengeance (1995)', 'content', 'Director 1, Director 17', 'Actor 9, Actor 24, Actor 39', '1995', '1h22m', 1, '1572');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(166, 'Doom Generation, The (1995)', 'Doom Generation, The (1995)', 'content', 'Director 9, Director 17', 'Actor 1, Actor 30, Actor 35', '1995', '1h37m', 1, '13552');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(167, 'Feast of July (1995)', 'Feast of July (1995)', 'content', 'Director 7, Director 17', 'Actor 7, Actor 27, Actor 39', '1995', '2h49m', 1, '259209');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(168, 'First Knight (1995)', 'First Knight (1995)', 'content', 'Director 3, Director 17', 'Actor 7, Actor 23, Actor 31', '1995', '1h43m', 1, '6520');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(169, 'Free Willy 2: The Adventure Home (1995)', 'Free Willy 2: The Adventure Home (1995)', 'content', 'Director 3, Director 12', 'Actor 10, Actor 23, Actor 40', '1995', '1h40m', 1, '9073');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(170, 'Hackers (1995)', 'Hackers (1995)', 'content', 'Director 7, Director 20', 'Actor 4, Actor 18, Actor 37', '1995', '1h26m', 1, '10428');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(171, 'Jeffrey (1995)', 'Jeffrey (1995)', 'content', 'Director 5, Director 17', 'Actor 8, Actor 27, Actor 34', '1995', '2h20m', 1, '17447');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(172, 'Johnny Mnemonic (1995)', 'Johnny Mnemonic (1995)', 'content', 'Director 3, Director 16', 'Actor 5, Actor 11, Actor 36', '1995', '1h39m', 1, '9886');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(173, 'Judge Dredd (1995)', 'Judge Dredd (1995)', 'content', 'Director 8, Director 17', 'Actor 3, Actor 28, Actor 36', '1995', '2h35m', 1, '9482');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(174, 'Jury Duty (1995)', 'Jury Duty (1995)', 'content', 'Director 8, Director 16', 'Actor 2, Actor 26, Actor 39', '1995', '2h22m', 1, '19326');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(175, 'Kids (1995)', 'Kids (1995)', 'content', 'Director 4, Director 20', 'Actor 8, Actor 22, Actor 31', '1995', '2h33m', 1, '9344');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(176, 'Living in Oblivion (1995)', 'Living in Oblivion (1995)', 'content', 'Director 4, Director 18', 'Actor 5, Actor 19, Actor 36', '1995', '2h12m', 1, '9071');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(177, 'Lord of Illusions (1995)', 'Lord of Illusions (1995)', 'content', 'Director 5, Director 12', 'Actor 8, Actor 26, Actor 33', '1995', '1h26m', 1, '8973');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(178, 'Love & Human Remains (1993)', 'Love & Human Remains (1993)', 'content', 'Director 2, Director 14', 'Actor 3, Actor 17, Actor 32', '1993', '1h43m', 1, '15730');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(179, 'Mad Love (1995)', 'Mad Love (1995)', 'content', 'Director 6, Director 12', 'Actor 6, Actor 21, Actor 37', '1995', '1h13m', 1, '47608');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(180, 'Mallrats (1995)', 'Mallrats (1995)', 'content', 'Director 6, Director 17', 'Actor 6, Actor 28, Actor 34', '1995', '1h16m', 1, '2293');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(181, 'Mighty Morphin Power Rangers: The Movie (1995)', 'Mighty Morphin Power Rangers: The Movie (1995)', 'content', 'Director 9, Director 12', 'Actor 3, Actor 11, Actor 33', '1995', '2h27m', 1, '9070');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(182, 'Moonlight and Valentino (1995)', 'Moonlight and Valentino (1995)', 'content', 'Director 4, Director 11', 'Actor 3, Actor 21, Actor 37', '1995', '1h14m', 1, '68274');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(183, 'Mute Witness (1994)', 'Mute Witness (1994)', 'content', 'Director 3, Director 13', 'Actor 5, Actor 23, Actor 31', '1994', '1h21m', 1, '48787');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(184, 'Nadja (1994)', 'Nadja (1994)', 'content', 'Director 5, Director 20', 'Actor 4, Actor 19, Actor 35', '1994', '2h16m', 1, '34574');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(185, 'Net, The (1995)', 'Net, The (1995)', 'content', 'Director 7, Director 13', 'Actor 7, Actor 30, Actor 34', '1995', '2h19m', 1, '1642');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(186, 'Nine Months (1995)', 'Nine Months (1995)', 'content', 'Director 8, Director 14', 'Actor 1, Actor 21, Actor 33', '1995', '1h12m', 1, '11472');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(187, 'Party Girl (1995)', 'Party Girl (1995)', 'content', 'Director 1, Director 11', 'Actor 10, Actor 19, Actor 34', '1995', '2h17m', 1, '36196');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(188, 'Prophecy, The (1995)', 'Prophecy, The (1995)', 'content', 'Director 1, Director 15', 'Actor 7, Actor 23, Actor 33', '1995', '1h32m', 1, '11980');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(189, 'Reckless (1995)', 'Reckless (1995)', 'content', 'Director 2, Director 20', 'Actor 8, Actor 20, Actor 31', '1995', '1h40m', 1, '58372');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(190, 'Safe (1995)', 'Safe (1995)', 'content', 'Director 2, Director 19', 'Actor 6, Actor 24, Actor 35', '1995', '1h47m', 1, '32646');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(191, 'Scarlet Letter, The (1995)', 'Scarlet Letter, The (1995)', 'content', 'Director 4, Director 20', 'Actor 6, Actor 29, Actor 40', '1995', '1h36m', 1, '10533');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(192, 'The Show (1995)', 'The Show (1995)', 'content', 'Director 8, Director 19', 'Actor 6, Actor 25, Actor 37', '1995', '1h46m', 1, '56088');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(193, 'Showgirls (1995)', 'Showgirls (1995)', 'content', 'Director 6, Director 20', 'Actor 4, Actor 27, Actor 36', '1995', '1h21m', 1, '10802');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(194, 'Smoke (1995)', 'Smoke (1995)', 'content', 'Director 9, Director 15', 'Actor 4, Actor 16, Actor 38', '1995', '2h15m', 1, '10149');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(195, 'Something to Talk About (1995)', 'Something to Talk About (1995)', 'content', 'Director 7, Director 13', 'Actor 5, Actor 21, Actor 34', '1995', '2h26m', 1, '18402');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(196, 'Species (1995)', 'Species (1995)', 'content', 'Director 5, Director 15', 'Actor 7, Actor 26, Actor 40', '1995', '2h31m', 1, '9348');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(197, 'Stars Fell on Henrietta, The (1995)', 'Stars Fell on Henrietta, The (1995)', 'content', 'Director 5, Director 12', 'Actor 4, Actor 13, Actor 36', '1995', '2h12m', 1, '139408');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(198, 'Strange Days (1995)', 'Strange Days (1995)', 'content', 'Director 1, Director 17', 'Actor 8, Actor 20, Actor 31', '1995', '2h39m', 1, '281');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(199, 'Umbrellas of Cherbourg, The (Parapluies de Cherbourg, Les) (1964)', 'Umbrellas of Cherbourg, The (Parapluies de Cherbourg, Les) (1964)', 'content', 'Director 10, Director 13', 'Actor 1, Actor 29, Actor 35', '1964', '2h22m', 1, '5967');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(200, 'Tie That Binds, The (1995)', 'Tie That Binds, The (1995)', 'content', 'Director 8, Director 18', 'Actor 3, Actor 27, Actor 35', '1995', '2h24m', 1, '79593');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(201, 'Three Wishes (1995)', 'Three Wishes (1995)', 'content', 'Director 1, Director 12', 'Actor 8, Actor 20, Actor 35', '1995', '1h25m', 1, '47939');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(202, 'Total Eclipse (1995)', 'Total Eclipse (1995)', 'content', 'Director 2, Director 14', 'Actor 2, Actor 30, Actor 33', '1995', '2h41m', 1, '36834');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(203, 'To Wong Foo, Thanks for Everything! Julie Newmar (1995)', 'To Wong Foo, Thanks for Everything! Julie Newmar (1995)', 'content', 'Director 10, Director 11', 'Actor 8, Actor 13, Actor 33', '1995', '2h39m', 1, '9090');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(204, 'Under Siege 2: Dark Territory (1995)', 'Under Siege 2: Dark Territory (1995)', 'content', 'Director 3, Director 20', 'Actor 8, Actor 13, Actor 38', '1995', '1h45m', 1, '3512');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(205, 'Unstrung Heroes (1995)', 'Unstrung Heroes (1995)', 'content', 'Director 6, Director 18', 'Actor 5, Actor 18, Actor 39', '1995', '1h42m', 1, '52856');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(206, 'Unzipped (1995)', 'Unzipped (1995)', 'content', 'Director 9, Director 11', 'Actor 1, Actor 19, Actor 31', '1995', '1h25m', 1, '77350');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(207, 'Walk in the Clouds, A (1995)', 'Walk in the Clouds, A (1995)', 'content', 'Director 3, Director 19', 'Actor 7, Actor 30, Actor 35', '1995', '1h36m', 1, '9560');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(208, 'Waterworld (1995)', 'Waterworld (1995)', 'content', 'Director 7, Director 17', 'Actor 10, Actor 13, Actor 37', '1995', '2h50m', 1, '9804');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(209, 'White Man Burden (1995)', 'White Man Burden (1995)', 'content', 'Director 9, Director 17', 'Actor 7, Actor 18, Actor 32', '1995', '1h30m', 1, '31611');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(210, 'Wild Bill (1995)', 'Wild Bill (1995)', 'content', 'Director 2, Director 19', 'Actor 3, Actor 20, Actor 35', '1995', '2h50m', 1, '65796');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(211, 'Browning Version, The (1994)', 'Browning Version, The (1994)', 'content', 'Director 5, Director 12', 'Actor 10, Actor 17, Actor 39', '1994', '2h35m', 1, '49805');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(212, 'Bushwhacked (1995)', 'Bushwhacked (1995)', 'content', 'Director 5, Director 15', 'Actor 8, Actor 23, Actor 36', '1995', '1h25m', 1, '26258');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(213, 'Burnt by the Sun (Utomlyonnye solntsem) (1994)', 'Burnt by the Sun (Utomlyonnye solntsem) (1994)', 'content', 'Director 8, Director 17', 'Actor 6, Actor 17, Actor 31', '1994', '2h23m', 1, '50797');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(214, 'Before the Rain (Pred dozhdot) (1994)', 'Before the Rain (Pred dozhdot) (1994)', 'content', 'Director 2, Director 20', 'Actor 5, Actor 15, Actor 32', '1994', '2h18m', 1, '19155');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(215, 'Before Sunrise (1995)', 'Before Sunrise (1995)', 'content', 'Director 6, Director 11', 'Actor 8, Actor 18, Actor 33', '1995', '2h47m', 1, '76');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(216, 'Billy Madison (1995)', 'Billy Madison (1995)', 'content', 'Director 9, Director 17', 'Actor 6, Actor 16, Actor 40', '1995', '1h41m', 1, '11017');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(217, 'Babysitter, The (1995)', 'Babysitter, The (1995)', 'content', 'Director 6, Director 12', 'Actor 10, Actor 11, Actor 34', '1995', '2h11m', 1, '37141');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(218, 'Boys on the Side (1995)', 'Boys on the Side (1995)', 'content', 'Director 1, Director 20', 'Actor 7, Actor 16, Actor 34', '1995', '1h17m', 1, '9382');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(219, 'Cure, The (1995)', 'Cure, The (1995)', 'content', 'Director 6, Director 11', 'Actor 6, Actor 12, Actor 35', '1995', '2h50m', 1, '6715');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(220, 'Castle Freak (1995)', 'Castle Freak (1995)', 'content', 'Director 1, Director 18', 'Actor 1, Actor 24, Actor 34', '1995', '2h13m', 1, '18256');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(221, 'Movie 221 (2017)', 'Movie 221 (2017)', 'content', 'Director 8, Director 20', 'Actor 1, Actor 27, Actor 32', '2017', '1h22m', 0, '');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(222, 'Circle of Friends (1995)', 'Circle of Friends (1995)', 'content', 'Director 6, Director 13', 'Actor 9, Actor 11, Actor 39', '1995', '2h37m', 1, '22625');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(223, 'Clerks (1994)', 'Clerks (1994)', 'content', 'Director 9, Director 13', 'Actor 10, Actor 17, Actor 39', '1994', '2h39m', 1, '2292');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(224, 'Don Juan DeMarco (1995)', 'Don Juan DeMarco (1995)', 'content', 'Director 1, Director 19', 'Actor 3, Actor 28, Actor 32', '1995', '1h20m', 1, '1909');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(225, 'Disclosure (1994)', 'Disclosure (1994)', 'content', 'Director 6, Director 12', 'Actor 4, Actor 25, Actor 35', '1994', '2h14m', 1, '8984');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(226, 'Dream Man (1995)', 'Dream Man (1995)', 'content', 'Director 7, Director 17', 'Actor 9, Actor 22, Actor 32', '1995', '2h36m', 1, '61813');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(227, 'Drop Zone (1994)', 'Drop Zone (1994)', 'content', 'Director 10, Director 18', 'Actor 8, Actor 16, Actor 33', '1994', '1h37m', 1, '4954');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(228, 'Destiny Turns on the Radio (1995)', 'Destiny Turns on the Radio (1995)', 'content', 'Director 9, Director 20', 'Actor 7, Actor 27, Actor 39', '1995', '2h49m', 1, '62488');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(229, 'Death and the Maiden (1994)', 'Death and the Maiden (1994)', 'content', 'Director 6, Director 18', 'Actor 7, Actor 24, Actor 36', '1994', '2h34m', 1, '10531');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(230, 'Dolores Claiborne (1995)', 'Dolores Claiborne (1995)', 'content', 'Director 9, Director 18', 'Actor 2, Actor 29, Actor 37', '1995', '1h47m', 1, '11929');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(231, 'Dumb & Dumber (Dumb and Dumber) (1994)', 'Dumb & Dumber (Dumb and Dumber) (1994)', 'content', 'Director 6, Director 13', 'Actor 10, Actor 16, Actor 31', '1994', '2h44m', 1, '8467');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(232, 'Eat Drink Man Woman (Yin shi nan nu) (1994)', 'Eat Drink Man Woman (Yin shi nan nu) (1994)', 'content', 'Director 1, Director 15', 'Actor 4, Actor 26, Actor 38', '1994', '1h19m', 1, '10451');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(233, 'Exotica (1994)', 'Exotica (1994)', 'content', 'Director 7, Director 14', 'Actor 3, Actor 18, Actor 35', '1994', '2h32m', 1, '20156');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(234, 'Exit to Eden (1994)', 'Exit to Eden (1994)', 'content', 'Director 3, Director 18', 'Actor 3, Actor 25, Actor 34', '1994', '2h27m', 1, '18395');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(235, 'Ed Wood (1994)', 'Ed Wood (1994)', 'content', 'Director 9, Director 11', 'Actor 7, Actor 25, Actor 33', '1994', '1h33m', 1, '522');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(236, 'French Kiss (1995)', 'French Kiss (1995)', 'content', 'Director 5, Director 13', 'Actor 4, Actor 30, Actor 33', '1995', '2h23m', 1, '397');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(237, 'Forget Paris (1995)', 'Forget Paris (1995)', 'content', 'Director 8, Director 14', 'Actor 8, Actor 29, Actor 33', '1995', '1h50m', 1, '10525');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(238, 'Far From Home: The Adventures of Yellow Dog (1995)', 'Far From Home: The Adventures of Yellow Dog (1995)', 'content', 'Director 7, Director 18', 'Actor 2, Actor 28, Actor 34', '1995', '1h37m', 1, '27985');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(239, 'Goofy Movie, A (1995)', 'Goofy Movie, A (1995)', 'content', 'Director 4, Director 13', 'Actor 4, Actor 25, Actor 40', '1995', '2h15m', 1, '15789');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(240, 'Hideaway (1995)', 'Hideaway (1995)', 'content', 'Director 4, Director 18', 'Actor 4, Actor 11, Actor 36', '1995', '1h11m', 1, '27303');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(241, 'Fluke (1995)', 'Fluke (1995)', 'content', 'Director 6, Director 19', 'Actor 7, Actor 30, Actor 37', '1995', '2h40m', 1, '21183');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(242, 'Farinelli: il castrato (1994)', 'Farinelli: il castrato (1994)', 'content', 'Director 3, Director 20', 'Actor 6, Actor 13, Actor 34', '1994', '1h22m', 1, '10954');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(243, 'Gordy (1995)', 'Gordy (1995)', 'content', 'Director 9, Director 18', 'Actor 10, Actor 23, Actor 33', '1995', '2h31m', 1, '47867');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(244, 'Gumby: The Movie (1995)', 'Gumby: The Movie (1995)', 'content', 'Director 10, Director 12', 'Actor 10, Actor 19, Actor 38', '1995', '2h40m', 1, '43475');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(245, 'The Glass Shield (1994)', 'The Glass Shield (1994)', 'content', 'Director 10, Director 14', 'Actor 10, Actor 21, Actor 36', '1994', '1h39m', 1, '72031');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(246, 'Hoop Dreams (1994)', 'Hoop Dreams (1994)', 'content', 'Director 10, Director 13', 'Actor 3, Actor 28, Actor 34', '1994', '1h29m', 1, '14275');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(247, 'Heavenly Creatures (1994)', 'Heavenly Creatures (1994)', 'content', 'Director 7, Director 17', 'Actor 1, Actor 24, Actor 34', '1994', '2h33m', 1, '1024');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(248, 'Houseguest (1994)', 'Houseguest (1994)', 'content', 'Director 2, Director 18', 'Actor 3, Actor 24, Actor 32', '1994', '1h29m', 1, '17207');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(249, 'Immortal Beloved (1994)', 'Immortal Beloved (1994)', 'content', 'Director 3, Director 11', 'Actor 4, Actor 26, Actor 34', '1994', '2h20m', 1, '13701');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(250, 'Heavyweights (Heavy Weights) (1995)', 'Heavyweights (Heavy Weights) (1995)', 'content', 'Director 7, Director 17', 'Actor 10, Actor 22, Actor 32', '1995', '1h34m', 1, '14819');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(251, 'Hunted, The (1995)', 'Hunted, The (1995)', 'content', 'Director 10, Director 17', 'Actor 9, Actor 21, Actor 32', '1995', '1h41m', 1, '32631');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(252, 'I.Q. (1994)', 'I.Q. (1994)', 'content', 'Director 9, Director 12', 'Actor 6, Actor 22, Actor 36', '1994', '2h44m', 1, '11777');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(253, 'Interview with the Vampire: The Vampire Chronicles (1994)', 'Interview with the Vampire: The Vampire Chronicles (1994)', 'content', 'Director 8, Director 11', 'Actor 5, Actor 13, Actor 40', '1994', '2h19m', 1, '628');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(254, 'Jefferson in Paris (1995)', 'Jefferson in Paris (1995)', 'content', 'Director 1, Director 12', 'Actor 7, Actor 21, Actor 38', '1995', '2h44m', 1, '87729');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(255, 'Jerky Boys, The (1995)', 'Jerky Boys, The (1995)', 'content', 'Director 9, Director 19', 'Actor 5, Actor 14, Actor 35', '1995', '2h10m', 1, '18713');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(256, 'Junior (1994)', 'Junior (1994)', 'content', 'Director 4, Director 18', 'Actor 6, Actor 30, Actor 34', '1994', '1h36m', 1, '6280');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(257, 'Just Cause (1995)', 'Just Cause (1995)', 'content', 'Director 10, Director 14', 'Actor 10, Actor 19, Actor 36', '1995', '1h45m', 1, '9061');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(258, 'Kid in King Arthur Court, A (1995)', 'Kid in King Arthur Court, A (1995)', 'content', 'Director 4, Director 12', 'Actor 2, Actor 20, Actor 39', '1995', '1h36m', 1, '37108');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(259, 'Kiss of Death (1995)', 'Kiss of Death (1995)', 'content', 'Director 5, Director 14', 'Actor 1, Actor 15, Actor 40', '1995', '2h35m', 1, '6071');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(260, 'Star Wars: Episode IV - A New Hope (1977)', 'Star Wars: Episode IV - A New Hope (1977)', 'content', 'Director 8, Director 13', 'Actor 10, Actor 18, Actor 35', '1977', '2h24m', 1, '11');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(261, 'Little Women (1994)', 'Little Women (1994)', 'content', 'Director 5, Director 16', 'Actor 6, Actor 28, Actor 34', '1994', '2h30m', 1, '9587');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(262, 'Little Princess, A (1995)', 'Little Princess, A (1995)', 'content', 'Director 5, Director 18', 'Actor 6, Actor 22, Actor 38', '1995', '2h47m', 1, '19101');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(263, 'Ladybird Ladybird (1994)', 'Ladybird Ladybird (1994)', 'content', 'Director 3, Director 11', 'Actor 10, Actor 24, Actor 32', '1994', '1h16m', 1, '49980');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(264, 'Enfer, L (1994)', 'Enfer, L (1994)', 'content', 'Director 10, Director 12', 'Actor 2, Actor 17, Actor 35', '1994', '2h48m', 1, '17961');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(265, 'Like Water for Chocolate (Como agua para chocolate) (1992)', 'Like Water for Chocolate (Como agua para chocolate) (1992)', 'content', 'Director 7, Director 11', 'Actor 6, Actor 25, Actor 37', '1992', '1h39m', 1, '18183');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(266, 'Legends of the Fall (1994)', 'Legends of the Fall (1994)', 'content', 'Director 1, Director 14', 'Actor 1, Actor 27, Actor 37', '1994', '1h31m', 1, '4476');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(267, 'Major Payne (1995)', 'Major Payne (1995)', 'content', 'Director 8, Director 20', 'Actor 5, Actor 19, Actor 32', '1995', '2h28m', 1, '11008');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(268, 'Little Odessa (1994)', 'Little Odessa (1994)', 'content', 'Director 6, Director 17', 'Actor 2, Actor 29, Actor 33', '1994', '1h42m', 1, '47504');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(269, 'My Crazy Life (Mi vida loca) (1993)', 'My Crazy Life (Mi vida loca) (1993)', 'content', 'Director 1, Director 17', 'Actor 3, Actor 28, Actor 31', '1993', '1h31m', 1, '32325');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(270, 'Love Affair (1994)', 'Love Affair (1994)', 'content', 'Director 3, Director 18', 'Actor 3, Actor 15, Actor 35', '1994', '1h20m', 1, '43742');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(271, 'Losing Isaiah (1995)', 'Losing Isaiah (1995)', 'content', 'Director 9, Director 18', 'Actor 3, Actor 22, Actor 35', '1995', '2h18m', 1, '28313');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(272, 'Madness of King George, The (1994)', 'Madness of King George, The (1994)', 'content', 'Director 6, Director 13', 'Actor 8, Actor 12, Actor 38', '1994', '1h27m', 1, '11318');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(273, 'Mary Shelley Frankenstein (Frankenstein) (1994)', 'Mary Shelley Frankenstein (Frankenstein) (1994)', 'content', 'Director 10, Director 12', 'Actor 9, Actor 14, Actor 32', '1994', '1h25m', 1, '3036');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(274, 'Man of the House (1995)', 'Man of the House (1995)', 'content', 'Director 8, Director 19', 'Actor 3, Actor 17, Actor 32', '1995', '1h30m', 1, '40490');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(275, 'Mixed Nuts (1994)', 'Mixed Nuts (1994)', 'content', 'Director 10, Director 15', 'Actor 7, Actor 13, Actor 36', '1994', '1h14m', 1, '24070');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(276, 'Milk Money (1994)', 'Milk Money (1994)', 'content', 'Director 6, Director 20', 'Actor 4, Actor 20, Actor 39', '1994', '2h46m', 1, '8986');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(277, 'Miracle on 34th Street (1994)', 'Miracle on 34th Street (1994)', 'content', 'Director 8, Director 17', 'Actor 4, Actor 26, Actor 39', '1994', '2h50m', 1, '10510');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(278, 'Miami Rhapsody (1995)', 'Miami Rhapsody (1995)', 'content', 'Director 10, Director 12', 'Actor 1, Actor 25, Actor 32', '1995', '2h36m', 1, '17402');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(279, 'My Family (1995)', 'My Family (1995)', 'content', 'Director 1, Director 16', 'Actor 9, Actor 12, Actor 31', '1995', '2h35m', 1, '38722');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(280, 'Murder in the First (1995)', 'Murder in the First (1995)', 'content', 'Director 10, Director 18', 'Actor 3, Actor 13, Actor 33', '1995', '1h24m', 1, '8438');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(281, 'Nobody Fool (1994)', 'Nobody Fool (1994)', 'content', 'Director 3, Director 15', 'Actor 5, Actor 20, Actor 31', '1994', '2h41m', 1, '11593');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(282, 'Nell (1994)', 'Nell (1994)', 'content', 'Director 4, Director 20', 'Actor 10, Actor 26, Actor 38', '1994', '1h49m', 1, '1945');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(283, 'New Jersey Drive (1995)', 'New Jersey Drive (1995)', 'content', 'Director 3, Director 20', 'Actor 9, Actor 21, Actor 35', '1995', '1h16m', 1, '39310');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(284, 'New York Cop (NyÃ» YÃ´ku no koppu) (1993)', 'New York Cop (NyÃ» YÃ´ku no koppu) (1993)', 'content', 'Director 5, Director 14', 'Actor 7, Actor 17, Actor 35', '1993', '1h20m', 1, '109560');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(285, 'Beyond Bedlam (1993)', 'Beyond Bedlam (1993)', 'content', 'Director 1, Director 14', 'Actor 8, Actor 23, Actor 40', '1993', '1h10m', 1, '56428');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(286, 'Nemesis 2: Nebula (1995)', 'Nemesis 2: Nebula (1995)', 'content', 'Director 7, Director 17', 'Actor 5, Actor 14, Actor 37', '1995', '1h42m', 1, '63105');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(287, 'Nina Takes a Lover (1994)', 'Nina Takes a Lover (1994)', 'content', 'Director 7, Director 16', 'Actor 10, Actor 24, Actor 39', '1994', '2h12m', 1, '131957');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(288, 'Natural Born Killers (1994)', 'Natural Born Killers (1994)', 'content', 'Director 4, Director 16', 'Actor 4, Actor 24, Actor 37', '1994', '2h29m', 1, '241');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(289, 'Only You (1994)', 'Only You (1994)', 'content', 'Director 5, Director 18', 'Actor 7, Actor 19, Actor 34', '1994', '1h23m', 1, '9058');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(290, 'Once Were Warriors (1994)', 'Once Were Warriors (1994)', 'content', 'Director 4, Director 13', 'Actor 4, Actor 29, Actor 36', '1994', '2h47m', 1, '527');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(291, 'Movie 291 (2020)', 'Movie 291 (2020)', 'content', 'Director 5, Director 11', 'Actor 5, Actor 26, Actor 39', '2020', '1h18m', 0, '');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(292, 'Outbreak (1995)', 'Outbreak (1995)', 'content', 'Director 9, Director 11', 'Actor 6, Actor 21, Actor 37', '1995', '2h17m', 1, '6950');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(293, 'LÃ©on: The Professional (a.k.a. The Professional) (LÃ©on) (1994)', 'LÃ©on: The Professional (a.k.a. The Professional) (LÃ©on) (1994)', 'content', 'Director 9, Director 17', 'Actor 3, Actor 22, Actor 38', '1994', '2h38m', 1, '101');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(294, 'Perez Family, The (1995)', 'Perez Family, The (1995)', 'content', 'Director 3, Director 11', 'Actor 7, Actor 11, Actor 38', '1995', '1h20m', 1, '63020');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(295, 'Pyromaniacs Love Story, A (1995)', 'Pyromaniacs Love Story, A (1995)', 'content', 'Director 5, Director 17', 'Actor 9, Actor 26, Actor 32', '1995', '1h39m', 1, '2307');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(296, 'Pulp Fiction (1994)', 'Pulp Fiction (1994)', 'content', 'Director 7, Director 11', 'Actor 2, Actor 29, Actor 31', '1994', '2h41m', 1, '680');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(297, 'Panther (1995)', 'Panther (1995)', 'content', 'Director 6, Director 19', 'Actor 2, Actor 13, Actor 39', '1995', '2h41m', 1, '41478');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(298, 'Pushing Hands (Tui shou) (1992)', 'Pushing Hands (Tui shou) (1992)', 'content', 'Director 8, Director 15', 'Actor 7, Actor 14, Actor 40', '1992', '2h49m', 1, '25296');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(299, 'Priest (1994)', 'Priest (1994)', 'content', 'Director 10, Director 14', 'Actor 10, Actor 23, Actor 40', '1994', '1h11m', 1, '40156');
INSERT INTO pdmv_movies(movie_id, title_vi, title_en, content, director, actors, manuFactureYear, videoLength, typeOfPosterURL, posterURL) VALUES(300, 'Quiz Show (1994)', 'Quiz Show (1994)', 'content', 'Director 8, Director 17', 'Actor 6, Actor 23, Actor 32', '1994', '1h14m', 1, '11450');


UPDATE pdmv_movies
SET posterURL = NULL
WHERE posterURL = '';

UPDATE pdmv_movies
SET movie_url = convertToURL(title_en)
WHERE movie_url IS NULL;

INSERT INTO pdmv_movies_genres (movie_id, mvgenre_id)
VALUES
	(1, 13),
    (1, 8),
    (1, 16),
    (1, 17),
    (1, 19),
    (2, 13),
    (2, 16),
    (2, 19),
    (3, 17),
    (3, 5),
    (4, 17),
    (4, 10),
    (4, 5),
    (5, 17),
    (6, 7),
    (6, 18),
    (6, 14),
    (7, 17),
    (7, 5),
    (8, 13),
    (8, 16),
    (9, 7),
    (10, 7),
    (10, 13),
    (10, 14),
    (11, 17),
    (11, 10),
    (11, 5),
    (12, 17),
    (12, 4),
    (13, 13),
    (13, 8),
    (13, 16),
    (14, 10),
    (15, 7),
    (15, 13),
    (15, 5),
    (16, 18),
    (16, 10),
    (17, 10),
    (17, 5),
    (18, 17),
    (19, 17),
    (20, 7),
    (20, 17),
    (20, 18),
    (20, 10),
    (20, 14),
    (21, 17),
    (21, 18),
    (21, 14),
    (22, 18),
    (22, 10),
    (22, 4),
    (22, 12),
    (22, 14),
    (23, 7),
    (23, 18),
    (23, 14),
    (24, 10),
    (24, 3),
    (25, 10),
    (25, 5),
    (26, 10),
    (27, 16),
    (27, 10),
    (28, 10),
    (28, 5),
    (29, 13),
    (29, 10),
    (29, 19),
    (29, 12),
    (29, 3),
    (30, 18),
    (30, 10),
    (31, 10),
    (32, 12),
    (32, 3),
    (32, 14),
    (33, 13),
    (33, 5),
    (33, 20),
    (34, 16),
    (34, 10),
    (35, 10),
    (35, 5),
    (36, 18),
    (36, 10),
    (37, 21),
    (37, 20),
    (38, 16),
    (38, 17),
    (39, 17),
    (39, 5),
    (40, 10),
    (41, 10),
    (41, 22),
    (42, 7),
    (42, 18),
    (42, 10),
    (43, 10),
    (44, 7),
    (44, 13),
    (44, 19),
    (45, 17),
    (45, 10),
    (45, 14),
    (46, 10),
    (46, 5),
    (47, 12),
    (47, 14),
    (48, 8),
    (48, 16),
    (48, 10),
    (48, 6),
    (48, 5),
    (49, 10),
    (49, 5),
    (50, 18),
    (50, 12),
    (50, 14),
    (51, 7),
    (51, 10),
    (51, 14),
    (52, 17),
    (52, 10),
    (52, 5),
    (53, 13),
    (53, 10),
    (54, 16),
    (54, 17),
    (55, 10),
    (56, 13),
    (56, 16),
    (56, 17),
    (56, 19),
    (57, 10),
    (58, 17),
    (58, 10),
    (58, 5),
    (59, 10),
    (59, 12),
    (60, 13),
    (60, 16),
    (60, 19),
    (61, 14),
    (62, 10),
    (63, 17),
    (63, 18),
    (64, 17),
    (64, 5),
    (65, 17),
    (66, 7),
    (66, 3),
    (66, 14),
    (67, 10),
    (68, 17),
    (68, 5),
    (69, 17),
    (70, 7),
    (70, 17),
    (70, 4),
    (70, 14),
    (71, 7),
    (72, 17),
    (72, 10),
    (73, 10),
    (73, 22),
    (74, 10),
    (74, 5),
    (75, 17),
    (75, 10),
    (76, 7),
    (76, 3),
    (76, 14),
    (77, 21),
    (78, 7),
    (78, 18),
    (78, 10),
    (78, 14),
    (79, 10),
    (79, 14),
    (80, 16),
    (80, 10),
    (81, 18),
    (81, 10),
    (81, 5),
    (82, 17),
    (82, 10),
    (83, 10),
    (83, 5),
    (84, 17),
    (84, 10),
    (85, 10),
    (85, 5),
    (86, 7),
    (86, 13),
    (86, 10),
    (87, 16),
    (87, 17),
    (88, 17),
    (89, 7),
    (89, 14),
    (90, 10),
    (91, 1),
    (92, 10),
    (92, 4),
    (92, 14),
    (93, 17),
    (93, 4),
    (93, 5),
    (94, 17),
    (94, 10),
    (94, 5),
    (95, 7),
    (95, 13),
    (95, 14),
    (96, 17),
    (96, 10),
    (97, 18),
    (97, 10),
    (98, 7),
    (98, 14),
    (99, 21),
    (100, 10),
    (100, 14),
    (101, 13),
    (101, 17),
    (101, 18),
    (101, 5),
    (102, 17),
    (103, 12),
    (103, 3),
    (103, 14),
    (104, 17),
    (105, 10),
    (105, 5),
    (106, 17),
    (106, 10),
    (107, 13),
    (107, 16),
    (107, 17),
    (107, 6),
    (108, 21),
    (109, 17),
    (109, 10),
    (109, 14),
    (110, 7),
    (110, 10),
    (110, 22),
    (111, 18),
    (111, 10),
    (111, 14),
    (112, 7),
    (112, 13),
    (112, 17),
    (112, 18),
    (113, 10),
    (113, 12),
    (114, 10),
    (115, 17),
    (116, 21),
    (117, 18),
    (117, 10),
    (118, 17),
    (118, 5),
    (119, 17),
    (120, 13),
    (120, 17),
    (120, 10),
    (121, 10),
    (122, 17),
    (122, 5),
    (123, 10),
    (123, 12),
    (123, 5),
    (124, 10),
    (125, 17),
    (126, 13),
    (126, 16),
    (126, 19),
    (127, 10),
    (128, 21),
    (129, 17),
    (129, 5),
    (130, 10),
    (131, 10),
    (131, 5),
    (132, 14),
    (133, 17),
    (133, 10),
    (134, 21),
    (135, 17),
    (136, 21),
    (137, 21),
    (138, 10),
    (139, 7),
    (139, 10),
    (140, 10),
    (140, 5),
    (141, 17),
    (142, 10),
    (143, 10),
    (144, 17),
    (145, 7),
    (145, 17),
    (145, 18),
    (145, 10),
    (145, 14),
    (146, 13),
    (146, 16),
    (147, 10),
    (148, 10),
    (149, 18),
    (149, 10),
    (149, 14),
    (150, 13),
    (150, 10),
    (150, 20),
    (151, 7),
    (151, 10),
    (151, 5),
    (151, 22),
    (152, 10),
    (152, 4),
    (153, 7),
    (153, 13),
    (153, 17),
    (153, 18),
    (154, 10),
    (155, 13),
    (155, 10),
    (155, 22),
    (156, 17),
    (156, 10),
    (157, 17),
    (157, 22),
    (158, 13),
    (158, 16),
    (159, 18),
    (159, 10),
    (159, 12),
    (160, 7),
    (160, 13),
    (160, 12),
    (160, 3),
    (161, 10),
    (161, 14),
    (161, 22),
    (162, 21),
    (163, 7),
    (163, 5),
    (163, 23),
    (164, 18),
    (164, 24),
    (164, 12),
    (164, 14),
    (165, 7),
    (165, 18),
    (165, 14),
    (166, 17),
    (166, 18),
    (166, 10),
    (167, 10),
    (168, 7),
    (168, 10),
    (168, 5),
    (169, 13),
    (169, 16),
    (169, 10),
    (170, 7),
    (170, 13),
    (170, 18),
    (170, 14),
    (171, 17),
    (171, 10),
    (172, 7),
    (172, 3),
    (172, 14),
    (173, 7),
    (173, 18),
    (173, 3),
    (174, 17),
    (175, 10),
    (176, 17),
    (177, 4),
    (178, 17),
    (178, 10),
    (179, 10),
    (179, 5),
    (180, 17),
    (180, 5),
    (181, 7),
    (181, 16),
    (182, 10),
    (182, 5),
    (183, 17),
    (183, 4),
    (183, 14),
    (184, 10),
    (185, 7),
    (185, 18),
    (185, 14),
    (186, 17),
    (186, 5),
    (187, 17),
    (188, 19),
    (188, 4),
    (188, 12),
    (189, 17),
    (189, 19),
    (190, 14),
    (191, 10),
    (191, 5),
    (192, 21),
    (193, 10),
    (194, 17),
    (194, 10),
    (195, 17),
    (195, 10),
    (195, 5),
    (196, 4),
    (196, 3),
    (197, 10),
    (198, 7),
    (198, 18),
    (198, 10),
    (198, 12),
    (198, 3),
    (198, 14),
    (199, 10),
    (199, 6),
    (199, 5),
    (200, 14),
    (201, 10),
    (201, 19),
    (202, 10),
    (202, 5),
    (203, 17),
    (204, 7),
    (205, 17),
    (205, 10),
    (206, 21),
    (207, 10),
    (207, 5),
    (208, 7),
    (208, 13),
    (208, 3),
    (209, 10),
    (210, 23),
    (211, 10),
    (212, 13),
    (212, 17),
    (212, 18),
    (212, 12),
    (213, 10),
    (214, 10),
    (214, 22),
    (215, 10),
    (215, 5),
    (216, 17),
    (217, 10),
    (217, 14),
    (218, 17),
    (218, 10),
    (219, 10),
    (220, 4),
    (221, 1),
    (222, 10),
    (222, 5),
    (223, 17),
    (224, 17),
    (224, 10),
    (224, 5),
    (225, 10),
    (225, 14),
    (226, 14),
    (227, 7),
    (227, 14),
    (228, 17),
    (229, 10),
    (229, 14),
    (230, 10),
    (230, 14),
    (231, 13),
    (231, 17),
    (232, 17),
    (232, 10),
    (232, 5),
    (233, 10),
    (234, 17),
    (235, 17),
    (235, 10),
    (236, 7),
    (236, 17),
    (236, 5),
    (237, 17),
    (237, 5),
    (238, 13),
    (238, 16),
    (239, 8),
    (239, 16),
    (239, 17),
    (239, 5),
    (240, 14),
    (241, 16),
    (241, 10),
    (242, 10),
    (242, 6),
    (243, 16),
    (243, 17),
    (243, 19),
    (244, 8),
    (244, 16),
    (245, 18),
    (245, 10),
    (246, 21),
    (247, 18),
    (247, 10),
    (248, 17),
    (249, 10),
    (249, 5),
    (250, 16),
    (250, 17),
    (251, 7),
    (252, 17),
    (252, 5),
    (253, 10),
    (253, 4),
    (254, 10),
    (255, 17),
    (256, 17),
    (256, 3),
    (257, 12),
    (257, 14),
    (258, 13),
    (258, 16),
    (258, 17),
    (258, 19),
    (258, 5),
    (259, 18),
    (259, 10),
    (259, 14),
    (260, 7),
    (260, 13),
    (260, 3),
    (261, 10),
    (262, 16),
    (262, 10),
    (263, 10),
    (264, 10),
    (265, 10),
    (265, 19),
    (265, 5),
    (266, 10),
    (266, 5),
    (266, 22),
    (266, 23),
    (267, 17),
    (268, 18),
    (268, 10),
    (269, 10),
    (270, 10),
    (270, 5),
    (271, 10),
    (272, 17),
    (272, 10),
    (273, 10),
    (273, 4),
    (273, 3),
    (274, 17),
    (275, 17),
    (276, 17),
    (276, 5),
    (277, 10),
    (278, 17),
    (279, 10),
    (280, 10),
    (280, 14),
    (281, 17),
    (281, 10),
    (281, 5),
    (282, 10),
    (283, 18),
    (283, 10),
    (284, 7),
    (284, 18),
    (285, 10),
    (285, 4),
    (286, 7),
    (286, 3),
    (286, 14),
    (287, 17),
    (287, 5),
    (288, 7),
    (288, 18),
    (288, 14),
    (289, 17),
    (289, 5),
    (290, 18),
    (290, 10),
    (291, 1),
    (292, 7),
    (292, 10),
    (292, 3),
    (292, 14),
    (293, 7),
    (293, 18),
    (293, 10),
    (293, 14),
    (294, 17),
    (294, 5),
    (295, 17),
    (295, 5),
    (296, 17),
    (296, 18),
    (296, 10),
    (296, 14),
    (297, 10),
    (298, 10),
    (299, 10),
    (300, 10);

CREATE TABLE pdmv_systemVariable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    varName VARCHAR(50) NOT NULL,
    varValue VARCHAR(50) NOT NULL,
    varLink VARCHAR(255),
    updateAt DATETIME NOT NULL DEFAULT NOW() 
);

INSERT INTO pdmv_systemVariable(varName, varValue, varLink) VALUES('themoviedb API KEY', 'dee4bd9bc518b8011007f9f1ecc1bc17', 'https://api.themoviedb.org/3/movie/{movie_id}?api_key=dee4bd9bc518b8011007f9f1ecc1bc17');

DELIMITER //
CREATE PROCEDURE admin_addNew(
    IN p_fullname VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(10),
    IN p_usname VARCHAR(50),
    IN p_password VARCHAR(100)
    )
BEGIN
    DECLARE newAccId INT DEFAULT 0;
    DECLARE newAdminId INT DEFAULT 0;

    IF NOT EXISTS (SELECT usname FROM pdmv_accounts WHERE usname = p_usname) THEN
        INSERT INTO pdmv_accounts (usname, password, acctype_id) VALUES (p_usname, p_password, 2);
        SET newAccId = (SELECT LAST_INSERT_ID());
        INSERT INTO pdmv_admins (admin_id, fullname, email, phone) VALUES (newAccId, p_fullname, p_email, p_phone);
        SET newAdminId = (SELECT LAST_INSERT_ID());
        IF newAdminId > 0 THEN
            SELECT newAdminId AS results;
        END IF;
    END IF;
END //
DELIMITER ;

-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
/*
RECOMMENDED MOVIE BASED CONTENT (BASED genres of movies)
*/
-- get vector dac trung cua phim (id) -> chuoi dac trung
DELIMITER //
CREATE FUNCTION movie_getFeatureVector(p_mvid INT)
	RETURNS varchar(255)
BEGIN
	DECLARE varFeatureVector varchar(255) DEFAULT '';
    DECLARE mvgTotal INT DEFAULT 0;
    DECLARE i INT;
    DECLARE replacement_character varchar(10) DEFAULT '1';
    
    DECLARE isDone INT DEFAULT 0;
    DECLARE mvgId INT;
    DECLARE mvgHaveList VARCHAR(255) DEFAULT '';
    DECLARE cur CURSOR FOR SELECT mvgenre_id FROM pdmv_movies_genres WHERE movie_id = p_mvid ORDER BY mvgenre_id ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET isDone = 1;
    
    SET mvgTotal = (SELECT COUNT(*) AS genreTotal FROM pdmv_mvgenres);
    SET i = 1;
    WHILE i  <= mvgTotal DO
    	SET  varFeatureVector = CONCAT(varFeatureVector,'0');
		SET  i = i + 1; 
    END WHILE;
    
    OPEN cur;
    	read_loop: LOOP
        	FETCH cur INTO mvgId;
            IF isDone THEN
                LEAVE read_loop;
            END IF;
            SET varFeatureVector = CONCAT(
                SUBSTRING(varFeatureVector, 1, mvgId - 1),
                replacement_character,
                SUBSTRING(varFeatureVector,mvgId + 1)
            );
        END LOOP;
    CLOSE cur;
    
    RETURN varFeatureVector;
END //
DELIMITER ;
-- SELECT movie_id, movie_getFeatureVector(movie_id) FROM pdmv_movies ORDER BY movie_id ASC;


-- tinh toan so ky  tu giong nhau (intersection) cua 2 chuoi (str1, str2) -> count ky tu giong nhau (phan giao)
DELIMITER //
CREATE FUNCTION CountMatchingCharacters(str1 VARCHAR(255), str2 VARCHAR(255))
    RETURNS INT
BEGIN
    DECLARE len1 INT;
    DECLARE len2 INT;
    DECLARE matchingCount INT;
    DECLARE i INT;

    SET len1 = LENGTH(str1);
    SET len2 = LENGTH(str2);
    SET matchingCount = 0;

    IF len1 <> len2 THEN
        RETURN -1; -- Độ dài hai chuỗi không bằng nhau
    END IF;

    FOR i IN 1..len1 DO
        IF SUBSTRING(str1, i, 1) = SUBSTRING(str2, i, 1) THEN
            IF SUBSTRING(str1, i, 1) = '1' THEN
                SET matchingCount = matchingCount + 1;
            END IF;
            
        END IF;
    END FOR;

    RETURN matchingCount;
END //
DELIMITER ;


-- Tinh toan jascard cua 2 bo phim (id1, id2) -> ty le % giong nhau (intersection/union)
DELIMITER //
CREATE FUNCTION JaccardIndex(p_mv1 INT, p_mv2 INT)
    RETURNS DECIMAL(5, 4)
BEGIN
    DECLARE set1 VARCHAR(255);
    DECLARE set2 VARCHAR(255);
    DECLARE intersectionCount INT;
    DECLARE unionCount INT;

 	SET set1 = ( SELECT movie_getFeatureVector(p_mv1) );
    SET set2 = ( SELECT movie_getFeatureVector(p_mv2) );

    -- Tính số phần tử giao của hai tập hợp
    SET intersectionCount = ( SELECT CountMatchingCharacters(set1, set2) );
    -- Tính số phần tử hợp của hai tập hợp
    SET unionCount = ( SELECT LENGTH(set1) );
    -- Tính Jaccard index
    IF unionCount = 0 THEN
        RETURN 0; -- Trường hợp đặc biệt khi cả hai tập hợp đều rỗng
    ELSE
        RETURN CAST(intersectionCount AS DECIMAL) / CAST(unionCount AS DECIMAL);
    END IF;
END //
DELIMITER ;

-- get danh sach phim goi y
DROP PROCEDURE IF EXISTS Content_RecommendedMovies;
DELIMITER //
CREATE PROCEDURE Content_RecommendedMovies(p_mvid INT, p_KNum INT, p_userid INT, p_min DECIMAL(5,4))
BEGIN
    DROP TABLE IF EXISTS MOVIE_LIST;
    CREATE TEMPORARY TABLE MOVIE_LIST 
    (
        movie_id INT,
        jaccardPoint DECIMAL(5, 4)
    );

    -- Tính toán Jaccard Index và lưu vào bảng tạm thời
    INSERT INTO MOVIE_LIST (movie_id, jaccardPoint)
    SELECT m.movie_id, JaccardIndex(p_mvid, m.movie_id)
    FROM pdmv_movies m
    WHERE m.movie_id <> p_mvid;

    -- Sắp xếp trong truy vấn SQL và giới hạn số kết quả
    SELECT
        m.*,
        COALESCE(AVG(r.rating), 0) AS mvrating,
        ml.jaccardPoint AS similarPoint
    FROM pdmv_movies m
    LEFT JOIN pdmv_ratings r ON m.movie_id = r.movie_id
    INNER JOIN MOVIE_LIST ml ON m.movie_id = ml.movie_id
    LEFT JOIN pdmv_ratings pr ON m.movie_id = pr.movie_id AND pr.user_id = p_userid
    WHERE (pr.rating_id IS NULL OR pr.user_id != p_userid)
        AND (
            CAST(ml.jaccardPoint AS DECIMAL(5, 4)) > 0 AND CAST(ml.jaccardPoint AS DECIMAL(5, 4)) >= CAST(p_min AS DECIMAL(5, 4))
        )
    GROUP BY m.movie_id
    ORDER BY ml.jaccardPoint DESC
    LIMIT p_KNum;

    DROP TEMPORARY TABLE MOVIE_LIST;
END //
DELIMITER ;

/*
DELIMITER //
CREATE PROCEDURE insertMV_Genre_FromTheMVDB()
BEGIN
    DECLARE movieId INT DEFAULT 101;
    
    WHILE movieId <= 300 DO
        INSERT INTO pdmv_movies_genres (movie_id, mvgenre_id)
        VALUES (movieId, 1);
        
        SET movieId = movieId + 1;
    END WHILE;
END //
DELIMITER ;
CALL insertMV_Genre_FromTheMVDB();
*/

/* LARAVEL
INSERT INTO users (id, name, password, acctype_id)
SELECT acc_id, usname, password, acctype_id FROM pdmv_accounts;


UPDATE users
INNER JOIN pdmv_users ON users.id = pdmv_users.user_id
SET users.email = pdmv_users.email, users.fullname = pdmv_users.fullname;
*/
