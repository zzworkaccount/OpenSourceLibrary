# 从Save_TestData拿到测试数据
from tools.util import Utility
class Get_SM_TestData:
    # 从Excel中获取登录的测试数据(查询)
    @classmethod
    def get_user_management_excel_data_select(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_LMT.conf')[0]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

if __name__ == '__main__':
    print(Get_SM_TestData.get_user_management_excel_data_select())