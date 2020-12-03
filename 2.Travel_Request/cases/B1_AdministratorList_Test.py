import os
import unittest
import sys
import warnings

from parameterized import parameterized

from data.Get_TestData.Get_B1_ALT_Data import Get_AL_TestData
from lib.B1_AdministratorList_Action import AL_Action
from tools.service import Service
from tools.util import Utility


# 管理员列表
class AL_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.al = AL_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)

    # 新增
    @parameterized.expand(Get_AL_TestData.get_al_add_excel_data())
    def test_add(self , url , method , username , realname ,telephone , email , password , status , csesname , expect):
        add_data = {"URL":url , "METHOD":method ,
                    "DATA":{"username":username , "realname":realname , "telephone":telephone , "email":email,
                            "password":password,"status":status} , "CASENAME":csesname , "EXPECT":expect}
        res = self.al.do_add(add_data["URL"] , add_data["METHOD"] , add_data["DATA"])
        centent = res.json()

        # 断言
        if add_data["CASENAME"] == '成功新增管理员':
            if centent['msg']== '管理员增加成功':
                resutl = 'add-pass'
            else:
                resutl = 'add-fail'


        elif add_data["CASENAME"] == '新增管理员账户名为特殊字符':
            if centent['msg'] == '管理员增加失败':
                resutl = 'add-fail'
            else:
                resutl = 'error'

        elif add_data["CASENAME"] == '新增管理员姓名为特殊字符':
            if centent['msg'] == '管理员增加失败':
                resutl = 'add-fail'
            else:
                resutl = 'error'

        Utility.logger(add_data["CASENAME"], centent['msg'] , resutl, add_data["EXPECT"])
        self.assertEqual(resutl,add_data["EXPECT"])

    # 刷新
    @parameterized.expand(Get_AL_TestData.get_al_refresh_excel_data())
    def test_refresh(self , url , method , casesname , expect):
        res = self.al.do_refresh(url , method)
        centent = res.json()
        flag = False

        # 断言
        if casesname == '所有参数正确':
            try:
                if centent["count"] == 14:
                    flag = True
            except KeyError:
                flag = False

        elif casesname == 'page为特殊字符':
            try:
                if centent["count"] == 14:
                    flag = True
            except KeyError:
                flag = False

        elif casesname == 'limit为特殊字符':
            try:
                if centent["count"] == 14:
                    flag = True
            except KeyError:
                flag = False

        if flag:
            resutl = 'refresh-pass'
        else:
            resutl = 'refresh-fail'

        Utility.logger(casesname, flag, resutl, expect)
        self.assertEqual(resutl , expect)

    # 修改
    @parameterized.expand(Get_AL_TestData.get_al_edit_excel_data())
    def test_edit(self , url , method , id , username , realname , telephone , email , casesname , expect):
        edit_data = {"URL":url , "METHOD":method ,
                     "DATA":{"id":id , "username":username , "realname":realname ,
                             "telephone":telephone , "email":email},
                     "CASESNAME":casesname , "EXPECT":expect}
        res = self.al.do_edit(edit_data["URL"] , edit_data["METHOD"] , edit_data["DATA"])
        centent = res.json()

        # 断言
        if edit_data["CASESNAME"] == '修改管理员账户为合法账户名':
            if centent['message'] == '修改成功' and centent['status'] == 200:
                resutl = 'edit-pass'
            else:
                resutl = 'edit-fail'

        elif edit_data["CASESNAME"] == '修改用户名为特殊字符':
            if centent['message'] == '修改失败' and centent['status'] == 200:
                resutl = 'edit-fail'
            else:
                resutl = 'error'

        elif edit_data["CASESNAME"] == '修改姓名为特殊字符':
            if centent['message'] == '修改失败' and centent['status'] == 200:
                resutl = 'edit-fail'
            else:
                resutl = 'error'

        Utility.logger(casesname, centent['message'], resutl, expect)
        self.assertEqual(resutl, expect)

    # 删除
    @parameterized.expand(Get_AL_TestData.get_al_delete_excel_data())
    def test_delete(self , url , mehtod , casesname , expect):
        res = self.al.do_delet(url , mehtod)
        centent = res.json()
        if casesname == '删除已存在的数据':
            if centent['msg'] == '管理员删除成功':
                resutl = 'delete-pass'
            else:
                resutl = 'delete-fail'
            Utility.logger(casesname, centent['msg'], resutl,expect)

        elif casesname == '删除不存在的数据':
            if centent['msg'] == '管理员删除失败':
                resutl = 'delete-fail'
            else:
                resutl = 'error'
            Utility.logger(casesname, centent['msg'], resutl,expect)

        elif casesname == '删除的编号为特殊字符':
            if centent['message'] == '管理员删除失败':
                resutl = 'delete-fail'
            else:
                resutl = 'error'
            Utility.logger(casesname,centent['message'],resutl,expect)

        self.assertEqual(resutl,expect)

    # 查询
    @parameterized.expand(Get_AL_TestData.get_al_query_excel_data())
    def test_delete(self, url, mehtod, casesname, expect):
        res = self.al.do_query(url, mehtod)
        centent = res.json()
        if casesname == '查询已存在的数据':
            if centent['count'] == 1:
                resutl = 'query-pass'
            else:
                resutl = 'query-fail'

        elif casesname == '查询不存在的数据':
            if centent['count'] == 0:
                resutl = 'query-pass'
            else:
                resutl = 'query-fail'

        elif casesname == '查询的姓名为特殊字符':
            if centent['count'] == 0:
                resutl = 'query-pass'
            else:
                resutl = 'query-fail'

        Utility.logger(casesname, centent['count'], resutl, expect)
        self.assertEqual(resutl, expect)


    # 查询角色
    @parameterized.expand(Get_AL_TestData.get_al_roles_query_excel_data())
    def test_query_roles(self , url , method, casesname, expect):
        res = self.al.do_query_roles(url , method)
        centent = res.json()
        if casesname == '角色查询':
            if centent['count'] == 3:
                resutl = 'roles_query-pass'
            else:
                resutl = 'roles_query-fail'
            Utility.logger(casesname, centent['count'], resutl, expect)
            self.assertEqual(resutl, expect)

        elif casesname == '查询不存在的角色名':
            if centent['count'] == 3:
                resutl = 'roles_query-pass'
            else:
                resutl = 'roles_query-fail'
            Utility.logger(casesname, centent['count'], resutl, expect)
            self.assertEqual(resutl, expect)

        elif casesname == '角色名为特殊字符查询':
            if centent['message'] == "无数据":
                resutl = 'roles_query-fail'
            else:
                resutl = 'error'
            Utility.logger(casesname, centent['message'], resutl, expect)
            self.assertEqual(resutl,expect)


    # 分配角色
    @parameterized.expand(Get_AL_TestData.get_al_assign_roles_excel_data())
    def test_assign_roles(self , url , method, casesname, expect):
        res = self.al.do_assign_roles(url , method)
        centent = res.json()
        if casesname == '成功分配角色':
            if centent['msg']== '角色分配成功':
                resutl = 'assign-roles-pass'
            else:
                resutl = 'assign-roles-fail'
            Utility.logger(casesname, centent['msg'], resutl, expect)
            self.assertEqual(resutl , expect)

        elif casesname == '成功分配不存在的角色':
            if centent['msg'] == '角色分配失败':
                resutl = 'assign_roles-fail'
            else:
                resutl = 'error'
            Utility.logger(casesname, centent['msg'], resutl, expect)
            self.assertEqual(resutl, expect)

        elif casesname == '分配角色名为特殊字符的角色':
            if centent['status'] == 400:
                resutl = 'assign-roles-test-pass'
            else:
                resutl = 'assign-roles-test-fail'
            Utility.logger(casesname, centent['status'], resutl, expect)
            self.assertEqual(resutl, expect)


    # 批量删除
    @parameterized.expand(Get_AL_TestData.get_al_batches_delete_excel_data())
    def test_batches_delete(self , url , method, casesname, expect):
        res = self.al.do_batches_delete(url , method)
        centent = res.json()
        if casesname == '批量删除已存在的账户':
            if centent['msg'] == '管理员删除成功':
                resutl = 'batches-delete-test-pass'
            else:
                resutl = 'batches-delete-test-fail'
        elif casesname == '批量删除不存在的账户':
            if centent['msg'] == '没有该管理员':
                resutl = 'batches-delete-test-pass'
            else:
                resutl = 'batches-delete-test-fail'
        elif casesname == '批量删除uid为特殊字符的账户':
            if centent['msg'] == '没有该管理员':
                resutl = 'batches-delete-test-pass'
            else:
                resutl = 'batches-delete-test-fail'
        Utility.logger(casesname,centent['msg'],resutl,expect)
        self.assertEqual(resutl,expect)



    # 批量停用
    @parameterized.expand(Get_AL_TestData.get_al_batches_disabled_excel_data())
    def test_batches_disabled(self , url , method, casesname, expect):
        res = self.al.do_batches_disabled(url , method)
        centent = res.json()
        if casesname == '禁用已存在的账户':
            pass
        elif casesname == '禁用不存在的账户':
            pass
        elif casesname == '禁用uid为特殊字符的账户':
            pass


    # 批量启用
    @parameterized.expand(Get_AL_TestData.get_al_batches_enabled_excel_data())
    def test_batches_enabled(self , url , method, casesname, expect):
        res = self.al.do_batches_enabled(url , method)
        centent = res.json()
        if casesname == '启用已存在的账户':
            if centent['msg'] == '管理员禁用成功':
                resutl = 'batches-disabled-test-pass'
            else:
                resutl = 'batches-disabled-test-fail'

        elif casesname == '启用不存在的账户':
            if centent['msg'] == '管理员禁用失败':
                resutl = 'batches-disabled-test-pass'
            else:
                resutl = 'batches-disabled-test-fail'
        elif casesname == '启用uid为特殊字符的账户':
            if centent['msg'] == '管理员禁用失败':
                resutl = 'batches-disabled-test-pass'
            else:
                resutl = 'batches-disabled-test-fail'
        Utility.logger(casesname,centent['msg'],resutl,expect)
        self.assertEqual(resutl,expect)


if __name__ == '__main__':
    unittest.main(verbosity=2)


