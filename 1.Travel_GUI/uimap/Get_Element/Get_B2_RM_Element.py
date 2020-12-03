from tools.util import Utility

class Get_RM_ElementData:

    # 获取元素数据
    @classmethod
    def get_SystemManagement_ele_data(cls):
        ele_info = Utility.get_ele_json\
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\B_SystemManagement_Uimap.json")[1]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

if __name__ == '__main__':
    print(Get_RM_ElementData.get_SystemManagement_ele_data())