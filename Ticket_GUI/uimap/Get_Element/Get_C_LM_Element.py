# 从Save_SBM_UImap中读取元素定位方式跟元素值
import os

from tools.util import Utility



class Get_LM_ElementData:
    # 获取演出列表的元素数据
    @classmethod
    def get_SL_ele_data(cls):
        ele_info = Utility.get_ele_json(Utility.get_root_path() + "/uimap/Save_UImap/C_ListManagemenet_Uimap.json")[0]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

    # 获取添加演出的元素数据
    @classmethod
    def get_AS_ele_data(cls):

        ele_info = Utility.get_ele_json(Utility.get_root_path()+"/uimap/Save_UImap/C_ListManagemenet_Uimap.json")[1]
        # print(ele_info)
        # ele_info = Utility.get_ele_json("..\\Save_UImap\\C_ListManagemenet_Uimap.json")[1]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

    # 获取图片管理的元素数据
    @classmethod
    def get_PM_ele_data(cls):
        ele_info = Utility.get_ele_json(Utility.get_root_path() + "/uimap/Save_UImap/C_ListManagemenet_Uimap.json")[2]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

if __name__ == '__main__':
#     pass
    Get_LM_ElementData.get_SL_ele_data()
    print(Get_LM_ElementData.get_AS_ele_data())
    print(Get_LM_ElementData.get_PM_ele_data())
    print(Get_LM_ElementData.get_SL_ele_data())