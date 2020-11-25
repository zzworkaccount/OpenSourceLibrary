# 收入
import unittest
from time import sleep

from lib.Tally.Action import Action


class Test_Income(unittest.TestCase):

    def setUp(self):
        self.lg = Action()
        self.driver = self.lg.driver


    def test_income(self ):
        """收入"""
        self.lg.do_Income()
        sleep(1)
        count = 0
        # 获取完成支付后的文本信息
        income_text = self.driver.find_element_by_xpath\
            ('(//*/android.widget.LinearLayout[2]/android.widget.LinearLayout/'
             'android.widget.LinearLayout/android.widget.FrameLayout/'
             'android.widget.LinearLayout/android.widget.TextView[1])').text
        I_num_text = self.driver.find_element_by_xpath \
            ('(//*/android.widget.LinearLayout[2]/android.widget.LinearLayout/'
             'android.widget.LinearLayout/android.widget.FrameLayout/'
             'android.widget.LinearLayout/android.widget.TextView[2])').text
        expect = 1
        if '兼职' in income_text and '520' == I_num_text:
            count += 1

        # 断言
        self.assertEqual(count, expect)





