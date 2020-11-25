# 从Save_TestData拿到测试数据
from tools.util import Utility


class Get_LG_TestData:

    # 从Excel中获取登录的测试数据（条件查询）
    @classmethod
    def get_login_excel_data_query(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_SL.conf')[0]
        login_data = Utility.get_excel(login_info)
        return login_data

# 从Excel中获取登录的测试数据（用户列表的删除）
    @classmethod
    def get_login_excel_data_delete(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_SL.conf')[1]
        login_data = Utility.get_excel(login_info)
        return login_data

# 从Excel中获取登录的测试数据（用户列表的查询）
    @classmethod
    def get_login_excel_data_query_list(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_SL.conf')[2]
        login_data = Utility.get_excel(login_info)
        return login_data

    # 从Excel中获取登录的测试数据（用户列表的批量删除）
    @classmethod
    def get_login_excel_data_query_batch_delete(cls):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\F_SL.conf')[3]
        login_data = Utility.get_excel(login_info)
        return login_data

if __name__ == '__main__':
    print(Get_LG_TestData.get_login_excel_data_query_batch_delete())
