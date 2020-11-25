# 从Save_SBM_UImap中读取元素定位方式跟元素值
from tools.util import Utility

class Get_PM_ElementData:
    # 获取元素数据
    @classmethod
    def get_pm_ele_data_edit(cls):
        ele_info = Utility.get_ele_json \
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\A_PublishManagement_uimap.json")[0]
        ele_data = Utility.get_element_value(ele_info)
        return ele_data

if __name__ == '__main__':
    print(Get_PM_ElementData().get_pm_ele_data_edit())
