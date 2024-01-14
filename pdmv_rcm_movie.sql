DROP DATABASE IF EXISTS rcm_movie;
CREATE DATABASE rcm_movie;
USE rcm_movie;
SET SQL_SAFE_UPDATES = 0;
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
    createAt DATETIME NOT NULL DEFAULT NOW(),
    updateAt DATETIME NOT NULL DEFAULT NOW(),
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
    (0, 'Image URL'),
    (1, 'TheMovieDB (movie)'),
    (2, 'TheMovieDB (tv)');

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
	createAt DATETIME NOT NULL DEFAULT NOW(),
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
    createAt DATETIME NOT NULL DEFAULT NOW(),
    updateAt DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

INSERT INTO pdmv_mvchapters(movie_id, chapter_name, chapterURL)
VALUES
    (301, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (302, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (303, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (304, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (305, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (306, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
	(307, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (308, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (309, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (310, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (311, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (312, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (313, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (314, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (315, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (316, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
	(317, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (318, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (319, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (320, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (321, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (322, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (323, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (324, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (325, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (326, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
	(327, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (328, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (329, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (330, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (331, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (332, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (333, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (334, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (335, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (336, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
	(337, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (338, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (339, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (340, 'FULL-VN', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V'),
    (340, 'FULL-EN', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V');

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
    updateAt DATETIME NOT NULL DEFAULT NOW(),
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

ALTER TABLE pdmv_movies
ADD COLUMN mvpoint DECIMAL(10, 1);
ALTER TABLE pdmv_movies
ADD COLUMN numrating INT;

UPDATE pdmv_movies
SET mvpoint = COALESCE(
    (
        SELECT AVG(rating)
        FROM pdmv_ratings
        WHERE movie_id = pdmv_movies.movie_id
    ),
    0
);
UPDATE pdmv_movies
SET numrating = COALESCE(
    (
        SELECT count(rating)
        FROM pdmv_ratings
        WHERE movie_id = pdmv_movies.movie_id
    ),
    0
);

DELIMITER //
CREATE TRIGGER before_insert_rating
AFTER INSERT ON pdmv_ratings
FOR EACH ROW
BEGIN
    UPDATE pdmv_movies
    SET mvpoint = COALESCE(
        (
            SELECT AVG(rating)
            FROM pdmv_ratings
            WHERE movie_id = NEW.movie_id
        ),
        0
    )
    WHERE movie_id = NEW.movie_id;

    UPDATE pdmv_movies
    SET numrating = (
        SELECT COUNT(rating)
        FROM pdmv_ratings
        WHERE movie_id = NEW.movie_id
    )
    WHERE movie_id = NEW.movie_id;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_rating
AFTER UPDATE ON pdmv_ratings
FOR EACH ROW
BEGIN
    UPDATE pdmv_movies
    SET mvpoint = COALESCE(
        (
            SELECT AVG(rating)
            FROM pdmv_ratings
            WHERE movie_id = NEW.movie_id
        ),
        0
    )
    WHERE movie_id = NEW.movie_id;

    UPDATE pdmv_movies
    SET numrating = (
        SELECT COUNT(rating)
        FROM pdmv_ratings
        WHERE movie_id = NEW.movie_id
    )
    WHERE movie_id = NEW.movie_id;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_delete_rating
AFTER DELETE ON pdmv_ratings
FOR EACH ROW
BEGIN
    UPDATE pdmv_movies
    SET mvpoint = COALESCE(
        (
            SELECT AVG(rating)
            FROM pdmv_ratings
            WHERE movie_id = OLD.movie_id
        ),
        0
    )
    WHERE movie_id = OLD.movie_id;

    UPDATE pdmv_movies
    SET numrating = (
        SELECT COUNT(rating)
        FROM pdmv_ratings
        WHERE movie_id = OLD.movie_id
    )
    WHERE movie_id = OLD.movie_id;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_showdetail (IN mvid INT)
BEGIN
	SELECT mv.*
	FROM pdmv_movies mv
	WHERE mv.movie_id = mvid;
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
    updateAt DATETIME NOT NULL DEFAULT NOW(),
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
    createAt DATETIME NOT NULL DEFAULT NOW(),
    updateAt DATETIME NOT NULL DEFAULT NOW(),
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
RETURNS INT DETERMINISTIC
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

INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(25, 'user21', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(26, 'user22', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(27, 'user23', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(28, 'user24', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(29, 'user25', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(30, 'user26', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(31, 'user27', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(32, 'user28', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(33, 'user29', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(34, 'user30', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(35, 'user31', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(36, 'user32', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(37, 'user33', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(38, 'user34', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(39, 'user35', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(40, 'user36', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(41, 'user37', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(42, 'user38', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(43, 'user39', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(44, 'user40', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(45, 'user41', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(46, 'user42', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(47, 'user43', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(48, 'user44', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(49, 'user45', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(50, 'user46', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(51, 'user47', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(52, 'user48', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(53, 'user49', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(54, 'user50', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(55, 'user51', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(56, 'user52', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(57, 'user53', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(58, 'user54', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(59, 'user55', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(60, 'user56', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(61, 'user57', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(62, 'user58', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(63, 'user59', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(64, 'user60', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(65, 'user61', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(66, 'user62', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(67, 'user63', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(68, 'user64', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(69, 'user65', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(70, 'user66', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(71, 'user67', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(72, 'user68', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(73, 'user69', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(74, 'user70', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(75, 'user71', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(76, 'user72', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(77, 'user73', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(78, 'user74', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(79, 'user75', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(80, 'user76', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(81, 'user77', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(82, 'user78', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(83, 'user79', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(84, 'user80', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(85, 'user81', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(86, 'user82', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(87, 'user83', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(88, 'user84', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(89, 'user85', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(90, 'user86', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(91, 'user87', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(92, 'user88', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(93, 'user89', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(94, 'user90', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(95, 'user91', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(96, 'user92', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(97, 'user93', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(98, 'user94', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(99, 'user95', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(100, 'user96', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(101, 'user97', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(102, 'user98', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(103, 'user99', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(104, 'user100', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(105, 'user101', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(106, 'user102', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(107, 'user103', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(108, 'user104', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(109, 'user105', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(110, 'user106', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(111, 'user107', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(112, 'user108', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(113, 'user109', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(114, 'user110', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(115, 'user111', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(116, 'user112', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(117, 'user113', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(118, 'user114', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(119, 'user115', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(120, 'user116', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(121, 'user117', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(122, 'user118', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(123, 'user119', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(124, 'user120', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(125, 'user121', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(126, 'user122', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(127, 'user123', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(128, 'user124', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(129, 'user125', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(130, 'user126', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(131, 'user127', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(132, 'user128', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(133, 'user129', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(134, 'user130', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(135, 'user131', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(136, 'user132', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(137, 'user133', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(138, 'user134', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(139, 'user135', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(140, 'user136', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(141, 'user137', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(142, 'user138', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(143, 'user139', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(144, 'user140', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(145, 'user141', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(146, 'user142', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(147, 'user143', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(148, 'user144', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(149, 'user145', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(150, 'user146', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(151, 'user147', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(152, 'user148', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(153, 'user149', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(154, 'user150', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(155, 'user151', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(156, 'user152', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(157, 'user153', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(158, 'user154', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(159, 'user155', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(160, 'user156', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(161, 'user157', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(162, 'user158', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(163, 'user159', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(164, 'user160', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(165, 'user161', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(166, 'user162', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(167, 'user163', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(168, 'user164', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(169, 'user165', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(170, 'user166', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(171, 'user167', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(172, 'user168', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(173, 'user169', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(174, 'user170', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(175, 'user171', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(176, 'user172', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(177, 'user173', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(178, 'user174', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(179, 'user175', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(180, 'user176', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(181, 'user177', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(182, 'user178', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(183, 'user179', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(184, 'user180', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(185, 'user181', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(186, 'user182', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(187, 'user183', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(188, 'user184', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(189, 'user185', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(190, 'user186', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(191, 'user187', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(192, 'user188', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(193, 'user189', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(194, 'user190', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(195, 'user191', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(196, 'user192', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(197, 'user193', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(198, 'user194', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(199, 'user195', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(200, 'user196', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(201, 'user197', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(202, 'user198', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(203, 'user199', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(204, 'user200', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(205, 'user201', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(206, 'user202', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(207, 'user203', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(208, 'user204', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(209, 'user205', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(210, 'user206', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(211, 'user207', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(212, 'user208', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(213, 'user209', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(214, 'user210', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(215, 'user211', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(216, 'user212', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(217, 'user213', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(218, 'user214', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(219, 'user215', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(220, 'user216', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(221, 'user217', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(222, 'user218', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(223, 'user219', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);
INSERT INTO pdmv_accounts (acc_id, usname, password, acctype_id)
VALUES(224, 'user220', '$2y$10$6JTI13ELBs98yJvIZu99Ee8iWg.2pycIhY6uKM7JmVFPmNrCALBYy', 3);

INSERT INTO pdmv_users (user_id, email, fullname) VALUES (25, 'user21@gmail.com', 'Người Dùng 25'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (26, 'user22@gmail.com', 'Người Dùng 26'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (27, 'user23@gmail.com', 'Người Dùng 27'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (28, 'user24@gmail.com', 'Người Dùng 28'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (29, 'user25@gmail.com', 'Người Dùng 29'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (30, 'user26@gmail.com', 'Người Dùng 30'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (31, 'user27@gmail.com', 'Người Dùng 31'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (32, 'user28@gmail.com', 'Người Dùng 32'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (33, 'user29@gmail.com', 'Người Dùng 33'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (34, 'user30@gmail.com', 'Người Dùng 34'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (35, 'user31@gmail.com', 'Người Dùng 35'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (36, 'user32@gmail.com', 'Người Dùng 36'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (37, 'user33@gmail.com', 'Người Dùng 37'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (38, 'user34@gmail.com', 'Người Dùng 38'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (39, 'user35@gmail.com', 'Người Dùng 39'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (40, 'user36@gmail.com', 'Người Dùng 40'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (41, 'user37@gmail.com', 'Người Dùng 41'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (42, 'user38@gmail.com', 'Người Dùng 42'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (43, 'user39@gmail.com', 'Người Dùng 43'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (44, 'user40@gmail.com', 'Người Dùng 44'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (45, 'user41@gmail.com', 'Người Dùng 45'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (46, 'user42@gmail.com', 'Người Dùng 46'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (47, 'user43@gmail.com', 'Người Dùng 47'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (48, 'user44@gmail.com', 'Người Dùng 48'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (49, 'user45@gmail.com', 'Người Dùng 49'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (50, 'user46@gmail.com', 'Người Dùng 50'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (51, 'user47@gmail.com', 'Người Dùng 51'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (52, 'user48@gmail.com', 'Người Dùng 52'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (53, 'user49@gmail.com', 'Người Dùng 53'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (54, 'user50@gmail.com', 'Người Dùng 54'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (55, 'user51@gmail.com', 'Người Dùng 55'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (56, 'user52@gmail.com', 'Người Dùng 56'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (57, 'user53@gmail.com', 'Người Dùng 57'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (58, 'user54@gmail.com', 'Người Dùng 58'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (59, 'user55@gmail.com', 'Người Dùng 59'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (60, 'user56@gmail.com', 'Người Dùng 60'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (61, 'user57@gmail.com', 'Người Dùng 61'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (62, 'user58@gmail.com', 'Người Dùng 62'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (63, 'user59@gmail.com', 'Người Dùng 63'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (64, 'user60@gmail.com', 'Người Dùng 64'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (65, 'user61@gmail.com', 'Người Dùng 65'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (66, 'user62@gmail.com', 'Người Dùng 66'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (67, 'user63@gmail.com', 'Người Dùng 67'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (68, 'user64@gmail.com', 'Người Dùng 68'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (69, 'user65@gmail.com', 'Người Dùng 69'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (70, 'user66@gmail.com', 'Người Dùng 70'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (71, 'user67@gmail.com', 'Người Dùng 71'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (72, 'user68@gmail.com', 'Người Dùng 72'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (73, 'user69@gmail.com', 'Người Dùng 73'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (74, 'user70@gmail.com', 'Người Dùng 74'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (75, 'user71@gmail.com', 'Người Dùng 75'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (76, 'user72@gmail.com', 'Người Dùng 76'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (77, 'user73@gmail.com', 'Người Dùng 77'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (78, 'user74@gmail.com', 'Người Dùng 78'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (79, 'user75@gmail.com', 'Người Dùng 79'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (80, 'user76@gmail.com', 'Người Dùng 80'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (81, 'user77@gmail.com', 'Người Dùng 81'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (82, 'user78@gmail.com', 'Người Dùng 82'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (83, 'user79@gmail.com', 'Người Dùng 83'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (84, 'user80@gmail.com', 'Người Dùng 84'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (85, 'user81@gmail.com', 'Người Dùng 85'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (86, 'user82@gmail.com', 'Người Dùng 86'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (87, 'user83@gmail.com', 'Người Dùng 87'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (88, 'user84@gmail.com', 'Người Dùng 88'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (89, 'user85@gmail.com', 'Người Dùng 89'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (90, 'user86@gmail.com', 'Người Dùng 90'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (91, 'user87@gmail.com', 'Người Dùng 91'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (92, 'user88@gmail.com', 'Người Dùng 92'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (93, 'user89@gmail.com', 'Người Dùng 93'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (94, 'user90@gmail.com', 'Người Dùng 94'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (95, 'user91@gmail.com', 'Người Dùng 95'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (96, 'user92@gmail.com', 'Người Dùng 96'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (97, 'user93@gmail.com', 'Người Dùng 97'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (98, 'user94@gmail.com', 'Người Dùng 98'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (99, 'user95@gmail.com', 'Người Dùng 99'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (100, 'user96@gmail.com', 'Người Dùng 100'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (101, 'user97@gmail.com', 'Người Dùng 101'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (102, 'user98@gmail.com', 'Người Dùng 102'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (103, 'user99@gmail.com', 'Người Dùng 103'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (104, 'user100@gmail.com', 'Người Dùng 104'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (105, 'user101@gmail.com', 'Người Dùng 105'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (106, 'user102@gmail.com', 'Người Dùng 106'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (107, 'user103@gmail.com', 'Người Dùng 107'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (108, 'user104@gmail.com', 'Người Dùng 108'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (109, 'user105@gmail.com', 'Người Dùng 109'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (110, 'user106@gmail.com', 'Người Dùng 110'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (111, 'user107@gmail.com', 'Người Dùng 111'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (112, 'user108@gmail.com', 'Người Dùng 112'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (113, 'user109@gmail.com', 'Người Dùng 113'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (114, 'user110@gmail.com', 'Người Dùng 114'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (115, 'user111@gmail.com', 'Người Dùng 115'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (116, 'user112@gmail.com', 'Người Dùng 116'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (117, 'user113@gmail.com', 'Người Dùng 117'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (118, 'user114@gmail.com', 'Người Dùng 118'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (119, 'user115@gmail.com', 'Người Dùng 119'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (120, 'user116@gmail.com', 'Người Dùng 120'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (121, 'user117@gmail.com', 'Người Dùng 121'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (122, 'user118@gmail.com', 'Người Dùng 122'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (123, 'user119@gmail.com', 'Người Dùng 123'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (124, 'user120@gmail.com', 'Người Dùng 124'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (125, 'user121@gmail.com', 'Người Dùng 125'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (126, 'user122@gmail.com', 'Người Dùng 126'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (127, 'user123@gmail.com', 'Người Dùng 127'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (128, 'user124@gmail.com', 'Người Dùng 128'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (129, 'user125@gmail.com', 'Người Dùng 129'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (130, 'user126@gmail.com', 'Người Dùng 130'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (131, 'user127@gmail.com', 'Người Dùng 131'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (132, 'user128@gmail.com', 'Người Dùng 132'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (133, 'user129@gmail.com', 'Người Dùng 133'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (134, 'user130@gmail.com', 'Người Dùng 134'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (135, 'user131@gmail.com', 'Người Dùng 135'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (136, 'user132@gmail.com', 'Người Dùng 136'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (137, 'user133@gmail.com', 'Người Dùng 137'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (138, 'user134@gmail.com', 'Người Dùng 138'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (139, 'user135@gmail.com', 'Người Dùng 139'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (140, 'user136@gmail.com', 'Người Dùng 140'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (141, 'user137@gmail.com', 'Người Dùng 141'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (142, 'user138@gmail.com', 'Người Dùng 142'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (143, 'user139@gmail.com', 'Người Dùng 143'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (144, 'user140@gmail.com', 'Người Dùng 144'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (145, 'user141@gmail.com', 'Người Dùng 145'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (146, 'user142@gmail.com', 'Người Dùng 146'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (147, 'user143@gmail.com', 'Người Dùng 147'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (148, 'user144@gmail.com', 'Người Dùng 148'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (149, 'user145@gmail.com', 'Người Dùng 149'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (150, 'user146@gmail.com', 'Người Dùng 150'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (151, 'user147@gmail.com', 'Người Dùng 151'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (152, 'user148@gmail.com', 'Người Dùng 152'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (153, 'user149@gmail.com', 'Người Dùng 153'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (154, 'user150@gmail.com', 'Người Dùng 154'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (155, 'user151@gmail.com', 'Người Dùng 155'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (156, 'user152@gmail.com', 'Người Dùng 156'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (157, 'user153@gmail.com', 'Người Dùng 157'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (158, 'user154@gmail.com', 'Người Dùng 158'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (159, 'user155@gmail.com', 'Người Dùng 159'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (160, 'user156@gmail.com', 'Người Dùng 160'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (161, 'user157@gmail.com', 'Người Dùng 161'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (162, 'user158@gmail.com', 'Người Dùng 162'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (163, 'user159@gmail.com', 'Người Dùng 163'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (164, 'user160@gmail.com', 'Người Dùng 164'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (165, 'user161@gmail.com', 'Người Dùng 165'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (166, 'user162@gmail.com', 'Người Dùng 166'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (167, 'user163@gmail.com', 'Người Dùng 167'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (168, 'user164@gmail.com', 'Người Dùng 168'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (169, 'user165@gmail.com', 'Người Dùng 169'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (170, 'user166@gmail.com', 'Người Dùng 170'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (171, 'user167@gmail.com', 'Người Dùng 171'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (172, 'user168@gmail.com', 'Người Dùng 172'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (173, 'user169@gmail.com', 'Người Dùng 173'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (174, 'user170@gmail.com', 'Người Dùng 174'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (175, 'user171@gmail.com', 'Người Dùng 175'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (176, 'user172@gmail.com', 'Người Dùng 176'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (177, 'user173@gmail.com', 'Người Dùng 177'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (178, 'user174@gmail.com', 'Người Dùng 178'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (179, 'user175@gmail.com', 'Người Dùng 179'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (180, 'user176@gmail.com', 'Người Dùng 180'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (181, 'user177@gmail.com', 'Người Dùng 181'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (182, 'user178@gmail.com', 'Người Dùng 182'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (183, 'user179@gmail.com', 'Người Dùng 183'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (184, 'user180@gmail.com', 'Người Dùng 184'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (185, 'user181@gmail.com', 'Người Dùng 185'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (186, 'user182@gmail.com', 'Người Dùng 186'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (187, 'user183@gmail.com', 'Người Dùng 187'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (188, 'user184@gmail.com', 'Người Dùng 188'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (189, 'user185@gmail.com', 'Người Dùng 189'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (190, 'user186@gmail.com', 'Người Dùng 190'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (191, 'user187@gmail.com', 'Người Dùng 191'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (192, 'user188@gmail.com', 'Người Dùng 192'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (193, 'user189@gmail.com', 'Người Dùng 193'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (194, 'user190@gmail.com', 'Người Dùng 194'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (195, 'user191@gmail.com', 'Người Dùng 195'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (196, 'user192@gmail.com', 'Người Dùng 196'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (197, 'user193@gmail.com', 'Người Dùng 197'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (198, 'user194@gmail.com', 'Người Dùng 198'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (199, 'user195@gmail.com', 'Người Dùng 199'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (200, 'user196@gmail.com', 'Người Dùng 200'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (201, 'user197@gmail.com', 'Người Dùng 201'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (202, 'user198@gmail.com', 'Người Dùng 202'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (203, 'user199@gmail.com', 'Người Dùng 203'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (204, 'user200@gmail.com', 'Người Dùng 204'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (205, 'user201@gmail.com', 'Người Dùng 205'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (206, 'user202@gmail.com', 'Người Dùng 206'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (207, 'user203@gmail.com', 'Người Dùng 207'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (208, 'user204@gmail.com', 'Người Dùng 208'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (209, 'user205@gmail.com', 'Người Dùng 209'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (210, 'user206@gmail.com', 'Người Dùng 210'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (211, 'user207@gmail.com', 'Người Dùng 211'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (212, 'user208@gmail.com', 'Người Dùng 212'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (213, 'user209@gmail.com', 'Người Dùng 213'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (214, 'user210@gmail.com', 'Người Dùng 214'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (215, 'user211@gmail.com', 'Người Dùng 215'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (216, 'user212@gmail.com', 'Người Dùng 216'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (217, 'user213@gmail.com', 'Người Dùng 217'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (218, 'user214@gmail.com', 'Người Dùng 218'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (219, 'user215@gmail.com', 'Người Dùng 219'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (220, 'user216@gmail.com', 'Người Dùng 220'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (221, 'user217@gmail.com', 'Người Dùng 221'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (222, 'user218@gmail.com', 'Người Dùng 222'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (223, 'user219@gmail.com', 'Người Dùng 223'); 
INSERT INTO pdmv_users (user_id, email, fullname) VALUES (224, 'user220@gmail.com', 'Người Dùng 224'); 

INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (25, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (26, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 29, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 172, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 214, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (27, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (28, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (28, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (28, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 19, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 88, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 113, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 122, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 147, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 170, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 191, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 216, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 218, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 219, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 224, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 235, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 238, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 248, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 267, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 277, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 288, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (29, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (30, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (30, 260, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 17, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 28, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 58, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 185, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 288, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (31, 296, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 11, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 18, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 27, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 39, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 50, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 69, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 103, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 112, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 125, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 145, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 150, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 163, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 180, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 198, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 201, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 207, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 209, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 225, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 237, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 290, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (32, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 2, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 61, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 116, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 158, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 168, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 225, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 256, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 273, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 276, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 277, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (33, 280, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 50, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 193, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (34, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (35, 277, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 7, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 18, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 20, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 22, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 27, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 29, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 31, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 45, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 48, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 54, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 68, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 97, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 101, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 140, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 145, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 168, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 175, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 176, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 203, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 209, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 215, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 222, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 231, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 238, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 249, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 252, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 256, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 257, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 268, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (36, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 19, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 60, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 70, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 104, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 110, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 112, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 208, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 216, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 256, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 277, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (37, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (38, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (38, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (38, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (39, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (39, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (39, 216, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (39, 296, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 160, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 173, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 186, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (42, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 44, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 48, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 123, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 158, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 231, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (43, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (44, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (44, 44, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (44, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (45, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (45, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 185, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 208, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 231, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (46, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 14, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 16, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 40, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 52, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 58, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 72, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 104, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 105, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 111, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 125, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 144, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 156, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 186, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 216, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 224, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 236, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 252, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 261, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 281, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (47, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (48, 31, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (48, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 21, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 39, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 47, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 52, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 144, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 159, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 185, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 196, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 215, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 225, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 229, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 236, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 247, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 252, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 280, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 281, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 282, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 288, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (49, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (50, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (51, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (51, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (52, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (52, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (52, 260, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (52, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (53, 69, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (53, 73, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (53, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (53, 147, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (53, 175, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 145, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 153, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 185, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 215, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 277, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (55, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 160, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 161, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 173, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (56, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (57, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (57, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (57, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (58, 26, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (58, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (58, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (59, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (59, 19, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (59, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (59, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 46, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 60, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 95, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 144, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 151, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 158, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 160, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 164, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 168, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 207, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 208, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 222, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 224, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 243, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 262, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 265, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 270, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 272, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (60, 281, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 97, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 110, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (61, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 105, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (62, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (63, 29, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (63, 162, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (63, 260, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (64, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 9, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 21, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 44, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 70, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 89, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 95, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 112, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 145, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 163, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 168, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 170, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 198, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (65, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (66, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (66, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 95, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 141, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 208, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 273, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (67, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (68, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 82, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 83, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 125, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 140, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (69, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (70, 105, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (70, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (70, 161, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (70, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (70, 256, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 14, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 30, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 35, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 52, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 85, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 94, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 144, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 156, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 162, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 205, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 246, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 247, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 249, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 266, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 272, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (71, 290, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 3, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 5, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 6, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 14, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 16, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 39, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 47, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 104, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 112, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 145, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 216, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (72, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 19, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 185, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 186, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (73, 256, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 31, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (74, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (75, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (78, 7, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (78, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (78, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (79, 73, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (80, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (80, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (80, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (80, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 62, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 72, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 97, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 101, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 112, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 180, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 198, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 216, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (81, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (82, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (82, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (82, 163, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 22, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 24, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 28, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 29, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 168, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 172, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 223, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 230, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 231, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 235, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 249, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 272, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (83, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 5, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 19, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 27, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 28, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 31, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 46, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 48, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 69, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 82, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 125, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 180, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 187, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 258, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 265, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (85, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 50, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 69, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 97, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 145, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (86, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (88, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (88, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (88, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 48, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 145, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (90, 186, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 2, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 44, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 48, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 170, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (91, 277, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (92, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (92, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (92, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 16, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 18, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 47, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 231, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (93, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 150, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 185, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (94, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (95, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (95, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (95, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (95, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 2, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 18, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 24, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 34, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 45, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 69, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 70, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 72, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 76, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 78, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 81, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 94, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 100, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 118, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 147, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 151, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 157, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 163, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 168, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 180, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 182, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 186, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 193, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 195, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 198, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 203, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 222, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 224, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 236, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 252, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 256, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 273, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 276, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 281, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (96, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 6, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 14, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 18, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 32, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 61, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 74, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 79, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 81, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 86, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 100, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (97, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 10, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 153, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 161, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (98, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 1, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 48, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 105, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 207, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 236, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (99, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 29, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (100, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 19, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 60, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 62, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 153, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 158, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 160, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 168, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 196, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 235, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 252, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 277, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (101, 292, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (102, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 149, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 158, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 172, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 175, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 235, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 272, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (103, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 2, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 10, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 16, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 21, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 22, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 23, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 24, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 31, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 42, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 44, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 69, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 70, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 73, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 112, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 140, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 145, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 159, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 160, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 170, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 172, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 173, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 175, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 193, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 196, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 288, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (104, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (105, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (106, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (106, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (106, 223, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (106, 296, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (107, 22, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (107, 222, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 199, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 223, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (108, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 7, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 11, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 19, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 25, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 34, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 74, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 105, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 151, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 168, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 193, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 195, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 222, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 224, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 235, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 237, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 249, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 252, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 256, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 263, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 265, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (109, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 68, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 246, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (110, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (111, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (111, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 58, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 141, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 151, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 252, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 256, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 272, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 277, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (113, 300, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 5, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 26, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 62, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 74, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 85, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 95, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 103, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (114, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (115, 215, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (115, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 50, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (116, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (117, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (117, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (117, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 160, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 173, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 185, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 208, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 225, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 230, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 288, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (118, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 147, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (119, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (120, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 6, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 22, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 48, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 158, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 172, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (121, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (122, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (122, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (122, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 47, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 111, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 215, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (123, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 26, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 52, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 58, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 78, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 82, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 85, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 213, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (124, 290, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (125, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (125, 48, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (125, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (125, 215, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (125, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 29, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (126, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 185, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 235, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 290, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (127, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (128, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (128, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (128, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (128, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 5, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 25, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 36, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 63, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 74, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 79, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 92, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 94, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 100, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 102, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (129, 141, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 10, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 11, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 31, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 68, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 132, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 151, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 159, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 168, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 193, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 196, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 233, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 234, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 236, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 249, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 266, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 277, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 290, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 294, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 297, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (130, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 194, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 213, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 215, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 232, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 247, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 265, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (131, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (132, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (132, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 97, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 215, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (133, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (134, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (134, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (134, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (134, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (135, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (135, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (135, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 10, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 14, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 19, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 58, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 70, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 111, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 112, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 151, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 154, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 164, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 165, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 188, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 198, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 231, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 265, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 292, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 296, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (136, 300, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (137, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (137, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (137, 180, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (137, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (138, 19, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (138, 296, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (139, 99, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (139, 110, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (139, 161, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (139, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (140, 6, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (140, 70, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (140, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (140, 145, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (140, 260, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (141, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (141, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 19, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 39, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 185, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 225, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 231, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 288, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (142, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (143, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (143, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 36, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 52, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 104, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 147, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 155, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 159, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 161, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 164, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 180, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 194, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 215, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 246, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 281, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 282, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 289, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 293, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 296, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (144, 300, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 34, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 111, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 162, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 246, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 290, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (145, 297, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 2, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 7, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 11, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 39, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 47, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 173, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (146, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 21, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 42, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 44, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 70, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 95, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 223, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (147, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 6, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 22, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 25, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 29, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 45, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 52, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 103, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 116, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 121, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 155, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 185, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 194, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 198, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 214, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 237, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 242, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (148, 300, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 19, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 63, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 65, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 107, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 135, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 170, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 174, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 260, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 267, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (149, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (150, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (150, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 2, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 32, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (151, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (152, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (152, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 7, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 9, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 61, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 64, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 74, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 75, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 79, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 103, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 104, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 113, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 135, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (154, 140, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 11, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (155, 186, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 52, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 110, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (156, 300, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 6, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 11, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 21, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 36, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 45, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 46, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 50, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 62, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 95, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 100, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 141, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 145, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 163, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 164, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 172, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 173, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 193, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 203, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 218, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 222, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 230, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 237, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 257, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 265, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 271, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 273, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 280, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 282, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 288, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (157, 296, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 16, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 104, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 266, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (158, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (159, 9, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (159, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (159, 170, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (159, 227, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (159, 296, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 10, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 21, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 39, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 47, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 186, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 196, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 225, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 236, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 252, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 282, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (160, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 5, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 132, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 164, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 222, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (161, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (162, 107, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 14, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 21, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 25, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 32, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 44, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 62, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 63, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 70, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 81, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 97, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 158, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 159, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 172, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 180, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 185, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 208, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 256, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 266, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 288, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (163, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 10, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 110, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 153, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 185, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (164, 292, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 4, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 5, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 39, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 48, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 60, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 100, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 105, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 141, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 158, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 160, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 163, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 168, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 169, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 181, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 186, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 195, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 203, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 207, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 218, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 222, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 248, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 256, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 289, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 292, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (165, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (166, 6, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (166, 50, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (166, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (166, 260, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (166, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 94, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 95, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 107, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 135, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (167, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (168, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (168, 88, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (168, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (168, 215, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (170, 266, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 29, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 52, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 94, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 99, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 123, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 125, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 162, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 176, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 206, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 273, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 280, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (171, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 32, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 111, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (172, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (173, 163, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (174, 150, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (175, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (175, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (175, 246, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 50, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 93, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (176, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (178, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 44, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 112, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 150, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (179, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 7, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 48, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 236, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (180, 300, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (181, 40, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (181, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 10, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 70, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 95, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 105, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 158, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 160, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 172, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 185, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 188, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 223, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 224, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 225, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 231, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 236, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 252, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 253, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 256, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 266, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 273, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 288, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 292, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 293, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (182, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 39, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (183, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 10, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 110, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 181, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (184, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 21, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 48, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (185, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 28, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 48, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 85, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 151, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 158, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 222, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 239, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 250, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (186, 262, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (187, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (187, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (187, 181, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (187, 239, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 11, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 22, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 31, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 48, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 145, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 151, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 160, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 161, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 165, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 185, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 186, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 193, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 196, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 224, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 225, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 227, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 230, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 246, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 252, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 253, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 282, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 288, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 293, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (189, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 5, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 11, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 17, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 27, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 31, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 43, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 46, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 52, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 74, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 107, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 140, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 144, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 164, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 168, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 181, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 186, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 195, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 203, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 204, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 218, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 222, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 236, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 237, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 249, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 252, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 257, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 272, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 276, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 277, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 282, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 289, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (190, 300, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 5, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 17, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 27, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 40, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 41, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 46, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 52, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 57, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 58, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 62, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 79, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 105, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 140, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 185, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 186, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 195, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 222, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 237, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 252, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 256, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 260, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 261, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 262, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 271, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 277, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (191, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 47, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 165, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 185, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 288, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 292, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (192, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 5, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 29, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 39, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 62, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 94, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 170, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 199, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 207, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (193, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (194, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 6, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 16, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 29, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 58, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 69, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 94, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 101, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 104, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 111, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 125, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 127, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 141, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 147, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 161, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 162, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 163, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 175, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 194, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 196, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 215, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 224, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 249, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 265, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 266, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (195, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (196, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (196, 215, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 2, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 34, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 222, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 227, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (197, 300, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (198, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 1, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 2, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 4, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 7, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 14, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 16, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 21, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 24, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 25, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 36, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 42, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 45, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 60, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 65, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 104, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 141, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 162, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 186, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 216, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 224, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 230, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 236, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 237, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 246, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 276, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 282, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (199, 300, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 1, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 3, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 21, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 34, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (200, 52, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 10, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 42, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 70, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 95, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 145, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 153, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 168, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 170, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 204, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 227, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (201, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (202, 223, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (202, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 2, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 9, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 14, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 16, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 25, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 26, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 27, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 28, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 35, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 36, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 41, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 45, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 46, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 58, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 62, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 79, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 100, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 105, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 150, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 154, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 171, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 194, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 225, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 229, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 232, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 261, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 265, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 272, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 273, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 279, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (203, 299, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 6, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 44, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 70, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 104, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 111, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 145, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 150, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 158, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 163, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 165, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 172, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 196, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 215, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 235, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 256, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 260, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (205, 296, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (206, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 11, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 160, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 161, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 208, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 231, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 236, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 282, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (207, 300, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (208, 110, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 2, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 10, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 25, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 39, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 95, 0);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 110, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 111, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 194, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 266, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (209, 296, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 47, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 237, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (210, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 2, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 3, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 13, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 19, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 44, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 47, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 60, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 63, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 65, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 69, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 88, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 104, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 111, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 147, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 158, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 173, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 175, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 180, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 188, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 196, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 216, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 231, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 239, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 260, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 267, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 292, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (211, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 1, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 21, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 32, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 110, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 112, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 153, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 172, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 173, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 196, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (212, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 29, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 41, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 58, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 70, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 112, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 151, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 234, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 252, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 253, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 261, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 265, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 266, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 272, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (213, 293, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 11, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 16, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 17, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 19, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 32, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 34, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 36, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 43, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 58, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 73, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 82, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 85, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 105, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 121, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 141, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 145, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 150, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 155, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 158, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 247, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 262, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 290, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 296, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (214, 300, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (216, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (216, 193, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (217, 36, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (218, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (219, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (219, 260, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 32, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 47, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 50, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 186, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 293, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (220, 296, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 44, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 48, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 50, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 110, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 150, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (221, 296, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 1, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 3, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 5, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 9, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 12, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 61, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 62, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 65, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 75, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 103, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 104, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 112, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 135, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 140, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 141, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (222, 260, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 19, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 23, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 31, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 39, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 44, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 48, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 50, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 104, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 110, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 145, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 151, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 153, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 158, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 163, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 165, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 168, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 170, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 172, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 173, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 174, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 185, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 186, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 193, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 196, 1);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 204, 2);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 208, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 216, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 218, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 223, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 227, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 231, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 253, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 255, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 267, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 273, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 288, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 292, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 293, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (223, 296, 3);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (224, 1, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (224, 2, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (224, 34, 4);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (224, 62, 5);
INSERT INTO pdmv_ratings (user_id, movie_id, rating)
 VALUES (224, 260, 2);

UPDATE pdmv_ratings SET rating = 1 WHERE rating = 0;

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
    prefix VARCHAR(100) NOT NULL,
    varLink VARCHAR(255) NOT NULL,
    updateAt DATETIME NOT NULL DEFAULT NOW() 
);

INSERT INTO pdmv_systemVariable(varName, varValue, prefix, varLink) VALUES('themoviedb API KEY (movie)', 'dee4bd9bc518b8011007f9f1ecc1bc17', 'https://api.themoviedb.org/3/movie/{movie_id}?api_key=', 'https://api.themoviedb.org/3/movie/{movie_id}?api_key=dee4bd9bc518b8011007f9f1ecc1bc17');
INSERT INTO pdmv_systemVariable(varName, varValue, prefix, varLink) VALUES('themoviedb API KEY (tv)', 'dee4bd9bc518b8011007f9f1ecc1bc17', 'https://api.themoviedb.org/3/tv/{movie_id}?api_key=', 'https://api.themoviedb.org/3/tv/{movie_id}?api_key=dee4bd9bc518b8011007f9f1ecc1bc17');

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

DELIMITER //
CREATE PROCEDURE movie_add(
    IN p_titlevi VARCHAR(255),
    IN p_titleen VARCHAR(255),
    IN p_content TEXT,
    IN p_director TEXT,
    IN p_actors TEXT,
    IN p_manufactureYear INT,
    IN p_videoLength VARCHAR(100),
    IN p_typeOfPosterURL INT,
    IN p_posterURL TEXT
)
BEGIN
    DECLARE p_movieURL VARCHAR(255) DEFAULT '';
    DECLARE newMovieId INT DEFAULT 0;
    SET p_movieURL = convertToURL(p_titleen);

    IF p_titlevi IS NULL THEN
        SET p_titlevi = p_titleen;
    END IF;

    IF p_titlevi = '' THEN
        SET p_titlevi = p_titleen;
    END IF;

    IF p_posterURL = '' THEN
        SET p_posterURL = NULL;
    END IF;

    IF p_titleen = '' THEN
        SET p_titleen = NULL;
    END IF;

    IF p_titleen IS NOT NULL THEN
        INSERT INTO pdmv_movies(
            title_vi,
            title_en,
            content,
            director,
            actors,
            manuFactureYear,
            videoLength,
            typeOfPosterURL,
            posterURL,
            movie_url
            ) VALUES(
            p_titlevi,
            p_titleen,
            p_content,
            p_director,
            p_actors,
            p_manufactureYear,
            p_videoLength,
            p_typeOfPosterURL,
            p_posterURL,
            p_movieURL);
    SET newMovieId = LAST_INSERT_ID();
    CALL movie_genre_add(newMovieId, 1);
    SELECT * FROM pdmv_movies WHERE movie_id = newMovieId;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_drop(IN p_mvid INT)
BEGIN
    IF EXISTS (SELECT movie_id FROM pdmv_movies WHERE movie_id = p_mvid) THEN
        DELETE FROM pdmv_comments WHERE movie_id = p_mvid;
        DELETE FROM pdmv_ratings WHERE movie_id = p_mvid;
        DELETE FROM pdmv_movies_genres WHERE movie_id = p_mvid;
        DELETE FROM pdmv_errors WHERE movie_id = p_mvid;
        DELETE FROM pdmv_mvchapters WHERE movie_id = p_mvid;
        DELETE FROM pdmv_movies WHERE movie_id = p_mvid;
        SELECT 'Xóa thành công' AS results;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_update(
    IN p_mvid INT,
    IN p_titlevi VARCHAR(255),
    IN p_titleen VARCHAR(255),
    IN p_content TEXT,
    IN p_director TEXT,
    IN p_actors TEXT,
    IN p_manufactureYear INT,
    IN p_videoLength VARCHAR(100),
    IN p_typeOfPosterURL INT,
    IN p_posterURL TEXT
)
BEGIN
    DECLARE p_movieURL VARCHAR(255) DEFAULT '';
    SET p_movieURL = convertToURL(p_titleen);
    IF EXISTS (SELECT movie_id FROM pdmv_movies WHERE movie_id = p_mvid) THEN
        IF p_titlevi IS NULL THEN
            SET p_titlevi = p_titleen;
        END IF;
        IF p_titlevi = '' THEN
            SET p_titlevi = p_titleen;
        END IF;
        IF p_posterURL = '' THEN
            SET p_posterURL = NULL;
        END IF;
        IF p_titleen = '' THEN
            SET p_titleen = NULL;
        END IF;
        IF NOT EXISTS (SELECT movie_id FROM pdmv_movies WHERE title_en = p_titleen AND movie_id != p_mvid) THEN
            UPDATE pdmv_movies
            SET
            title_vi = p_titlevi,
            title_en = p_titleen,
            content = p_content,
            director = p_director,
            actors = p_actors,
            manuFactureYear = p_manufactureYear,
            videoLength = p_videoLength,
            typeOfPosterURL = p_typeOfPosterURL,
            posterURL = p_posterURL,
            movie_url = p_movieURL
            WHERE movie_id = p_mvid;
        SELECT * FROM pdmv_movies WHERE movie_id = p_mvid;
        END IF;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_add(IN p_genreVI VARCHAR(255), IN p_genreEN VARCHAR(255))
BEGIN
    DECLARE newGenreId INT DEFAULT 0;
    IF NOT EXISTS (SELECT mvgenre_id FROM pdmv_mvgenres WHERE mvgenre_en_name = p_genreEN) THEN
        INSERT INTO pdmv_mvgenres (mvgenre_vi_name, mvgenre_en_name)
        VALUES(p_genreVI, p_genreEN);
    SET newGenreId = (SELECT LAST_INSERT_ID());
    SELECT * FROM pdmv_mvgenres WHERE mvgenre_id = newGenreId;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_update(IN p_genreId INT, IN p_genreVI VARCHAR(255), IN p_genreEN VARCHAR(255))
BEGIN
    IF NOT EXISTS (SELECT mvgenre_id FROM pdmv_mvgenres WHERE mvgenre_en_name = p_genreEN AND mvgenre_id != p_genreId) THEN
        UPDATE pdmv_mvgenres
        SET mvgenre_vi_name = p_genreVI,
        mvgenre_en_name = p_genreEN
        WHERE mvgenre_id = p_genreId;

    SELECT * FROM pdmv_mvgenres WHERE mvgenre_id = p_genreId;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_drop(IN p_genreId INT)
BEGIN
    IF NOT EXISTS (SELECT mvgenre_id FROM pdmv_movies_genres WHERE mvgenre_id = p_genreId) THEN
		IF p_genreId != "1" THEN
			DELETE FROM pdmv_movies_genres WHERE mvgenre_id = p_genreId;
			DELETE FROM pdmv_mvgenres WHERE mvgenre_id = p_genreId;
			SELECT 'Đã xóa' AS results;
		END IF;
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvgenre_listMovieOfGenreWithId(
    IN p_mvgid INT
)
BEGIN
    SELECT mvg.movgen_id, mv.*
    FROM pdmv_movies mv
    JOIN pdmv_movies_genres mvg ON mv.movie_id = mvg.movie_id
    WHERE mvg.mvgenre_id = p_mvgid
    ORDER BY mv.movie_id DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_add(
    IN p_mvid INT,
    IN p_mvgid INT
)
BEGIN
    IF NOT EXISTS(SELECT movie_id FROM pdmv_movies_genres WHERE movie_id = p_mvid AND mvgenre_id = p_mvgid) THEN
        INSERT INTO pdmv_movies_genres (movie_id, mvgenre_id) VALUES (p_mvid, p_mvgid);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_drop(
    IN p_movgenid INT
)
BEGIN
    IF EXISTS (SELECT * FROM pdmv_movies_genres WHERE movgen_id = p_movgenid) THEN
		DELETE FROM pdmv_movies_genres WHERE movgen_id = p_movgenid;
        SELECT p_movgenid AS results;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_get(
	IN p_mvid INT
)
BEGIN
	IF EXISTS (SELECT * FROM pdmv_movies WHERE movie_id = p_mvid) THEN
		SELECT g.*, movgen_id FROM pdmv_mvgenres g 
		LEFT JOIN (SELECT * FROM pdmv_movies_genres WHERE movie_id = p_mvid) AS mvg ON g.mvgenre_id = mvg.mvgenre_id
		ORDER BY movgen_id DESC, g.mvgenre_id ASC;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_drop_all_of_movie(
    IN p_mvid INT
)
BEGIN
    IF EXISTS (SELECT * FROM pdmv_movies_genres WHERE movie_id = p_mvid) THEN
		DELETE FROM pdmv_movies_genres WHERE movie_id = p_mvid;
        SELECT p_mvid AS results;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_if_not_exists(
	IN p_mvid INT
)
BEGIN
	IF NOT EXISTS (SELECT movie_id FROM pdmv_movies_genres WHERE movie_id = p_mvid) THEN
		CALL movie_genre_add(p_mvid, 1);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movie_genre_get_info(
	IN p_mvgid INT
)
BEGIN
	SELECT movie_id, mvgenre_id FROM pdmv_movies_genres WHERE movgen_id = p_mvgid;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE TEST_ADD_CHAPTER_TO_MOVIES_FROM_1_300()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 300 DO
        INSERT INTO pdmv_mvchapters(movie_id, chapter_name, chapterURL) VALUES 
            (i, 'FULL', 'https://www.youtube.com/embed/K6PMnE3pMZ8?si=w-lbPo2Ktqwzbo9V');
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
CALL TEST_ADD_CHAPTER_TO_MOVIES_FROM_1_300();

DELIMITER //
CREATE PROCEDURE mvchapter_update(
	IN p_chapterid INT,
    IN p_chaptername VARCHAR(255),
    IN p_chapterurl TEXT
    )
BEGIN
	IF EXISTS(SELECT chapter_id FROM pdmv_mvchapters WHERE chapter_id = p_chapterid) THEN
		UPDATE pdmv_mvchapters
        SET
        chapter_name = p_chaptername,
        chapterURL = p_chapterurl
        WHERE chapter_id = p_chapterid;
        SELECT * FROM pdmv_mvchapters
        WHERE chapter_id = p_chapterid; 
	END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvchapter_drop(
	IN p_ctid INT
    )
BEGIN
	IF EXISTS (SELECT chapter_id FROM pdmv_mvchapters WHERE chapter_id = p_ctid) THEN
		DELETE FROM pdmv_mvchapters
        WHERE chapter_id = p_ctid;
        SELECT p_ctid AS deletedId;
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvchapter_add(
	IN p_mvid INT,
    IN p_ctname VARCHAR(255),
    IN p_cturl TEXT
	)
BEGIN
	DECLARE newId INT DEFAULT 0;
	IF EXISTS (SELECT movie_id FROM pdmv_movies WHERE movie_id = p_mvid) THEN
		INSERT INTO pdmv_mvchapters(movie_id, chapter_name, chapterURL) VALUES 
        (p_mvid, p_ctname, p_cturl);
        SET newId = (SELECT LAST_INSERT_ID());
		SELECT * FROM pdmv_mvchapters WHERE chapter_id = newId;
    END IF;
END; //
DELIMITER ;

CREATE TABLE pdmv_reports (
	report_id INT PRIMARY KEY AUTO_INCREMENT,
    comment_id INT,
    isSolved TINYINT DEFAULT 0,
    createAt DATETIME NOT NULL DEFAULT NOW(),
    updateAt DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (comment_id) REFERENCES pdmv_comments(comment_id)
    ON DELETE CASCADE
);

DELIMITER //
CREATE PROCEDURE report_post(
	IN p_cmtid INT
	)
BEGIN
	INSERT INTO pdmv_reports (comment_id) VALUES (p_cmtid);
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE error_getAll()
BEGIN
	SELECT * FROM pdmv_errors;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_error
BEFORE UPDATE ON pdmv_errors
FOR EACH ROW
BEGIN
    SET NEW.updateAt = NOW();
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE error_solve(
	IN p_err_id INT
    )
BEGIN
	IF EXISTS (SELECT err_id FROM pdmv_errors WHERE err_id = p_err_id) THEN
		UPDATE pdmv_errors
        SET isSolved = 1
        WHERE err_id = p_err_id;
		SELECT * FROM pdmv_errors WHERE err_id = p_err_id;
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE report_getAll()
BEGIN
	SELECT rp.*, cmt.comment FROM pdmv_reports rp
    JOIN pdmv_comments cmt ON rp.comment_id = cmt.comment_id;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_report
BEFORE UPDATE ON pdmv_reports
FOR EACH ROW
BEGIN
    SET NEW.updateAt = NOW();
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE report_solve(
	IN p_rp_id INT
    )
BEGIN
	IF EXISTS (SELECT report_id FROM pdmv_reports WHERE report_id = p_rp_id) THEN
		UPDATE pdmv_reports
        SET isSolved = 1
        WHERE report_id = p_rp_id;
		SELECT rp.*, cmt.comment FROM pdmv_reports rp
		JOIN pdmv_comments cmt ON rp.comment_id = cmt.comment_id
		WHERE rp.report_id = p_rp_id;
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE error_drop(
	IN p_beforeDate DATE
    )
BEGIN
	DELETE FROM pdmv_errors 
    WHERE isSolved = 1 AND updateAt < p_beforeDate;
    SELECT "Thành công" AS results;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE report_drop(
	IN p_beforeDate DATE
    )
BEGIN
	DELETE FROM pdmv_reports 
    WHERE isSolved = 1 AND updateAt < p_beforeDate;
    SELECT "Thành công" AS results;
END; //
DELIMITER ;

ALTER TABLE pdmv_movies ADD COLUMN view INT DEFAULT 0;
UPDATE pdmv_movies SET view = 301 WHERE movie_id = 1;
UPDATE pdmv_movies SET view = 311 WHERE movie_id = 2;
UPDATE pdmv_movies SET view = 91 WHERE movie_id = 3;
UPDATE pdmv_movies SET view = 276 WHERE movie_id = 4;
UPDATE pdmv_movies SET view = 448 WHERE movie_id = 5;
UPDATE pdmv_movies SET view = 166 WHERE movie_id = 6;
UPDATE pdmv_movies SET view = 42 WHERE movie_id = 7;
UPDATE pdmv_movies SET view = 294 WHERE movie_id = 8;
UPDATE pdmv_movies SET view = 177 WHERE movie_id = 9;
UPDATE pdmv_movies SET view = 60 WHERE movie_id = 10;
UPDATE pdmv_movies SET view = 110 WHERE movie_id = 11;
UPDATE pdmv_movies SET view = 389 WHERE movie_id = 12;
UPDATE pdmv_movies SET view = 286 WHERE movie_id = 13;
UPDATE pdmv_movies SET view = 166 WHERE movie_id = 14;
UPDATE pdmv_movies SET view = 129 WHERE movie_id = 15;
UPDATE pdmv_movies SET view = 162 WHERE movie_id = 16;
UPDATE pdmv_movies SET view = 336 WHERE movie_id = 17;
UPDATE pdmv_movies SET view = 250 WHERE movie_id = 18;
UPDATE pdmv_movies SET view = 270 WHERE movie_id = 19;
UPDATE pdmv_movies SET view = 199 WHERE movie_id = 20;
UPDATE pdmv_movies SET view = 62 WHERE movie_id = 21;
UPDATE pdmv_movies SET view = 350 WHERE movie_id = 22;
UPDATE pdmv_movies SET view = 475 WHERE movie_id = 23;
UPDATE pdmv_movies SET view = 14 WHERE movie_id = 24;
UPDATE pdmv_movies SET view = 333 WHERE movie_id = 25;
UPDATE pdmv_movies SET view = 211 WHERE movie_id = 26;
UPDATE pdmv_movies SET view = 323 WHERE movie_id = 27;
UPDATE pdmv_movies SET view = 374 WHERE movie_id = 28;
UPDATE pdmv_movies SET view = 128 WHERE movie_id = 29;
UPDATE pdmv_movies SET view = 376 WHERE movie_id = 30;
UPDATE pdmv_movies SET view = 367 WHERE movie_id = 31;
UPDATE pdmv_movies SET view = 432 WHERE movie_id = 32;
UPDATE pdmv_movies SET view = 224 WHERE movie_id = 33;
UPDATE pdmv_movies SET view = 120 WHERE movie_id = 34;
UPDATE pdmv_movies SET view = 313 WHERE movie_id = 35;
UPDATE pdmv_movies SET view = 284 WHERE movie_id = 36;
UPDATE pdmv_movies SET view = 177 WHERE movie_id = 37;
UPDATE pdmv_movies SET view = 82 WHERE movie_id = 38;
UPDATE pdmv_movies SET view = 318 WHERE movie_id = 39;
UPDATE pdmv_movies SET view = 285 WHERE movie_id = 40;
UPDATE pdmv_movies SET view = 400 WHERE movie_id = 41;
UPDATE pdmv_movies SET view = 483 WHERE movie_id = 42;
UPDATE pdmv_movies SET view = 101 WHERE movie_id = 43;
UPDATE pdmv_movies SET view = 452 WHERE movie_id = 44;
UPDATE pdmv_movies SET view = 418 WHERE movie_id = 45;
UPDATE pdmv_movies SET view = 30 WHERE movie_id = 46;
UPDATE pdmv_movies SET view = 464 WHERE movie_id = 47;
UPDATE pdmv_movies SET view = 448 WHERE movie_id = 48;
UPDATE pdmv_movies SET view = 376 WHERE movie_id = 49;
UPDATE pdmv_movies SET view = 34 WHERE movie_id = 50;
UPDATE pdmv_movies SET view = 201 WHERE movie_id = 51;
UPDATE pdmv_movies SET view = 198 WHERE movie_id = 52;
UPDATE pdmv_movies SET view = 103 WHERE movie_id = 53;
UPDATE pdmv_movies SET view = 177 WHERE movie_id = 54;
UPDATE pdmv_movies SET view = 176 WHERE movie_id = 55;
UPDATE pdmv_movies SET view = 327 WHERE movie_id = 56;
UPDATE pdmv_movies SET view = 68 WHERE movie_id = 57;
UPDATE pdmv_movies SET view = 471 WHERE movie_id = 58;
UPDATE pdmv_movies SET view = 216 WHERE movie_id = 59;
UPDATE pdmv_movies SET view = 460 WHERE movie_id = 60;
UPDATE pdmv_movies SET view = 79 WHERE movie_id = 61;
UPDATE pdmv_movies SET view = 222 WHERE movie_id = 62;
UPDATE pdmv_movies SET view = 424 WHERE movie_id = 63;
UPDATE pdmv_movies SET view = 249 WHERE movie_id = 64;
UPDATE pdmv_movies SET view = 336 WHERE movie_id = 65;
UPDATE pdmv_movies SET view = 453 WHERE movie_id = 66;
UPDATE pdmv_movies SET view = 94 WHERE movie_id = 67;
UPDATE pdmv_movies SET view = 478 WHERE movie_id = 68;
UPDATE pdmv_movies SET view = 196 WHERE movie_id = 69;
UPDATE pdmv_movies SET view = 31 WHERE movie_id = 70;
UPDATE pdmv_movies SET view = 396 WHERE movie_id = 71;
UPDATE pdmv_movies SET view = 16 WHERE movie_id = 72;
UPDATE pdmv_movies SET view = 347 WHERE movie_id = 73;
UPDATE pdmv_movies SET view = 47 WHERE movie_id = 74;
UPDATE pdmv_movies SET view = 235 WHERE movie_id = 75;
UPDATE pdmv_movies SET view = 245 WHERE movie_id = 76;
UPDATE pdmv_movies SET view = 124 WHERE movie_id = 77;
UPDATE pdmv_movies SET view = 17 WHERE movie_id = 78;
UPDATE pdmv_movies SET view = 424 WHERE movie_id = 79;
UPDATE pdmv_movies SET view = 268 WHERE movie_id = 80;
UPDATE pdmv_movies SET view = 478 WHERE movie_id = 81;
UPDATE pdmv_movies SET view = 238 WHERE movie_id = 82;
UPDATE pdmv_movies SET view = 457 WHERE movie_id = 83;
UPDATE pdmv_movies SET view = 114 WHERE movie_id = 84;
UPDATE pdmv_movies SET view = 205 WHERE movie_id = 85;
UPDATE pdmv_movies SET view = 372 WHERE movie_id = 86;
UPDATE pdmv_movies SET view = 155 WHERE movie_id = 87;
UPDATE pdmv_movies SET view = 382 WHERE movie_id = 88;
UPDATE pdmv_movies SET view = 294 WHERE movie_id = 89;
UPDATE pdmv_movies SET view = 86 WHERE movie_id = 90;
UPDATE pdmv_movies SET view = 237 WHERE movie_id = 91;
UPDATE pdmv_movies SET view = 182 WHERE movie_id = 92;
UPDATE pdmv_movies SET view = 387 WHERE movie_id = 93;
UPDATE pdmv_movies SET view = 87 WHERE movie_id = 94;
UPDATE pdmv_movies SET view = 93 WHERE movie_id = 95;
UPDATE pdmv_movies SET view = 143 WHERE movie_id = 96;
UPDATE pdmv_movies SET view = 169 WHERE movie_id = 97;
UPDATE pdmv_movies SET view = 170 WHERE movie_id = 98;
UPDATE pdmv_movies SET view = 173 WHERE movie_id = 99;
UPDATE pdmv_movies SET view = 379 WHERE movie_id = 100;
UPDATE pdmv_movies SET view = 304 WHERE movie_id = 101;
UPDATE pdmv_movies SET view = 237 WHERE movie_id = 102;
UPDATE pdmv_movies SET view = 50 WHERE movie_id = 103;
UPDATE pdmv_movies SET view = 28 WHERE movie_id = 104;
UPDATE pdmv_movies SET view = 201 WHERE movie_id = 105;
UPDATE pdmv_movies SET view = 139 WHERE movie_id = 106;
UPDATE pdmv_movies SET view = 451 WHERE movie_id = 107;
UPDATE pdmv_movies SET view = 48 WHERE movie_id = 108;
UPDATE pdmv_movies SET view = 192 WHERE movie_id = 109;
UPDATE pdmv_movies SET view = 365 WHERE movie_id = 110;
UPDATE pdmv_movies SET view = 34 WHERE movie_id = 111;
UPDATE pdmv_movies SET view = 390 WHERE movie_id = 112;
UPDATE pdmv_movies SET view = 127 WHERE movie_id = 113;
UPDATE pdmv_movies SET view = 92 WHERE movie_id = 114;
UPDATE pdmv_movies SET view = 365 WHERE movie_id = 115;
UPDATE pdmv_movies SET view = 42 WHERE movie_id = 116;
UPDATE pdmv_movies SET view = 309 WHERE movie_id = 117;
UPDATE pdmv_movies SET view = 34 WHERE movie_id = 118;
UPDATE pdmv_movies SET view = 78 WHERE movie_id = 119;
UPDATE pdmv_movies SET view = 68 WHERE movie_id = 120;
UPDATE pdmv_movies SET view = 302 WHERE movie_id = 121;
UPDATE pdmv_movies SET view = 353 WHERE movie_id = 122;
UPDATE pdmv_movies SET view = 77 WHERE movie_id = 123;
UPDATE pdmv_movies SET view = 270 WHERE movie_id = 124;
UPDATE pdmv_movies SET view = 160 WHERE movie_id = 125;
UPDATE pdmv_movies SET view = 427 WHERE movie_id = 126;
UPDATE pdmv_movies SET view = 251 WHERE movie_id = 127;
UPDATE pdmv_movies SET view = 115 WHERE movie_id = 128;
UPDATE pdmv_movies SET view = 239 WHERE movie_id = 129;
UPDATE pdmv_movies SET view = 176 WHERE movie_id = 130;
UPDATE pdmv_movies SET view = 247 WHERE movie_id = 131;
UPDATE pdmv_movies SET view = 396 WHERE movie_id = 132;
UPDATE pdmv_movies SET view = 52 WHERE movie_id = 133;
UPDATE pdmv_movies SET view = 365 WHERE movie_id = 134;
UPDATE pdmv_movies SET view = 292 WHERE movie_id = 135;
UPDATE pdmv_movies SET view = 31 WHERE movie_id = 136;
UPDATE pdmv_movies SET view = 283 WHERE movie_id = 137;
UPDATE pdmv_movies SET view = 119 WHERE movie_id = 138;
UPDATE pdmv_movies SET view = 399 WHERE movie_id = 139;
UPDATE pdmv_movies SET view = 453 WHERE movie_id = 140;
UPDATE pdmv_movies SET view = 74 WHERE movie_id = 141;
UPDATE pdmv_movies SET view = 88 WHERE movie_id = 142;
UPDATE pdmv_movies SET view = 73 WHERE movie_id = 143;
UPDATE pdmv_movies SET view = 185 WHERE movie_id = 144;
UPDATE pdmv_movies SET view = 249 WHERE movie_id = 145;
UPDATE pdmv_movies SET view = 465 WHERE movie_id = 146;
UPDATE pdmv_movies SET view = 269 WHERE movie_id = 147;
UPDATE pdmv_movies SET view = 500 WHERE movie_id = 148;
UPDATE pdmv_movies SET view = 324 WHERE movie_id = 149;
UPDATE pdmv_movies SET view = 219 WHERE movie_id = 150;
UPDATE pdmv_movies SET view = 304 WHERE movie_id = 151;
UPDATE pdmv_movies SET view = 492 WHERE movie_id = 152;
UPDATE pdmv_movies SET view = 225 WHERE movie_id = 153;
UPDATE pdmv_movies SET view = 471 WHERE movie_id = 154;
UPDATE pdmv_movies SET view = 376 WHERE movie_id = 155;
UPDATE pdmv_movies SET view = 392 WHERE movie_id = 156;
UPDATE pdmv_movies SET view = 416 WHERE movie_id = 157;
UPDATE pdmv_movies SET view = 97 WHERE movie_id = 158;
UPDATE pdmv_movies SET view = 31 WHERE movie_id = 159;
UPDATE pdmv_movies SET view = 81 WHERE movie_id = 160;
UPDATE pdmv_movies SET view = 134 WHERE movie_id = 161;
UPDATE pdmv_movies SET view = 334 WHERE movie_id = 162;
UPDATE pdmv_movies SET view = 72 WHERE movie_id = 163;
UPDATE pdmv_movies SET view = 361 WHERE movie_id = 164;
UPDATE pdmv_movies SET view = 457 WHERE movie_id = 165;
UPDATE pdmv_movies SET view = 485 WHERE movie_id = 166;
UPDATE pdmv_movies SET view = 16 WHERE movie_id = 167;
UPDATE pdmv_movies SET view = 265 WHERE movie_id = 168;
UPDATE pdmv_movies SET view = 291 WHERE movie_id = 169;
UPDATE pdmv_movies SET view = 30 WHERE movie_id = 170;
UPDATE pdmv_movies SET view = 111 WHERE movie_id = 171;
UPDATE pdmv_movies SET view = 485 WHERE movie_id = 172;
UPDATE pdmv_movies SET view = 57 WHERE movie_id = 173;
UPDATE pdmv_movies SET view = 438 WHERE movie_id = 174;
UPDATE pdmv_movies SET view = 322 WHERE movie_id = 175;
UPDATE pdmv_movies SET view = 273 WHERE movie_id = 176;
UPDATE pdmv_movies SET view = 219 WHERE movie_id = 177;
UPDATE pdmv_movies SET view = 431 WHERE movie_id = 178;
UPDATE pdmv_movies SET view = 48 WHERE movie_id = 179;
UPDATE pdmv_movies SET view = 399 WHERE movie_id = 180;
UPDATE pdmv_movies SET view = 64 WHERE movie_id = 181;
UPDATE pdmv_movies SET view = 97 WHERE movie_id = 182;
UPDATE pdmv_movies SET view = 468 WHERE movie_id = 183;
UPDATE pdmv_movies SET view = 228 WHERE movie_id = 184;
UPDATE pdmv_movies SET view = 425 WHERE movie_id = 185;
UPDATE pdmv_movies SET view = 52 WHERE movie_id = 186;
UPDATE pdmv_movies SET view = 45 WHERE movie_id = 187;
UPDATE pdmv_movies SET view = 135 WHERE movie_id = 188;
UPDATE pdmv_movies SET view = 429 WHERE movie_id = 189;
UPDATE pdmv_movies SET view = 286 WHERE movie_id = 190;
UPDATE pdmv_movies SET view = 468 WHERE movie_id = 191;
UPDATE pdmv_movies SET view = 273 WHERE movie_id = 192;
UPDATE pdmv_movies SET view = 171 WHERE movie_id = 193;
UPDATE pdmv_movies SET view = 366 WHERE movie_id = 194;
UPDATE pdmv_movies SET view = 218 WHERE movie_id = 195;
UPDATE pdmv_movies SET view = 105 WHERE movie_id = 196;
UPDATE pdmv_movies SET view = 450 WHERE movie_id = 197;
UPDATE pdmv_movies SET view = 468 WHERE movie_id = 198;
UPDATE pdmv_movies SET view = 462 WHERE movie_id = 199;
UPDATE pdmv_movies SET view = 444 WHERE movie_id = 200;
UPDATE pdmv_movies SET view = 175 WHERE movie_id = 201;
UPDATE pdmv_movies SET view = 17 WHERE movie_id = 202;
UPDATE pdmv_movies SET view = 31 WHERE movie_id = 203;
UPDATE pdmv_movies SET view = 338 WHERE movie_id = 204;
UPDATE pdmv_movies SET view = 485 WHERE movie_id = 205;
UPDATE pdmv_movies SET view = 410 WHERE movie_id = 206;
UPDATE pdmv_movies SET view = 210 WHERE movie_id = 207;
UPDATE pdmv_movies SET view = 448 WHERE movie_id = 208;
UPDATE pdmv_movies SET view = 204 WHERE movie_id = 209;
UPDATE pdmv_movies SET view = 464 WHERE movie_id = 210;
UPDATE pdmv_movies SET view = 119 WHERE movie_id = 211;
UPDATE pdmv_movies SET view = 408 WHERE movie_id = 212;
UPDATE pdmv_movies SET view = 294 WHERE movie_id = 213;
UPDATE pdmv_movies SET view = 464 WHERE movie_id = 214;
UPDATE pdmv_movies SET view = 79 WHERE movie_id = 215;
UPDATE pdmv_movies SET view = 477 WHERE movie_id = 216;
UPDATE pdmv_movies SET view = 14 WHERE movie_id = 217;
UPDATE pdmv_movies SET view = 315 WHERE movie_id = 218;
UPDATE pdmv_movies SET view = 458 WHERE movie_id = 219;
UPDATE pdmv_movies SET view = 25 WHERE movie_id = 220;
UPDATE pdmv_movies SET view = 144 WHERE movie_id = 221;
UPDATE pdmv_movies SET view = 360 WHERE movie_id = 222;
UPDATE pdmv_movies SET view = 72 WHERE movie_id = 223;
UPDATE pdmv_movies SET view = 223 WHERE movie_id = 224;
UPDATE pdmv_movies SET view = 113 WHERE movie_id = 225;
UPDATE pdmv_movies SET view = 425 WHERE movie_id = 226;
UPDATE pdmv_movies SET view = 345 WHERE movie_id = 227;
UPDATE pdmv_movies SET view = 364 WHERE movie_id = 228;
UPDATE pdmv_movies SET view = 55 WHERE movie_id = 229;
UPDATE pdmv_movies SET view = 404 WHERE movie_id = 230;
UPDATE pdmv_movies SET view = 441 WHERE movie_id = 231;
UPDATE pdmv_movies SET view = 456 WHERE movie_id = 232;
UPDATE pdmv_movies SET view = 161 WHERE movie_id = 233;
UPDATE pdmv_movies SET view = 80 WHERE movie_id = 234;
UPDATE pdmv_movies SET view = 172 WHERE movie_id = 235;
UPDATE pdmv_movies SET view = 490 WHERE movie_id = 236;
UPDATE pdmv_movies SET view = 483 WHERE movie_id = 237;
UPDATE pdmv_movies SET view = 168 WHERE movie_id = 238;
UPDATE pdmv_movies SET view = 433 WHERE movie_id = 239;
UPDATE pdmv_movies SET view = 472 WHERE movie_id = 240;
UPDATE pdmv_movies SET view = 409 WHERE movie_id = 241;
UPDATE pdmv_movies SET view = 33 WHERE movie_id = 242;
UPDATE pdmv_movies SET view = 464 WHERE movie_id = 243;
UPDATE pdmv_movies SET view = 112 WHERE movie_id = 244;
UPDATE pdmv_movies SET view = 212 WHERE movie_id = 245;
UPDATE pdmv_movies SET view = 264 WHERE movie_id = 246;
UPDATE pdmv_movies SET view = 208 WHERE movie_id = 247;
UPDATE pdmv_movies SET view = 47 WHERE movie_id = 248;
UPDATE pdmv_movies SET view = 453 WHERE movie_id = 249;
UPDATE pdmv_movies SET view = 302 WHERE movie_id = 250;
UPDATE pdmv_movies SET view = 386 WHERE movie_id = 251;
UPDATE pdmv_movies SET view = 455 WHERE movie_id = 252;
UPDATE pdmv_movies SET view = 441 WHERE movie_id = 253;
UPDATE pdmv_movies SET view = 493 WHERE movie_id = 254;
UPDATE pdmv_movies SET view = 317 WHERE movie_id = 255;
UPDATE pdmv_movies SET view = 94 WHERE movie_id = 256;
UPDATE pdmv_movies SET view = 458 WHERE movie_id = 257;
UPDATE pdmv_movies SET view = 269 WHERE movie_id = 258;
UPDATE pdmv_movies SET view = 424 WHERE movie_id = 259;
UPDATE pdmv_movies SET view = 278 WHERE movie_id = 260;
UPDATE pdmv_movies SET view = 474 WHERE movie_id = 261;
UPDATE pdmv_movies SET view = 244 WHERE movie_id = 262;
UPDATE pdmv_movies SET view = 342 WHERE movie_id = 263;
UPDATE pdmv_movies SET view = 497 WHERE movie_id = 264;
UPDATE pdmv_movies SET view = 365 WHERE movie_id = 265;
UPDATE pdmv_movies SET view = 421 WHERE movie_id = 266;
UPDATE pdmv_movies SET view = 434 WHERE movie_id = 267;
UPDATE pdmv_movies SET view = 155 WHERE movie_id = 268;
UPDATE pdmv_movies SET view = 208 WHERE movie_id = 269;
UPDATE pdmv_movies SET view = 23 WHERE movie_id = 270;
UPDATE pdmv_movies SET view = 329 WHERE movie_id = 271;
UPDATE pdmv_movies SET view = 340 WHERE movie_id = 272;
UPDATE pdmv_movies SET view = 103 WHERE movie_id = 273;
UPDATE pdmv_movies SET view = 429 WHERE movie_id = 274;
UPDATE pdmv_movies SET view = 179 WHERE movie_id = 275;
UPDATE pdmv_movies SET view = 403 WHERE movie_id = 276;
UPDATE pdmv_movies SET view = 24 WHERE movie_id = 277;
UPDATE pdmv_movies SET view = 496 WHERE movie_id = 278;
UPDATE pdmv_movies SET view = 438 WHERE movie_id = 279;
UPDATE pdmv_movies SET view = 357 WHERE movie_id = 280;
UPDATE pdmv_movies SET view = 448 WHERE movie_id = 281;
UPDATE pdmv_movies SET view = 224 WHERE movie_id = 282;
UPDATE pdmv_movies SET view = 181 WHERE movie_id = 283;
UPDATE pdmv_movies SET view = 277 WHERE movie_id = 284;
UPDATE pdmv_movies SET view = 328 WHERE movie_id = 285;
UPDATE pdmv_movies SET view = 233 WHERE movie_id = 286;
UPDATE pdmv_movies SET view = 409 WHERE movie_id = 287;
UPDATE pdmv_movies SET view = 193 WHERE movie_id = 288;
UPDATE pdmv_movies SET view = 177 WHERE movie_id = 289;
UPDATE pdmv_movies SET view = 163 WHERE movie_id = 290;
UPDATE pdmv_movies SET view = 257 WHERE movie_id = 291;
UPDATE pdmv_movies SET view = 252 WHERE movie_id = 292;
UPDATE pdmv_movies SET view = 295 WHERE movie_id = 293;
UPDATE pdmv_movies SET view = 349 WHERE movie_id = 294;
UPDATE pdmv_movies SET view = 142 WHERE movie_id = 295;
UPDATE pdmv_movies SET view = 233 WHERE movie_id = 296;
UPDATE pdmv_movies SET view = 255 WHERE movie_id = 297;
UPDATE pdmv_movies SET view = 486 WHERE movie_id = 298;
UPDATE pdmv_movies SET view = 325 WHERE movie_id = 299;
UPDATE pdmv_movies SET view = 159 WHERE movie_id = 300;
UPDATE pdmv_movies SET view = 256 WHERE movie_id = 301;
UPDATE pdmv_movies SET view = 265 WHERE movie_id = 302;
UPDATE pdmv_movies SET view = 160 WHERE movie_id = 303;
UPDATE pdmv_movies SET view = 317 WHERE movie_id = 304;
UPDATE pdmv_movies SET view = 381 WHERE movie_id = 305;
UPDATE pdmv_movies SET view = 399 WHERE movie_id = 306;
UPDATE pdmv_movies SET view = 12 WHERE movie_id = 307;
UPDATE pdmv_movies SET view = 114 WHERE movie_id = 308;
UPDATE pdmv_movies SET view = 284 WHERE movie_id = 309;
UPDATE pdmv_movies SET view = 416 WHERE movie_id = 310;
UPDATE pdmv_movies SET view = 37 WHERE movie_id = 311;
UPDATE pdmv_movies SET view = 407 WHERE movie_id = 312;
UPDATE pdmv_movies SET view = 207 WHERE movie_id = 313;
UPDATE pdmv_movies SET view = 407 WHERE movie_id = 314;
UPDATE pdmv_movies SET view = 320 WHERE movie_id = 315;
UPDATE pdmv_movies SET view = 227 WHERE movie_id = 316;
UPDATE pdmv_movies SET view = 435 WHERE movie_id = 317;
UPDATE pdmv_movies SET view = 269 WHERE movie_id = 318;
UPDATE pdmv_movies SET view = 307 WHERE movie_id = 319;
UPDATE pdmv_movies SET view = 412 WHERE movie_id = 320;
UPDATE pdmv_movies SET view = 197 WHERE movie_id = 321;
UPDATE pdmv_movies SET view = 60 WHERE movie_id = 322;
UPDATE pdmv_movies SET view = 86 WHERE movie_id = 323;
UPDATE pdmv_movies SET view = 134 WHERE movie_id = 324;
UPDATE pdmv_movies SET view = 242 WHERE movie_id = 325;
UPDATE pdmv_movies SET view = 389 WHERE movie_id = 326;
UPDATE pdmv_movies SET view = 111 WHERE movie_id = 327;
UPDATE pdmv_movies SET view = 28 WHERE movie_id = 328;
UPDATE pdmv_movies SET view = 206 WHERE movie_id = 329;
UPDATE pdmv_movies SET view = 89 WHERE movie_id = 330;
UPDATE pdmv_movies SET view = 128 WHERE movie_id = 331;
UPDATE pdmv_movies SET view = 463 WHERE movie_id = 332;
UPDATE pdmv_movies SET view = 33 WHERE movie_id = 333;
UPDATE pdmv_movies SET view = 260 WHERE movie_id = 334;
UPDATE pdmv_movies SET view = 467 WHERE movie_id = 335;
UPDATE pdmv_movies SET view = 492 WHERE movie_id = 336;
UPDATE pdmv_movies SET view = 468 WHERE movie_id = 337;
UPDATE pdmv_movies SET view = 369 WHERE movie_id = 338;
UPDATE pdmv_movies SET view = 188 WHERE movie_id = 339;
UPDATE pdmv_movies SET view = 120 WHERE movie_id = 340;
UPDATE pdmv_movies SET view = 0 WHERE view % 12 = 0;

DELIMITER //
CREATE PROCEDURE statistic_movie()
BEGIN
	SELECT mv.*, COUNT(rt.rating) as rating, ROUND(COALESCE(AVG(rt.rating), 0), 1) as ratePoint
    FROM pdmv_movies mv
	LEFT JOIN pdmv_ratings rt ON mv.movie_id = rt.movie_id
	GROUP BY mv.movie_id;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE mvview_post(
	IN p_mvid INT
    )
BEGIN
	UPDATE pdmv_movies
    SET view = view + 1
    WHERE movie_id = p_mvid;
END; //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE statistic_movie_show(
	IN p_mvid INT
)
BEGIN
	SELECT mv.*, 
       COUNT(rt.rating) AS total,
       SUM(CASE WHEN rt.rating = 1 THEN 1 ELSE 0 END) AS numRating1,
       SUM(CASE WHEN rt.rating = 2 THEN 1 ELSE 0 END) AS numRating2,
       SUM(CASE WHEN rt.rating = 3 THEN 1 ELSE 0 END) AS numRating3,
       SUM(CASE WHEN rt.rating = 4 THEN 1 ELSE 0 END) AS numRating4,
       SUM(CASE WHEN rt.rating = 5 THEN 1 ELSE 0 END) AS numRating5
	FROM pdmv_movies mv
	LEFT JOIN pdmv_ratings rt ON mv.movie_id = rt.movie_id
	WHERE mv.movie_id = p_mvid
	GROUP BY mv.movie_id;
END; //
DELIMITER ;

DELIMITER //


DELIMITER //
CREATE PROCEDURE rating_export_csv(IN p_path VARCHAR(255))
BEGIN
    -- Tạo bảng tạm thời để lưu trữ tên cột và dữ liệu
    CREATE TEMPORARY TABLE temp_pdmv_ratings AS
    SELECT 'userId' as userId, 'movieId' as movieId, 'rating' as rating
    UNION ALL
    SELECT user_id as userId, movie_id as movieId, rating
    FROM pdmv_ratings;

    -- Tạo câu lệnh SQL động
    SET @sql = CONCAT(
        'SELECT * INTO OUTFILE ''', p_path, ''' ',
        'FIELDS TERMINATED BY '','' ',
        'LINES TERMINATED BY ''\\n'' ',
        'FROM temp_pdmv_ratings'
    );

    -- Thực thi câu lệnh SQL động
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Xóa bảng tạm thời
    DROP TEMPORARY TABLE IF EXISTS temp_pdmv_ratings;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Collab_getRecommendedMoviesFromIds(IN p_ids TEXT)
BEGIN
    DECLARE query VARCHAR(1000);

    SET @query = CONCAT(
        'SELECT * FROM pdmv_movies WHERE movie_id IN (', p_ids, ') ORDER BY FIELD(movie_id, ', p_ids, ');'
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- -----------------------------------------------------RECOMMENNDER---------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------RECOMMENNDER---------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------RECOMMENNDER---------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
/*
RECOMMENDED MOVIE BASED USER (COLLAB FILTERING - SIMILAR USERS)
*/
DELIMITER //
CREATE FUNCTION Collab_SimilarityCosine(user1 INT, user2 INT) RETURNS DECIMAL(10, 5) DETERMINISTIC READS SQL DATA
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
    IF NOT EXISTS (SELECT user_id FROM pdmv_ratings WHERE user_id = user1) THEN
		call movie_listhighestratingmovies(numoffilm);
    ELSE
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
	END IF;
END//
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
	RETURNS varchar(255) DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE varFeatureVector varchar(255) DEFAULT '';
    DECLARE mvgTotal INT DEFAULT 0;
    DECLARE i INT;
    DECLARE replacement_character varchar(10) DEFAULT '1';
    
    DECLARE isDone INT DEFAULT 0;
    DECLARE mvgId INT;
    DECLARE mvgHaveList VARCHAR(255) DEFAULT '';
    DECLARE cur CURSOR FOR SELECT mvgenre_id FROM pdmv_movies_genres WHERE movie_id = p_mvid AND mvgenre_id != 1 ORDER BY mvgenre_id ASC;
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
    RETURNS INT DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE len1 INT;
    DECLARE len2 INT;
    DECLARE matchingCount INT;
    DECLARE i INT;

    SET len1 = LENGTH(str1);
    SET len2 = LENGTH(str2);
    SET matchingCount = 0;

    IF len1 <> len2 THEN
        RETURN -1; -- or any other value indicating the strings are of different lengths
    END IF;
    
	SET i = 1;
	IF SUBSTRING(str1, i, len1) = 0 OR SUBSTRING(str2, i, len2) = 0 THEN
		RETURN 0;
	END IF;

    WHILE i <= len1 DO
        IF SUBSTRING(str1, i, 1) = SUBSTRING(str2, i, 1) AND SUBSTRING(str1, i, 1) = "1" THEN
            SET matchingCount = matchingCount + 1;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN matchingCount;
END; //
DELIMITER ;


-- Tinh toan jascard cua 2 bo phim (id1, id2) -> ty le % giong nhau (intersection/union)
DELIMITER //
CREATE FUNCTION JaccardIndex(p_mv1 INT, p_mv2 INT)
    RETURNS DECIMAL(5, 4) DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE set1 VARCHAR(255);
    DECLARE set2 VARCHAR(255);
    DECLARE intersectionCount INT;
    DECLARE unionCount INT;
	DECLARE i INT;
 	SET set1 = ( SELECT movie_getFeatureVector(p_mv1) );
    SET set2 = ( SELECT movie_getFeatureVector(p_mv2) );

    -- Tính số phần tử giao của hai tập hợp
    SET intersectionCount = ( SELECT CountMatchingCharacters(set1, set2) );
    -- Tính số phần tử hợp của hai tập hợp
	SET unionCount = 0;
    SET i = 1;
    WHILE i <= LENGTH(set1) DO
        IF SUBSTRING(set1, i, 1) = "1" OR SUBSTRING(set2, i, 1) = "1" THEN
            SET unionCount = unionCount + 1;
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Tính Jaccard index
    IF unionCount = 0 THEN
        RETURN 0; -- Trường hợp đặc biệt khi cả hai tập hợp đều rỗng
    ELSE
        RETURN CAST(intersectionCount AS DECIMAL) / CAST(unionCount AS DECIMAL);
    END IF;
END //
DELIMITER ;

-- get danh sach phim goi y
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

update pdmv_movies set numrating = 0 where numrating is null;
update pdmv_movies set mvpoint = 0 where mvpoint is null;

CREATE TABLE pdmv_mvimages (
    img_id INT PRIMARY KEY AUTO_INCREMENT,
	movie_id INT NOT NULL,
	imgURL TEXT,
    createAt DATETIME NOT NULL DEFAULT NOW(),
    updateAt DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

INSERT INTO `pdmv_mvimages` (`img_id`, `movie_id`, `imgURL`, `createAt`, `updateAt`) VALUES (NULL, '340', 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg', current_timestamp(), current_timestamp()), (NULL, '340', 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-2.jpg', current_timestamp(), current_timestamp());

DELIMITER //
CREATE PROCEDURE InsertMultipleRowsInMVImages (IN p_mvid INT, IN num_rows INT)
BEGIN
    DECLARE i INT DEFAULT 0;

    WHILE i < num_rows DO
        INSERT INTO pdmv_mvimages(movie_id) VALUES (p_mvid);
        SET i = i + 1;
    END WHILE;
END; //
DELIMITER ;
