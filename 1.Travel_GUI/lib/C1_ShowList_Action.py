import random
import time

# import pymysql

from selenium.webdriver.common.by import By

from data.Get_TestData.Get_C1_LMT_Data import Get_LM_TestData
from tools.service import Service
from uimap.Get_Element.Get_C_LM_Element import Get_LM_ElementData

num = random.choice(range(1, 6))

class SLI_Action:

    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)

    def ShowManage_click(self,ele_list):
        self.driver.find_element(ele_list[0][0],ele_list[1][0]).click()
        # self.driver.find_element_by_xpath("//*[@id='navBar']/li[2]/a/cite").click()

    def ListManage_click(self,ele_list):
        self.driver.find_element(ele_list[0][1],ele_list[1][1]).click()
        # self.driver.find_element_by_xpath("//*[@id='navBar']/li[2]/dl/dd[1]/a/cite").click()

    # 点击演出列表
    def ShowList_click(self,ele_list):
        self.driver.find_element(ele_list[0][2],ele_list[1][2]).click()
        # self.driver.find_element_by_xpath("//*[@id='navBar']/li[2]/dl/dd[1]/dl/dd[1]/a/cite").click()


    # 切换到showlist
    def switch_showlist(self,ele_list):
        ele = self.driver.find_element(ele_list[0][3],ele_list[1][3])
        # ele = self.driver.find_element_by_xpath("//iframe[@src='/showservice/showInfos']")
        self.driver.switch_to.frame(ele)
    def click_input(self,ele,para):
        ele.click()
        ele.clear()
        ele.send_keys(para)

    def showdetails_click(self,ele_list):
        # 首页
        time.sleep(5)
        self.driver.find_elements(ele_list[0][4],ele_list[1][4])[num].click()
        # self.driver.find_elements_by_xpath("//*[@id='app']/div[3]/div[@class='item']").click()

    def switch_showdetails(self,ele_list):
        ele=self.driver.find_element(ele_list[0][5],ele_list[1][5])
        # ele = self.driver.find_element_by_xpath("//iframe[@src='editShow']")
        self.driver.switch_to.frame(ele)

    def revise_show(self,input_data,ele_list):
        ele_title =self.driver.find_element(ele_list[0][6],ele_list[1][6])
        # ele_title = self.driver.find_element_by_id("title")
        self.click_input(ele_title,input_data[0]+str(num))
        # ele_showlength = self.driver.find_element_by_id("showLength")
        ele_showlength = self.driver.find_element(ele_list[0][7],ele_list[1][7])
        self.click_input(ele_showlength,input_data[1])
        self.driver.find_element(ele_list[0][8],ele_list[1][8]).click()
        # self.driver.find_element_by_xpath("//*[@id='showFrom']/div[6]/div/button[1]").click()

    def do_ShowList(self,input_data,ele_list):
        Service.Lose_login(self.driver)
        self.driver.implicitly_wait(10)
        self.ShowManage_click(ele_list)
        self.ListManage_click(ele_list)
        self.ShowList_click(ele_list)
        time.sleep(2)
        self.switch_showlist(ele_list)
        time.sleep(3)
        self.showdetails_click(ele_list)
        self.switch_showdetails(ele_list)
        time.sleep(3)
        self.revise_show(input_data,ele_list)



if __name__ == '__main__':
    pass
    ele_list = Get_LM_ElementData.get_SL_ele_data()
    print(ele_list)
    input_data = ('李宇春演唱会', '100', 'revise-pass')
    # print(input_data)
    s = SLI_Action()
    s.do_ShowList(input_data,ele_list)
    # # s.revise_show(input_data)
    #
    pass



