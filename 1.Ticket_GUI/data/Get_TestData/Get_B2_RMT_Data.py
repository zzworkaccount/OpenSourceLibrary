from tools.util import Utility


class Get_RM_TestData:

    @classmethod
    def get_SystemManagement_excel_data(cls):
        SystemManagement_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[4]
        SystemManagement_data = Utility.get_excel(SystemManagement_info)
        return SystemManagement_data

    @classmethod
    def get_add_role_excel_data(cls):
        SystemManagement_delete_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[5]
        SystemManagement_delete_data = Utility.get_excel(SystemManagement_delete_info)
        return SystemManagement_delete_data

if __name__ == '__main__':
    print(Get_RM_TestData.get_SystemManagement_excel_data())
    print(Get_RM_TestData.get_add_role_excel_data())