import time

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from tools.service import Service
from selenium.webdriver.support.select import Select

class UL_Action:
    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)

    def user_management(self, element_list):
        # 用户管理-->用户列表
        self.driver.find_element(element_list[0][0], element_list[1][0]).click()
        self.driver.find_element(element_list[0][1], element_list[1][1]).click()

    def switch_one_iframe(self, element_list):
        # 切进 外层iframe
        self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'User_Management')]"))

    def switch_two_iframe(self, element_list):
        self.driver.find_element(element_list[0][2], element_list[1][2]).click()
        # 切进内层 iframe
        self.driver.switch_to.frame(self.driver.find_element_by_xpath("//iframe[contains(@src,'toUserAddPage')]"))

    def add_action(self, element_list, username, user_phone, email):
        # 用户名
        self.driver.find_element(element_list[0][3], element_list[1][3]).send_keys(username)
        # 手机号
        self.driver.find_element(element_list[0][4], element_list[1][4]).send_keys(user_phone)
        # 邮箱
        self.driver.find_element(element_list[0][5], element_list[1][5]).send_keys(email)
        # 性别
        self.driver.find_element(element_list[0][6], element_list[1][6]).click()
        # 地址
        self.driver.find_element(element_list[0][7], element_list[1][7]).click()
        # s_province = Select(self.driver.find_element(element_list[0][7], element_list[1][7]))
        self.driver.find_element_by_xpath("/html/body/div/form/div[5]/div[1]/div/dl/dd[19]").click()
        self.driver.find_element(element_list[0][8], element_list[1][8]).click()
        self.driver.find_element_by_xpath("//*[@id='area-picker']/div[2]/div/dl/dd[3]").click()
        self.driver.find_element(element_list[0][9], element_list[1][9]).click()
        self.driver.find_element_by_xpath("//*[@id='area-picker']/div[3]/div/dl/dd[3]").click()
        # 详细地址
        self.driver.find_element(element_list[0][10], element_list[1][10]).send_keys("湖北省武汉市江夏区")
        # 密码
        self.driver.find_element(element_list[0][11], element_list[1][11]).send_keys(123456)
        # 余额
        self.driver.find_element(element_list[0][12], element_list[1][12]).send_keys(20)
        # 状态
        self.driver.find_element(element_list[0][13], element_list[1][13]).click()
        # 认证
        self.driver.find_element(element_list[0][14], element_list[1][14]).click()
        # 提交
        self.driver.find_element(element_list[0][15], element_list[1][15]).click()
        # 页面刷新
        self.driver.refresh()

    # 执行新增操作
    def add_user(self, element_list, username_data, phone_data, email_data):
        Service.Lose_login(self.driver)
        self.user_management(element_list)
        self.switch_one_iframe(element_list)
        self.switch_two_iframe(element_list)
        self.add_action(element_list, username_data, phone_data, email_data)

    def delete_action1(self, element_list):
        self.driver.find_element(element_list[0][20], element_list[1][20]).click()
        sys_notice = (By.XPATH, element_list[1][21])
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(sys_notice))
        time.sleep(3)
        self.driver.find_element(element_list[0][21], element_list[1][21]).click()
        time.sleep(3)
        self.driver.find_element(element_list[0][22], element_list[1][22]).click()

    def delete_action2(self, element_list):
        self.driver.find_element(element_list[0][20], element_list[1][20]).click()
        time.sleep(2)
        self.driver.find_element(element_list[0][24], element_list[1][24]).click()
        time.sleep(2)
        self.driver.find_element(element_list[0][23], element_list[1][23])

    def delete_action3(self, element_list):
        self.driver.find_element(element_list[0][25], element_list[1][25]).click()
        time.sleep(3)
        self.driver.find_element(element_list[0][23], element_list[1][23]).click()
        time.sleep(3)
        self.driver.find_element(element_list[0][27], element_list[1][27]).click()

    # 执行删除操作
    def delete_user(self, element_list):
        Service.Lose_login(self.driver)
        self.user_management(element_list)
        self.switch_one_iframe(element_list)

    def delete_user1(self, element_list):
        self.delete_user(element_list)
        time.sleep(2)
        self.delete_action1(element_list)

    def delete_user2(self, element_list):
        self.delete_user(element_list)
        self.delete_action2(element_list)

    def delete_user3(self, element_list):
        self.delete_user(element_list)
        self.delete_action3(element_list)

