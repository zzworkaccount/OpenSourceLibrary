from tools.util import Utility


class Get_F_TestData:


    # 获取影片数据
    @classmethod
    def get_f_film_query_excel_data(cls):
        f_query_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[0]
        f_query_data = Utility.get_excel(f_query_info)
        return f_query_data

    # 获取影院数据
    @classmethod
    def get_f_movie_query_excel_data(cls):
        f_query_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[1]
        f_query_data = Utility.get_excel(f_query_info)
        return f_query_data


    # 登录
    @classmethod
    def get_f_login_excel_data(cls):
        f_login_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[2]
        f_login_data = Utility.get_excel(f_login_info)
        return f_login_data

    # 影厅
    @classmethod
    def get_f_movie_hall_excel_data(cls):
        f_movie_hall_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[3]
        f_movie_hall_data = Utility.get_excel(f_movie_hall_info)
        return f_movie_hall_data


    # 即将上映影片查询
    @classmethod
    def get_f_comingo_soon_movie_hall_excel_data(cls):
        f_comingo_soon_movie_hall_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[4]
        f_comingo_soon_movie_hall_data = Utility.get_excel(f_comingo_soon_movie_hall_info)
        return f_comingo_soon_movie_hall_data


    # 影片图片查询
    @classmethod
    def get_f_coming_soon_video_excel_data(cls):
        f_coming_soon_video_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[5]
        f_coming_soon_video_data = Utility.get_excel(f_coming_soon_video_info)
        return f_coming_soon_video_data


    # 青羊万达影厅查询
    @classmethod
    def get_f_sheet_movie_hall_excel_data(cls):
        f_sheet_movie_hall_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[6]
        f_sheet_movie_hall_data = Utility.get_excel(f_sheet_movie_hall_info)
        return f_sheet_movie_hall_data


    # 高新万达影厅查询
    @classmethod
    def get_f_new_movie_hall_excel_data(cls):
        f_new_movie_hall_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[7]
        f_new_movie_hall_data = Utility.get_excel(f_new_movie_hall_info)
        return f_new_movie_hall_data


    # 金牛万达影厅2:00场查询
    @classmethod
    def get_f_cow2_movie_hall_excel_data(cls):
        f_cow2_movie_hall_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[8]
        f_cow2_movie_hall_data = Utility.get_excel(f_cow2_movie_hall_info)
        return f_cow2_movie_hall_data


    # 金牛万达影厅2:00场查询
    @classmethod
    def get_f_choose_seat_excel_data(cls):
        f_choose_seat_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\C_FT.conf')[9]
        f_choose_seat_data = Utility.get_excel(f_choose_seat_info)
        return f_choose_seat_data


if __name__ == '__main__':
    # print(Get_F_TestData.get_f_film_query_excel_data())
    # print(Get_F_TestData.get_f_movie_query_excel_data())
    # print(Get_F_TestData.get_f_login_excel_data())
    # print(Get_F_TestData.get_f_movie_hall_excel_data())
    # print(Get_F_TestData.get_f_comingo_soon_movie_hall_excel_data())
    # print(Get_F_TestData.get_f_coming_soon_video_excel_data())
    # print(Get_F_TestData.get_f_sheet_movie_hall_excel_data())
    # print(Get_F_TestData.get_f_new_movie_hall_excel_data())
    # print(Get_F_TestData.get_f_cow2_movie_hall_excel_data())
    print(Get_F_TestData.get_f_choose_seat_excel_data())