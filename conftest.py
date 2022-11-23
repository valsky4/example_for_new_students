import pytest
from selenium import webdriver


@pytest.fixture(params=["CHROME", "FIREFOX", "EDGE"], scope="class")
def driver_init(request):
    global web_driver
    if request.param == "CHROME":
        options_exec = webdriver.ChromeOptions()
        options_exec.add_argument('--no-sandbox')
        options_exec.add_argument('--window-size=1920,1080')
        options_exec.add_argument('--headless')
        options_exec.add_argument('--disable-gpu')
        web_driver = webdriver.Remote(
            command_executor="http://0.0.0.0:4444",
            options=options_exec
        )
    if request.param == "FIREFOX":
        options_exec = webdriver.FirefoxOptions()
        options_exec.add_argument('--no-sandbox')
        options_exec.add_argument('--window-size=1920,1080')
        options_exec.add_argument('--headless')
        options_exec.add_argument('--disable-gpu')
        web_driver = webdriver.Remote(
            command_executor="http://0.0.0.0:4444",
            options=options_exec
        )
    if request.param == "EDGE":
        options_exec = webdriver.EdgeOptions()
        options_exec.add_argument('--no-sandbox')
        options_exec.add_argument('--window-size=1920,1080')
        options_exec.add_argument('--headless')
        options_exec.add_argument('--disable-gpu')
        web_driver = webdriver.Remote(
            command_executor="http://0.0.0.0:4444",
            options=options_exec
        )
    request.cls.driver = web_driver
    yield
    web_driver.quit()
