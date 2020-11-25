import os
import time
import unittest

from BeautifulReport import BeautifulReport
from parameterized import parameterized

from data.Get_TestData.Get_A_PM_Data import Get_PM_TestData
from lib.A_Publish_Management_Action import PM_Action
from tools.util import Utility
from uimap.Get_Element.Get_A_PM_Element import Get_PM_ElementData

path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

element_list = Get_PM_ElementData().get_pm_ele_data_edit()
class LM_Test(unittest.TestCase):

    # @classmethod
    # def setUpClass(cls) -> None:
    #     os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    def setUp(self) -> None:
        self.ul = PM_Action()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")


    @parameterized.expand(Get_PM_TestData.get_user_management_excel_data_edit1())
    @BeautifulReport.add_test_img('')
    def test_edit1(self, name, expected, cases_name):
        flag = False
        # 1.断言修改电影名称
        if cases_name == '修改电影名称':
            self.ul.edit_user1(element_list, name)
            try:

                db_username = Utility.query_one(f"select movie_name from movie_info where movie_name='{name}'")
                if db_username[0] == name:
                    flag = True
            except BaseException:
                return flag

            if flag:
                result = "edit_pass"
            else:
                result = "edit_fail"
            print(flag)
            print(result)
            print(expected)
            self.assertEqual(result, expected)

    @parameterized.expand(Get_PM_TestData.get_user_management_excel_data_edit2())
    @BeautifulReport.add_test_img('')
    def test_edit2(self, times, expect, cases_name):
        # 2.断言修改电影时长
        if cases_name == '修改电影时长':
            self.ul.edit_user3(element_list, times)
            db_username = Utility.query_one(f"select duration from movie_info where duration='{times}'")
            if db_username[0] == times:
                result = "edit_pass"
            else:
                result = "edit_fail"
            self.assertEqual(result, expect)

    @parameterized.expand(Get_PM_TestData.get_user_management_excel_data_edit3())
    @BeautifulReport.add_test_img('')
    def test_edit3(self, wd, expect, cases_name):
        # 3.断言修改电影维度
        if cases_name == '修改电影维度':
            self.ul.edit_user4(element_list, wd)
            db_username = Utility.query_one(f"select dimensional from movie_info where dimensional='{wd}'")
            if db_username[0] == wd:
                result = "edit_pass"
            else:
                result = "edit_fail"
            self.assertEqual(result, expect)

    @parameterized.expand(Get_PM_TestData.get_user_management_excel_data_edit4())
    @BeautifulReport.add_test_img('')
    def test_edit4(self, language, expect, cases_name):
        # 4.断言修改电影时长
        if cases_name == '修改电影时长':
            self.ul.edit_user5(element_list, language)
            db_username = Utility.query_one(f"select language from movie_info where language='{language}'")
            if db_username[0] == language:
                result = "edit_pass"
            else:
                result = "edit_fail"
            self.assertEqual(result, expect)

    @parameterized.expand(Get_PM_TestData.get_user_management_excel_data_find())
    @BeautifulReport.add_test_img('')
    def test_select(self, name, expect, cases_name):
        if cases_name == '电影名称精确查询':
            self.ul.select_user1(element_list, name)
            list_name = self.ul.driver.find_elements(element_list[0][12], element_list[1][12])
            result = ""
            for item in list_name:
                if item.text == name:
                    result = "select_pass"
                    break
                else:
                    result = "select_fail"
                    continue
            self.assertEqual(result, expect)

        if cases_name == '电影名称模糊查询':
            self.ul.select_user1(element_list, name)
            list_name = self.ul.driver.find_elements(element_list[0][12], element_list[1][12])
            result = ""
            for item in list_name:
                if name in item.text:
                    result = "select_pass"
                    break
                else:
                    result = "select_fail"
                    continue
            self.assertEqual(result, expect)

        if cases_name == '无效查询':
            self.ul.select_user2(element_list, name)
            list_name = self.ul.driver.find_elements(element_list[0][12], element_list[1][12])
            result = ""
            for item in list_name:
                if name not in item.text:
                    result = "select_pass"
                    break
                else:
                    result = "select_fail"
                    continue
            self.assertEqual(result, expect)


    def save_img(self, img_name):
        driver = self.ul.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.ul.driver.close()

if __name__ == '__main__':
    unittest.main()