import unittest,warnings
from ddt import ddt,data,unpack
from tools.service import Service
from data.Get_TestData.Get_M1_ASA_Data import Get_ASA_TestData
from lib.M1_Shipping_Addres_Action import ASA_Action
from tools.util import Utility


@ddt
class ASA_Test(unittest.TestCase):
    def setUp(self):
        self.ASA = ASA_Action(Service.get_session_tm())
        Utility.initialize_DB()

    @data(*Get_ASA_TestData.get_AASA_excel_data())
    @unpack
    def test_do_add_movie(self, url, method, id,userId,name,phone,address,isDefault, casesname, expect):
            warnings.simplefilter('ignore', ResourceWarning)
            test_data = {"CASESNAME": casesname, "URL": url,
                         "METHOD": method,
                         "DATA": {"id": id,"userId":userId,"name":name, "phone": phone,"address":address,"isDefault":isDefault}, "EXPECTED": expect}
            res = self.ASA.do_add(test_data['URL'], test_data["METHOD"], test_data["DATA"])

            if casesname == "地址添加成功":
                if "地址增加成功" in res.text:
                    result = "add_pass"
                else:
                    result = "add_fail"
                self.assertEqual(result, test_data['EXPECTED'])
            if casesname == "地址添加失败1":
                if "地址已存在" in res.text:
                    result = "add_pass"
                else:
                    result = "add_fail"
                self.assertEqual(result, test_data['EXPECTED'])
            if casesname == "地址添加失败2":
                if "Bad Request" in res.text:
                    result = "add_pass"
                else:
                    result = "add_fail"
                self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_ASA_TestData.get_aASA_excel_data())
    @unpack
    def test_do_alter_movie(self, url, method,address, id, isDefault,name,phone,userId,casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method,
                     "DATA": {"id": id, "userId": userId, "name": name, "phone": phone, "address": address,
                              "isDefault": isDefault}, "EXPECTED": expect}
        res = self.ASA.do_edit(test_data['URL'], test_data["METHOD"], test_data["DATA"])

        if casesname == "修改成功":
            if "地址修改成功" in res.text:
                result = "put_pass"
            else:
                result = "put_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "修改失败1":
            if "地址修改失败" in res.text:
                result = "put_pass"
            else:
                result = "put_fail"
            self.assertEqual(result, test_data['EXPECTED'])
        if casesname == "修改失败2":
            if "Bad Request" in res.text:
                result = "put_pass"
            else:
                result = "put_fail"
            self.assertEqual(result, test_data['EXPECTED'])

    @data(*Get_ASA_TestData.get_DASA_excel_data())
    @unpack
    def test_do_delete(self, url, method, casesname, expect):
        warnings.simplefilter('ignore', ResourceWarning)
        test_data = {"CASESNAME": casesname, "URL": url,
                     "METHOD": method, "EXPECTED": expect}
        res = self.ASA.do_delet(test_data['URL'], test_data["METHOD"])

        if casesname == "删除成功":
            if "地址删除成功" in res.text:
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


if __name__ == '__main__':
    unittest.main(verbosity=2)


