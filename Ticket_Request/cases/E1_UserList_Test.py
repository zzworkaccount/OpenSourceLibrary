# 用户列表
import json
import os
import unittest
import warnings

from parameterized import parameterized
import requests
from ddt import ddt,unpack,data
from requests import session

from data.Get_TestData.Get_E1_UL_Data import Get_LG_TestData
from lib.D1_UserList_Action import UL_Action
from tools.service import Service
from tools.util import Utility
path = r"D:\woo\WoniuTicket_Request\wts.sql"
@ddt
class UL_Test(unittest.TestCase):

    def setUp(self) -> None:
        # os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")
        warnings.simplefilter('ignore', ResourceWarning)
        # Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)
        self.ul = UL_Action(Service.get_session())

    @parameterized.expand(Get_LG_TestData.get_login_excel_data_add())
    def test_UserList_add(self, url, res_method, name, phone, email, cases_name, expected):
        add_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                      "DATA": {"name": name, "phone": phone, "email": email}, "EXPECTED": expected}
        if add_data["CASENAME"] == "新增所有必填项":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data["URL"], add_data["DATA"])
                actual = json.loads(result)['msg']


        elif add_data["CASENAME"] == "新增重复":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data["URL"], add_data["DATA"])
                actual = json.loads(result)['msg']


        elif add_data["CASENAME"] == "新增手机号非法":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data["URL"], add_data["DATA"])
                actual = json.loads(result)['msg']
        else:
            add_data['CASENAME'] = '用例名错误'

        Utility.logger(add_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, add_data["EXPECTED"])


    @parameterized.expand(Get_LG_TestData.get_login_excel_data_delete())
    def test_UserList_delete(self, url, res_method,cases_name, expected):
        delete_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if delete_data['CASENAME'] == "删除存在的ID":
            if delete_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(delete_data['URL'])
                actual = json.loads(result)['msg']
                # self.assertEqual(actual, delete_data['EXPECTED'])

        elif delete_data['CASENAME'] == "删除不存在的ID":
            if delete_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(delete_data['URL'])
                actual = json.loads(result)['msg']
        else:
            delete_data['CASENAME'] = '用例名错误'

        Utility.logger(delete_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, delete_data['EXPECTED'])

    @parameterized.expand(Get_LG_TestData.get_login_excel_data_edit())
    def test_UserList_edit(self, url, res_method, name, phone, email, cases_name, expected):
        edit_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                      "DATA": {"name": name, "phone": phone, "email": email}, "EXPECTED": expected}
        if edit_data['CASENAME'] == "修改合法必填项":
            if edit_data['METHOD'] == "PUT":
                result = self.ul.doPut(edit_data['URL'], edit_data['DATA'])
                actual = json.loads(result)['msg']
                # self.assertEqual(actual, edit_data['EXPECTED'])

        elif edit_data['CASENAME'] == "修改用户名为空":
            if edit_data['METHOD'] == "PUT":
                result = self.ul.doPut(edit_data["URL"], edit_data["DATA"])
                actual = json.loads(result)['msg']
                # self.assertEqual(actual, edit_data['EXPECTED'])

        elif edit_data['CASENAME'] == "修改非法手机号":
            if edit_data['METHOD'] == "PUT":
                result = self.ul.doPut(edit_data["URL"], edit_data["DATA"])
                actual = json.loads(result)['msg']
                # self.assertEqual(actual, edit_data['EXPECTED'])
        else:
            edit_data['CASENAME'] = '用例名错误'
        Utility.logger(edit_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, edit_data['EXPECTED'])

    @classmethod
    def tearDownClass(cls) -> None:
        print("用例执行完成")

if __name__ == '__main__':
    unittest.main()
