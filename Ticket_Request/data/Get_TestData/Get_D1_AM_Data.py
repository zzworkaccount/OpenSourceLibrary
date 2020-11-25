# 从Save_TestData拿到测试数据
from tools.util import Utility


class Get_SM_TestData:

    # 从Excel中获取登录的测试数据（查询演职人员）
    @classmethod
    def get_login_excel_data_query_actor(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\D_AM.conf')[0]
        login_data = Utility.get_excel(login_info,row)
        return login_data

    # 从Excel中获取登录的测试数据（查询演职人员）
    @classmethod
    def get_login_excel_data_delete_actor(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\D_AM.conf')[1]
        login_data = Utility.get_excel(login_info,row)
        return login_data

    # 从Excel中获取登录的测试数据（新增演职人员）
    @classmethod
    def get_login_excel_data_add_actor(cls, row=0):
        login_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\D_AM.conf')[2]
        login_data = Utility.get_excel(login_info, row)
        return login_data

if __name__ == '__main__':
    print(Get_SM_TestData.get_login_excel_data_add_actor(1))
