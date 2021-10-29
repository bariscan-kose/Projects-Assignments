from selenium import webdriver
from PIL import Image
import xlwt, urllib, urllib.request
import pandas as pd
import requests, numpy as np
from datetime import datetime
from bs4 import BeautifulSoup
from webbot import Browser
import imageio ,time
import glob, os,cv2
import pyodbc
import smtplib
import ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from skimage.metrics import structural_similarity
from selenium.common.exceptions import NoSuchElementException
import urllib.request
from urllib.error import HTTPError


checkImage_dict={"Count":[],"Barcode":[],"Title":[],"Durum":[],"Score":[],"URL":[]}

op = webdriver.ChromeOptions()
op.add_argument('headless')
browser = webdriver.Chrome('E:\Saldospy\CheckProductImage\chromedriver',options=op)


df = pd.read_excel(r'E:\Saldospy\CheckProductImage\ty_resim_alma_loreal.xlsx')
hb_kod_list = df['TY'].tolist()
barcode_henkel = df['Barkod'].tolist()
#print(hb_kod_list)

def check_gorsel():
    count=0
    count_dogru=0
    count_yanlis=0
    html2 = ""
    for hb_kod in hb_kod_list:
        barcode = barcode_henkel[count]
        URL = hb_kod_list[count]
        browser.get(hb_kod)
        count +=1
        durum ="0"
        
        if count % 25 == 0:
            time.sleep(2)
        
        try:
            img = browser.find_element_by_xpath('//*[@class="selected pd-img"]//img') 
            title2 = browser.find_element_by_xpath('//*[@class="pr-new-br"]')
            title = title2.text
            title = title[:75]
            image = img.get_attribute('src')
            old_url = image[:-4]
            print(old_url)
            
            count_try=0
            gorsel_uzantisi= ["_zoom.jpg","_zoom.jpeg"]
            try:
                new_url = old_url + gorsel_uzantisi[count_try]
                count_try+=1
                ty_im = imageio.imread(new_url)
                os.chdir(r'E:\Saldospy\CheckProductImage\Loreal_Img\imageDownloads')
                
                #im = Image.open(ty_im)
                #ty_im = im.convert('RGB')
                
                
                imageio.imwrite('{}.jpg'.format(barcode),ty_im,"jpg")
                ty_download = cv2.imread("{}.jpg".format(barcode))
                    
            except urllib.error.HTTPError as err:
                print(err.code)
            
        except NoSuchElementException:
            title = "0"
            durum = "Ürün Kapalı"
            score = "0"          
        
        if durum == "Ürün Kapalı":
            checkImage_dict["Barcode"].append(barcode)
            checkImage_dict["Count"].append(count)
            checkImage_dict["Title"].append(title)
            checkImage_dict["Durum"].append(durum)
            checkImage_dict["Score"].append(score)
            checkImage_dict["URL"].append(URL)
            
            """
             html2 += "<tr >" + "<td >" + str(count) + "<td >" + str(barcode) + "<td >" + title + "<td >" + \s
            "<body style='color:red'>" + str(durum) + "</body>" + "<td >" + str(score) + "<td >" + str(URL) + "</td >" + "</tr >"
            """
        else:
            #klasörü gösteri baz dosyayı_buldurma
            os.chdir(r'E:\Saldospy\CheckProductImage\Loreal_Img')
            for file in glob.glob("*.jpg"):
                check_barcode= str(barcode) +"."
                if str(check_barcode) in str(file):
                    print(barcode, title)
            ############Karşılaştırma
                    original = cv2.imread('{}.jpg'.format(barcode))
                    if original.shape == ty_download.shape:
                        #print("görseller aynı boyutta")
                        difference = cv2.subtract(original,ty_download)
                        b , g , r = cv2.split(difference)


                        # Convert images to grayscale
                        before_gray = cv2.cvtColor(original, cv2.COLOR_BGR2GRAY)
                        after_gray = cv2.cvtColor(ty_download, cv2.COLOR_BGR2GRAY)

                        # Compute SSIM between two images
                        #changed compare_ssim to structural_similarity in skimage.metrics because it was renamed and moved in scikit-image
                        (score, diff) = structural_similarity(before_gray, after_gray, full=True)
                        print("Image similarity", score)

                        score = '{0:.2g}'.format(score)


                        #cv2.imshow("difference",g)
                        if float(score) >= 0.9 :
                            print("images are same")
                            durum = 1
                            count_dogru+=1
                            checkImage_dict["Barcode"].append(barcode)
                            checkImage_dict["Count"].append(count)
                            checkImage_dict["Title"].append(title)
                            checkImage_dict["Durum"].append(durum)
                            checkImage_dict["Score"].append(score)
                            checkImage_dict["URL"].append(URL)
                            """ 
                            html2 += "<tr >" + "<td >" + str(count) + "<td >" + str(barcode) + "<td >" + title + "<td >" + \
                            str(durum) + "<td >" + str(score) + "<td >" + str(URL) + "</td >" + "</tr >"
                             """
                        else:
                            print("images are Different")
                            durum = 0
                            count_yanlis+=1
                            checkImage_dict["Barcode"].append(barcode)
                            checkImage_dict["Count"].append(count)
                            checkImage_dict["Title"].append(title)
                            checkImage_dict["Durum"].append(durum)
                            checkImage_dict["Score"].append(score)
                            checkImage_dict["URL"].append(URL)

                            """
                             html2 += "<tr >" + "<td >" + str(count) + "<td >" + str(barcode) + "<td >" + title + "<td >" + \
                            "<body style='color:red'>" + str(durum) + "</body>" + "<td >" + str(score) + "<td >" + str(URL) + "</td >" + "</tr >" 
                            """

                    else:
                        score = "0"
                        durum = "Ürün Kapalı"
                        durum = "Size 1200x1800 Değil"
                        checkImage_dict["Barcode"].append(barcode)
                        checkImage_dict["Count"].append(count)
                        checkImage_dict["Title"].append(title)
                        checkImage_dict["Durum"].append(durum)
                        checkImage_dict["Score"].append(score)
                        checkImage_dict["URL"].append(URL)
                        """ 
                        html2 += "<tr >" + "<td >" + str(count) + "<td >" + str(barcode) + "<td >" + title + "<td >" + \
                        str(durum) + "<td >" + str(score) + "<td >" + str(URL) + "</td >" + "</tr >"
                         """
                    #cv2.waitKey(0)
                    #cv2.destroyAllWindows()



            #print(new_url)
        
        
    checkImage_df=pd.DataFrame(checkImage_dict,columns=["Count","Barcode","Title","Durum","Score","URL"])    
    def send_SQL():
        server_name="VM01"
        database_name="SALDOSReporting"
        conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
        cursor = conn.cursor()
        #cursor.execute('CREATE TABLE CheckImageResults (Count nvarchar(50), Barcode nvarchar(50), Title nvarchar(100),Durum nvarchar(100), Score nvarchar(50), URL nvarchar(500))')

        # Insert DataFrame to Table
        for row in checkImage_df.itertuples():
            cursor.execute('''
                INSERT INTO SALDOSReporting.dbo.CheckImageResults (Count, Barcode, Title, Durum, Score, URL)
                VALUES (?,?,?,?,?,?)
                ''', 
                row.Count, 
                row.Barcode,
                row.Title,
                row.Durum, 
                row.Score,
                row.URL
                )
        conn.commit()

    if all(checkImage_df.loc[3:5,"Title"]== 0):
        pass
    else:    
        send_SQL()
        print(checkImage_df)

check_gorsel()