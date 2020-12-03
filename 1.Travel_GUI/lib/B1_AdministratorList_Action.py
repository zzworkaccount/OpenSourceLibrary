# 管理员列表
import time
from selenium.webdriver.support.select import Select


from tools.service import Service
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from uimap.Get_Element.Get_B1_AL_Element import Get_AL_ElementData
from selenium.webdriver.common.action_chains import ActionChains


class AL_Action:

    def __init__(self):
        self.driver = Service().get_driver()
        self.driver.implicitly_wait(10)


    # 进入管理员列表模块
    def click_sysmanagment(self , ele_list):
        # 点击
        self.driver.find_element(ele_list[0][0] , ele_list[1][0]).click()
        time.sleep(2)
        self.driver.find_element(ele_list[0][1] , ele_list[1][1]).click()

    # 切换iframe
    def switch_to_iframe(self , ele_list):
        # 切换iframe
        iframe = self.driver.find_element(ele_list[0][2], ele_list[1][2])
        self.driver.switch_to.frame(iframe)

    # 点击添加用户
    def click_add_button(self , ele_list):
        # 切换iframe
        self.switch_to_iframe(ele_list)
        # 点击添加用户按钮
        self.driver.find_element(ele_list[0][3] , ele_list[1][3]).click()
        time.sleep(3)


    # 输入用户名
    def input_account(self , ele_list , account):
        time.sleep(1)
        window_iframe_one = self.driver.find_element(ele_list[0][4] , ele_list[1][4])
        self.driver.switch_to.frame(window_iframe_one)
        account_ele = self.driver.find_element(ele_list[0][5] , ele_list[1][5])
        Service.input_send(account_ele , account)


    # 输入姓名
    def input_username(self , ele_list , username):
        time.sleep(1)
        username_ele = self.driver.find_element(ele_list[0][6] , ele_list[1][6])
        Service.input_send(username_ele , username)


    # 输入电话
    def input_iphone(self , ele_list , phone):
        time.sleep(1)
        iphone_ele = self.driver.find_element(ele_list[0][7] , ele_list[1][7])
        # //*[@id="dataFrm"]/div[3]/div/input
        Service.input_send(iphone_ele, phone)


    # 输入邮箱
    def input_email(self , ele_list , email):
        time.sleep(1)
        email_ele = self.driver.find_element(ele_list[0][8] , ele_list[1][8])
        Service.input_send(email_ele, email)


    # 输入密码
    def input_password(self , ele_list , password):
        time.sleep(1)
        password_ele = self.driver.find_element(ele_list[0][9] , ele_list[1][9])
        Service.input_send(password_ele, password)


    # 选择地址
    def select_addr(self , ele_list):
        time.sleep(1)
        select_addr = self.driver.find_element(ele_list[0][10] , ele_list[1][10])
        select_addr.click()
        time.sleep(1)
        city_ele = self.driver.find_element(ele_list[0][11] , ele_list[1][11])
        city_ele.click()
        time.sleep(1)


    # 输入详细地址
    def input_fulladdr(self , ele_list , fulladdr):
        time.sleep(1)
        input_fulladdr = self.driver.find_element(ele_list[0][12] , ele_list[1][12])
        Service.input_send(input_fulladdr , fulladdr)


    # 点击提交
    def click_submit_button(self , ele_list):
        time.sleep(1)
        submit_ele = self.driver.find_element(ele_list[0][13] , ele_list[1][13])
        submit_ele.click()
        # 返回到上一级
        self.driver.switch_to.parent_frame()

    # 点击关闭按钮
    def click_close_button(self , ele_list):
        time.sleep(1)
        self.driver.find_element(ele_list[0][14] , ele_list[1][14]).click()

    # 退出登录
    def logout(self , ele_list):
        # 返回到上一级
        self.driver.switch_to.parent_frame()
        time.sleep(1)
        # 刷新页面
        # self.driver.refresh()
        logout_button = (By.XPATH, ele_list[1][15])
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(logout_button))
        logout_ele = self.driver.find_element(ele_list[0][15] , ele_list[1][15])
        # 鼠标移到悬停元素上
        ActionChains(self.driver).move_to_element(logout_ele).perform()
        time.sleep(1)
        logout_button_one = (By.XPATH, ele_list[1][16])
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(logout_button_one))
        self.driver.find_element(ele_list[0][16] , ele_list[1][16]).click()

    # 登录
    def Relogin(self , ele_list , login_account , login_password , login_verifycode):
        time.sleep(1)
        user_ele = self.driver.find_element(ele_list[0][17] , ele_list[1][17])
        Service.input_send(user_ele, login_account)
        time.sleep(1)
        pass_ele = self.driver.find_element(ele_list[0][18] , ele_list[1][18])
        Service.input_send(pass_ele, login_password)
        time.sleep(1)
        verifycode_ele = self.driver.find_element(ele_list[0][19] , ele_list[1][19])
        Service.input_send(verifycode_ele, login_verifycode)
        time.sleep(1)
        login_button = self.driver.find_element(ele_list[0][20] , ele_list[1][20])
        login_button.click()

    # 进入管理员列表模块
    def do_add_username(self , ele_data , account , username , phone , email , password , fulladdr):
        driver = self.driver
        Service.Lose_login(driver)
        time.sleep(2)
        self.click_sysmanagment(ele_data)
        self.click_add_button(ele_data)
        self.input_account(ele_data , account)
        self.input_username(ele_data , username)
        self.input_iphone(ele_data , phone)
        self.input_email(ele_data , email)
        self.input_password(ele_data , password)
        self.select_addr(ele_data)
        self.input_fulladdr(ele_data , fulladdr)
        self.click_submit_button(ele_data)
        self.click_close_button(ele_data)

    # 修改
    def do_edit(self , ele_list , account , username , phone , email , fulladdr):
        driver = self.driver
        Service.Lose_login(driver)
        time.sleep(2)
        self.click_sysmanagment(ele_list)
        time.sleep(2)
        window_iframe_edit_button = self.driver.find_element(ele_list[0][25], ele_list[1][25])
        self.driver.switch_to.frame(window_iframe_edit_button)
        # 点击修改按钮
        self.driver.find_element(ele_list[0][21] , ele_list[1][21]).click()
        time.sleep(3)
        # 修改用户名
        window_iframe_edit_account = self.driver.find_element(ele_list[0][22], ele_list[1][22])
        self.driver.switch_to.frame(window_iframe_edit_account)
        account_ele = self.driver.find_element(ele_list[0][23], ele_list[1][23])
        Service.input_send(account_ele, account)
        # 修改姓名
        self.input_username(ele_list , username)
        # 修改手机号
        time.sleep(2)
        iphone_ele = self.driver.find_element(ele_list[0][27], ele_list[1][27])
        # //*[@id="dataFrm"]/div[3]/div/input
        Service.input_send(iphone_ele, phone)
        time.sleep(2)
        # 修改邮箱
        self.input_email(ele_list , email)
        # 修改详细地址
        self.input_fulladdr(ele_list , fulladdr)
        time.sleep(3)
        # 调用点击提交按钮
        edit_submit_ele = self.driver.find_element(ele_list[0][24], ele_list[1][24])
        edit_submit_ele.click()
        # 返回到上一级
        self.driver.switch_to.parent_frame()
        time.sleep(1)
        # 点击关闭按钮
        self.driver.find_element(ele_list[0][26] , ele_list[1][26]).click()
        time.sleep(1)

    # 删除
    def do_delete(self , ele_list):
        # 切换iframe
        self.switch_to_iframe(ele_list)
        self.driver.find_element(ele_list[0][28] , ele_list[1][28]).click()
        time.sleep(3)
        # 点击确定
        self.driver.find_element(ele_list[0][29] , ele_list[1][29]).click()
        # 返回到上一级
        self.driver.switch_to.parent_frame()


    # 查询
    def do_query(self , ele_list , account):
        # 切换
        window_iframe_query_button = self.driver.find_element(ele_list[0][25], ele_list[1][25])
        self.driver.switch_to.frame(window_iframe_query_button)
        # 点击输入框输入值
        query_account = self.driver.find_element(ele_list[0][30] , ele_list[1][30])
        Service.input_send(query_account , account)
        # 点击查询按钮
        self.driver.find_element(ele_list[0][31] , ele_list[1][31]).click()




if __name__ == '__main__':
    al = AL_Action()
    Service.Lose_login(al.driver)
    al.click_sysmanagment(Get_AL_ElementData.get_sm_ele_data())
    al.do_query(Get_AL_ElementData.get_sm_ele_data() , ' ')
