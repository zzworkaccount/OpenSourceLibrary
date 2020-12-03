import time


from tools.service import Service



class SL_Action:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)

    def system_log_management(self, element_list):
        # 日志管理-->系统操作日志
        Service.Lose_login(self.driver)
        self.driver.find_element(element_list[0][0], element_list[1][0]).click()
        self.driver.find_element(element_list[0][1], element_list[1][1]).click()

    def switch_one_iframe(self):
        # 切进 外层iframe
        self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'SysLog_Manage')]"))

    def select_action(self, element_list, info):
        self.driver.find_element(element_list[0][2], element_list[1][2]).click()
        self.driver.find_element(element_list[0][2], element_list[1][2]).send_keys(info)
        self.driver.find_element(element_list[0][3], element_list[1][3]).click()
        time.sleep(5)

    # 执行查询操作
    def select_user(self, element_list, info, expect, cases_name):
        self.system_log_management(element_list)
        self.switch_one_iframe()
        self.select_action(element_list, info)

    def compose_action(self, element_list):
        time.sleep(2)
        self.driver.find_element(element_list[0][6], element_list[1][6]).click()
        self.driver.find_element(element_list[0][7], element_list[1][7]).click()
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        time.sleep(5)
        self.driver.find_element(element_list[0][9], element_list[1][9]).click()
        self.driver.find_element(element_list[0][10], element_list[1][10]).click()
        self.driver.find_element(element_list[0][11], element_list[1][11]).click()

#   执行组合查询操作
    def select_compose(self, element_list, info, expect, cases_name):
        self.system_log_management(element_list)
        self.switch_one_iframe()
        self.compose_action(element_list)
        self.select_action(element_list, info)

# if __name__ == '__main__':
#     SL_Action().select_user(Get_SL_ElementData().get_sl_ele_data())