from tools.util import Utility


class Get_MUM_TestData:
    @classmethod
    def get_MDUM_excel_data(cls):
        MDUM_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_UMT.conf')[0]
        MDUM_data = Utility.get_excel(MDUM_info)
        return MDUM_data

    @classmethod
    def get_MQUM_excel_data(cls):
        MQUM_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_UMT.conf')[1]
        MQUM_data = Utility.get_excel(MQUM_info)
        return MQUM_data

    @classmethod
    def get_MAUM_excel_data(cls):
        MAUM_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_UMT.conf')[2]
        MAUM_data = Utility.get_excel(MAUM_info)
        return MAUM_data

    @classmethod
    def get_MaUM_excel_data(cls):
        MaUM_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\L_UMT.conf')[3]
        MaUM_data = Utility.get_excel(MaUM_info)
        return MaUM_data
if __name__ == '__main__':
    print(Get_MUM_TestData.get_MaUM_excel_data())