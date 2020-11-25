# 从Save_SBM_UImap中读取元素定位方式跟元素值
from tools.util import Utility

class Get_SL_ElementData:
    # 获取元素数据
    # 日志管理
    @classmethod
    def get_sl_ele_data(cls):
        ele_info = Utility.get_ele_json\
            (Utility.get_root_path() + "\\uimap\\Save_UImap\\F_LogManagement_Uimap.json")[0]
        ele_data = Utility.get_element_value(ele_info)
        # print(ele_data)
        return ele_data

if __name__ == '__main__':
    print(Get_SL_ElementData().get_sl_ele_data())
