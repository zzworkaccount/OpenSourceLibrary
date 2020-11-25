# 测试添加演出
import os
import random
import time
import unittest

from BeautifulReport import BeautifulReport
from ddt import ddt,unpack,data

from data.Get_TestData.Get_C1_LMT_Data import Get_LM_TestData
from lib.C2_AddShow_Action import AS_Action
from uimap.Get_Element.Get_C_LM_Element import Get_LM_ElementData
n = str(random.choice(range(1000)))

path = 'D:\pyFileDM_New\WoniuTicket_GUI\wts.sql'



@ddt
class AddShow_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.l=AS_Action()
        self.l.driver.maximize_window()
        os.system(f"mysql -h192.172.4.60 -u root -p123456 --default-character-set=utf8 wts <{path}")
    def tearDown(self) -> None:
        self.l.driver.close()

    # ele_list = Get_LM_ElementData.get_AS_ele_data()
    input_data = Get_LM_TestData.get_LMT_excel_data()
    @data(*input_data)
    @unpack
    @BeautifulReport.add_test_img('')
    def test_addshow(self,input_data):
        # print(input_data)
        ele_list = Get_LM_ElementData.get_AS_ele_data()
        self.l.do_AddShow(ele_list,input_data)
        self.l.driver.refresh()
        time.sleep(5)
        self.l.driver.find_element(ele_list[0][4],ele_list[1][4]).click()
        iframe = self.l.driver.find_element(ele_list[0][5],ele_list[1][5])
        self.l.driver.switch_to.frame(iframe)
        time.sleep(5)
        #点击尾页
        self.l.driver.find_element(ele_list[0][6],ele_list[1][6]).click()


        m = len(self.l.driver.find_elements(ele_list[0][7],ele_list[1][7]))

        flag = False
        # 断言
        try:
            el = self.l.driver.find_element(ele_list[0][8],ele_list[1][8])
            text = el.text

            if text == (input_data[0]+n):
                flag = True
        except BaseException:
            return flag
        # 断言

        if '王力宏演唱会' in text:
            resuit = 'add-pass'
        else:
            resuit = 'add-fail'

        self.assertEqual(resuit, input_data[11])

    def save_img(self , img_name):
        driver = self.al.driver
        driver.get_screenshot_as_file(img_name)

if __name__ == '__main__':
    unittest.main()




