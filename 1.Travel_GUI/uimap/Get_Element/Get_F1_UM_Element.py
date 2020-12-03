from tools.util import Utility

class Get_UM_ElementData:

    # 获取元素数据
    @classmethod
    def get_User_management_ele_data(cls):
        ele_info = Utility.get_ele_json\
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\F_UserManagement_Uimap.json")[0]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

if __name__ == '__main__':
    print(Get_UM_ElementData.get_User_management_ele_data())