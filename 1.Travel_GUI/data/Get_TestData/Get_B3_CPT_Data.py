from tools.util import Utility


class Get_CP_TestData:

    @classmethod
    def get_CP_password_excel_data(cls):
        al_edit_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\B_SMT.conf')[6]
        cp_edit_data = Utility.get_excel(al_edit_info)
        return cp_edit_data


if __name__ == '__main__':
    print(Get_CP_TestData.get_CP_password_excel_data())