import os
import unittest

from BeautifulReport import BeautifulReport
from parameterized import parameterized

from data.Get_TestData.Get_F1_SMT_Data import Get_SM_TestData
from lib.F1_SystemLogList_Action import SL_Action
from uimap.Get_Element.Get_F1_LM_Element import Get_SL_ElementData

path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'

element_list = Get_SL_ElementData().get_sl_ele_data()
class LM_Test(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")

    def setUp(self) -> None:
        self.ul = SL_Action()

    @parameterized.expand(Get_SM_TestData.get_user_management_excel_data_select())
    @BeautifulReport.add_test_img('')
    def test_select(self, info, expect, cases_name):
        # 1.断言操作内容精确查询
        result = ""
        if cases_name == '操作内容精确查询':
            self.ul.select_user(element_list, info, expect, cases_name)
            list_operate = self.ul.driver.find_elements(element_list[0][4], element_list[1][4])
            for item in list_operate:
                if info == item.text:
                    result = "select_pass"
                else:
                    result = "select_fail"
            self.assertEqual(result, expect)

        # 2.断言操作内容模糊查询
        if cases_name == '操作内容模糊查询':
            self.ul.select_user(element_list, info, expect, cases_name)
            list_operate = self.ul.driver.find_elements(element_list[0][4], element_list[1][4])
            result = ""
            for item in list_operate:
                if info in item.text:
                    result = "select_pass"
                    continue
                else:
                    result = "select_fail"
                    break
            self.assertEqual(result, expect)

        # 3.断言空查询
        if cases_name == '空查询':
            self.ul.select_user(element_list, info, expect, cases_name)
            list_operate = self.ul.driver.find_element(element_list[0][5], element_list[1][5])
            if list_operate.text == '无数据':
                result = "select_pass"
            else:
                result = "select_fail"
            self.assertEqual(result, expect)

        # 4.断言无效查询
        if cases_name == '无效查询':
            self.ul.select_user(element_list, info, expect, cases_name)
            list_operate = self.ul.driver.find_element(element_list[0][5], element_list[1][5])
            if list_operate.text == '无数据':
                result = "select_pass"
            else:
                result = "select_fail"
            self.assertEqual(result, expect)

        # 5.断言组合查询
        if cases_name == '组合查询':
            self.ul.select_compose(element_list, info, expect, cases_name)
            list_operate = self.ul.driver.find_element(element_list[0][5], element_list[1][5])
            if list_operate.text == '无数据':
                result = "select_pass"
            else:
                result = "select_fail"
            self.assertEqual(result, expect)

    def save_img(self, img_name):
        driver = self.ul.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.ul.driver.close()

if __name__ == '__main__':
    unittest.main()