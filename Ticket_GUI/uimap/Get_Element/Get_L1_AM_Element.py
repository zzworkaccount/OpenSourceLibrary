from tools.util import Utility

class Get_AM_ElementData:

    # 获取元素数据
    @classmethod
    def get_Actor_management_ele_data(cls):
        ele_info = Utility.get_ele_json\
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\L_ActorManagement_Uimap.json")[0]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

if __name__ == '__main__':
    print(Get_AM_ElementData.get_Actor_management_ele_data())