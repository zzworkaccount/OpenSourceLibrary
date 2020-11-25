import os
import unittest
import time
from BeautifulReport import BeautifulReport
from parameterized import parameterized
from selenium.common.exceptions import StaleElementReferenceException
from data.Get_TestData.Get_B1_ALT_Data import Get_AL_TestData
from lib.B1_AdministratorList_Action import AL_Action
from tools.service import Service
from tools.util import Utility
from uimap.Get_Element.Get_B1_AL_Element import Get_AL_ElementData
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import sys
sys.path.append('D:\\pyFileDM_New\\WoniuTicket_GUI\\data')
path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'



class AL_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.al = AL_Action()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    # 新增
    @parameterized.expand(Get_AL_TestData.get_al_add_excel_data())
    @BeautifulReport.add_test_img('')
    def test_al_add(self , account , username , phone , email , password , fulladdr , login_verifycode , Expected , casesname):
        f"""{casesname}"""
        ele_data = Get_AL_ElementData.get_sm_ele_data()
        account_list = []
        try:
            self.al.do_add_username\
                (ele_data, account , username , phone , email , password , fulladdr)
            try:
                user_list = self.al.driver.find_elements_by_xpath\
                    ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
                for i in user_list:
                    account_list.append(i.text)
            except BaseException:
                account_list = []

            self.al.logout(ele_data)
            self.al.Relogin(ele_data , account , password , login_verifycode)

            flag = False
            # 断言
            try:
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.al.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_notice_text = self.al.driver.find_element_by_xpath\
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_notice_text == '控制台':
                    flag = True
            except BaseException:
                flag = False

            # 断言
            if account in account_list and flag:
                result = 'add-pass'
            else:
                result = 'add-fail'
            self.assertEqual(result, Expected)
        except StaleElementReferenceException:
            print('StaleElementReferenceException')

    # 修改
    @parameterized.expand(Get_AL_TestData.get_al_edit_excel_data())
    @BeautifulReport.add_test_img('')
    def test_al_edit(self , account , username , phone , email , fulladdr , password , verifycode , Expected , casesname):
        f"""{casesname}"""
        account_list = []
        flag = False
        count = 0
        self.al.do_edit(Get_AL_ElementData.get_sm_ele_data() , account , username , phone , email , fulladdr)
        if casesname == '修改管理员的账户为合法账户':
            try:
                account_test = self.al.driver.find_elements_by_xpath\
                    ('/html/body/div[1]/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
                for i in account_test:
                    account_list.append(i)
            except BaseException:
                account_list = []
            self.al.logout(Get_AL_ElementData.get_sm_ele_data())
            self.al.Relogin(Get_AL_ElementData.get_sm_ele_data(), account, password, verifycode)
            try:
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.al.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_text = self.al.driver.find_element_by_xpath \
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_text == '控制台':
                    flag = True
            except BaseException:
                flag = False
            # 断言
            if account in account_list and flag:
                result = 'edit-pass'
            else:
                result = 'edit-fail'
            self.assertEqual(result, Expected)


        elif casesname == '修改管理员账户为特殊字符':
            try:
                account_text = self.al.driver.find_element_by_xpath\
                    ('/html/body/div[1]/div[2]/div[2]/div[2]/table/tbody/tr[4]/td[3]/div')
                print(account_text)
                if account == account_text.text:
                    count = 0
            except BaseException:
                count += 1
            self.al.logout(Get_AL_ElementData.get_sm_ele_data())
            self.al.Relogin(Get_AL_ElementData.get_sm_ele_data(), account, password, verifycode)
            try:
                console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
                WebDriverWait(self.al.driver, 10, 1).until(EC.presence_of_element_located(console))
                sys_text = self.al.driver.find_element_by_xpath \
                    ('//*[@id="tabTitle"]/li[1]/cite').text
                if sys_text == '控制台':
                    flag = False
            except BaseException:
                flag = True
            # 断言
            if count == 1 and flag:
                result = 'edit-fail'
            else:
                result = 'edit-pass'
            self.assertEqual(result, Expected)


        elif casesname == '修改管理员的姓名为合法姓名':
            try:
                account_text = self.al.driver.find_element_by_xpath\
                    ('/html/body/div[1]/div[2]/div[2]/div[2]/table/tbody/tr[4]/td[4]/div')
                if account == account_text.text:
                    count += 1
            except BaseException:
                count = 0
            try:
                edit_name = Utility.query_one(f"select realname from admin where realname='{username}'")[0]
                if edit_name != None:
                    flag = True
            except BaseException:
                flag = False
            # 断言
            if count == 1 and flag:
                result = 'edit-pass'
            else:
                result = 'edit-fail'
            self.assertEqual(result, Expected)

        elif casesname == '修改管理员的姓名为特殊字符':
            time.sleep(1)
            try:
                name_text = self.al.driver.find_element_by_xpath\
                    ('/html/body/div[1]/div[2]/div[2]/div[2]/table/tbody/tr[4]/td[4]/div')
                if username == name_text.text:
                    count = 0
            except BaseException:
                count += 1
            try:
                query_name = Utility.query_one(f"select realname from admin where realname='{username}'")[0]
                if query_name != None:
                    flag = False
            except BaseException:
                flag = True
            # 断言
            if count == 0 and flag:
                result = 'edit-fail'
            else:
                result = 'edit-pass'
            self.assertEqual(result, Expected)


    # 删除
    @parameterized.expand(Get_AL_TestData.get_al_delete_excel_data())
    @BeautifulReport.add_test_img('')
    def test_al_delete(self, account, password, verifycode , Expected , casesname):
        f"""{casesname}"""
        old_user_sum = Utility.query_one('select count(username) from admin')[0]

        time.sleep(3)
        flag = False
        Service.Lose_login(self.al.driver)
        self.al.click_sysmanagment(Get_AL_ElementData.get_sm_ele_data())
        time.sleep(2)
        self.al.do_delete(Get_AL_ElementData.get_sm_ele_data())

        new_user_sum = Utility.query_one('select count(username) from admin')[0]

        time.sleep(2)
        self.al.logout(Get_AL_ElementData.get_sm_ele_data())
        self.al.Relogin(Get_AL_ElementData.get_sm_ele_data(), account, password, verifycode)

        try:
            console = (By.XPATH, '//*[@id="tabTitle"]/li[1]/cite')
            WebDriverWait(self.al.driver, 10, 1).until(EC.presence_of_element_located(console))
            sys_text = self.al.driver.find_element_by_xpath \
                ('//*[@id="tabTitle"]/li[1]/cite').text
            if sys_text == '控制台':
                flag = False
        except BaseException:
            flag = True

        # 断言
        if old_user_sum != new_user_sum and flag:
            resutl = 'delete-pass'
        else:
            resutl = 'delete-fail'
        self.assertEqual(resutl , Expected)

    # 查询
    @parameterized.expand(Get_AL_TestData.get_al_query_excel_data())
    @BeautifulReport.add_test_img('')
    def test_al_query(self , account , Expected , casesname):
        f"""{casesname}"""
        Service.Lose_login(self.al.driver)
        self.al.click_sysmanagment(Get_AL_ElementData.get_sm_ele_data())
        time.sleep(2)
        self.al.do_query(Get_AL_ElementData.get_sm_ele_data() , account)
        time.sleep(1)
        if casesname == '账户模糊查询':
            account_list = self.al.driver.find_elements_by_xpath\
                ('/html/body/div/div[2]/div[2]/div[2]/table/tbody//td[3]/div')
            for i in account_list:
                if account  not in i.text:
                    result = 'query-error'
                else:
                    result = 'query-pass'
            self.assertEqual(result , Expected)
        elif casesname == '账户精准查询':
            account_text = self.al.driver.find_element_by_xpath \
                ('/html/body/div/div[2]/div[2]/div[2]/table/tbody/tr/td[3]/div').text
            if account == account_text:
                result = 'query-pass'
            else:
                result = 'query-error'
            self.assertEqual(result , Expected)
        elif casesname == '无效条件查询':
            time.sleep(1)
            account_text = self.al.driver.find_element_by_xpath \
                ('/html/body/div/div[2]/div[2]/div[2]/div').text
            if account_text == '无数据':
                result = 'query-pass'
            else:
                result = 'query-error'
            self.assertEqual(result, Expected)



    def save_img(self , img_name):
        driver = self.al.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.al.driver.close()

if __name__ == '__main__':
    unittest.main(verbosity=2)


