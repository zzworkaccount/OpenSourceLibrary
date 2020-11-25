# import logging
# logger = logging.getLogger(__name__)
# logger.setLevel(level = logging.INFO)
# handler = logging.FileHandler("log.txt")
# handler.setLevel(logging.INFO)
# formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s : %(message)s')
# handler.setFormatter(formatter)
#
# console = logging.StreamHandler()
# console.setLevel(logging.INFO)
#
# logger.addHandler(handler)
# logger.addHandler(console)
#
# logger.info("Start print log")
# logger.debug("Do something")
# logger.warning("Something maybe fail.")
# logger.info("Finish")
# import requests
# from parameterized import parameterized
#
# from data.Get_TestData.Get_A1_LT_Data import Get_LG_TestData
#
# # url1 = 'http://175.24.188.162:7103/adminservice/login.do'
# # data = {"username":"admin","password":"123456","captcha":"123"}
# # session = requests.session()
# # resp = session.post(url1 , data)
# # print(resp.text)
# # print(resp.status_code)
# #
# #
# # url2 = 'http://175.24.188.162:7103/adminservice/admins.do'
# # data2 = {"username":"2" , "realname":"2" , "telephone":"2" , "email":"zz@qq.com" , "password":"1" , "status":"0"}
# # resp2 = session.post(url2 , data2)
# # print(resp2.text)
# import unittest
# class Test(unittest.TestCase):
#     data = Get_LG_TestData.get_login_excel_data()
#     print(data)
#
#     @parameterized.expand(data)
#     def test_login(self, url, method, username, password, captcha, casesname, expect):
#         print(url)
# if __name__ == '__main__':
#     unittest.main()
import sys
temp = sys.stdout
sys.stdout = open('D:\\log.txt' , 'a')
print('111')
sys.stdout = temp
print('111')

