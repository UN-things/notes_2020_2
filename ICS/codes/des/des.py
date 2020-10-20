import base64
from pyDes import *

def use_base64(img, encode):
    if encode:
        temp = base64.b64encode(img)
        result = temp.decode('utf-8')
    else:
        temp = img.encode('utf-8')
        result = base64.decodebytes(temp)
    return result

def open_file(name_file):
    with open(name_file, 'rb') as binary_file:
        data = binary_file.read()
        return bytearray(data)

def encrypt_img(img, key):
    new_des = des(key, CBC, '\0\0\0\0\0\0\0\0', padmode=PAD_PKCS5)
    encrypted_img = new_des.encrypt(str(img))
    return base64.b64encode(encrypt_img)

def decrypt_img(encrypt, key)
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

if __name__ == "__main__":
    main()