from tools.util import Utility


class Get_Appshow_TestData:

    # 从Excel中获取登录的测试数据
    @classmethod
    def get_appshow_excel_data(cls):
        login_info = Utility.get_json(Utility.get_root_path() + "\\conf\Excel_conf\\Q_Show.conf")[0]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

    @classmethod
    def get_appAddshowOrder_excel_data(cls):
        login_info = Utility.get_json(Utility.get_root_path() + "\\conf\Excel_conf\\Q_Show.conf")[1]
        # print(login_info)
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data

    @classmethod
    def get_appQueryByPhone_excel_data(cls):
        login_info = Utility.get_json(Utility.get_root_path() + "\\conf\Excel_conf\\Q_Show.conf")[2]
        login_data = Utility.get_excel(login_info)
        # print(login_data)
        return login_data


if __name__ == '__main__':
    print(Get_Appshow_TestData.get_appAddshowOrder_excel_data())
