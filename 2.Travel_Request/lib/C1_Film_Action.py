
class F_Action:

    def __init__(self , session):
        self.session = session


    # 影片查询
    def do_film_query(self , film_query_url , film_query_method):
        return self.session.request(url=film_query_url , method=film_query_method)


    # 影院查询
    def do_movie_query(self , movie_query_url , movie_query_method):
        return self.session.request(url=movie_query_url, method=movie_query_method)


    # 登录
    def do_login(self , login_url , login_method , login_data):
        return self.session.request(url=login_url, method=login_method , data=login_data)


    # 金牛万达影厅6:00场查询
    def do_cow6_movie_hall(self , movie_hall_url , movie_hall_method):
        return self.session.request(url=movie_hall_url, method=movie_hall_method)


    # 即将上映影片查询
    def do_comingo_soon_movie_hall_query(self , comingo_soon_movie_hall_url , comingo_soon_movie_hall_method):
        return self.session.request(url=comingo_soon_movie_hall_url, method=comingo_soon_movie_hall_method)


    # 影片图片查询
    def do_coming_soon_video_query(self , coming_soon_video_url , coming_soon_video_method):
        return self.session.request(url=coming_soon_video_url, method=coming_soon_video_method)

    # 青羊万达影厅查询
    def do_sheet_movie_hall(self, movie_hall_url, movie_hall_method):
        return self.session.request(url=movie_hall_url, method=movie_hall_method)


    # 高新万达影厅查询
    def do_new_movie_hall(self, movie_hall_url, movie_hall_method):
        return self.session.request(url=movie_hall_url, method=movie_hall_method)


    # 金牛万达影厅2:00场查询
    def do_cow2_movie_hall(self , movie_hall_url , movie_hall_method):
        return self.session.request(url=movie_hall_url, method=movie_hall_method)


    # 确认选座
    def do_choose_seat(self , choose_seat_url , choose_seat_method , choose_seat_data):
        return self.session.request(url=choose_seat_url, method=choose_seat_method , data=choose_seat_data)




