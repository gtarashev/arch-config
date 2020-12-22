""" get and return covid data from https://publichealthengland.github.io/coronavirus-dashboard-api-python-sdk/ for a certain region"""

""" IMPORTS """

import json
import requests

""" FUNCTIONS """

def get_url(filename):
    """ get the url for the API from the file name provided """

    with open(filename, "r") as f:
        x = json.load(f)
        for api in x["APIs"]:
            if (api["name"] == "covid"):
                area_type = api["area_type"]
                area_name = api["area_name"]
                base_url = api["base_url"]
                structure = api["structure"]
                break

        return base_url + 'filters=areaType=' + area_type + ';areaName=' + area_name + '&structure=' + structure

def get_data(url):
    """ return the covid data given by the API """

    response = requests.get(url, timeout=10)

    if response.status_code >= 400:
        raise RuntimeError(f"Request failed: { response.text }")

    return response.json()["data"][0]
