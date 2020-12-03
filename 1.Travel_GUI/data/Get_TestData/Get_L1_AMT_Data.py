# 从Save_TestData拿到测试数据
from tools.util import Utility


class Get_AM_TestData:

    @classmethod
    def get_Actor_management_excel_data(cls):
        Actor_management_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_AMT.conf')[0]
        Actor_management_data = Utility.get_excel(Actor_management_info)
        return Actor_management_data

    @classmethod
    def get_edit_excel_data(cls):
        edit_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_AMT.conf')[1]
        edit_data = Utility.get_excel(edit_info)
        return edit_data

if __name__ == '__main__':
    print(Get_AM_TestData.get_edit_excel_data())
    print(Get_AM_TestData.get_Actor_management_excel_data)