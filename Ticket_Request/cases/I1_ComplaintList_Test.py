# 投诉列表
import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_I1_CLT_Data import Get_CLT_TestData
from lib.I1_ComplaintList_Action import CL_Action
from tools.util import Utility


@ddt
class CL_Test(unittest.TestCase):
    def setUp(self):
        self.CL = CL_Action(Service.get_session())
        Utility.initialize_DB()

    @data(*Get_CLT_TestData.get_CL_excel_data())
    @unpack
    def test_do_delete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}
        res = self.CL.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "删除成功":
            if "投诉删除成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "删除失败1":
            if "Bad Request" in res.text:
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



    @data(*Get_CLT_TestData.get_BCL_excel_data())
    @unpack
    def test_do_Bdelete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}

        res = self.CL.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "批量删除成功":
            if "投诉删除成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "批量删除失败1":
            if "Bad Request" in res.text:
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