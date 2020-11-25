import time

from tools.service import Service
from selenium.webdriver.support.select import Select



class PM_Action:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)

    def publish_management(self, element_list):
        # 用户管理-->用户列表
        self.driver.find_element(element_list[0][0], element_list[1][0]).click()
        self.driver.find_element(element_list[0][1], element_list[1][1]).click()

    def switch_one_iframe(self, element_list):
        #切进 外层iframe
        self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'MovieInfo_Management')]"))

    def switch_two_iframe(self, element_list):
        self.driver.find_element(element_list[0][2], element_list[1][2]).click()
        # 切进 外层iframe
        self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))

    # 修改
    def edit_action1(self, element_list, name):
        # self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))
        self.driver.find_element(element_list[0][3], element_list[1][3]).clear()
        time.sleep(3)
        self.driver.find_element(element_list[0][3], element_list[1][3]).send_keys(name)
        time.sleep(3)
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(3)

    def edit_action2(self, element_list, types):
        time.sleep(2)
        # self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))
        self.driver.find_element(element_list[0][4], element_list[1][4]).clear()
        time.sleep(2)
        self.driver.find_element(element_list[0][4], element_list[1][4]).send_keys(types)
        time.sleep(3)
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(3)

    def edit_action3(self, element_list, times):
        # self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))
        self.driver.find_element(element_list[0][5], element_list[1][5]).clear()
        time.sleep(3)
        self.driver.find_element(element_list[0][5], element_list[1][5]).send_keys(times)
        time.sleep(3)
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(3)

    def edit_action4(self, element_list, wd):
        # self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))
        self.driver.find_element(element_list[0][6], element_list[1][6]).clear()
        time.sleep(3)
        self.driver.find_element(element_list[0][6], element_list[1][6]).send_keys(wd)
        time.sleep(3)
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(3)

    def edit_action5(self, element_list, language):
        # self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toMovieInfoEdit')]"))
        self.driver.find_element(element_list[0][7], element_list[1][7]).clear()
        time.sleep(3)
        self.driver.find_element(element_list[0][7], element_list[1][7]).send_keys(language)
        time.sleep(3)
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(3)

    def edit_user(self, element_list, name):
        Service.Lose_TBM_login(self.driver)
        self.publish_management(element_list)
        self.switch_one_iframe(element_list)
        self.switch_two_iframe(element_list)

    def edit_user1(self, element_list, name):
        self.edit_user(element_list, name)
        self.edit_action1(element_list, name)

    def edit_user2(self, element_list, types):
        self.edit_user(element_list, types)
        self.edit_action2(element_list, types)

    def edit_user3(self, element_list, times):
        self.edit_user(element_list, times)
        self.edit_action3(element_list, times)

    def edit_user4(self, element_list, wd):
        self.edit_user(element_list, wd)
        self.edit_action4(element_list, wd)

    def edit_user5(self, element_list, language):
        self.edit_user(element_list, language)
        self.edit_action5(element_list, language)

    # 查询
    def select_action1(self, element_list, name):
        time.sleep(3)
        self.driver.find_element(element_list[0][9], element_list[1][9]).click()
        time.sleep(1)
        self.driver.find_element(element_list[0][9], element_list[1][9]).send_keys(name)
        time.sleep(2)
        self.driver.find_element(element_list[0][10], element_list[1][10]).click()
        self.driver.find_element(element_list[0][11], element_list[1][11]).click()
        time.sleep(2)

    def select_action2(self, element_list, name):
        time.sleep(3)
        self.driver.find_element(element_list[0][9], element_list[1][9]).click()
        time.sleep(1)
        self.driver.find_element(element_list[0][9], element_list[1][9]).send_keys(name)
        time.sleep(2)
        self.driver.find_element(element_list[0][12], element_list[1][12]).click()
        self.driver.find_element(element_list[0][11], element_list[1][11]).click()
        time.sleep(2)

    def select_user1(self, element_list, name):
        Service.Lose_TBM_login(self.driver)
        self.publish_management(element_list)
        self.switch_one_iframe(element_list)
        self.select_action1(element_list, name)

    def select_user2(self, element_list, name):
        Service.Lose_TBM_login(self.driver)
        self.publish_management(element_list)
        self.switch_one_iframe(element_list)
        self.select_action2(element_list, name)

# if __name__ == '__main__':
#     PM_Action().publish_management(GetElementData().get_login_ele_data_select())
