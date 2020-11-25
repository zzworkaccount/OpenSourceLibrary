import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_K1_CLT_Data import Get_ACLT_TestData
from lib.K1_CinemaList_Action import ACL_Action
from tools.util import Utility


@ddt
class CL_Test(unittest.TestCase):
    def setUp(self):
        self.ACL = ACL_Action(Service.get_session_tm())
        Utility.initialize_DB()

    @data(*Get_ACLT_TestData.get_ACL_excel_data())
    @unpack
    def test_do_add_movie(self, url, method, cName,province,city,zone,cAddress,cPhone,casesname,expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "DATA":{"cName": cName, "province": province, "city": city,"zone":zone,"cAddress":cAddress,"cPhone":cPhone},"EXPECTED": expect}
        res = self.ACL.do_add(test_data['URL'], test_data["METHOD"], test_data["DATA"])
        if casesname == "添加影院成功":
            if "增加电影院成功" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "影院添加失败1":
            if "增加电影院失败" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "影院添加失败2":
            if "增加电影院失败" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_ACLT_TestData.get_DCL_excel_data())
    @unpack
    def test_do_delete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}
        res = self.ACL.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "删除影院成功":
            if "删除电影院成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "影院删除失败1":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "影院删除失败2":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])



if __name__ == '__main__':
    unittest.main(verbosity=2)