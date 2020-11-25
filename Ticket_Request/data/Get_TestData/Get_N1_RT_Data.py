from tools.util import Utility

class Get_Register_TestData:
    @classmethod
    def get_Register_excel_data(cls):
        Register_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\N_ASA.conf')[0]
        Register_data = Utility.get_excel(Register_info)
        return Register_data

if __name__ == '__main__':
    print(Get_Register_TestData.get_Register_excel_data())