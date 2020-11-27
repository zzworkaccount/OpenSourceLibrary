from tools.util import Utility


class Get_AL_TestData:

    # 从Excel中获取登录的测试数据
    @classmethod
    def get_al_add_excel_data(cls):
        al_add_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[0]
        al_add_data = Utility.get_excel(al_add_info)
        return al_add_data

    @classmethod
    def get_al_edit_excel_data(cls):
        al_edit_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[1]
        al_edit_data = Utility.get_excel(al_edit_info)
        return al_edit_data

    @classmethod
    def get_al_delete_excel_data(cls):
        al_edit_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[2]
        al_edit_data = Utility.get_excel(al_edit_info)
        return al_edit_data

    @classmethod
    def get_al_query_excel_data(cls):
        al_edit_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[3]
        al_edit_data = Utility.get_excel(al_edit_info)
        return al_edit_data

if __name__ == '__main__':
    print(Get_AL_TestData.get_al_edit_excel_data())