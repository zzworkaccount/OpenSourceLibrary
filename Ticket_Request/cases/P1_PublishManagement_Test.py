import unittest
import warnings

from data.Get_TestData.Get_P1_PM_Data import Get_a_PM_TestData
from ddt import data, ddt, unpack
from lib.P1_Publish_Management_Action import PM_Action
from tools.service import Service
from tools.util import Utility


@ddt
class Publish_Test(unittest.TestCase):

    input_data = Get_a_PM_TestData.get_PM_Publish_data()

    def setUp(self) -> None:
        self.p = PM_Action(Service.get_session())
        Utility.initialize_DB()
        warnings.simplefilter('ignore', ResourceWarning)

    @data(*input_data)


    @unpack
    # test要写在方法之前
    def test_publish(self,url,method,cinema_id,movieName,releaseTime,duration,dimensional,movieType_id,notice,status,synopsis,cover,casename,expect):
        test_data = {"URL": url, "Method": method,"data":{"cinema.id": cinema_id,"movieName": movieName,
                                                 "releaseTime": releaseTime,"duration": duration, "dimensional":dimensional,
                                                "movieType.id": movieType_id, "notice": notice,"status": status, "synopsis": synopsis,"cover":cover},"casename":casename,"EXPECT": expect}
        res = self.p.publish_Action(url=test_data["URL"],method=test_data["Method"],data=test_data["data"])

        text = res.json()

        if text["msg"] == "发布电影成功":
            resutl = 'publish-pass'
        else:
            resutl = 'publish-fail'

        Utility.logger(test_data["casename"], text["msg"], resutl, test_data["EXPECT"])
        self.assertEqual(resutl, test_data["EXPECT"])


if __name__ == '__main__':
    unittest.main()
