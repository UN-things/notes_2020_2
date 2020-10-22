import base64
from pyDes import *

def main():
    if len(sys.argv) != 2: print("\trun with:\t\npython3 nameImage.ext")
    ext = sys.argv[1].split('.')[1]
    k=des("SUICIDAL", CBC, "\0\0\0\0\0\0\0\0",padmode=PAD_PKCS5)

    # Encrypt
    d = k.encrypt(open(sys.argv[1], "rb").read())
    des2 = base64.b64encode(d)
    file = open("base64code.txt", "wb").write(base64.standard_b64encode(d))
    print ("\tImage encrypted succesfully")

    # Decrypt
    strg= base64.standard_b64decode(open("base64code.txt", "rb").read())
    d = k.decrypt(strg,padmode=PAD_PKCS5)
    open("decrypted_image."+ext, "wb").write(d)
    print("\tImage decrypted succesfully")

if __name__ == '__main__':
    main()