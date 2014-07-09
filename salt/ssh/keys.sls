#!py
from os import listdir
from os.path import dirname, basename, realpath, join

def run():
    """
    automatically add all the keys in salt://ssh/keys for the default user
    """
    config = {}

    for key_file in listdir(join(dirname(realpath(__file__)), 'keys')):
        file_name = basename(key_file)
        config[file_name] = {
            'ssh_auth': [
                'present',
                {'user': __pillar__['username']},
                {'source': 'salt://ssh/keys/' + file_name},
                {'mode': 600},
                {
                    'require': [{'user': __pillar__['username']}]
                },
            ]
        }
    return config
