# 从Save_TestData拿到测试数据
from tools.util import Utility
class Get_UL_TestData:
    # 从Excel中获取登录的测试数据(新增)
    @classmethod
    def get_user_management_excel_data_add(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\H_UMT.conf')[0]
        login_data = Utility.get_excel(login_info)
        return login_data

    # 从Excel中获取登录的测试数据(删除)
    @classmethod
    def get_user_management_excel_data_delete(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\H_UMT.conf')[1]
        login_data = Utility.get_excel(login_info)
        return login_data



if __name__ == '__main__':
    print(Get_UL_TestData.get_user_management_excel_data_add())
    print(Get_UL_TestData.get_user_management_excel_data_delete())