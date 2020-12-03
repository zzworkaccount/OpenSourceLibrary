# 登录
import os
import time
import unittest

import warnings

from ddt import ddt,data,unpack
from data.Get_TestData.Get_A1_LT_Data import Get_LG_TestData
from lib.A1_Login_Action import L_Action
from tools.service import Service
from tools.util import Utility


@ddt
class L_Test(unittest.TestCase):

    def setUp(self):
        self.lg = L_Action(Service.get_session())
        warnings.simplefilter('ignore', ResourceWarning)


    @data(*Get_LG_TestData.get_login_excel_data())
    @unpack
    def test_do_login(self, url, method, username, password, captcha, casesname , expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME":casesname, "URL":url, "METHOD":method,
                     "DATA":{"username": username, "password": password, "captcha": captcha}, "EXPECTED": expect}
        res = self.lg.do_login(test_data['URL'], test_data["METHOD"], test_data["DATA"])
        centent = res.json()
        # 断言
        if centent['msg'] == '登录成功':
            result = 'login-pass'
        else:
            result = 'login-fail'
        Utility.logger(casesname,centent['msg'],result,expect)
        self.assertEqual(result,expect)


if __name__ == '__main__':
    unittest.main(verbosity=2)