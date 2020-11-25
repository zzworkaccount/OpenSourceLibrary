import json
import unittest
import warnings

from parameterized import parameterized

from data.Get_TestData.Get_D1_AM_Data import Get_SM_TestData
from lib.D1_UserList_Action import UL_Action
from tools.service import Service
from tools.util import Utility

class AM_Test(unittest.TestCase):

    def setUp(self) -> None:
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)
        self.ul = UL_Action(Service.get_session_tm())

    # 查询演员
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_query_actor(1))
    def test_SurroundingMall_query_actor(self, url, res_method, cases_name, expected):
        edit_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        result = self.ul.doGet(edit_data['URL'])

        if edit_data['CASENAME'] == "查询存在的电影名":
            if edit_data['METHOD'] == "GET":
                actual = str(json.loads(result)['count'])

        elif edit_data['CASENAME'] == "查询不存在的电影名":
            if edit_data['METHOD'] == "GET":
                actual = str(json.loads(result)['count'])

        elif edit_data['CASENAME'] == "查询不存在的page":
            if edit_data['METHOD'] == "GET":
                actual = str(json.loads(result)['count'])

        else:
            edit_data['CASENAME'] = '用例名错误'

        Utility.logger(edit_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, edit_data['EXPECTED'])

    # 删除演职演员
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_delete_actor(1))
    def test_SurroundingMall_delete_actor(self, url, res_method, cases_name, expected):
        delete_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        result = self.ul.doDelete(delete_data['URL'])
        if delete_data['CASENAME'] == "删除存在的演职人员ID":
            if delete_data['METHOD'] == "DELETE":
                actual = json.loads(result)['msg']

        elif delete_data['CASENAME'] == "删除不存在的演职人员ID":
            if delete_data['METHOD'] == "DELETE":
                actual = json.loads(result)['msg']

        else:
            delete_data['CASENAME'] = '用例名错误'

        Utility.logger(delete_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, delete_data['EXPECTED'])

    # 增加演职演员
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_add_actor(1))
    def test_SurroundingMall_add_actor(self, url, res_method, mid, realName, actorType, role, actorPic, cases_name,
                                       expected):
        add_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                    "DATA": {"mid": mid, "realName": realName, "actorType": actorType, "role": role,
                             "actorPic": actorPic}, "EXPECTED": expected}

        actual = ""
        if add_data['CASENAME'] == "添加演职人员ID":
            if add_data['METHOD'] == "POST":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                actual = json.loads(result)['msg']

        elif add_data['CASENAME'] == "添加不存在的演职人员ID":
            if add_data['METHOD'] == "DELETE":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                actual = json.loads(result)['msg']

        elif add_data['CASENAME'] == "添加重复的演职人员ID":
            if add_data['METHOD'] == "POST":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                actual = json.loads(result)['msg']
        else:
            add_data['CASENAME'] = '用例名错误'
        Utility.logger(add_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, add_data['EXPECTED'])



if __name__ == '__main__':
    unittest.main()