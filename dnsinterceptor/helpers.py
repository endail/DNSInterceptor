import configparser

def loadConfig(file):
    config = configparser.ConfigParser()
    config.read(file)
    return config

