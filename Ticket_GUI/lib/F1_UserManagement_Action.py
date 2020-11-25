import time
from tools.service import Service

class User_management:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)

    #点击系统管理
    def click_system_management_button(self , centent_list):
        system_management_button = self.driver.find_element(centent_list[0][0], centent_list[1][0])
        system_management_button.click()

    #点击用户管理
    def click_User_management_button(self , centent_list):
        User_management_button = self.driver.find_element(centent_list[0][0], centent_list[1][1])
        User_management_button.click()

    #输入搜索内容
    def input_search_message(self, centent_list, username):
        self.driver.switch_to.frame(self.driver.find_element_by_xpath
                                    ("//iframe[contains(@src,'CinemaUser.do')]"))
        search_message_ele = self.driver.find_element(centent_list[0][0], centent_list[1][2])
        Service.input_send(search_message_ele, username)

    #点击搜索
    def click_search_button(self , centent_list):
        search_button = self.driver.find_element(centent_list[0][0], centent_list[1][3])
        search_button.click()

    #搜索动作
    def do_Usermanagement(self,centent_data,username):
        Service.Lose_TBM_login(self.driver)
        self.click_system_management_button(centent_data)
        self.click_User_management_button(centent_data)
        self.input_search_message(centent_data,username)
        time.sleep(2)
        self.click_search_button(centent_data)


