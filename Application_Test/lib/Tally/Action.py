from time import sleep

from tools.service import Service


class Action:

    def __init__(self):
        self.driver = Service().get_driver()
        self.driver.implicitly_wait(10)

    def is_Applicathon_exist(self):
        # 判断某个APP是否已安装
        if not self.driver.is_app_installed("com.mobivans.onestrokecharge"):
            # 安装指定APP
            self.driver.install_app("D:\\APPtools\\apk\\yunyouguizhou.apk")


    # 点击记一笔
    def click_record(self):
        self.driver.find_element_by_xpath\
            ('(//*/android.widget.FrameLayout/android.widget.LinearLayout[1]/'
             'android.widget.LinearLayout/android.view.View)').click()


    # 点击餐饮
    def click_repast(self):
        self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[1]/android.widget.ImageView)').click()


    # 点击520
    def click_number(self):
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/keyb_btn_5').click()
        sleep(1)
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/keyb_btn_2').click()
        sleep(1)
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/keyb_btn_0').click()

    # 点击完成
    def click_complete(self):
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/keyb_btn_finish').click()


    # 封装支出动作
    def do_pay(self):
        self.click_record()
        self.click_repast()
        self.click_number()
        self.click_complete()


    # 点击收入
    def click_Income(self):
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/add_txt_In').click()


    # 点击兼职
    def click_work(self):
        self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[3]/android.widget.ImageView)').click()


    # 封装收入动作
    def do_Income(self):
        self.click_record()
        self.click_Income()
        self.click_work()
        self.click_number()
        self.click_complete()


    # 点击设置
    def click_setting(self):
        self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[4]/android.widget.LinearLayout/'
             'android.widget.ImageView)[2]').click()


    # 点击登录
    def click_login(self):
        self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[1]/android.widget.LinearLayout/'
             'android.widget.LinearLayout/android.widget.TextView)[3]').click()


    # 输入用户名
    def send_username(self):
        self.driver.find_element_by_id\
            ('com.mobivans.onestrokecharge:id/etxt_login_phonenumber').send_keys('12345678')


    # 输入验证码
    def send_verifycode(self):
        self.driver.find_element_by_id\
            ('com.mobivans.onestrokecharge:id/etxt_login_code').send_keys('12345')


    # 点击登录按钮
    def click_login_button(self):
        self.driver.find_element_by_id('com.mobivans.onestrokecharge:id/btn_login').click()


    # 封装登录动作
    def do_login(self):
        self.click_setting()
        self.click_login()
        self.send_username()
        self.send_verifycode()
        self.click_login_button()






