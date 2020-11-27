# 用户日志
import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_J1_UMT_Data import Get_UMT_TestData
from lib.J1_UserLoginLog_Action import UL_Action
from tools.util import Utility


@ddt
class UL_Test(unittest.TestCase):
    def setUp(self):
        self.UM = UL_Action(Service.get_session())
        Utility.initialize_DB()

    @data(*Get_UMT_TestData.get_DT_excel_data())
    @unpack
    def test_do_delete(self,url, method,casesname , expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method,"EXPECTED": expect}

        res = self.UM.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "删除成功":
            if "日志删除成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "删除失败1":
            if "日志删除失败" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "删除失败2":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])


    @data(*Get_UMT_TestData.get_BT_excel_data())
    @unpack
    def test_do_Bdelete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}

        res = self.UM.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "批量删除成功":
            if "日志删除成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "批量删除失败1":
            if "日志删除失败" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "批量删除失败2":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])


if __name__ == '__main__':
    unittest.main(verbosity=2)