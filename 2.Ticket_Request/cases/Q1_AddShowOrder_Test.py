import unittest
import warnings

from data.Get_TestData.Get_Q1_Show_Data import Get_Appshow_TestData
from ddt import ddt, unpack, data

from lib.Q1_AddShowOrder_Action import APP_ADShow_Action
from tools.util import Utility


@ddt
class APP_Show_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.a = APP_ADShow_Action()
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)

    input_data = Get_Appshow_TestData.get_appAddshowOrder_excel_data()

    @data(*input_data)
    @unpack
    def test_appshow(self,url,method,userId,ticketNumber,ticketId,casesname,expect):
        test_data = {"URL":url,"METHOD":method,
        "DATA":{"userId":userId,"ticketNumber":ticketNumber,"ticketId":ticketId},"CASESNAME":casesname,"EXPECT":expect}

        res = self.a.APP_AD_Action(method=test_data["METHOD"],url=test_data["URL"],para=test_data["DATA"])
        text = res.json()
        if text['msg'] == "添加成功":
            result = "add-pass"
        else:
            result = "add-fail"

        Utility.logger(test_data["CASESNAME"], text['msg'], result, test_data["EXPECT"])
        self.assertEqual(result,test_data["EXPECT"])

if __name__ == '__main__':
    unittest.main()