import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_N1_RT_Data import Get_Register_TestData
from lib.N1_Register_Action import Register_Action
from tools.util import Utility


@ddt
class Register_Test(unittest.TestCase):
    def setUp(self):
        self.R = Register_Action(Service.get_session_tm())
        Utility.initialize_DB()

    @data(*Get_Register_TestData.get_Register_excel_data())
    @unpack
    def test_do_Register(self, url, method,phone,pwd,casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method,
                     "DATA": { "phone": phone, "pwd": pwd,
                              }, "EXPECTED": expect}
        res = self.R.do_add(test_data['URL'], test_data["METHOD"], test_data["DATA"])
        if casesname == "注册成功":
            if "账号注册成功" in res.text:
                result = "register_pass"
            else:
                result = "register_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "注册失败1":
            if "地址修改失败" in res.text:
                result = "register_pass"
            else:
                result = "register_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "注册失败2":
            if "Bad Request" in res.text:
                result = "register_pass"
            else:
                result = "register_fail"
            self.assertEqual(result, test_data['EXPECTED'])

if __name__ == '__main__':
    unittest.main(verbosity=2)