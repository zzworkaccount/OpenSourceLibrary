from tools.util import Utility


class Get_AL_TestData:


    # 从Excel中获取登录的测试数据
    @classmethod
    def get_al_add_excel_data(cls):
        al_add_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[0]
        al_add_data = Utility.get_excel(al_add_info)
        return al_add_data


    # 从Excel中获取登录的测试数据
    @classmethod
    def get_al_refresh_excel_data(cls):
        al_refresh_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[1]
        al_refresh_data = Utility.get_excel(al_refresh_info)
        return al_refresh_data


    @classmethod
    def get_al_edit_excel_data(cls):
        al_edit_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[2]
        al_edit_data = Utility.get_excel(al_edit_info)
        return al_edit_data


    @classmethod
    def get_al_delete_excel_data(cls):
        al_delete_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[3]
        al_delete_data = Utility.get_excel(al_delete_info)
        return al_delete_data


    @classmethod
    def get_al_query_excel_data(cls):
        al_query_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[4]
        al_query_data = Utility.get_excel(al_query_info)
        return al_query_data


    @classmethod
    def get_al_roles_query_excel_data(cls):
        al_roles_query_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[5]
        al_roles_query_data = Utility.get_excel(al_roles_query_info)
        return al_roles_query_data


    @classmethod
    def get_al_assign_roles_excel_data(cls):
        al_assign_roles_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[6]
        al_assign_roles_data = Utility.get_excel(al_assign_roles_info)
        return al_assign_roles_data


    @classmethod
    def get_al_batches_delete_excel_data(cls):
        al_assign_roles_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[7]
        al_assign_roles_data = Utility.get_excel(al_assign_roles_info)
        return al_assign_roles_data


    @classmethod
    def get_al_batches_disabled_excel_data(cls):
        al_assign_roles_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[9]
        al_assign_roles_data = Utility.get_excel(al_assign_roles_info)
        return al_assign_roles_data


    @classmethod
    def get_al_batches_enabled_excel_data(cls):
        al_assign_roles_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[8]
        al_assign_roles_data = Utility.get_excel(al_assign_roles_info)
        return al_assign_roles_data



if __name__ == '__main__':
    # print(Get_AL_TestData.get_al_add_excel_data())
    # print(Get_AL_TestData.get_al_refresh_excel_data())
    # print(Get_AL_TestData.get_al_edit_excel_data())
    # print(Get_AL_TestData.get_al_delete_excel_data())
    # print(Get_AL_TestData.get_al_query_excel_data())
    # print(Get_AL_TestData.get_al_roles_query_excel_data())
    # print(Get_AL_TestData.get_al_assign_roles_excel_data())
    # print(Get_AL_TestData.get_al_batches_delete_excel_data())
    # print(Get_AL_TestData.get_al_batches_disabled_excel_data())
    print(Get_AL_TestData.get_al_batches_enabled_excel_data())
