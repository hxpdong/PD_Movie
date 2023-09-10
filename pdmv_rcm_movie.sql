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
    email VARCHAR(255) NOT NULL,
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
    (1, 'Hài','Comedy'),
    (2, 'Khoa học viễn tưởng', 'Sci-fi'),
	(3, 'Kinh dị','Horror'),
	(4, 'Tình cảm','Romance'),
	(5, 'Ca nhạc','Musical'),
	(6, 'Hành động','Action'),
	(7, 'Hoạt hình','Cartoon'),
	(8, 'Trinh thám','Detective'),
    (9, 'Kịch', 'Dramatic'),
    (10, 'Giả tưởng', 'Fiction'),
    (11, 'Huyền bí', 'Mystery'),
    (12, 'Phiêu lưu', 'Adventure'),
    (13, 'Giật gân', 'Thriller'),
    (14, 'Thảm họa', 'Disaster');

CREATE TABLE pdmv_movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
	title_vi NVARCHAR(255) NOT NULL,
    title_en NVARCHAR(255) NOT NULL,
	content TEXT,
    director TEXT,
    actors TEXT,
	manufactureYear INT,
	videoLength NVARCHAR(100),
	posterURL TEXT,
	updateAt DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO pdmv_movies (movie_id, title_vi, title_en, content, director, actors, manufactureYear, videoLength)
