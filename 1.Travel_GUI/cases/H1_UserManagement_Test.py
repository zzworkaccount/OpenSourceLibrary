import os
import unittest

from BeautifulReport import BeautifulReport
from parameterized import parameterized

from data.Get_TestData.Get_H1_UMT_Data import Get_UL_TestData
from lib.H1_UserList_Action import UL_Action
from tools.util import Utility
from uimap.Get_Element.Get_H1_GM_Element import Get_UL_ElementData

path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

element_list = Get_UL_ElementData().get_ul_ele_data()
class UM_Test(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    def setUp(self) -> None:
        self.ul = UL_Action()

    @parameterized.expand(Get_UL_TestData.get_user_management_excel_data_add())
    @BeautifulReport.add_test_img('')
    def test_add(self, add_username, add_phone, add_email, expect, cases_name):
        # 1.断言所有必填项
        if cases_name == '所有必填项正确':
            # 调用新增动作
            self.ul.add_user(element_list, add_username, add_phone, add_email)
            # 进入iframe
            self.ul.driver.switch_to.frame(self.ul.driver.find_element_by_xpath("//iframe[contains(@src,'User_Management')]"))
            # 获取列表
            lists = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            # 查询数据库
            db_username = Utility.query_one(f"select name from users where name='{add_username}'")
            result = ""
            for item in lists:
                if add_username == item.text and (add_username in db_username):
                    result = "add_pass"
                    break
                else:
                    result = "add_fail"
                    continue
            self.assertEqual(expect, result)

        # 2.断言用户名为空
        if cases_name == '用户名为空':
            # 调用新增动作
            self.ul.add_user(element_list, add_username, add_phone, add_email)
            # 进入iframe
            self.ul.driver.switch_to.frame(
                self.ul.driver.find_element_by_xpath("//iframe[contains(@src,'User_Management')]"))
            # 获取列表
            lists = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            # 查询数据库
            db_username = Utility.query_one(f"select count(name) from users")
            if len(lists) == db_username:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(expect, result)

        # 3.断言手机号长度错误
        if cases_name == '手机号长度错误':
            # 查询数据库(新增之前查询数据库)
            name_count1 = Utility.query_one(f"select count(name) from users")
            # 调用新增动作
            self.ul.add_user(element_list, add_username, add_phone, add_email)
            # 查询数据库(新增之后再次查询数据库)
            name_count2 = Utility.query_one(f"select count(name) from users")
            if name_count1 == name_count2:
                result = "add_fail"
            else:
                result = "add_pass"
            self.assertEqual(expect, result)

        # 4.断言手机号格式不合法
        if cases_name == '手机号格式不合法':
            # 调用新增动作
            self.ul.add_user(element_list, add_username, add_phone, add_email)
            # 进入iframe
            self.ul.driver.switch_to.frame(
                self.ul.driver.find_element_by_xpath("//iframe[contains(@src,'User_Management')]"))
            # 获取列表
            lists = self.ul.driver.find_elements(element_list[0][19], element_list[1][19])
            # 查询数据库
            db_phone = Utility.query_one(f"select phone from users where phone='{add_phone}'")
            result = ""
            for item in lists:
                if db_phone != item.text and (add_phone not in db_phone):
                    result = "add_fail"
                    break
                else:
                    result = "add_pass"
                    continue
            self.assertEqual(expect, result)

        # 5.断言邮箱格式错误
        if cases_name == '邮箱格式错误':
            # 查询数据库(新增之前查询数据库)
            email_count1 = Utility.query_one(f"select count(email) from users")
            # 调用新增动作
            self.ul.add_user(Get_UL_ElementData().get_ul_ele_data(), add_username, add_phone, add_email)
            # 查询数据库(新增之后再次查询数据库)
            email_count2 = Utility.query_one(f"select count(email) from users")
            if email_count1 == email_count2:
                result = "add_fail"
            else:
                result = "add_pass"
            self.assertEqual(expect, result)

    @parameterized.expand(Get_UL_TestData.get_user_management_excel_data_delete())
    @BeautifulReport.add_test_img('')
    def test_delete1(self, expect, cases_name):
        # 1.删除单个
        if cases_name == "删除单个":
            lists_length1 = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            self.ul.delete_user1(element_list)
            # 获取列表
            lists_length2 = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            if len(lists_length1) == len(lists_length2):
                result = "delete_fail"
            else:
                result = "delete_pass"
            self.assertEqual(result, expect)

        # 2.删除多个
        if cases_name == "删除多个":
            lists_length1 = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            self.ul.delete_user2(element_list)
            # 获取列表
            lists_length2 = self.ul.driver.find_elements(element_list[0][18], element_list[1][18])
            if len(lists_length1) == len(lists_length2)-2:
                result = "delete_fail"
            else:
                result = "delete_pass"
            self.assertEqual(result, expect)

        # 3.删除所有
        if cases_name == "删除所有":
            self.ul.delete_user3(element_list)
            list_name = self.ul.driver.find_element(element_list[0][26], element_list[1][26])
            if list_name.text == "无数据":
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, expect)

    def save_img(self, img_name):
        driver = self.ul.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.ul.driver.close()

if __name__ == '__main__':
    unittest.main()