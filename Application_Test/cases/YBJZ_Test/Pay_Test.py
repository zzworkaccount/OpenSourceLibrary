# 支出
import unittest
from time import sleep

from lib.Tally.Action import Action


class Test_Pay(unittest.TestCase):

    def setUp(self):
        self.lg = Action()
        self.driver = self.lg.driver


    def test_pay(self ):
        """支出"""
        self.lg.do_pay()
        sleep(1)
        count = 0
        # 获取完成支付后的文本信息
        pay_text = self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[2]/android.widget.LinearLayout/'
             'android.widget.LinearLayout/android.widget.FrameLayout/'
             'android.widget.LinearLayout/android.widget.TextView[1])').text
        num_text = self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[2]/android.widget.LinearLayout/'
             'android.widget.LinearLayout/android.widget.FrameLayout/'
             'android.widget.LinearLayout/android.widget.TextView[2])').text
        expect = 1
        if '餐饮' in pay_text and '-520' == num_text:
            count += 1


        # 断言
        # 框架提供的断言方法
        self.assertEqual(count, expect)

