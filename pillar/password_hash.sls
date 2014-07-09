#!py
from crypt import crypt
from bcrypt import gensalt

def run():
    password = 'core2062'
    salt = gensalt()
    return {'password_hash': crypt(password, '\$6\$%s\$' % salt)}
