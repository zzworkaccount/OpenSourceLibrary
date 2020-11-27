import random
import time

from tools.service import Service
from uimap.Get_Element.Get_C_LM_Element import Get_LM_ElementData

n = str(random.choice(range(1000)))

class AS_Action:

    def __init__(self):
        self.driver = Service.get_driver()
        self.driver.implicitly_wait(10)



    # 点击演出管理
    def ShowManage_click(self , ele_list):
        self.driver.find_element(ele_list[0][0],ele_list[1][0]).click()

    #点击列表管理
    def ListManage_click(self,ele_list):
        self.driver.find_element(ele_list[0][1],ele_list[1][1]).click()   #点击列表管理
    # 点击添加演出
    def AddShow(self,ele_list):
        self.driver.find_element(ele_list[0][2],ele_list[1][2]).click()

        # 切换到增加演出页
    def switch_AddShow(self,ele_list):
        time.sleep(3)
        # //*[@id="tabContent"]/div[3]/iframe
        iframe = self.driver.find_element(ele_list[0][3],ele_list[1][3])
        # iframe = self.driver.find_element()
        self.driver.switch_to.frame(iframe)

    def click_send(self,ele,para):
        ele.click()
        ele.clear()
        ele.send_keys(para)

# 张杰演唱会
    def write_title(self,input_data):
        ele = self.driver.find_element_by_id("title")
        self.click_send(ele,input_data[0]+n)
# 2020-11-20 17:30:00
    def write_starttime(self,input_data):
        #手工输入演出时间
        ele = self.driver.find_element_by_id("showTime")
        self.click_send(ele,input_data[1])
#武汉市江夏区华夏国际影城702
    def write_showAddress(self,input_data):
        ele = self.driver.find_element_by_id("showAddress")
        self.click_send(ele,input_data[2])
    # 演出时长120
    def write_showLength(self,input_data):
        ele = self.driver.find_element_by_id("showLength")
        self.click_send(ele,input_data[3])

    def select_showType(self):
        num = random.randint(1,8)
        self.driver.find_element_by_xpath('//*[@id="showFrom"]/div[2]/div[5]/div/div/div/input').click()
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[2]/div[5]/div/div/dl/dd[{}]".format(num)).click()
# 这是张杰的个人演唱会
    def write_showDetails(self,input_data):
        ele = self.driver.find_element_by_id("showDetails")
        self.click_send(ele, input_data[4])


    def write_ticket_price(self,input_data):
        #input_data = [[150,100],[100,100],[50,100])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[4]/div[2]/input").send_keys(input_data[5])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[4]/div[3]/input").send_keys(input_data[6])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[5]/div[2]/input").send_keys(input_data[7])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[5]/div[3]/input").send_keys(input_data[8])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[6]/div[2]/input").send_keys(input_data[9])
        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[6]/div[3]/input").send_keys(input_data[10])
    # 上传标题图片
    def icon_upload(self,file):

        self.driver.find_element_by_xpath("//*[@id='test1']/i").click()
        # 将即将要上传的文件名及路径设置到剪切板中

        self.driver.find_element_by_xpath("//*[@id='showFrom']/div[1]/input").send_keys(file)
    def summit(self):
        self.driver.find_elements_by_xpath("//button[@class ='layui-btn']")[2].click()


    def do_AddShow(self,ele_list,input_data):

        Service.Lose_login(self.driver)
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)
        # time.sleep(10)
        self.ShowManage_click(ele_list)
        # time.sleep(3)
        self.ListManage_click(ele_list)
        # time.sleep(3)
        self.AddShow(ele_list)
        self.switch_AddShow(ele_list)
        time.sleep(4)
        self.write_title(input_data)
        self.write_starttime(input_data)
        time.sleep(1)
        self.write_showAddress(input_data)
        self.write_showLength(input_data)
        self.write_showDetails(input_data)
        self.select_showType()
        self.write_ticket_price(input_data)
        # time.sleep(3)
        self.summit()


