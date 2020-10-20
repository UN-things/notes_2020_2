import base64
from pyDes import *

def use_base64():
    pass

def open_file(name_file):
    with open(name_file, 'rb') as binary_file:
        data = binary_file.read()
        return bytearray(data)

def encrypt_img(img, key):
    new_des = des(key, CBC, '\0\0\0\0\0\0\0\0', padmode=PAD_PKCS5)
    encrypted_img = new_des.encrypt(str(img))
    return base64.b64encode(encrypt_img)

def decrypt_img(encrypt, key):
    new_des = des(key, CBC, '\0\0\0\0\0\0\0\0', padmode=PAD_PKCS5)
    img = base64.b64decode(encrypt)
    new_img = new_des.decrypt(img, padmode=PAD_PKCS5)
    with open('result.png', 'wb') as file_to_save:
        file_to_save.write(new_img)

def main():
    key = "colombia"
    img_name = "input.png"
    mode = 0
    img = open_file(img_name)
    new_des = des(key, CBC, '\0\0\0\0\0\0\0\0', padmode=PAD_PKCS5)
    encrypted_img = new_des.encrypt(str(img))
    enc = base64.b64encode(encrypted_img)
    res = enc.decode('utf-8')


    test = res.encode('utf-8')
    data = base64.decodebytes(test)
    img = new_des.decrypt(data, padmode=PAD_PKCS5)

    with open('result.png', 'wb') as file_to_save:
        file_to_save.write(img)
    '''
    if mode == 0:
        encrypted_img = new_des.encrypt(str(img))
        enc = base64.b64encode(encrypted_img)
        print(enc)
    else:
    '''

if __name__ == "__main__":
    main()