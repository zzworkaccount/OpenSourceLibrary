# app影片
import unittest
import warnings
from json import JSONDecodeError

from parameterized import parameterized

from data.Get_TestData.Get_C1_F_Data import Get_F_TestData
from lib.C1_Film_Action import F_Action
from tools.service import Service
from tools.util import Utility


class F_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.f = F_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)


    # 查询
    @parameterized.expand(Get_F_TestData.get_f_film_query_excel_data())
    def test_film_query(self , url , method , casesname , expect):
        res = self.f.do_film_query(url , method)
        centent = res.json()

        # 断言
        if casesname == '查询所有演员':
            if centent['count'] == 2:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'
        elif casesname == '查询不存在的演员id':
            if centent['count'] == 0:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'
        elif casesname == '查询演员id为特殊字符':
            if centent['count'] == 0:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'
        Utility.logger(casesname,centent['count'],resutl,expect)
        self.assertEqual(resutl,expect)


    # 影院查询
    @parameterized.expand(Get_F_TestData.get_f_movie_query_excel_data())
    def test_movie_query(self , url , method , casesname , expect):
        res = self.f.do_movie_query(url , method)
        centent = res.json()

        # 断言
        if casesname == '查询所有影院':
            if len(centent) == 4:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'
        elif casesname == '查询不存在的影院id':
            if len(centent) == 0:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'
        elif casesname == '查询影院id为特殊字符':
            if len(centent) == 0:
                resutl = 'query-test-pass'
            else:
                resutl = 'query-test-fail'

        Utility.logger(casesname,len(centent),resutl,expect)
        self.assertEqual(resutl,expect)


    # 登录
    @parameterized.expand(Get_F_TestData.get_f_login_excel_data())
    def test_login(self , url , method , phone , pwd , casesname , expect):
        login_data = {"URL":url , "METHOD":method , "DATA":{"phone":phone , "pwd":pwd} , "CASESNAME":casesname , "EXPCET":expect}
        res = self.f.do_login(login_data["URL"] , login_data["METHOD"] , login_data["DATA"])
        centent = res.json()

        # 断言
        if login_data["CASESNAME"] == "用户名密码正确":
            if centent['msg'] == '验证通过':
                resutl = 'login-test-pass'
            else:
                resutl = 'login-test-fail'
            Utility.logger(casesname, centent['msg'], resutl, expect)
            self.assertEqual(resutl, expect)
        elif login_data["CASESNAME"] == "用户名错误":
            if "Error" in centent['error']:
                resutl = 'login-test-pass'
            else:
                resutl = 'login-test-fail'
            Utility.logger(casesname, centent['error'], resutl, expect)
            self.assertEqual(resutl, expect)
        elif login_data["CASESNAME"] == "密码错误":
            if "Error" in centent['error']:
                resutl = 'login-test-pass'
            else:
                resutl = 'login-test-fail'
            Utility.logger(casesname, centent['error'], resutl, expect)
            self.assertEqual(resutl, expect)


    # 影厅查询
    @parameterized.expand(Get_F_TestData.get_f_movie_hall_excel_data())
    def test_movie_hall(self , url , method , casesname , expect):
        flag = False
        res = self.f.do_cow6_movie_hall(url, method)
        try:
            centent = res.json()
            flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if casesname == "存在的影厅id" and flag:
            if centent['movieOffice']['officeName'] == '1号厅':
                resutl = 'movie-hall-test-pass'
            else:
                resutl = 'movie-hall-test-fail'
            Utility.logger(casesname, centent['movieOffice']['officeName'], resutl, expect)
            self.assertEqual(resutl, expect)
        elif casesname == "不存在的影厅id":
            if flag:
                resutl = 'movie-hall-test-pass'
            else:
                resutl = 'movie-hall-test-fail'
            Utility.logger(casesname, flag, resutl, expect)
            self.assertEqual(resutl, expect)
        elif casesname == "影厅id为特殊字符":
            if flag:
                resutl = 'movie-hall-test-pass'
            else:
                resutl = 'movie-hall-test-fail'
            Utility.logger(casesname, flag, resutl, expect)
            self.assertEqual(resutl, expect)


    # 即将上映影片查询
    @parameterized.expand(Get_F_TestData.get_f_comingo_soon_movie_hall_excel_data())
    def test_comingo_soon_movie_hall_query(self , url , method , casesname , expect):
        flag = False
        res = self.f.do_coming_soon_video_query(url , method)
        try:
            centent = res.json()
            flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if  flag:
            resutl = 'coming-soon-movie-hall-query-test-pass'
        else:
            resutl = 'coming-soon-movie-hall-query-test-fail'

        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl, expect)


    # 影片图片查询
    @parameterized.expand(Get_F_TestData.get_f_coming_soon_video_excel_data())
    def test_coming_soon_video_query(self , url , method , casesname , expect):
        res = self.f.do_coming_soon_video_query(url , method)
        centen = res.json()

        # 断言
        if centen['count']  == 1:
            resutl = 'coming-soon-video-query-test-pass'
        else:
            resutl = 'coming-soon-video-query-test-fail'
        Utility.logger(casesname,centen['count'],resutl,expect)
        self.assertEqual(resutl,expect)


    # 青羊万达影厅查询
    @parameterized.expand(Get_F_TestData.get_f_sheet_movie_hall_excel_data())
    def test_sheet_movie_hall(self , url , method , casesname , expect):
        res = self.f.do_sheet_movie_hall(url , method)
        flag = False
        try:
            centent = res.json()
            if centent['cinema']['cName'] == '青羊万达电影院':
                flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if casesname == "查询青羊存在的影厅id":
            if flag:
                resutl = 'sheet-movie-hall-test-pass'
            else:
                resutl = 'sheet-movie-hall-test-fail'
        elif casesname == "查询青羊不存在的影厅id":
            if flag:
                resutl = 'sheet-movie-hall-test-pass'
            else:
                resutl = 'sheet-movie-hall-test-fail'
        elif casesname == "查询青羊影厅id为特殊字符":
            if flag:
                resutl = 'sheet-movie-hall-test-pass'
            else:
                resutl = 'sheet-movie-hall-test-fail'
        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl, expect)


    # 高新万达影厅查询
    @parameterized.expand(Get_F_TestData.get_f_new_movie_hall_excel_data())
    def test_new_movie_hall(self , url , method , casesname , expect):
        res = self.f.do_new_movie_hall(url , method)
        flag = False
        try:
            centent = res.json()
            if centent['cinema']['cName'] == '高新万达电影院':
                flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if casesname == "查询高新存在的影厅id":
            if flag:
                resutl = 'new_movie_hall-test-pass'
            else:
                resutl = 'new_movie_hall-test-fail'
        elif casesname == "查询高新不存在的影厅id":
            if flag:
                resutl = 'new_movie_hall-test-pass'
            else:
                resutl = 'new_movie_hall-test-fail'
        elif casesname == "查询高新影厅id为特殊字符":
            if flag:
                resutl = 'new_movie_hall-test-pass'
            else:
                resutl = 'new_movie_hall-test-fail'
        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl, expect)


    # 金牛万达影厅2点场查询
    @parameterized.expand(Get_F_TestData.get_f_cow2_movie_hall_excel_data())
    def test_cow2_movie_hall(self , url , method , casesname , expect):
        res = self.f.do_cow2_movie_hall(url , method)
        flag = False
        try:
            centent = res.json()
            if '02:00:00' in centent['begintime']:
                flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if casesname == "查询金牛2点场存在的影厅id":
            if flag:
                resutl = 'cow2_movie_hall-test-pass'
            else:
                resutl = 'cow2_movie_hall-test-fail'
        elif casesname == "查询金牛2点场不存在的影厅id":
            if flag:
                resutl = 'cow2_movie_hall-test-pass'
            else:
                resutl = 'cow2_movie_hall-test-fail'
        elif casesname == "查询金牛2点场影厅id为特殊字符":
            if flag:
                resutl = 'cow2_movie_hall-test-pass'
            else:
                resutl = 'cow2_movie_hall-test-fail'
        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl, expect)


    # 确认选座
    @parameterized.expand(Get_F_TestData.get_f_choose_seat_excel_data())
    def test_choose_seat(self,url,method,uid,tickets,cid,mid,sid,sessionPrice,totalPrice,seatno,casesname,expect):
        choose_seat_data = {"URL":url , "METHOD":method,
                            "DATA":{'uid':uid,"tickets":tickets,"cid":cid,'mid':mid,'sid':sid,
                                    'sessionPrice':sessionPrice,'totalPrice':totalPrice,'seatno':seatno},
                            "CASESNAME":casesname,"EXPECT":expect}
        res = self.f.do_choose_seat(choose_seat_data["URL"] , choose_seat_data["METHOD"] , choose_seat_data["DATA"])
        flag = False
        try:
            centent = res.json()
            if centent['status'] == 200:
                flag = True
        except JSONDecodeError:
            flag = False

        # 断言
        if casesname == "成功选座":
            if flag:
                resutl = 'choose_seat-test-pass'
            else:
                resutl = 'choose_seat-test-fail'
        elif casesname == "选座失败":
            if flag:
                resutl = 'choose_seat-test-pass'
            else:
                resutl = 'choose_seat-test-fail'
        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl, expect)


if __name__ == '__main__':
    unittest.main(verbosity=2)