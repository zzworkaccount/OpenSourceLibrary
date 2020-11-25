import time,unittest

from BeautifulReport import BeautifulReport

from data.Get_TestData.Get_L1_AMT_Data import Get_AM_TestData
from lib.L1_ActorManagement_Action import Film_management
from tools.util import Utility

from parameterized import parameterized

from uimap.Get_Element.Get_L1_AM_Element import Get_AM_ElementData


class AT_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.fm = Film_management()
        self.fm.driver.maximize_window()

    @parameterized.expand(Get_AM_TestData.get_Actor_management_excel_data())
    @BeautifulReport.add_test_img('')
    def testFilmManagement(self, username, identity, execpect, case_name):
        self.fm.do_FilmManagement(Get_AM_ElementData.get_Actor_management_ele_data(), username, identity)
        time.sleep(5)
        if case_name == "正确添加职演人员":
            ele_list = self.fm.driver.find_elements_by_xpath \
                ('/html/body/form/div/div[1]/div[2]/table/tbody/tr/td[3]/div')
            db_username = Utility.query_all("select real_name from movie_actor")[2][0]
            # 断言
            print(db_username)
            result = ""
            for i in ele_list:
                print(i.text)
                if username == i.text and username == db_username:
                    result = 'add_pass'
                    break
                else:
                    result = 'add_fail'
                    continue
            self.assertEqual(result, execpect)
        elif case_name == "身份为空添加职演人员":
            ele_list = self.fm.driver.find_elements_by_xpath \
                ('/html/body/form/div/div[1]/div[2]/table/tbody/tr')
            db_username = Utility.query_all("select real_name from movie_actor")
            # 断言
            a = list(db_username)
            print(type(a))
            result = ""
            for i in ele_list:
                if username not in i.text and username not in a:
                    result = 'add_pass'
                    break
                else:
                    result = 'add_fail'
                    continue
            self.assertEqual(result, execpect)


    @parameterized.expand(Get_AM_TestData.get_edit_excel_data())
    @BeautifulReport.add_test_img('')
    def testeditFilmManagement(self,username, identity,execpect,case_name):
        self.fm.do_edit_FM(Get_AM_ElementData.get_Actor_management_ele_data(),username,identity)
        time.sleep(5)
        if case_name == "成功修改":
            ele_list = self.fm.driver.find_elements_by_xpath \
                ('/html/body/form/div/div[1]/div[2]/table/tbody/tr/td[3]')
            db_username = Utility.query_all("select real_name from movie_actor")[0][0]
            # 断言
            result = ""
            for i in ele_list:
                if username == i.text and username == db_username:
                    result = 'add_pass'
                    break
                else:
                    result = 'add_fail'
                    continue
            self.assertEqual(result, execpect)

        elif case_name == "修改失败":
            ele_list = self.fm.driver.find_elements_by_xpath \
                ('/html/body/form/div/div[1]/div[2]/table/tbody/tr/td[3]')
            db_username = Utility.query_all("select real_name from movie_actor")[0][0]
            # 断言
            result = ""
            for i in ele_list:
                if username not in i.text and username != db_username:
                    result = 'add_pass'
                    break
                else:
                    result = 'add_fail'
                    continue
            self.assertEqual(result, execpect)

    def save_img(self, img_name):
        driver = self.fm.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.fm.driver.close()

if __name__ == '__main__':
    unittest.main()