# 从Save_TestData拿到测试数据
from tools.util import Utility
class Get_PM_TestData:
    # 从Excel中获取登录的测试数据(编辑)
    @classmethod
    def get_user_management_excel_data_edit1(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_PM.conf')[0]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

    @classmethod
    def get_user_management_excel_data_edit2(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_PM.conf')[1]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

    @classmethod
    def get_user_management_excel_data_edit3(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_PM.conf')[2]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

    @classmethod
    def get_user_management_excel_data_edit4(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_PM.conf')[3]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

# 从Excel中获取登录的测试数据(查询)
    @classmethod
    def get_user_management_excel_data_find(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_PM.conf')[4]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

if __name__ == '__main__':
    print(Get_PM_TestData.get_user_management_excel_data_find())