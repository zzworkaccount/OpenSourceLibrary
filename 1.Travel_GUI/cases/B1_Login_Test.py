# 测试登录
import os
import time
import unittest

from BeautifulReport import BeautifulReport
from parameterized import parameterized

from data.Get_TestData.Get_A1_LT_Data import Get_LG_TestData
from lib.A1_Login_Action import L_Action
from uimap.Get_Element.Get_A1_LT_Element import Get_LG_ElementData
path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

class L_Test(unittest.TestCase):



    def setUp(self) -> None:
        self.login = L_Action()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    @parameterized.expand(Get_LG_TestData.get_login_excel_data())
    @BeautifulReport.add_test_img('')
    def testlogin(self,username , password , verifycode , execpect , casesname):
        self.login.do_login(Get_LG_ElementData.get_login_ele_data() , username , password , verifycode)
        time.sleep(3)
        flag = False
        # 断言
        try:
            sys_notice_text = self.login.driver.find_element_by_xpath('/html/body/div[4]/div[1]').text
            if sys_notice_text == '系统公告':
                flag = True
        except BaseException:
            return flag
        # 断言
        if flag:
            result = 'login-pass'
        else:
            result = 'login-fail'

        self.assertEqual(result,execpect)

    def save_img(self , img_name):
        driver = self.login.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.login.driver.close()

if __name__ == '__main__':
    unittest.main(verbosity=2)