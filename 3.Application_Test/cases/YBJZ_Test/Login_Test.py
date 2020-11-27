# 登录
import unittest
from time import sleep

from lib.Tally.Action import Action


class Test_Login(unittest.TestCase):

    def setUp(self):
        self.lg = Action()
        self.driver = self.lg.driver


    def test_login(self ):
        """用户名密码错误"""
        self.lg.do_login()
        sleep(1)
        login_text = self.driver.find_element_by_id\
            ('com.mobivans.onestrokecharge:id/login_tv_agreement').text
        # 断言
        self.assertIn('用户使用协议', login_text)


