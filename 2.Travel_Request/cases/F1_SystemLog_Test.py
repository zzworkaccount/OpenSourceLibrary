# 系统日志
import json
import os
import unittest
import warnings

from parameterized import parameterized
from ddt import data, unpack, ddt

from data.Get_TestData.Get_F1_SL_Data import Get_LG_TestData
from lib.D1_UserList_Action import UL_Action
from tools.service import Service
from tools.util import Utility



class SL_Test(unittest.TestCase):
    def setUp(self) -> None:
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)
        self.ul = UL_Action(Service.get_session())

    @parameterized.expand(Get_LG_TestData.get_login_excel_data_query())
    def test_LogManagement_query(self, url, res_method, cases_name, expected):
        query_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_data["CASENAME"] == "查询正确的操作名":
            if query_data["METHOD"] == "GET":
                result = self.ul.doGet(query_data["URL"])
                actual = json.loads(result)["data"][0]["operation"]
                self.assertIn(actual, query_data["EXPECTED"])

        elif query_data["CASENAME"] == "查询非法的操作名":
            if query_data["METHOD"] == "GET":
                result = self.ul.doGet(query_data["URL"])
                actual = str(json.loads(result)["count"])
                self.assertEqual(actual, query_data["EXPECTED"])

        elif query_data["CASENAME"] == "查询空的操作名":
            if query_data["METHOD"] == "GET":
                result = self.ul.doGet(query_data["URL"])
                actual = str(json.loads(result)['count'])
                self.assertEqual(actual, query_data["EXPECTED"])
        else:
            query_data['CASENAME'] = '用例名错误'
        Utility.logger(query_data['CASENAME'], actual, actual, expected)

    # 删除单个按钮
    @parameterized.expand(Get_LG_TestData.get_login_excel_data_delete())
    def test_LogManagement_delete(self, url, res_method, cases_name, expected):
        query_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_data['CASENAME'] == "删除存在的ID":
            if query_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(query_data['URL'])
                actual = json.loads(result)['msg']


        elif query_data['CASENAME'] == "删除不存在的ID":
            if query_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(query_data['URL'])
                actual = json.loads(result)['msg']

        else:
            query_data['CASENAME'] = '用例名错误'
        Utility.logger(query_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, query_data['EXPECTED'])

    # 批量删除按钮
    @parameterized.expand(Get_LG_TestData.get_login_excel_data_query_batch_delete())
    def test_LogManagement_delete(self, url, res_method, cases_name, expected):
        query_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_data['CASENAME'] == "删除存在的ID":
            if query_data['METHOD'] == "GET":
                result = self.ul.doGet(query_data['URL'])
                actual = json.loads(result)['msg']


        elif query_data['CASENAME'] == "删除不存在的ID":
            if query_data['METHOD'] == "GET":
                result = self.ul.doGet(query_data['URL'])
                actual = json.loads(result)['msg']

        else:
            query_data['CASENAME'] = '用例名错误'
        Utility.logger(query_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, query_data['EXPECTED'])

    @parameterized.expand(Get_LG_TestData.get_login_excel_data_query_list())
    def test_LogManagement_query_list(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data['CASENAME'] == "查询合法的页数和显示行数":
            if query_list_data['METHOD'] == "GET":
                result = self.ul.doGet(query_list_data['URL'])
                actual = str(json.loads(result)['count'])
                self.assertEqual(actual, query_list_data['EXPECTED'])

        if query_list_data['CASENAME'] == "查询不合法的页数":
            if query_list_data['METHOD'] == "GET":
                result = self.ul.doGet(query_list_data['URL'])
                actual = json.loads(result)['error']
                self.assertEqual(actual, query_list_data['EXPECTED'])

        if query_list_data['CASENAME'] == "查询不合法的行数":
            if query_list_data['METHOD'] == "GET":
                result = self.ul.doGet(query_list_data['URL'])
                actual = json.loads(result)['error']
                self.assertEqual(actual, query_list_data['EXPECTED'])
        else:
            query_list_data['CASENAME'] = '用例名错误'
        Utility.logger(query_list_data['CASENAME'], actual, actual, expected)



if __name__ == '__main__':
    unittest.main()
