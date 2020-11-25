import json

from tools.util import Utility


class Get_LM_TestData:


    @classmethod
    def get_LMT_add_data(cls):
        ListManage_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\EXCEL_conf\\H_LMT.conf')[0]
        # print(ListManage_info)
        listManage_data = Utility.get_excel(ListManage_info)
        # print(listManage_data)
        return listManage_data

    @classmethod
    def get_LMT_showlist_data(cls):
        ListManage_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\EXCEL_conf\\H_LMT.conf')[1]
        # print(ListManage_info)
        listManage_data = Utility.get_excel(ListManage_info)
        # print(listManage_data)
        return listManage_data

if __name__ == '__main__':
    pass
    print(Get_LM_TestData.get_LMT_showlist_data())


