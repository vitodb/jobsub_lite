import os
import sys
import pytest

#
# we assume everwhere our current directory is in the package
# test area, so go ahead and cd there
#
os.chdir(os.path.dirname(__file__))


#
# import modules we need to test, since we chdir()ed, can use relative path
# unless we're testing installed, then use /opt/jobsub_lite/...
#
if os.environ.get("JOBSUB_TEST_INSTALLED", "0") == "1":
    sys.path.append("/opt/jobsub_lite/lib")
else:
    sys.path.append("../lib")
import creds
from test_unit import TestUnit


class TestCredUnit:
    """
    Use with pytest... unit tests for ../lib/*.py
    """

    # lib/creds.py routines...

    @pytest.mark.unit
    def test_get_creds_1(self):
        """get credentials, make sure the credentials files returned
        exist"""
        os.environ["GROUP"] = TestUnit.test_group
        proxy, token = creds.get_creds()
        assert os.path.exists(os.environ["X509_USER_PROXY"])
        assert os.path.exists(os.environ["BEARER_TOKEN_FILE"])
        assert os.path.exists(proxy)
        assert os.path.exists(token)

    @pytest.mark.unit
    def test_get_creds_default_role(self):
        """get credentials, make sure the credentials files returned
        exist"""
        args = {}
        os.environ["GROUP"] = TestUnit.test_group
        _, _ = creds.get_creds(args)
        assert args["role"] == "Analysis"
