import unittest
import warnings


from ddt import ddt, unpack, data

from data.Get_TestData.Get_Q1_Show_Data import Get_Appshow_TestData
from lib.Q2_Show_Action import APP_Show_Action
from tools.service import Service
from tools.util import Utility


@ddt
class APP_Show_Test(unittest.TestCase):
    def setUp(self) -> None:
        self.a = APP_Show_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)

    input_data = Get_Appshow_TestData.get_appshow_excel_data()

    @data(*input_data)
    @unpack
    def test_appshow(self,url,method,id,casesname,expect):
        test_data = {"URL":url,"METHOD":method,"CASESNAME":casesname,"EXPECT":expect}
        para = {"id":id}
        res = self.a.AP_Action(method=test_data["METHOD"],url=test_data["URL"],para=para)
        flag = False
        try:
            text = res.json()["showInfo"]
            flag = True
        except KeyError:
            flag = False
        if flag:
            result = "query-pass"
        else:
            result = "query-fail"

        Utility.logger(test_data["CASESNAME"], flag, result, test_data["EXPECT"])
        self.assertEqual(result,test_data["EXPECT"])

if __name__ == '__main__':
    unittest.main()