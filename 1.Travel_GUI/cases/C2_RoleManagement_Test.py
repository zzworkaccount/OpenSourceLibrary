import os
import time,unittest

from BeautifulReport import BeautifulReport

from data.Get_TestData.Get_B2_RMT_Data import Get_RM_TestData
from lib.B2_RoleManagement_Action import Role_Action
from tools.util import Utility

from parameterized import parameterized

from uimap.Get_Element.Get_B2_RM_Element import Get_RM_ElementData
path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

class S_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.st = Role_Action()
        self.st.driver.maximize_window()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    @parameterized.expand(Get_RM_TestData.get_SystemManagement_excel_data())
    @BeautifulReport.add_test_img('')
    def testSystemManagement(self,username,remarks, execpect,case_name):
        self.st.do_SystemManagement(Get_RM_ElementData.get_SystemManagement_ele_data(),username,remarks)
        time.sleep(5)
        if case_name == "正确的添加角色":
            ele_list = self.st.driver.find_elements_by_xpath\
                ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
            db_username = Utility.query_one(f"select name from sys_role where name='{username}'")[0]
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
        elif case_name == "备注为空添加角色":
            ele_list = self.st.driver.find_elements_by_xpath \
                ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
            db_username = Utility.query_one(f"select name from sys_role where name='{username}'")
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

    @parameterized.expand(Get_RM_TestData.get_add_role_excel_data())
    @BeautifulReport.add_test_img('')
    def testaddrole(self,execpect,case_name):
        ele_list1 = self.st.driver.find_elements_by_xpath \
            ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
        self.st.do_delete(Get_RM_ElementData.get_SystemManagement_ele_data())
        if case_name == "删除成功":
            ele_list2 = self.st.driver.find_elements_by_xpath \
                             ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
            if len(ele_list1) == len(ele_list2):
                result = 'delete_fail'
            else:
                result = 'delete_pass'
        self.assertEqual(result, execpect)

    def save_img(self, img_name):
        driver = self.st.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.st.driver.close()

if __name__ == '__main__':
    unittest.main()
