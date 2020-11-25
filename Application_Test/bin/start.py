import unittest
from BeautifulReport import BeautifulReport


if __name__ == '__main__':
    suite_tests = unittest.defaultTestLoader.discover("../cases",pattern="*_Test.py")
    BeautifulReport\
        (suite_tests).report(filename='Application测试报告', description='Application测试报告',
                             report_dir='../report')