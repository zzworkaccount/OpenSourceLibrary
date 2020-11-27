import os
import unittest

from BeautifulReport import BeautifulReport
from parameterized import parameterized

from data.Get_TestData.Get_B3_CPT_Data import Get_CP_TestData
from lib.B3_ChangePassword_Action import CP_Action
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import sys

from uimap.Get_Element.Get_B1_AL_Element import Get_AL_ElementData
from uimap.Get_Element.Get_B3_CP_Element import Get_CP_ElementData

sys.path.append('D:\\pyFileDM_New\\WoniuTicket_GUI\\data')
path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

class CP_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.cp = CP_Action()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    @parameterized.expand(Get_CP_TestData.get_CP_password_excel_data())
    @BeautifulReport.add_test_img('')
    def test_cp(self, old_password , new_password , confirm_password , account , login_verifycode , Excepted , casesname):
        f"""{casesname}"""
        flag = False
        self.cp.do_changepassword(Get_CP_ElementData.get_cp_ele_data(), old_password , new_password , confirm_password)
        ele_data = Get_CP_ElementData.get_cp_ele_data()
        f"""{casesname}"""
        if casesname == '输入正确的旧密码':
            try:
                self.cp.Relogin(ele_data, account, new_password, login_verifycode)
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.cp.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_text = self.cp.driver.find_element_by_xpath \
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_text == '控制台':
                    flag = True
            except BaseException:
                flag = False
            # 断言
            if flag:
                result = 'edit-ps-pass'
            else:
                result = 'edit-ps-fail'
            self.assertEqual(result , Excepted)

        if casesname == '输入错误的旧密码':
            try:
                self.cp.Relogin(ele_data, account, new_password, login_verifycode)
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.cp.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_text = self.cp.driver.find_element_by_xpath \
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_text == '控制台':
                    flag = False
            except BaseException:
                flag = True
            # 断言
            if flag:
                result = 'edit-ps-pass'
            else:
                result = 'edit-ps-fail'
            self.assertEqual(result, Excepted)

        if casesname == '新密码和确认密码不一致':
            try:
                self.cp.Relogin(ele_data, account, new_password, login_verifycode)
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.cp.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_text = self.cp.driver.find_element_by_xpath \
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_text == '控制台':
                    flag = False
            except BaseException:
                flag = True
            # 断言
            if flag:
                result = 'edit-ps-pass'
            else:
                result = 'edit-ps-fail'
            self.assertEqual(result, Excepted)

    def save_img(self , img_name):
        driver = self.cp.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.cp.driver.close()

if __name__ == '__main__':
    unittest.main(verbosity=2)
