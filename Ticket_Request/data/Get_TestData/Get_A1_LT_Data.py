# 从Save_TestData拿到测试数据
from parameterized import parameterized

from tools.util import Utility


class Get_LG_TestData:

    # 从Excel中获取登录的测试数据
    @classmethod
    def get_login_excel_data(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\A_LT.conf')[0]
        login_data = Utility.get_excel(login_info)
        return login_data





if __name__ == '__main__':
    print(Get_LG_TestData.get_login_excel_data())
