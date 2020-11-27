from tools.util import Utility


class Get_CLT_TestData:
    @classmethod
    def get_CL_excel_data(cls):
        CL_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\I_CLT.conf')[0]
        CL_data = Utility.get_excel(CL_info)
        return CL_data

    @classmethod
    def get_BCL_excel_data(cls):
        BCL_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\I_CLT.conf')[1]
        BCL_data = Utility.get_excel(BCL_info)
        return BCL_data

    @classmethod
    def get_OMT_orderlist_data(cls):
        ListManage_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\EXCEL_conf\\H_LMT.conf')[2]
        # print(ListManage_info)
        listManage_data = Utility.get_excel(ListManage_info)
        # print(listManage_data)
        return listManage_data

if __name__ == '__main__':
    print(Get_CLT_TestData.get_OMT_orderlist_data())