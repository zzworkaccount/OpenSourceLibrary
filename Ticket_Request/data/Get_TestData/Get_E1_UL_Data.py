# 从Save_TestData拿到测试数据
from tools.util import Utility


class Get_LG_TestData:

    # 从Excel中获取登录的测试数据（用户列表的新增）
    @classmethod
    def get_login_excel_data_add(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\E_UL.conf')[0]
        login_data = Utility.get_excel(login_info)
        return login_data

    # 从Excel中获取登录的测试数据(用户列表的删除)
    @classmethod
    def get_login_excel_data_delete(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\E_UL.conf')[1]
        login_data = Utility.get_excel(login_info)
        return login_data

# 从Excel中获取登录的测试数据(用户列表的删除)
    @classmethod
    def get_login_excel_data_edit(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\E_UL.conf')[2]
        login_data = Utility.get_excel(login_info)
        return login_data


if __name__ == '__main__':
    print(Get_LG_TestData.get_login_excel_data_add())
