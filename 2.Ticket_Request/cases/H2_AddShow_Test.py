import os
import unittest
import warnings

from data.Get_TestData.Get_H1_LMT_Data import Get_LM_TestData
from ddt import data, ddt, unpack
from lib.H2_AddShow_Action import AS_Action

# 测试添加演出
from tools.service import Service
from tools.util import Utility


@ddt
class AddShow_Test(unittest.TestCase):

    def setUp(self) -> None:
        self.a=AS_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)


    @data(*Get_LM_TestData.get_LMT_add_data())
    @unpack
    def test_addshow(self,url , method , title,showtime,showaddress,showlength,showtype,status,showdetails,ticket1_leve,ticket1_price,
                     ticket1_stock,ticket2_leve,ticket2_price,ticket2_stock,ticket3_leve,ticket3_price,ticket3_stock,casesname , expect):
        test_data = {"casesname": casesname,"URL": url,"METHOD": method,
                     "EXPECT": expect}
        para = {"showInfo.title": title, "showInfo.showTime": showtime, "showInfo.showAddress": showaddress,
                              "showInfo.showLength":showlength,"showInfo.showType":showtype,"showInfo.statue":status,"showInfo.showDetails":showdetails,"ticket1.leve":ticket1_leve,
                              "ticket1.price":ticket1_price ,"ticket1.stock":ticket1_stock,"ticket2.leve":ticket2_leve,
                              "ticket2.price":ticket2_price ,"ticket2.stock": ticket2_stock,"ticket3.leve":ticket3_leve,
                              "ticket3.price":ticket3_price ,"ticket3.stock": ticket3_stock}
        res = self.a.AddShow_Action(test_data["URL"] , test_data["METHOD"],para)
        flag = False

        try:
            text = res.json()['msg']
        except BaseException:
            flag = False

        finally:
            if flag:
                resutl = 'add-fail'
            else:
                resutl = 'add-pass'
            Utility.logger(test_data["casesname"], flag, resutl, test_data["EXPECT"])
            self.assertEqual(resutl, test_data["EXPECT"])




if __name__ == '__main__':
    unittest.main()

