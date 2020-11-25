from tools.util import Utility


class Get_LM_TestData:

    # 从Excel中获取登录的测试数据
    @classmethod
    def get_LMT_excel_data(cls):
        ListManage_info = Utility.get_json\
            (Utility.get_root_path() + '\\conf\\EXCEL_conf\\C_LMT.conf')[0]
        listManage_data = Utility.get_excel_sss(ListManage_info)
        return listManage_data

    @classmethod
    def get_LMT_SLexcel_data(cls):
        # print(Utility.get_root_path() + '\\conf\\SBM_conf\\SBM_Excel_conf\\C_LMT.conf')
        ListManage_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\EXCEL_conf\\C_LMT.conf')[1]
        # print(ListManage_info)
        listManage_data = Utility.get_excel_sss(ListManage_info)
        # print(listManage_data)
        return listManage_data


if __name__ == '__main__':
    print(Get_LM_TestData.get_LMT_SLexcel_data())

