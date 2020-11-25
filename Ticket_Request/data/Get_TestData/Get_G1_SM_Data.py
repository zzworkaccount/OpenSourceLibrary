# 从Save_TestData拿到测试数据
from tools.util import Utility


class Get_SM_TestData:

    # 从Excel中获取登录的测试数据（周边商城的搜索）
    @classmethod
    def get_login_excel_data_query_list(cls,row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[0]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（周边商城类型的搜索）
    @classmethod
    def get_login_excel_data_query_type(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[1]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（周边商城销量降序的搜索）
    @classmethod
    def get_login_excel_data_query_sale_desc(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[2]
        login_data = Utility.get_excel(login_info,row)
        return login_data

    # 从Excel中获取登录的测试数据（周边商城价格升序的搜索）
    @classmethod
    def get_login_excel_data_price_asc(cls, row=0):
        login_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[3]
        login_data = Utility.get_excel(login_info, row)
        return login_data

# 从Excel中获取登录的测试数据（周边商城价格降序的搜索）
    @classmethod
    def get_login_excel_data_price_desc(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[4]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（添加收货地址）
    @classmethod
    def get_login_excel_data_add_address(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[5]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（添加收货地址）
    @classmethod
    def get_login_excel_data_delete_address(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[6]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（编辑收货地址）
    @classmethod
    def get_login_excel_data_edit_address(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[7]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（创建订单）
    @classmethod
    def get_login_excel_data_add_order(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[8]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（登录）
    @classmethod
    def get_login_excel_data_add_login(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[9]
        login_data = Utility.get_excel(login_info,row)
        return login_data

# 从Excel中获取登录的测试数据（查看商品）
    @classmethod
    def get_login_excel_data_query_goodsId(cls, row=0):
        login_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\G_SM.conf')[10]
        login_data = Utility.get_excel(login_info,row)
        return login_data

if __name__ == '__main__':
    # print(Get_SM_TestData.get_login_excel_data_query_list(2))
    # print(Get_SM_TestData.get_login_excel_data_price_asc(2))
    # print(Get_SM_TestData.get_login_excel_data_price_desc(2))
    print(Get_SM_TestData.get_login_excel_data_add_address(2))
    # print(Get_SM_TestData.get_login_excel_data_add_login(2))
    # print(Get_SM_TestData.get_login_excel_data_query_goodsId(2))

