import time

from tools.util import Utility
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

#封装操作软件的工具类
class Service:

    # 获取软件网址,需要传入元素对象和网址配置文件路径
    @classmethod
    def open_page(cls, driver):
        contents = Utility.get_json(Utility.get_root_path()+"\\conf\\Base_conf\\base.conf")[0]
        url = f"{contents['PROTOCOL']}://{contents['IP']}:{contents['PORT']}/{contents['PROGRAM']}"
        driver.get(url)

    # 获取driver
    @classmethod
    def get_driver(cls):
        from selenium import webdriver
        contents = Utility.get_json(Utility.get_root_path()+"\\conf\\Base_conf\\base.conf")[0]
        driver = getattr(webdriver, contents['BROWSER'])()
        driver.implicitly_wait(10)
        return driver

    # 封装点击，清空，输入
    @classmethod
    def input_send(cls , ele , values):
        ele.click()
        ele.clear()
        ele.send_keys(values)


    #查询元素是否存在
    @classmethod
    def is_element_present(cls, driver, how, what):
        from selenium.common.exceptions import NoSuchElementException
        try:
            driver.find_element(by=how, value=what)
        except NoSuchElementException as e:
            return False
        return True

    # 切换iframe
    def switch_to_iframe(self , driver , centent_list):
        # 切换iframe
        iframe = driver.find_element(centent_list[0][1] , centent_list[0][1])
        driver.switch_to.frame(iframe)


    # 忽略登录
    @classmethod
    def Lose_login(self, driver):
        self.driver = driver
        url = 'http://192.172.4.60:9000/adminservice/login'
        self.driver.get(url)
        user_ele = self.driver.find_element_by_id('username')
        Service.input_send(user_ele, "admin")
        pass_ele = self.driver.find_element_by_id('password')
        Service.input_send(pass_ele, "123456")
        verifycode_ele = self.driver.find_element_by_id('captcha')
        Service.input_send(verifycode_ele, '123456')
        login_button = self.driver.find_element_by_xpath('/html/body/div/form/div[5]/button')
        login_button.click()
        time.sleep(1)
        sys_notice = (By.XPATH, '/html/body/div[4]/div[3]/a')
        WebDriverWait(self.driver, 15, 1).until(EC.presence_of_element_located(sys_notice))
        self.driver.find_element_by_xpath('/html/body/div[4]/div[3]/a').click()

    # 忽略登录
    @classmethod
    def Lose_TBM_login(self, driver):
        self.driver = driver
        url = 'http://192.172.4.60:9000/movieservice/login'
        self.driver.get(url)
        user_ele = self.driver.find_element_by_id('cTelephone')
        Service.input_send(user_ele, "18708133599")
        pass_ele = self.driver.find_element_by_id('cPassword')
        Service.input_send(pass_ele, "19910713")
        verifycode_ele = self.driver.find_element_by_id('captcha')
        Service.input_send(verifycode_ele, '1')
        login_button = self.driver.find_element_by_xpath('/html/body/div/form/div[5]/button')
        login_button.click()
        time.sleep(1)
        sys_notice = (By.XPATH, '/html/body/div[4]/div[3]/a')
        WebDriverWait(self.driver, 10, 1).until(EC.presence_of_element_located(sys_notice))
        self.driver.find_element_by_xpath('/html/body/div[4]/div[3]/a').click()