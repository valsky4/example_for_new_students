# import all required frameworks
import time
import unittest

from tests.test_Base import BaseTest


class Test(BaseTest):
    def test_search_in_python_org(self):
        # get driver
        driver = self.driver
        # get python.org using selenium
        driver.get("http://www.python.org")
        time.sleep(20)
        # assert Python in title
        assert "Python" in driver.title


# execute the script
if __name__ == "__main__":
    unittest.main()
