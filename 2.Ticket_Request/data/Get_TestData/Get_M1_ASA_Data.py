from tools.util import Utility


class Get_ASA_TestData:
    @classmethod
    def get_AASA_excel_data(cls):
        AASA_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\M_SAT.conf')[0]
        AASA_data = Utility.get_excel(AASA_info)
        return AASA_data

    @classmethod
    def get_aASA_excel_data(cls):
        aASA_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\M_SAT.conf')[1]
        aASA_data = Utility.get_excel(aASA_info)
        return aASA_data

    @classmethod
    def get_DASA_excel_data(cls):
        DASA_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\M_SAT.conf')[2]
        DASA_data = Utility.get_excel(DASA_info)
        return DASA_data

if __name__ == '__main__':
    print(Get_ASA_TestData.get_DASA_excel_data())