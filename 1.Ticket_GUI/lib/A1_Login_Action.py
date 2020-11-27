# 登录动作

from tools.service import Service


class L_Action:

    def __init__(self):
        from tools.service import Service
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)

    # 点击用户名输入框
    def input_username(self , ele_data , username):
        user_ele = self.driver.find_element(ele_data[0][0] , ele_data[1][0])
        Service.input_send(user_ele, username)

    # 点击密码
    def input_password(self , centent_list , password):
        pass_ele = self.driver.find_element(centent_list[0][1], centent_list[1][1])
        Service.input_send(pass_ele, password)

    # 点击验证码
    def input_verifcode(self , centent_list , verifycode):
        verifycode_ele = self.driver.find_element(centent_list[0][2], centent_list[1][2])
        Service.input_send(verifycode_ele, verifycode)

    # 点击登录按钮
    def click_login_button(self , centent_list):
        login_button = self.driver.find_element(centent_list[0][3], centent_list[1][3])
        login_button.click()

    # 完成登录动作
    def do_login(self , ele_data , username , password , verifycode):
        from tools.service import Service
        Service().open_page(self.driver)
        self.input_username(ele_data , username)
        self.input_password(ele_data , password)
        self.input_verifcode(ele_data , verifycode)
        self.click_login_button(ele_data)


