import time

from selenium.webdriver import ActionChains

from tools.service import Service
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By


class CP_Action:

    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)


    # 进入修改密码模块
    def click_changepassword(self , ele_list):
        # 点击系统管理
        self.driver.find_element(ele_list[0][0] , ele_list[1][0]).click()
        time.sleep(2)
        # 点击修改密码
        self.driver.find_element(ele_list[0][1] , ele_list[1][1]).click()

    # 切换iframe
    def switch_to_ps_iframe(self , ele_list):
        # 切换iframe
        iframe = self.driver.find_element(ele_list[0][2], ele_list[1][2])
        self.driver.switch_to.frame(iframe)

    # 输入原密码
    def input_old_password(self , ele_list , old_password):
        old_password_ele = self.driver.find_element(ele_list[0][3], ele_list[1][3])
        Service.input_send(old_password_ele , old_password)

    # 输入新密码
    def input_new_password(self , ele_list , new_password):
        new_password_ele = self.driver.find_element(ele_list[0][4] , ele_list[1][4])
        Service.input_send(new_password_ele , new_password)

    # 确认新密码
    def input_confirm_password(self , ele_list , confirm_password):
        confirm_password_ele = self.driver.find_element(ele_list[0][5] , ele_list[1][5])
        Service.input_send(confirm_password_ele , confirm_password)

    # 点击立即修改
    def click_edit_button(self , ele_list):
        edit_button_ele = self.driver.find_element(ele_list[0][6] , ele_list[1][6])
        edit_button_ele.click()

    # 完成修改密码
    def do_changepassword(self , ele_list , old_password , new_password , confirm_password):
        Service.Lose_login(self.driver)
        self.click_changepassword(ele_list)
        self.switch_to_ps_iframe(ele_list)
        time.sleep(2)
        self.input_old_password(ele_list , old_password)
        time.sleep(2)
        self.input_new_password(ele_list , new_password)
        time.sleep(2)
        self.input_confirm_password(ele_list , confirm_password)
        time.sleep(2)
        self.click_edit_button(ele_list)

    # 退出登录
    def logout(self, ele_list):
        # 返回到上一级
        self.driver.switch_to.parent_frame()
        time.sleep(1)
        # 刷新页面
        # self.driver.refresh()
        logout_button = (By.XPATH, ele_list[1][7])
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(logout_button))
        logout_ele = self.driver.find_element(ele_list[0][7], ele_list[1][7])
        # 鼠标移到悬停元素上
        ActionChains(self.driver).move_to_element(logout_ele).perform()
        time.sleep(1)
        logout_button_one = (By.XPATH, ele_list[1][8])
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(logout_button_one))
        self.driver.find_element(ele_list[0][8], ele_list[1][8]).click()

    # 登录
    def Relogin(self, ele_list, login_account, login_password, login_verifycode):
        self.driver.get('http://192.172.4.60:9000/adminservice/login')
        time.sleep(2)
        user_ele = self.driver.find_element(ele_list[0][9], ele_list[1][9])
        Service.input_send(user_ele, login_account)
        time.sleep(1)
        pass_ele = self.driver.find_element(ele_list[0][10], ele_list[1][10])
        Service.input_send(pass_ele, login_password)
        time.sleep(1)
        verifycode_ele = self.driver.find_element(ele_list[0][11], ele_list[1][11])
        Service.input_send(verifycode_ele, login_verifycode)
        time.sleep(1)
        login_button = self.driver.find_element(ele_list[0][12], ele_list[1][12])
        login_button.click()