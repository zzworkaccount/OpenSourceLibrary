from tools.util import Utility


class Get_ACLT_TestData:
    @classmethod
    def get_ACL_excel_data(cls):
        ACL_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\K_CLT.conf')[0]
        ACL_data = Utility.get_excel(ACL_info)
        return ACL_data

    @classmethod
    def get_DCL_excel_data(cls):
        DCL_info = Utility.get_json \
            (Utility.get_root_path() + '\\conf\\Excel_conf\\K_CLT.conf')[1]
        DCL_data = Utility.get_excel(DCL_info)
        return DCL_data


if __name__ == '__main__':
    print(Get_ACLT_TestData.get_DCL_excel_data())