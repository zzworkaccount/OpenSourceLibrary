from tools.util import Utility


class Get_CP_ElementData:

    # 获取元素数据
    @classmethod
    def get_cp_ele_data(cls):
        ele_info = Utility.get_ele_json\
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\B_SystemManagement_Uimap.json")[2]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data


if __name__ == '__main__':
    print(Get_CP_ElementData.get_cp_ele_data())