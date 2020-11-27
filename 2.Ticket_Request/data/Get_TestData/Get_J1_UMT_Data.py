from tools.util import Utility


class Get_UMT_TestData:
    @classmethod
    def get_DT_excel_data(cls):
        DT_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\J_UMT.conf')[0]
        DT_data = Utility.get_excel(DT_info)
        return DT_data

    @classmethod
    def get_BT_excel_data(cls):
        BT_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\J_UMT.conf')[1]
        BT_data = Utility.get_excel(BT_info)
        return BT_data

if __name__ == '__main__':
    print(Get_UMT_TestData().get_BT_excel_data())