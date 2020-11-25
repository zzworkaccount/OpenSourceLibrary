# 从Save_TestData拿到测试数据
from tools.util import Utility

class Get_UM_TestData:
    @classmethod
    def get_User_management_excel_data(cls):
        User_management_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_UMT.conf')[0]
        User_management_data = Utility.get_excel(User_management_info)
        return User_management_data

if __name__ == '__main__':
    print(Get_UM_TestData.get_User_management_excel_data())