VALUES
    (1, 'Harry Potter 1 - Harry Potter và Hòn đá Phù thủy', 'Harry Potter and the Philosopher Stone',
    'Harry Potter và Hòn Đá Phù Thủy là bộ phim đầu tiên trong series phim “Harry Potter” được xây dựng dựa trên tiểu thuyết của nhà văn J.K.Rowling. Nhân vật chính của phim, Harry Potter : cậu bé 11 tuổi sau khi mồ côi cha mẹ đã bị gửi đến nhà chú và dì dượng của mình, gia đình Dursley. Tuy nhiên, cậu bé bị ngược đãi và không hề biết về thân phận thực sự của mình. Vào sinh nhật thứ 11 của Harry, một người lai khổng lồ là Rubeus Hagrid đã đến tìm cậu bé để đưa cậu về trường Pháp Thuật Hogwarts. Lúc này, Harry mới biết được mình là phù thủy và một phần câu chuyện về cha mẹ mình, những người đã bị Voldemort giết hại. Cùng với trí thông minh và lòng dũng cảm, cậu bé đã cùng những người bạn của mình khám phá những điều bí mật nguy hiểm về thế giới của phép thuật...',
    'Chris Columbus', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2001', '2h32m'),
    (2, 'Harry Potter 2 - Harry Potter và Phòng chứa Bí mật', 'Harry Potter and the Chamber of Secrets',
    'Dựa trên tập thứ hai thuộc loạt sách ăn khách của tác giả J.K. Rowling, bộ phim kể lại cuộc sống của cậu bé Harry Potter trong năm học thứ hai tại trường phù thủy Hogwarts. Mong ngóng trở lại ngôi trường thân yêu của Harry bị một sinh vật kỳ lạ phá tan tành. Chú gia tinh Dobby đã mang tới lời cảnh báo về những nguy cơ tiềm ẩn đang chờ cậu và tìm cách ép Harry nghỉ học. Bất chấp điều đó, Harry vẫn trở lại nơi cậu coi là mái ấm thực sự. Tuy nhiên, Hogwarts có nguy cơ bị đóng cửa vĩnh viễn khi một chuỗi sự kiện kỳ lạ bắt đầu xảy ra: Những vệt máu lạ trên tường, học sinh các Nhà lần lượt hóa đá, câu chuyện thần bí và rùng rợn về "phòng chứa bí mật"... Rồi Harry phát hiện ra mình nghe thấy giọng nói lạ, phát ra từ đâu đó bên trong bức tường...',
    'Chris Columbus', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2002', '2h41m'),
    (3, 'Harry Potter 3 - Harry Potter và tên tù nhân ngục Azkaban', 'Harry Potter and the Prisoner of Azkaban',
    'Mùa hè trước khi Harry bước vào năm 3 ở trường Hogwarts, trong cơn nóng giận không kềm chế được, Harry đã làm phép với bà cô khó chịu và cậu sợ hãi bỏ trốn khỏi nhà trên chuyến xe bus hiệp sĩ. Tại đây, cậu nghe nói về Sirius Black, tên phù thuỷ trốn khỏi ngục Azkaban. Nhưng Harry không ngờ, Sirius Black trốn ngục là để truy tìm cậu...',
    'Alfonso Cuarón', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2004', '2h19m'),
    (4, 'Harry Potter 4 - Harry Potter và Chiếc cốc lửa', 'Harry Potter and the Goblet of Fire',
    'Cuộc thi đấu Tam pháp thuật diễn ra giữa ba trường phù thuỷ nổi tiếng thế giới của Bungary, Pháp và Anh. Tại vòng thi đấu Tam Pháp Thuật, Harry Potter bất ngờ được Chiếc cốc lửa chọn là thí sinh thứ tư, một trường hợp ngoại lệ hy hữu vì thứ nhất, mỗi trường chỉ có một người được chọn, và thứ hai, cậu bé chưa đủ tuổi để tham gia. Cuộc thi đấu khá cam go, nguy hiểm chết người. Trong cuộc thi cuối cùng trong mê cung, Harry và người bạn thi đấu cùng trường Cedric đã phải đối mặt với chúa tể Hắc ám Voldemort...',
    'Mike Newell', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2005', '2h37m'),
    (5, 'Harry Potter 5 - Harry Potter và Hội Phượng hoàng', 'Harry Potter and the Order of the Phoenix',
    'Trong kỳ nghỉ hè tại gia đình dì dượng Dursley trước khi bước vào năm thứ 5 tại Hogwarts, Harry Potter không nhận được nhiều tin tức từ thế giới phù thủy. Harry rất bực mình vì Voldemort vừa mới được sống dậy mà hai người bạn của Harry, Hermione Granger và Ron Weasley cứ úp mở trong các thư từ họ gửi. Trong lúc kình cãi với Dursley trong khi về nhà từ công viên, Harry bị hai giám ngục Azkaban tấn công. Với phép Expacto Patronum, Harry đã đẩy lùi bọn chúng nhưng Dudley đã bị tấn công. Một người hàng xóm, Arabella Figg, đến để giúp đỡ Harry, và tiết lộ rằng bà đã được Albus Dumbledore yêu cầu canh giữ Harry. Về đến nhà, Harry nhận một lá thư cho biết rằng cậu ta đã bị đuổi khỏi trường Hogwarts (vì học sinh không được phép dùng pháp thuật khi còn dưới 17 tuổi), và phải ra toà tại Bộ Pháp thuật để giải thích hành động của mình...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2007', '2h18m'),
    (6, 'Harry Potter 6 - Harry Potter và Hoàng tử lai', 'Harry Potter and the Half-Blood Prince',
    'Năm học thứ sáu của Harry Potter ở Hogwarts hóa ra lại là một năm đầy thú vị. Điều thú vị đầu tiên là việc chào đón một giáo sư mới tại Hogwarts, thầy Horace Slughorn, người dạy cho Harry nhiều điều thú vị trong môn độc dược của thầy Snape hắc ám. Thầy Slughorn còn cho Harry mượn đồ dùng của trường học, và trong số đó có một quyển sách cũ nát thuộc về chủ nhân tên là Hoàng Tử Lai. Quyển sách có nhiều ghi chú nguệch ngoạc ở lề mỗi trang giấy, và đây lại là người khuyên giúp Harry có thể tiến bộ trong pháp thuật của mình. Cũng trong năm học này, thầy Dumbledore mở một lớp học riêng cho Harry. Ở đó, thầy cho Harry xem những kí ức về những bí mật đen tối của quá khứ Voldermort, với hy vọng rằng Harry có thể lợi dụng những điểm yểu của Voldermort để đánh bại hắn trong trận chiến cuối cùng. Draco Malfoy, kẻ thù không đội trời chung của Harry, có nhiều hành động khả nghi, luôn lén lút đi khắp trường. Vì thế, Harry cho rằng Draco là nội gián của Voldermort và quyết tâm tìm hiểu chính xác chuyện gì đang xảy ra...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2009', '2h33m'),
    (7, 'Harry Potter 7 - Harry Potter và Bảo bối Tử thần – Phần 1', 'Harry Potter and the Deathly Hallows – Part 1',
    'Chúa tể Voldemort cùng đám tay chân của hắn đang âm mưu tấn công Harry Potter khi cậu rời khỏi ngôi nhà của gia đình Dursley lần cuối cùng. Ngay trước khi phép bảo vệ cho Harry tại gia đình Dursley hết hiệu lực vào thời điểm Harry bước qua tuổi 17, người của Hội Phượng hoàng đến để hộ tống cậu tới một nơi ở mới an toàn. Mặc dù đã dùng sáu người nguỵ trang thành Harry, Harry thật vẫn bị Voldemort cùng các Tử thần Thực tử phát hiện ra trên đường đi và bị tấn công...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2010', '2h26m'),
    (8, 'Harry Potter 7 - Harry Potter và Bảo bối Tử thần – Phần 2', 'Harry Potter and the Deathly Hallows – Part 2',
    'Kết thúc phần 1 là khi nhóm bạn Harry Potter, Ron và Hermione quay trở lại trường Hogwarts để tìm và tiêu diệt Trường Sinh Linh Giá cuối cùng của Voldemort. Nhưng Voldemort đã phát hiện ra nhiệm vụ của họ, và trận chiến pháp thuật lớn nhất trong lịch sử đã diễn ra ở đây, nơi mà biết bao người ngã xuống, nơi mà tất cả các pháp sư dũng cảm sẵn sàng đánh đổi cuộc sống của mình để tiêu diệt tận cùng thế lực hắc ám. Giáo sư Dumbledore mặc dù đã mất từ tập 6, nhưng ở phần cuối ông vẫn đóng vai trò quan trọng trong việc dẫn đường chỉ lối cho Harry chiến đấu với phù thủy hắc ám mạnh nhất mọi thời đại...',
    'David Yates', 'Daniel Radcliffe, Rupert Grint, Emma Watson', '2011', '2h10m'),
    (9, 'Sát thủ John Wick', 'John Wick', 
	'Bộ phim hành động nổi tiếng "John Wick" không thể bỏ qua. Câu chuyện xoay quanh John Wick, một sát thủ sống cùng chú chó héo của người vợ đã qua đời. Một ngày nọ, một băng nhóm xã hội đen do Isoef Tarasov cầm đầu tấn công John Wick vì không được mua chiếc xe Mustang của ông. Nhưng họ không ngờ rằng John Wick không phải là người dễ bị đánh bại và hậu quả của hành động đó làm dấy lên một thế giới ngầm đen tối với những luật lệ khắc nghiệt và các nhân vật sâu sắc tâm lý.', 
	'Chad Stahelski', 'Keanu Reeves, Alfie Allen', '2014', '1h41m'),
    (10, 'Nhiệm vụ bất khả thi 7', 'Mission: Impossible 7', 
	'Mission Impossible 7 đã gặp khó khăn trong quá trình sản xuất do dịch bệnh COVID-19. Kế hoạch ghi hình tại Italy đã bị hoãn từ tháng 7 năm trước. Paramount Pictures thông báo rằng bộ phim sẽ được ra mắt vào tháng 5 năm 2023. Mong chờ sự thành công của bộ phim hành động đình đám này!',
	'Christopher McQuarrie', 'Tom Cruise, Hayley Atwell, Rebecca Ferguson', '2023', '2h44m'),
	(11, 'Sát thủ đối đầu', 'Bullet Train', 
	'Sát thủ đối đầu là bộ phim ăn khách và đáng mong chờ nhất. Cốt truyện xoay quanh một cuộc đối đầu căng thẳng trên chuyến tàu cao tốc ở Nhật Bản. Nhóm sát thủ đụng độ và tranh chấp, tạo nên những pha hành động kịch tính và đầy căng thẳng. Hãy thưởng thức bộ phim này để trải nghiệm những pha hành động đáng nhớ nhất.',
	'David Leitch', 'Brad Pitt, Joey King', '2022', '2h6m'),
    (12, 'Thor: Tình yêu và sấm sét', 'Thor: Love & Thunder', 
	'Thor: Love and Thunder là một bộ phim lẻ hay của Mỹ sau sự kiện Avengers: Endgame. Sau khi Thanos bị đánh bại, Thor bắt đầu cuộc hành trình xuyên không gian theo Vệ binh dải ngân hà. Phim đã nhận được nhiều lời khen về kỹ xảo và diễn xuất, tuy nhiên cũng có những góp ý về âm sắc và kịch bản không nhất quán. Hãy xem để khám phá thêm!',
	'Taika Waititi', 'Chris Hemsworth, Natalie Portman, Chris Pratt', '2022', '2h6m'),
    (13, 'Minions: Sự trỗi dậy của Gru', 'Minions: The Rise Of Gru', 
	'Minions: The Rise Of Gru là bộ phim hoạt hình vui nhộn tập trung vào những Minions gây cười. Bộ phim là phần tiếp theo của Despicable Me, xoay quanh cuộc sống của Gru và ước mơ trở thành một ác nhân vĩ đại. Bị chế nhạo bởi bạn bè và không được quan tâm từ mẹ, Gru thể hiện tài năng khi thành công trong các nhiệm vụ của Vicious 6. Bên cạnh mối quan hệ chủ-tớ, Gru và Minions tạo nên một tình bạn đẹp và đầy cảm động. Hãy thưởng thức câu chuyện này và cười thả ga cùng Minions!',
	'Kyle Balda, Brad Ableson, Jonathan del Val', 'Steve Carell, Lucy Lawless, Michelle Yeoh', '2022', '1h28m'),
    (14, 'Black Adam', 'Black Adam', 
	'Black Adam là bộ phim siêu anh hùng DC duy nhất được xác nhận ra mắt vào năm 2022. Được sở hữu sức mạnh phi thường từ Wizard Shasm, Black Adam trở thành siêu anh hùng mạnh nhất trong vũ trụ DC. Tuy nhiên, thay vì bảo vệ thế giới, Black Adam quyết định trả thù những người đã gây ra khổ đau cho anh. Đón xem hành trình đầy hấp dẫn của Black Adam trong bộ phim này!',
	'Jaume Collet-Serra', 'Dwayne Johnson, Noah Centineo, Sarah Shahi, Aldis Hodge', '2022', '2h5m'),
    (15, 'The Flash', 'The Flash', 
	'Với các fan hâm mộ phim hành động Mỹ, The Flash là một trong những bộ phim lẻ hay nhất trong năm 2022. Tập trung vào nhân vật chính Barry Allen, một siêu anh hùng có khả năng chạy nhanh vượt qua tốc độ ánh sáng, The Flash khám phá sự mất mát và sự hối tiếc của Barry Allen trong quá khứ. Bộ phim dự kiến mang đến câu chuyện cảm động khi Barry cố gắng sửa chữa những sai lầm của mình. Đồng thời, The Flash cũng đánh dấu sự xuất hiện đáng chú ý của Supergirl. Hãy chờ đón bộ phim này vào cuối năm nay!', 
	'Andy Muschietti', 'Ezra Miller', '2023', '2h24m'),
    (16, 'Godzilla đại chiến Kong', 'Godzilla vs. Kong', 
	'Godzilla và Kong, hai quái vật huyền thoại, lại tiếp tục đối đầu nhau trong cuộc chiến gay cấn. Khi Godzilla bất ngờ tấn công trụ sở công ty Apex, lo ngại về sự hòa thuận giữa con người và quái vật nổi lên. Apex quyết định đối mặt với Godzilla và tìm cách chống lại sức mạnh hủy diệt của nó. Trong khi đó, Kong được đưa đến một khu nuôi dưỡng nhân tạo để bảo vệ, nhưng khi Kong và Godzilla chạm trán trên biển, cuộc chiến bùng nổ. Đây thực sự là một bộ phim hành động Mỹ đáng xem nhất mà bạn không thể bỏ qua.', 
	'Adam Wingard', 'Alexander Skarsgård, Millie Bobby Brown, Rebecca Hall', '2021', '1h53m'),
    (17, 'Quá nhanh quá nguy hiểm 9', 'Fast & Furious 9', 
	'Bộ phim hành động Mỹ "Fast & Furious 9" tái xuất với sự góp mặt của John Cena, Cardi B và Han Lue. Sự xuất hiện của các ngôi sao này là điểm nhấn và làm cho series "Fast And Furious" ngày càng nóng hơn. Trailer đã hé lộ vai trò đặc biệt của những nhân vật đình đám, hứa hẹn mang đến những phút giây căng thẳng đến ngừng thở. Cuộc sống hạnh phúc của Dominic Toretto và gia đình cũng được thể hiện trong đoạn trailer. ', 
	' Justin Lin', 'Vin Diesel, Michelle Rodriguez', '2021', '2h23m'),
    (18, 'Góa phụ đen', 'Black Widow', 
	'Phim "Black Widow" diễn ra sau cuộc nội chiến siêu anh hùng và trước khi Natasha Romanoff hy sinh trong "End Game". Natasha đang bị truy nã và tình cờ gặp lại Yelena - em gái nuôi của mình. Hai chị em phải đối mặt với nhiều nguy hiểm và đối đầu với kẻ đã gây chia rẽ họ. Kẻ thủ ác đó là người khiến cuộc sống của họ thay đổi hoàn toàn.', 
	'Cate Shortland', 'Scarlett Johansson, Florence Pugh', '2021', '2h13m'),
    (19, 'Ký sinh trùng (2019)', 'Parasite (2019)', 
	'"Parasite - Ký sinh trùng" là một bộ phim Hàn Quốc nổi tiếng về chủ đề tình cảm và xã hội. Phim đã giành nhiều giải thưởng danh giá, bao gồm cả giải Oscar. Câu chuyện xoay quanh sự phân biệt giàu nghèo trong xã hội Hàn Quốc, khi một gia đình nghèo khó tham gia vào cuộc sống của một gia đình giàu có thông qua công việc gia sư. Nhưng những bí mật sẽ dần dần được tiết lộ và gây ra những biến cố không ngờ.', 
	'Bong Joon Ho', 'Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-shik, Park So-dam', '2019', '2h12m'),
    (20, 'Điều Kỳ Diệu Ở Phòng Giam Số 7', 'Miracle in Cell No. 7', 
	'"Điều kỳ diệu ở phòng giam số 7" là một bộ phim lẻ Hàn Quốc cảm động và đầy ý nghĩa. Câu chuyện tập trung vào Yong Goo, một người cha thiểu năng trí tuệ, và con gái Ye Seung đáng yêu của anh. Sau khi bị oan sai và giam vào tù, Yong Goo lập nên một mối quan hệ đặc biệt với những tù nhân khác, nhờ đó anh có cơ hội gặp lại Ye Seung bằng cách đưa cô bé vào sống trong tù. Bộ phim này được đánh giá cao về kịch bản xuất sắc của Hàn Quốc và đã chinh phục trái tim của nhiều khán giả.', 
	'Lee Hwan-Kyung', 'Ryoo Seung-Ryong, Park Shin Hye, Kal So-Won', '2013', '2h7m'),
	(21, 'Chuyến tàu sinh tử', 'Train To Busan', 
	'"Train To Busan" là một bộ phim zombie đánh dấu sự trở lại của thể loại này trên màn ảnh rộng. Câu chuyện diễn ra trên một chuyến tàu đi từ Seoul tới thành phố an toàn Busan, với sự hiện diện của một người cha cùng con gái, một đôi vợ chồng chuẩn bị sinh con và một nhóm học sinh cấp 3. Khi đại dịch zombie bùng phát trên tàu, họ phải đấu tranh để bảo vệ những người thân yêu và chiến đấu để sống sót trên hành trình dài 453km đầy nguy hiểm.', 
	'Yeon Sang Ho', 'Ma Dong-Seok, Gong Yoo, Jung Yu Mi', '2016', '1h58m'),
    (22, 'Thử Thách Thần Chết 2', 'Along with the Gods: The Last 49 Days', 
	'Phần 2 của loạt phim "Thử Thách Thần Chết" tiếp tục mở rộng câu chuyện về chàng trai Su Hong, người được chọn làm linh hồn thuần khiết thứ 49. Trên thời hạn 49 ngày cuối cùng, nhiệm vụ của ba vệ thần là giúp đỡ Su Hong hoàn thành sứ mệnh của mình. Trong quá trình này, bí mật về thân phận của ba vệ thần dần được tiết lộ, và tình tiết phim trở nên căng thẳng hơn khi họ khám phá lại kí ức từ kiếp trước.', 
	'Kim Yong-hwa', 'Ha Jung-woo, Ju Ji-hoon, Kim Hyang-gi, Ma Dong-seok, Kim Dong-wook', '2018', '2h22m'),
    (23, 'Đại Dịch Cúm (2013)', 'Flu (2013)', 
	'Bộ phim xoay quanh chuyến tàu chở những người di cư trái phép sang Hàn Quốc, không hề hay biết rằng họ mang trong mình mầm bệnh nguy hiểm. Khi bùng phát dịch bệnh, chỉ còn một người sống sót duy nhất. Kim In Hae, trong hành trình tìm cách tìm ra loại virus và cứu con gái mình khỏi hiểm nguy, phát hiện ra rằng cô bé cũng đã mắc phải virus đáng sợ này. Câu chuyện xoay quanh việc cô phải làm gì để bảo vệ con gái và đối mặt với những nguy hiểm không ngừng.', 'Kim Sung-Su', 'Hyuk Jang, Soo-Ae, Park Min-Ha', '2013', '2h2m'),
    (24, 'Lối Thoát Trên Không (2019)', 'Exit (2019)',
	'Lối thoát trên không kể về Lee Yong-nam, một chàng trai nổi tiếng với kỹ năng leo núi nhưng không có công việc và không ai để ý tới. Trong một ngày đặc biệt, khi một thảm họa xảy ra, anh phải dùng tất cả khả năng leo núi của mình để cứu sống gia đình và mọi người. Bộ phim mang đến nhiều cung bậc cảm xúc, từ lòng cao thượng và tình yêu gia đình đến những tình huống hài hước và hấp dẫn. Exit - Lối thoát trên không là một bộ phim Hàn Quốc đầy cuốn hút không thể bỏ qua.', 
	'Lee Sang Geun', 'Jo Jong-suk, Im Yoon-ah', '2019', '1h44m'),
    (25, 'Nghề siêu khó (2019)', 'Extreme Job (2019)', 
	'Extreme Job - Phi Vụ Bá Đạo là một bộ phim Hàn Quốc phát hành vào năm 2019, gây sốt tại phòng vé. Câu chuyện xoay quanh 5 trinh sát thuộc đội phòng chống ma túy. Họ cải trang thành nhân viên quán gà rán để tiến hành điều tra một băng nhóm tội phạm. Tuy nhiên, việc nhà hàng trở nên nổi tiếng và đông khách gây ra nhiều rắc rối. Tuy vậy, đội trinh sát không bỏ cuộc và vẫn đoàn kết để truy bắt tội phạm. Phim cũng đề cao tình cảm đồng đội, gia đình và sự đoàn kết giữa những người cùng chí hướng. Extreme Job - Phi Vụ Bá Đạo là một bộ phim hấp dẫn và độc đáo.', 
	'Lee Byeong-heon', 'Ryu Seung-ryong, Lee Hanee, Jin Seon-kyu, Lee Dong-hwi, Gong Myung', '2019', '1h51m'),
    (26, 'Cờ Thái cực giương cao', 'Tae Guk Gi: The Brotherhood of War (2004)', 
	'Tae Guk Gi: The Brotherhood of War là một bộ phim hành động và tâm lý đặc sắc của Hàn Quốc do đạo diễn Kang Je-gyu chỉ đạo. Phim diễn ra ở Seoul vào những năm 1950 và kể về hai anh em Jin Tae và Jin Suk, sống trong một gia đình lao động nghèo khó. Jin Tae, người anh yêu thương em trở thành nguồn động lực để cung cấp cho em một tương lai tốt đẹp hơn. Khi chiến tranh bùng nổ, cả hai anh em gia nhập lực lượng quân đội Đại Hàn Dân Quốc. Tin rằng em trai đã hy sinh trong chiến trường, Jin Tae quyết định đầu quân cho Triều Tiên để trả thù cho quê hương và người em đã mất. Tuy nhiên, Jin Suk vẫn còn sống và phải đối mặt với anh trên chiến tuyến đối nghịch.', 
	'Kang Je-gyu', 'Jang Dong-gun, Won Bin, Lee Eun-ju, Kong Hyeong-jin, Lee Yeong-ran, Jeon Jae-hyeong', '2004', '2h20m'),
    (27, 'Ngoài Vòng Pháp Luật', 'The Outlaws (2017)',
	'Ngoài Vòng Pháp Luật là một bộ phim hành động đặc sắc của Hàn Quốc, với sự tham gia của hai diễn viên Ma Dong-seok và Yoon Kye-sang. Cốt truyện xoay quanh thế giới tội phạm đen tối ở Seoul và sự đối đầu giữa các băng nhóm xã hội đen. Ma Dong-seok đảm nhận vai một sĩ quan cảnh sát can đảm và quyết tâm, nhận nhiệm vụ giải quyết tất cả trong vòng 10 ngày. ', 
	'Kang Yoon-Sung', 'Yoon Kye-sang, Ma Dong-seok', '2017', '2h1m'),
    (28, 'Ác Nữ Báo Thù', 'The Villainess (2017)', 
	'The Villainess - Ác Nữ Báo Thù là một bộ phim hành động Hàn Quốc ra mắt năm 2017. Sook-hee, một cô gái từ nhỏ đã chứng kiến cái chết của cha mẹ và trở thành một sát thủ tàn nhẫn. Phim không chỉ có những pha hành động mãn nhãn mà còn chứa đựng những bí mật và tình tiết gây cấn không ngờ tới phút cuối.', 
	'Jung Byung-gil', 'Shin Ha-kyun, Kim Ok-bin, Sung Jun', '2017', '2h4m'),
    (29, 'Bố Già (2021)', 'Bố Già (2021)', 
	'"Bố Già" là một bộ phim lẻ Việt Nam ý nghĩa năm 2021. Cốt truyện tập trung vào mối quan hệ cha con của ông Sang và Quắn. Ông Sang là người cẩn thận và quan tâm đến mọi người xung quanh, nhưng sự can thiệp quá mức của ông đã mang lại rắc rối cho gia đình. Trái ngược với ông, Quắn là một chàng trai trẻ nổi loạn. Sự khác biệt thế hệ đã tạo ra mâu thuẫn giữa hai cha con. Với thông điệp sâu sắc, "Bố Già" đã thu hút khán giả và trở thành phim có doanh thu cao nhất ở Việt Nam.',
	'Trấn Thành, Vũ Ngọc Đãng', 'Trấn Thành, Tuấn Trần, NSND Ngọc Giàu, Ngân Chi, Quốc Khánh, Hoàng Mèo, Lê Giang, Lan Phương, La Thành, Lê Trang', '2021', '2h8m'),
    (30, 'Gái Già Lắm Chiêu 3 (2020)', 'Gái Già Lắm Chiêu 3 (2020)', 
	'"Gái Già Lắm Chiêu 3" là một bộ phim lẻ Việt Nam năm 2020 hấp dẫn. Cốt truyện xoay quanh mối quan hệ mẹ chồng - nàng dâu giữa hai người phụ nữ nổi tiếng trong giới showbiz. Thái Tuyết Mai, một cựu minh tinh gây tai tiếng, và một nữ hoàng scandal đang nổi tiếng với chương trình phanh phui bí mật showbiz. Bộ phim mang đến những tình huống thú vị và hài hước trong cuộc sống của hai nhân vật chính.', 
	'Bảo Nhân, Namcito', 'NSND Hồng Vân, NSND Lê Khanh, Ninh Dương Lan Ngọc, Jun Vũ, Lê Xuân Tiến', '2020', '2h00m'),
	(31, 'Tiệc Trăng Máu (2020)', 'Tiệc Trăng Máu (2020)', 
	'"Tiệc Trăng Máu" là một bộ phim lẻ Việt Nam ý nghĩa và hấp dẫn. Bối cảnh bắt đầu từ một bữa tiệc tại một căn penthouse xa hoa, những người bạn thân thiết chơi trò chơi tiết lộ tất cả tin nhắn và cuộc gọi. Những bí mật về sự lừa dối, phản bội dần được vạch trần trong câu chuyện. Bộ phim mang đến những cung bậc cảm xúc thú vị và những điều bất ngờ.', 
	'Nguyễn Quang Dũng', 'Thái Hòa, Đức Thịnh, Hồng Ánh, Thu Trang, Kiều Minh Tuấn, Hứa Vĩ Văn, Kaity Nguyễn', '2020', '1h59m'),
    (32, 'Mắt Biếc (2019)', 'Mắt Biếc (2019)', 
	'"Mắt Biếc" là một bộ phim lẻ đặc sắc của Việt Nam, dựa trên tiểu thuyết cùng tên của nhà văn Nguyễn Nhật Ánh. Câu chuyện bắt đầu với tình yêu ngây thơ và tươi đẹp của Ngạn và Hà Lan tại ngôi làng Đo Đo. Khi Hà Lan rời làng và yêu Dũng, cuộc hôn nhân của cô không được hạnh phúc. Hà Lan quyết định gửi con gái Trà Long trở về làng Đo Đo, nơi Ngạn vẫn mãi nhớ nhung. Tuy nhiên, khúc mắc xảy ra khi Trà Long lớn lên và phát sinh tình cảm với Ngạn...', 
	'Victor Vũ', ' Trúc Anh, Trần Nghĩa, Đỗ Khánh Vân, Trần Phong', '2019', '1h57m'),
    (33, 'Hai Phượng (2019)', 'Hai Phượng (2019)', 
	'"Hai Phượng" là một bộ phim lẻ đặc sắc của Việt Nam, mang đậm dấu ấn của diễn viên Ngô Thanh Vân. Cô vào vai Hai Phượng, một võ sư tài ba với quá khứ nổi tiếng, nhưng sau khi mang thai vô tình, cô quyết định trở về quê và sống một cuộc sống bình dị. Tuy nhiên, khi con gái 10 tuổi của cô, bé Mai, bị bắt đi bởi một nhóm người lạ, Hai Phượng bắt đầu cuộc hành trình đầy mạo hiểm để cứu con trong vòng 48 giờ. Liệu cô có thành công không? ',
	'Lê Văn Kiệt', 'Ngô Thanh Vân, Yaya Trương Nhi, Mai Cát Vi, Phan Thanh Nhiên, Pom', '2019', '1h40m'),
    (34, 'Birds of Prey: Cuộc lột xác huy hoàng của Harley Quinn', 'Harley Quinn: Birds Of Prey',
	'Harley Quinn: Birds of Prey là một trong những bộ phim lẻ hay 2020 được đánh giá cao và đáng xem. Được đạo diễn bởi Cathy Yan và xếp thứ 8 trong vũ trụ điện ảnh DC, bộ phim kể về cuộc lột xác của Harley Quinn sau khi chia tay Joker vào năm 2016. Cô nàng đã gặp và kết bạn với những người bạn mới, có tính cách lập dị và phong cách riêng, không muốn phụ thuộc vào bạn trai như trước đây.Bên cạnh cốt truyện hấp dẫn, Birds of Prey còn được đánh giá cao về doanh thu phòng vé và tiếng vang của nó trong thị trường điện ảnh. Mặc dù phải cạnh tranh với vũ trụ Marvel, bộ phim vẫn thu hút được sự chú ý của khán giả nhờ hướng đi mới và sáng tạo. Nếu bạn đang tìm kiếm một bộ phim hành động kịch tính và đầy cảm xúc, Harley Quinn: Birds of Prey chắc chắn là một lựa chọn tuyệt vời.',
	'Cathy Yan', 'Margot Robbie', '2020', '1h49m'),
    (35, 'Hoa Mộc Lan', 'Mulan', 
	'Hoa Mộc Lan là một câu chuyện quen thuộc với rất nhiều người, và bộ phim Mulan năm 2020 đã mang đến nhiều điều mới mẻ và thú vị. Câu chuyện kể về cô gái Mộc Lan, người đã giả trai và thay cha mình nhập ngũ để bảo vệ đất nước và đem lại vinh quang cho gia tộc.Mặc dù bị phát hiện là nữ giả nam trang, nhưng cô vẫn được phân công bảo vệ quân đội cùng với đội trưởng Tung. Bộ phim này không chỉ là một bộ phim hành động, mà còn là một bộ phim kiếm hiệp đầy hấp dẫn của Trung Quốc.Nếu bạn đang muốn tìm kiếm một bộ phim đầy cảm xúc với một câu chuyện lôi cuốn và đầy sức mạnh, thì Mulan chắc chắn là một lựa chọn tuyệt vời. Hãy bỏ qua các bộ phim hành động của Mỹ và khám phá thế giới kiếm hiệp của Trung Quốc với Mulan.', 
	'Tony Bancroft, Barry Cook', 'Ôn Minh Na', '2020', '1h55m'),
    (36, 'Mưa Tình Đầu', 'Classic Again', 
	'Năm 2020 đã chứng kiến rất nhiều bộ phim hay 2020 lẻ đáng xem, trong đó không thể bỏ qua Cơn Mưa Tình Đầu – Classic Again của đạo diễn Thatchaphong Suphasri và Tatchapong Supasri. Bộ phim kể về mối tình tay ba giữa Bota, cô bạn thân và Non - chàng trai mà cả hai đều yêu thích tại trường học. Tuy nhiên, khi biết rằng Poppy - người bạn của Bota cũng thích Non, cô đã lựa chọn che giấu tình cảm của mình để để cho Poppy tỏ tình trước.Một ngày nọ, Bota tình cờ đọc được những tấm thư của mẹ mình về mối tình đầu tiên. Những điều mà mẹ Bota viết về tình yêu khiến cô suy nghĩ nhiều hơn về bản thân và quan hệ tình cảm của mình. Cô nhận ra rằng bản thân và mẹ có nhiều điểm chung về tình yêu. Vậy sau đó, Bota sẽ có đủ dũng khí để thổ lộ tình cảm của mình với Non hay không?Nếu bạn đang tìm kiếm một bộ phim lãng mạn và đầy cảm động, hãy thử xem Cơn Mưa Tình Đầu – Classic Again, một trong những bộ phim lẻ hay nhất của năm 2020.',
	'Thatchaphong Suphasri, Tatchapong Supasri', 'Actor 11, Actor 2', '2020', '2h03m'),
    (37, 'Vua Sư Tử', 'The Lion King',
	'Bộ phim lấy bối cảnh trong khu rừng già châu Phi. Nhân vật chính là chú sư tử con Simba – con trai của vua Mufasa. Cuộc sống yêu đời, hạnh phúc bên cạnh cha mẹ và cô bạn Nala của cậu sớm kết thúc khi người chú ruột Scar có mưu đồ chiếm lấy ngai vàng của cha cậu.Người cha qua đời khi cứu Simba khỏi đám linh cẩu khiến cậu luôn cảm thấy ân hận. Sau khi biết được nguyên nhân cái chết của cha mình là do Scar, Simba đã cùng những người bạn của mình là lợn rừng Pumbaa và chồn đất Timon vạch trần thủ đoạn. Cậu trở lại đàn và tiếp tục nối nghiệp cha quản lý thảo nguyên. Cuộc sống yên bình đã trở lại với khu rừng.',
	'Roger Allers, Rob Minkoff', 'Robert Guillaume, Jeremy Irons, Matthew Broderick, James Earl Jones, Jonathan Taylor Thomas, Nathan Lane, Ernie Sabell, Moira Kelly', '1994', '1h28m'),
    (38, 'Đi tìm Nemo', 'Finding Nemo', 
	'Cốt chuyện xoay quanh hành trình đi tìm con trai Nemo của chú cá Marlin. Sau khi vợ và ổ trứng của anh bị ăn thịt và chỉ còn 1 quả trứng khác. Khi trứng nở, anh đặt tên con là Nemo và luôn bảo vệ con quá mức cần thiết vì sợ mất đi người thân duy nhất.Tuy nhiên, Nemo thích khám phá nên không nghe lời bố và vô tình bị lạc. Sau đó, cậu bị thợ lặn bắt đi, cho vào bể cá. Cậu cùng những con cá khác đang lên kế hoạch bỏ trốn. Trong khi đó, ông bố Marlin vượt đại dương, bám theo các manh mối để tìm con mình. Trên đường đi, Marlin gặp nhiều khó khăn và đôi lúc muốn bỏ cuộc nhưng ông nhận được nhiều sự giúp đỡ và động viên từ những người bạn mới. Đặc biệt là cô cá đồng hành Dory cực kỳ đãng trí.Cuối cùng, 2 cha con được đoàn tụ. Marlin cũng không còn là nhút nhát hay sợ hãi như trước. Anh được hàng xóm kính trọng vì đã dám dũng cảm đương đầu với những thử thách để tìm lại con trai.', 
	'Andrew Stanton, Lee Unkrich', 'Albert Brooks, Ellen DeGeneres, Alexander Gould, Willem Dafo, Brad Garrett, Joe Ranft, Allison Janne, Vicki Lewis', '2003', '1h40m'),
    (39, 'Câu chuyện đồ chơi 3', 'Toy Story 3',
	'Series phim xoay quanh một nhóm các đồ chơi có hành động và cảm xúc giống con người nhưng giả vờ vô tri vô giác. Trong phần 3, cậu bé Andy ngày nào nay đã lớn và sắp nhập học ở trường đại học. Đứng trước nguy cơ bị vứt bỏ, các món đồ chơi khác tìm đến nhà trẻ Sunnyside với hy vọng được sử dụng mãi mãi mặc dù Woody ra sức khuyên can.Được chào đón rất nhiệt tình, họ nghĩ rằng đây là lựa chọn thông minh và sáng suốt. Tuy nhiên, các món đồ chơi của Andy đã vỡ mộng về nơi này ngay trong ngày đầu tiên.Chúng bị bạo hành và đối xử tàn bạo. Đồng thời còn phải đối đầu với tên gấu bông xấu xa Lotso. Các món đồ chơi tìm đường về với chủ của mình sau khi được Woody giải thích. Khi Andy nhập học, các món đồ chơi đã được tặng cho Bonnie. Anh chàng cũng thường xuyên đến thăm cô bé và những người bạn đồ chơi thân thiết của mình. ', 
	'Lee Unkrich', 'Tom Hanks, Tim Allen, Don Rickles, Michael Keaton, Joan Cusack, Ned Beatty', '2010', '1h43m'),
    (40, 'Vút bay', 'Up', 
	'Carl Fredricksen từ nhỏ vốn nhút nhát nhưng lại mê phiêu lưu. Khi lớn lên anh lập gia đình với Ellie – người bạn từ nhỏ có cùng đam mê. Không may, họ chưa thực hiện được mục tiêu phiêu lưu đến Nam Mỹ cũng nhau thì Ellie qua đời.Nhiều năm về sau, Carl đã 78 tuổi và quyết phải hoàn thành chuyến hành trình tới Thác thiên đường Nam Mỹ đã cùng vợ ấp ủ. Ông nghĩ ra cách dùng hàng nghìn quả bóng bay để kéo cho ngôi nhà bay lên như một khinh khí cầu. Khi lên đến bầu trời, ông mới phát hiện ra có thêm cậu bé Russell ngoài hiên. Cậu bé trở thành người đồng hành bất đắc dĩ của ông. Một cuộc phiêu lưu trắc trở nhưng cũng rất vui nhộn, đầy xúc cảm sẽ đưa trí tưởng tượng của người xem bay cao.', 
	'Pete Docter, Bob Peterson', 'Edward Asner, Jordan Nagai, Bob Peterson, Pete Docter, Christopher Plummer', '2009', '1h36m');

UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1Su46sVT_-n_87Hjz1KQls6KlAULNUrm3' WHERE movie_id = 1;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1FPGTEpoicvq9XYq944Bqj1uwlrHogHpr' WHERE movie_id = 2;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1r1nPtIgJi7AozTmzEoi7Ivk9M16MsuLS' WHERE movie_id = 3;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1ikX5MBXx3L2CoKjDJG8z9fOIIwXQUaiJ' WHERE movie_id = 4;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1kqctca11Jm7K84ZF2TuEahZ8danf2D9f' WHERE movie_id = 5;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=18lapQ1wlgX7YgPf1bNwiQRD4DxWOVV44' WHERE movie_id = 6;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1ztrAwAeZPQqvZyzcIoghjU0Q0TKzUmY-' WHERE movie_id = 7;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1UgrVfHdkuBPBUB1SS-9CVmYiXhxN3C3k' WHERE movie_id = 8;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1eKflQHoGhkpYVTg_sHK7tHrB3rDkB4Th' WHERE movie_id = 9;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1CLKPWI0d1My9b-EUdoDXe28snbMotOXU' WHERE movie_id = 10;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1WFPjBzVUlT0g-5e-4H1MJsLa7c-pE6An' WHERE movie_id = 11;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1VvZpBQUBBSfRZnxmaDwpY_hp7SW2dhXY' WHERE movie_id = 12;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1OHEPDrhal8hv3iZxEB3PkNzg2Q0tyv-K' WHERE movie_id = 13;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1cE1720uNGeXjEqGqmPETTrMNXj7m23M4' WHERE movie_id = 14;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=18z32wdwQucwksjYRYkckO6BgoDhTHDbp' WHERE movie_id = 15;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1nFO6isiyg5nmZPTz5yZ_9IMtbJwGv9v_' WHERE movie_id = 16;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1hRfJm3mqFUa2A_C1TNaRqxoMUr9EjITf' WHERE movie_id = 17;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1NTZPMQcSe6uRM41dcG2vdi-eAHGtZ5E7' WHERE movie_id = 18;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1hOlzX4rM-CQEOuSjYMWP7RncVRGpJjci' WHERE movie_id = 19;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1Mb2ax0YsAUfvd_ep59Ao4vlBwGsoPTqc' WHERE movie_id = 20;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1sHb1--QPEa11-YuW-oo4ndIJ6mhxvoy_' WHERE movie_id = 21;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1yeZAXOEhQjyFEGzh27PiWdVX2w9JJqb8' WHERE movie_id = 22;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=11Y9FOZIXciYrj3IjtuEB88hYlxR86bg_' WHERE movie_id = 29;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1JZP90RfsWKXm_LW7kTFGC9E8OdkF20eF' WHERE movie_id = 32;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1wEQEU0ScQSQfiw_nvZZmWftdaZdtbEbk' WHERE movie_id = 34;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1NIpmg66DEHtM0RcxcUTO5mvT5s1MOahJ' WHERE movie_id = 35;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1rzpY_ZWcBFY9IKyzLPMWfdLqKv_SjKTQ' WHERE movie_id = 37;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1eOu9C2vbYhRh1fZzj-eKm0ODgkXjfa99' WHERE movie_id = 38;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1OkRfkFsxjMUiGF6xn7fKYbMTfLrzb_tk' WHERE movie_id = 39;
UPDATE pdmv_movies set posterURL = 'https://drive.google.com/uc?id=1I_f-vLgeLTtwJ0Yw9H88lN0O-3llVzv1' WHERE movie_id = 40;

CREATE TABLE pdmv_mvchapters (
	chapter_id INT PRIMARY KEY AUTO_INCREMENT,
	movie_id INT NOT NULL,
	chapter_name NVARCHAR(255) NOT NULL,
	chapterURL TEXT,
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id)
);

INSERT INTO pdmv_mvchapters(movie_id, chapter_name, chapterURL)
VALUES
    (1, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (2, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (3, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (4, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (5, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (6, 'FULL', 'https://player.vimeo.com/video/854102726'),
	(7, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (8, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (9, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (10, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (11, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (12, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (13, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (14, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (15, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (16, 'FULL', 'https://player.vimeo.com/video/862448685'),
	(17, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (18, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (19, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (20, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (21, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (22, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (23, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (24, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (25, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (26, 'FULL', 'https://player.vimeo.com/video/854102726'),
	(27, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (28, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (29, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (30, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (31, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (32, 'FULL', 'https://player.vimeo.com/video/862448685'),
    (33, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (34, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (35, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (36, 'FULL', 'https://player.vimeo.com/video/862448685'),
	(37, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (38, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (39, 'FULL', 'https://player.vimeo.com/video/854102726'),
    (40, 'FULL-VN', 'https://player.vimeo.com/video/862448685'),
    (40, 'FULL-EN', 'https://player.vimeo.com/video/854102726');

CREATE TABLE pdmv_movies_genres (
	movie_id INT NOT NULL,
	mvgenre_id INT NOT NULL,
	FOREIGN KEY (mvgenre_id) REFERENCES pdmv_mvgenres(mvgenre_id),
	FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id),
	PRIMARY KEY (mvgenre_id, movie_id)
);

INSERT INTO pdmv_movies_genres (movie_id, mvgenre_id)
VALUES
	(1, 9),
	(1, 10),
    (1, 11),
    (1, 13),
    (2, 9),
	(2, 10),
    (2, 11),
    (2, 13),
    (3, 9),
	(3, 10),
    (3, 11),
    (3, 13),
    (4, 9),
	(4, 10),
    (4, 11),
    (4, 13),
    (5, 9),
	(5, 10),
    (5, 11),
    (5, 13),
    (6, 9),
	(6, 10),
    (6, 11),
    (6, 13),
    (7, 9),
	(7, 10),
    (7, 11),
    (7, 13),
    (8, 9),
	(8, 10),
    (8, 11),
    (8, 13),
    (9, 6),
    (9, 13),
    (10, 6),
    (10, 12),
    (10, 13),
    (11, 1),
    (11, 12),
    (11, 6),
    (12, 6),
    (12, 2),
    (13, 7),
    (13, 1),
    (13, 12),
    (14, 6),
    (14, 12),
    (15, 6),
    (15, 12),
    (16, 2),
    (16, 6),
    (17, 6),
    (17, 12),
    (18, 2),
    (18, 6),
    (19, 13),
    (19, 9),
    (20, 1),
    (20, 9),
    (21, 3),
    (21, 6),
    (22, 6),
    (22, 9),
    (23, 9),
    (23, 2),
    (24, 1),
    (24, 14),
    (25, 1),
    (26, 6),
    (27, 6),
    (28, 6),
    (28, 13),
    (29, 1),
    (29, 9),
    (30, 1),
    (30, 9),
    (30, 4),
    (31, 9),
    (32, 4),
    (33, 6),
    (34, 6),
    (35, 6),
    (35, 9),
    (36, 9),
    (36, 4),
    (37, 7),
    (37, 12),
    (38, 7),
    (38, 12),
    (39, 7),
    (39, 12),
    (40, 7),
    (40, 12);


CREATE TABLE pdmv_ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating DECIMAL(3,1) NOT NULL,
	ratingtime DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES pdmv_users(user_id),
    FOREIGN KEY (movie_id) REFERENCES pdmv_movies(movie_id),
	UNIQUE(user_id, movie_id)
);

INSERT INTO pdmv_ratings (user_id, movie_id, rating)
VALUES
    (3, 1, 3.0),
	(3, 5, 5.0),
	(3, 2, 4.0),
	(3, 4, 3.0),
	(3, 16, 5.0),
	(3, 31, 5.0),
	(3, 26, 4.0),
	(3, 36, 5.0),
	(3, 23, 5.0),
	(3, 21, 4.0),
    (4, 3, 3.0),
	(4, 1, 5.0),
	(4, 4, 2.0),
	(4, 13, 5.0),
	(4, 32, 5.0),
	(4, 35, 3.0),
	(4, 7, 2.0),
	(4, 40, 3.0),
	(4, 29, 4.0),
    (5, 3, 4.0),
	(5, 2, 5.0),
	(5, 36, 4.0),
    (6, 13, 4.0),
	(6, 21, 5.0),
	(6, 14, 4.0),
	(6, 15, 4.0),
	(6, 34, 3.0),
	(6, 35, 3.0),
	(6, 22, 5.0),
	(6, 3, 4.0),
    (7, 3, 4.0),
	(7, 13, 3.0),
	(7, 23, 4.0),
	(7, 33, 4.0),
    (7, 12, 4.0),
	(7, 21, 5.0),
	(7, 34, 5.0),
	(7, 15, 3.0),
	(7, 16, 4.0),
	(7, 17, 4.0),
	(7, 11, 3.0),
	(7, 29, 5.0),
    (7, 40, 5.0),
	(7, 26, 2.0),
	(7, 27, 2.0),
	(7, 31, 5.0),
	(7, 7, 5.0),
	(8, 3, 4.0),
	(8, 13, 3.0),
	(8, 23, 4.0),
	(8, 33, 4.0),
    (8, 12, 4.0),
	(8, 21, 5.0),
	(8, 34, 5.0),
	(8, 15, 3.0),
	(8, 16, 4.0),
	(8, 17, 4.0),
	(8, 11, 3.0),
	(8, 29, 5.0),
    (8, 40, 5.0),
	(8, 26, 2.0),
	(8, 27, 2.0),
	(8, 31, 5.0),
    (9, 3, 5.0),
	(9, 13, 4.0),
    (10, 3, 5.0),
	(10, 1, 4.0),
	(10, 33, 4.0),
    (11, 1, 3.0),
	(11, 15, 3.0),
    (12, 16, 4.0),
	(12, 26, 5.0),
	(12, 6, 3.0),
	(12, 36, 3.0),
    (13, 4, 4.0),
	(13, 37, 4.0),
    (14, 4, 5.0),
	(14, 14, 4.0),
    (15, 4, 5.0),
	(15, 24, 4.0),
	(16, 5, 3.0),
	(16, 19, 4.0),
    (17, 6, 4.0),
	(17, 21, 4.0),
    (18, 4, 4.0),
	(18, 24, 5.0),
    (19, 4, 5.0),
	(19, 33, 3.0),
	(19, 22, 5.0),
    (20, 4, 5.0);

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
    SELECT * FROM USER_LIST WHERE cosine_similarity > 0 ORDER BY cosine_similarity DESC;
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
		pdmv_movies.*, AVG(pdmv_ratings.rating) as mvrating
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
    (7, 37, 'Phim này hay tuyệt'),
	(8, 37, 'Khá hay');

CREATE TABLE pdmv_errors (
	err_id INT PRIMARY KEY AUTO_INCREMENT,
	errContent TEXT
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

UPDATE pdmv_movies
SET movie_url = convertToURL(title_en);

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

/* LARAVEL
INSERT INTO users (id, name, password, acctype_id)
SELECT acc_id, usname, password, acctype_id FROM pdmv_accounts;


UPDATE users
INNER JOIN pdmv_users ON users.id = pdmv_users.user_id
SET users.email = pdmv_users.email, users.fullname = pdmv_users.fullname;
*/
