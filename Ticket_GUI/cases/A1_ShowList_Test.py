import random
import unittest

from BeautifulReport import BeautifulReport
from ddt import ddt,unpack,data

from data.Get_TestData.Get_C1_LMT_Data import Get_LM_TestData
from lib.C1_ShowList_Action import SLI_Action
from tools.util import Utility
from uimap.Get_Element.Get_C_LM_Element import Get_LM_ElementData

num = random.choice(range(1, 6))

@ddt
class ShowList_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.s = SLI_Action()
        self.s.driver.maximize_window()
        self.s.driver.implicitly_wait(10)

    input_data = Get_LM_TestData.get_LMT_SLexcel_data()
    @data(*input_data)
    @unpack
    @BeautifulReport.add_test_img('')
    def test_showlist(self,input_data):
        ele_list = Get_LM_ElementData.get_SL_ele_data()
        # print(ele_list)
        sql = "select * from show_info where id = {}".format(num)
        # print(sql)
        data_before = Utility.query_one(sql)
        # print(num,data_before)

        before_title = data_before[1]
        before_showlength = data_before[5]
        self.s.do_ShowList(input_data,ele_list)
        self.s.driver.refresh()

        data_after = Utility.query_one(sql)
        after_title  = data_after[1]
        after_showlength = data_after[5]



        flag = False


        if before_title != after_title and before_showlength != after_showlength:
            flag = True
        else:
            return flag
        # 断言

        if flag:
            resuit = 'revise-pass'
        else:
            resuit = 'revise-fail'

        self.assertEqual(resuit, input_data[2])

    def save_img(self, img_name):
        driver = self.s.driver
        driver.get_screenshot_as_file(img_name)

    def tearDown(self) -> None:
        self.s.driver.close()

if __name__ == '__main__':
    unittest.main(verbosity=2)