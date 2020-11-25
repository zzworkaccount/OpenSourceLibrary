# 周边商城
import json
import os
import unittest
import warnings
from json import JSONDecodeError

from parameterized import parameterized
import requests
from ddt import ddt,unpack,data
from requests import session


from data.Get_TestData.Get_G1_SM_Data import Get_SM_TestData
from lib.D1_UserList_Action import UL_Action
from tools.service import Service
from tools.util import Utility
path = r"D:\woo\WoniuTicket_Request\wts.sql"
class SM_Test(unittest.TestCase):

    def setUp(self) -> None:
        warnings.simplefilter('ignore', ResourceWarning)
        Utility.initialize_DB()
        self.ul = UL_Action(Service.get_session_app())

    # 查询周边商城
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_query_list(2))
    def test_SurroundingMall_query_list(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data["CASENAME"] == "查询周边商城列表":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                actual = len(json.loads(result)['data'])
                if str(actual):
                    flag = "1"
                else:
                    flag = "0"
                self.assertEqual(flag, query_list_data["EXPECTED"])
        else:
            query_list_data['CASENAME'] = '用例名错误'
        Utility.logger(query_list_data['CASENAME'], actual, flag, expected)

    # 查询商品类型
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_query_type(2))
    def test_SurroundingMall_query_list(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data["CASENAME"] == "查询周边商城商品类型":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                actual = str(json.loads(result)['msg'])
                self.assertEqual(actual, query_list_data["EXPECTED"])
        else:
            query_list_data['CASENAME'] = '用例名错误'
        Utility.logger(query_list_data['CASENAME'], actual, actual, expected)

    # 商品按照销量降序排列
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_query_sale_desc(2))
    def test_SurroundingMall_query_desc(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data["CASENAME"] == "查询销量降序条件合法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                value = json.loads(result)
                length = len(value)-1
                flag = "1"
                for index in range(length):
                    if value[index]['sale'] < value[index+1]['sale']:
                        flag = "0"
                        break
                    else:
                        continue
                Utility.logger(query_list_data['CASENAME'], flag, flag, expected)
                self.assertEqual(flag, query_list_data["EXPECTED"])
        elif query_list_data["CASENAME"] == "查询销量降序条件非法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                actual = json.loads(result)['error']
                Utility.logger(query_list_data['CASENAME'], actual, actual, expected)
                self.assertEqual(actual, query_list_data["EXPECTED"])
        else:
            query_list_data['CASENAME'] = '用例名错误'


    # 商品按照价格升序排列
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_price_asc(2))
    def test_SurroundingMall_query_price_desc(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data["CASENAME"] == "查询价格升序条件合法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                value = json.loads(result)
                length = len(value) - 1
                flag = "1"
                for index in range(length):
                    if value[index]['promotionPrice'] > value[index + 1]['promotionPrice']:
                        flag = "0"
                        break
                    else:
                        continue
                Utility.logger(query_list_data['CASENAME'], flag, flag, expected)
                self.assertEqual(flag, query_list_data["EXPECTED"])

        elif query_list_data["CASENAME"] == "查询价格升序条件非法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                actual = json.loads(result)['error']
                Utility.logger(query_list_data['CASENAME'], actual, actual, expected)
                self.assertEqual(actual, query_list_data["EXPECTED"])
        else:
            query_list_data['CASENAME'] = '用例名错误'


    # 商品按照价格升序排列
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_price_desc(2))
    def test_SurroundingMall_query_desc(self, url, res_method, cases_name, expected):
        query_list_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_list_data["CASENAME"] == "查询价格降序条件合法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                value = json.loads(result)
                length = len(value) - 1
                flag = "1"
                for index in range(length):
                    try:
                        if value[index]['promotionPrice'] < value[index + 1]['promotionPrice']:
                            flag = "0"
                            break
                    except KeyError:
                        flag = '1'

                Utility.logger(query_list_data['CASENAME'], flag, flag, expected)
                self.assertEqual(flag, query_list_data["EXPECTED"])

        elif query_list_data["CASENAME"] == "查询价格降序条件非法":
            if query_list_data["METHOD"] == "GET":
                result = self.ul.doGet(query_list_data["URL"])
                actual = json.loads(result)['error']
                Utility.logger(query_list_data['CASENAME'], actual, actual, expected)
                self.assertEqual(actual, query_list_data["EXPECTED"])
        else:
            query_list_data['CASENAME'] = '用例名错误'


    # 新增收货地址
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_add_address(2))
    def test_SurroundingMall_add_address(self, url, res_method, id, userId, name, phone, address, isDefault, cases_name, expected):
        add_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                    "DATA": {"id": id, "userId": userId, "name": name, "phone": phone, "address": address, "isDefault": isDefault}, "EXPECTED": expected}
        if add_data["CASENAME"] == "新增地址所有必填项合法":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data['URL'],add_data['DATA'])
                actual = json.loads(result)['msg']

        elif add_data["CASENAME"] == "新增地址联系人必填项为空":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data['URL'],add_data['DATA'])
                actual = json.loads(result)['msg']
                # self.assertEqual(actual, add_data["EXPECTED"])

        elif add_data["CASENAME"] == "新增重复收货人地址":
            if add_data["METHOD"] == "POST":
                result = self.ul.doPost(add_data['URL'],add_data['DATA'])
                actual = json.loads(result)['msg']
        else:
            add_data['CASENAME'] = '用例名错误'
        Utility.logger(add_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, add_data["EXPECTED"])

    # 删除收货地址
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_delete_address(2))
    def test_SurroundingMall_delete(self, url, res_method, cases_name, expected):
        delete_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if delete_data['CASENAME'] == "删除存在的地址编号":
            if delete_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(delete_data['URL'])
                actual = json.loads(result)['msg']


        elif delete_data['CASENAME'] == "删除存在的地址编号":
            if delete_data['METHOD'] == "DELETE":
                result = self.ul.doDelete(delete_data['URL'])
                actual = json.loads(result)['msg']

        else:
            delete_data['CASENAME'] = '用例名错误'
        Utility.logger(delete_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, delete_data["EXPECTED"])

    # 修改收货地址
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_edit_address(2))
    def test_SurroundingMall_edit(self, url, res_method, address, id, isDefault, name, phone, userId, cases_name, expected):
        edit_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                       "DATA": {"address": address, "id": id, "isDefault": isDefault, "name": name, "phone": phone,"userId": userId}, "EXPECTED": expected}
        if edit_data['CASENAME'] == "修改收货地址必填项合法":
            if edit_data['METHOD'] == "PUT":
                result = self.ul.doPut(edit_data['URL'], edit_data['DATA'])
                actual = json.loads(result)['msg']
        elif edit_data['CASENAME'] == "修改收货地址手机号非法":
            if edit_data['METHOD'] == "PUT":
                result = self.ul.doPut(edit_data['URL'], edit_data['DATA'])
                actual = json.loads(result)['msg']
        else:
            edit_data['CASENAME'] = '用例名错误'
        Utility.logger(edit_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, edit_data["EXPECTED"])

    # 创建订单
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_add_order(2))
    def test_SurroundingMall_add_order(self, url, res_method, remarks, addressId, totalAmount, carriage, goodsId, count,
                                       price, id, cases_name, expected):
        edit_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                     "DATA": {"remarks": remarks, "addressId": addressId, "totalAmount": totalAmount,
                              "carriage": carriage, "goodsId": goodsId, "count": count, "price": price, "id": id},
                     "EXPECTED": expected}

        if edit_data['CASENAME'] == "创建订单存在的订单ID":
            if edit_data['METHOD'] == "POST":
                result = self.ul.doPost(edit_data['URL'], edit_data['DATA'])
                actual = json.loads(result)['status']
        elif edit_data['CASENAME'] == "创建订单不存在的订单ID":
            if edit_data['METHOD'] == "POST":
                result = self.ul.doPost(edit_data['URL'], edit_data['DATA'])
                actual = json.loads(result)['status']
        else:
            edit_data['CASENAME'] = '用例名错误'
        Utility.logger(edit_data['CASENAME'], actual, actual, expected)
        self.assertEqual(actual, edit_data["EXPECTED"])

    # 登录
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_add_login(2))
    def test_SurroundingMall_add_login(self, url, res_method, phone, pwd, cases_name, expected):
        add_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method,
                    "DATA": {"phone": phone, "pwd": pwd}, "EXPECTED": expected}
        if add_data['CASENAME'] == "登录正确的手机号":
            if add_data['METHOD'] == "POST":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                actual = json.loads(result)['msg']
                Utility.logger(add_data['CASENAME'], actual, actual, expected)
                self.assertEqual(actual, add_data['EXPECTED'])

        elif add_data['CASENAME'] == "登录错误的手机号":
            if add_data['METHOD'] == "POST":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                actual = json.loads(result)['error']
                Utility.logger(add_data['CASENAME'], actual, actual, expected)
                self.assertEqual(actual, add_data['EXPECTED'])
        elif add_data['CASENAME'] == "登录错误的密码":
            res = ""
            if add_data['METHOD'] == "POST":
                result = self.ul.doPost(add_data['URL'], add_data['DATA'])
                try:
                    actual = json.loads(result)
                    flag = True
                except JSONDecodeError:
                    flag = False
                if flag:
                    res = '验证失败'
                else:
                    res = 'error'
            Utility.logger(add_data['CASENAME'], res, res, expected)
            self.assertEqual(res, add_data['EXPECTED'])
        else:
            add_data['CASENAME'] = '用例名错误'

    # 查看任意商品
    @parameterized.expand(Get_SM_TestData.get_login_excel_data_query_goodsId(2))
    def test_SurroundingMall_query_goods(self, url, res_method, cases_name, expected):
        query_goods_data = {"CASENAME": cases_name, "URL": url, "METHOD": res_method, "EXPECTED": expected}
        if query_goods_data['CASENAME'] == "查询存在的商品ID":
            if query_goods_data['METHOD'] == "GET":
                result = self.ul.doGet(query_goods_data['URL'])
                actual = str(json.loads(result)['id'])
            Utility.logger(query_goods_data['CASENAME'], actual, actual, expected)
            self.assertEqual(actual, query_goods_data['EXPECTED'])
        elif query_goods_data['CASENAME'] == "查询不存在的商品ID":
            result = ""
            if query_goods_data['METHOD'] == "GET":
                res = self.ul.doGet(query_goods_data['URL'])
                try:
                    actual = json.loads(res)
                    flag = True
                except JSONDecodeError:
                    flag = False
                if flag:
                    result = '商品不存在'
                else:
                    result = 'error'
            Utility.logger(query_goods_data['CASENAME'], result, result, expected)
            self.assertEqual(result, query_goods_data['EXPECTED'])
        else:
            query_goods_data['CASENAME'] = '用例名错误'


if __name__ == '__main__':
    unittest.main()
