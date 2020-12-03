from tools.util import Utility


class Get_a_PM_TestData:


    @classmethod
    def get_PM_Publish_data(cls):
        # print(Utility.get_root_path() + '\\conf\\SBM_conf\\SBM_Excel_conf\\a_MPM.conf')
        ListManage_info = Utility.get_json(Utility.get_root_path() + '\\conf\\EXCEL_conf\\P_MPM.conf')[0]
        # print(ListManage_info)
        listManage_data = Utility.get_excel(ListManage_info)
        # print(listManage_data)
        return listManage_data
if __name__ == '__main__':
    print(Get_a_PM_TestData.get_PM_Publish_data())