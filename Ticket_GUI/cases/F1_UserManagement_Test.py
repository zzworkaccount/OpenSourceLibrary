import time,unittest

from BeautifulReport import BeautifulReport

from data.Get_TestData.Get_F1_UMT_Data import Get_UM_TestData
from lib.F1_UserManagement_Action import User_management
from tools.util import Utility
from parameterized import parameterized

from uimap.Get_Element.Get_F1_UM_Element import Get_UM_ElementData


class UM_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.um = User_management()
        self.um.driver.maximize_window()

    @parameterized.expand(Get_UM_TestData.get_User_management_excel_data())
    @BeautifulReport.add_test_img('')
    def testUserManagement(self,username, execpect,case_name):
        self.um.do_Usermanagement(Get_UM_ElementData.get_User_management_ele_data(),username)
        time.sleep(5)
        if case_name == "查询成功":
            ele_list = self.um.driver.find_elements_by_xpath \
                ('/html/body/div[1]/div[1]/div[2]/table/tbody/tr/td[3]/div')
            db_username = Utility.query_all("select c_username from cinema_users")[0][0]
            print(db_username)
            # 断言
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

    def save_img(self, img_name):
        driver = self.um.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.um.driver.close()

if __name__ == '__main__':
    unittest.main()