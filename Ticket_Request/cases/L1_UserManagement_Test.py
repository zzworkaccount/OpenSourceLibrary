import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_L1_MUM_Data import Get_MUM_TestData
from lib.L1_UserManagement_Action import MUM_Action
from tools.util import Utility


@ddt
class MUM_Test(unittest.TestCase):
    def setUp(self):
        self.MUM = MUM_Action(Service.get_session_tm())
        Utility.initialize_DB()

    @data(*Get_MUM_TestData.get_MDUM_excel_data())
    @unpack
    def test_do_delete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}
        res = self.MUM.do_delet(test_data['URL'], test_data["METHOD"])
        if casesname == "删除用户成功":
            if "删除演职人员成功" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "删除用户失败1":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "删除用户失败2":
            if "Bad Request" in res.text:
                result = "delete_pass"
            else:
                result = "delete_fail"
            self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_MUM_TestData.get_MQUM_excel_data())
    @unpack
    def test_do_query(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}
        res = self.MUM.do_query(test_data['URL'], test_data["METHOD"])
        if casesname == "查询成功":
            if "he" in res.text:
                result = "query_pass"
            else:
                result = "query_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "查询失败1":
            if "Bad Request" in res.text:
                result = "query_pass"
            else:
                result = "query_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "查询失败2":
            if "Bad Request" in res.text:
                result = "query_pass"
            else:
                result = "query_fail"
            self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_MUM_TestData.get_MAUM_excel_data())
    @unpack
    def test_do_add_movie(self, url, method, id, cUsername, role,  casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method,
                     "DATA": {"id": id, "cUsername": cUsername, "role.id": role}, "EXPECTED": expect}
        print(test_data["METHOD"])
        res = self.MUM.do_edit(test_data['URL'], test_data["METHOD"], test_data["DATA"])
        if casesname == "修改成功":
            if "修改用户信息成功" in res.text:
                result = "alter_pass"
            else:
                result = "alter_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "修改失败1":
            if "修改用户信息失败" in res.text:
                result = "alter_pass"
            else:
                result = "alter_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "修改失败2":
            if "Bad Request" in res.text:
                result = "alter_pass"
            else:
                result = "alter_fail"
            self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_MUM_TestData.get_MaUM_excel_data())
    @unpack
    def test_do_add_movie(self, url, method,  cUsername,cTelephone,cPassword, role, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method,
                     "DATA": {"cUsername": cUsername,"cTelephone":cTelephone,"cPassword":cPassword, "role.id": role}, "EXPECTED": expect}
        res = self.MUM.do_add(test_data['URL'], test_data["METHOD"], test_data["DATA"])
        if casesname == "添加成功":
            if "添加用户成功" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "添加失败1":
            if "用户已存在" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "添加失败2":
            if "Bad Request" in res.text:
                result = "add_pass"
            else:
                result = "add_fail"
            self.assertEqual(result, test_data['EXPECTED'])

if __name__ == '__main__':
    unittest.main(verbosity=2)