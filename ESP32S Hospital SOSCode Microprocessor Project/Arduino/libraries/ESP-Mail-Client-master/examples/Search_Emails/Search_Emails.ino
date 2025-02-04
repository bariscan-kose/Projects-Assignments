/**
 * This example will search all Emails in the opened mailbox folder.
 * 
 * Created by K. Suwatchai (Mobizt)
 * 
 * Email: suwatchai@outlook.com
 * 
 * Github: https://github.com/mobizt/ESP-Mail-Client
 * 
 * Copyright (c) 2021 mobizt
 *
*/

/** To receive Email using Gmail, IMAP option should be enabled. https://support.google.com/mail/answer/7126229?hl=en
 * and also https://accounts.google.com/b/0/DisplayUnlockCaptcha
 * 
*/

/** For ESP8266, with BearSSL WiFi Client 
 * The memory reserved for completed valid SSL response from IMAP is 16 kbytes which
 * may cause your device out of memory reset in case the memory 
 * allocation error.
*/

#include <Arduino.h>
#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <ESP_Mail_Client.h>

#define WIFI_SSID "################"
#define WIFI_PASSWORD "################"

/* The imap host name e.g. imap.gmail.com for GMail or outlook.office365.com for Outlook */
#define IMAP_HOST "################"

/** The imap port e.g. 
 * 143  or esp_mail_imap_port_143
 * 993 or esp_mail_imap_port_993
*/
#define IMAP_PORT 993

/* The log in credentials */
#define AUTHOR_EMAIL "################"
#define AUTHOR_PASSWORD "################"


/* Callback function to get the Email reading status */
void imapCallback(IMAP_Status status);

/* Print the list of mailbox folders */
void printAllMailboxesInfo(IMAPSession &imap);

/* Print the selected folder info */
void printSelectedMailboxInfo(IMAPSession &imap);

/* Print all messages from the message list */
void printMessages(IMAPSession &imap);

/* Print all rfc822 messages included in the message */
void printRFC822Messages(IMAP_MSG_Item &msg);

/* Print all attachments info from the message */
void printAttacements(IMAP_MSG_Item &msg);

/* The IMAP Session object used for Email reading */
IMAPSession imap;

void setup()
{

    Serial.begin(115200);

#if defined(ARDUINO_ARCH_SAMD)
    while (!Serial)
        ;
    Serial.println();
    Serial.println("**** Custom built WiFiNINA firmware need to be installed.****\nTo install firmware, read the instruction here, https://github.com/mobizt/ESP-Mail-Client#install-custom-built-wifinina-firmware");

#endif

    Serial.println();

    Serial.print("Connecting to AP");

    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(200);
    }

    Serial.println("");
    Serial.println("WiFi connected.");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    /** Enable the debug via Serial port 
     * none debug or 0
     * basic debug or 1
    */
    imap.debug(1);

    /* Set the callback function to get the reading results */
    imap.callback(imapCallback);

    /* Declare the session config data */
    ESP_Mail_Session session;

    /** In case the SD card/adapter was used for the file storagge, the SPI pins can be configure from
     * MailClient.sdBegin function which may be different for ESP32 and ESP8266
     * For ESP32, assign all of SPI pins
     * MailClient.sdBegin(14,2,15,13)
     * Which SCK = 14, MISO = 2, MOSI = 15 and SS = 13
     * And for ESP8266, assign the CS pins of SPI port
     * MailClient.sdBegin(15)
     * Which pin 15 is the CS pin of SD card adapter
    */

    /** ########################################################
     * Some properties of IMAP_Config and ESP_Mail_Session data
     * accept the pointer to constant char i.e. const char*. 
     * 
     * You may assign a string literal to that properties like 
     * below example.
     *   
     * config.search.criteria = String("UID SEARCH ALL").c_str();
     * 
     * String folder = "INBOX";
     * imap.selectFolder(folder.c_str());
     * 
     * ###########################################################
    */

    /* Set the session config */
    session.server.host_name = IMAP_HOST;
    session.server.port = IMAP_PORT;
    session.login.email = AUTHOR_EMAIL;
    session.login.password = AUTHOR_PASSWORD;

    /* Setup the configuration for searching or fetching operation and its result */
    IMAP_Config config;

    /* Message UID to fetch or read */
    config.fetch.uid = "";

    /** Search criteria 
     * 
     * A search key can also be a parenthesized list of one or more search keys 
     * (e.g., for use with the OR and NOT keys). 
     * 
     * Since IMAP protocol uses Polish notation, the search criteria which in the polish notation form can be.
     * 
     * To search the message from "someone@email.com" with the subject "my subject" since 1 Jan 2021, your search criteria can be
     * UID SEARCH (OR SUBJECT "my subject" FROM "someone@email.com") SINCE "Fri, 1 Jan 2021 21:52:25 -0800"
     * 
     * To search the message from "mail1@domain.com" or from "mail2@domain.com", the search criteria will be
     * UID SEARCH OR FROM mail1@domain.com FROM mail2@domain.com 
     * 
     * For more details on using parentheses, AND, OR and NOT search keys in search criteria.
     * https://www.limilabs.com/blog/imap-search-requires-parentheses
     * 
     * 
    */
    config.search.criteria = "UID SEARCH ALL";

    /* Also search the unseen message */
    config.search.unseen_msg = true;

    /* Set the storage to save the downloaded files and attachments */
    config.storage.saved_path = "/email_data";

    /** The file storage type e.g.
     * esp_mail_file_storage_type_none,
     * esp_mail_file_storage_type_flash, and 
     * esp_mail_file_storage_type_sd 
    */
    config.storage.type = esp_mail_file_storage_type_flash;

    /** Set to download heades, text and html messaeges, 
     * attachments and inline images respectively.
    */
    config.download.header = true;
    config.download.text = true;
    config.download.html = true;
    config.download.attachment = true;
    config.download.inlineImg = true;

    /** Set to enable the results i.e. html and text messaeges 
     * which the content stored in the IMAPSession object is limited
     * by the option config.limit.msg_size.
     * The whole message can be download through config.download.text
     * or config.download.html which not depends on these enable options.
    */
    config.enable.html = true;
    config.enable.text = true;

    /* Set to enable the sort the result by message UID in the ascending order */
    config.enable.recent_sort = true;

    /* Set to report the download progress via the default serial port */
    config.enable.download_status = true;

    /* Set the limit of number of messages in the search results */
    config.limit.search = 5;

    /** Set the maximum size of message stored in 
     * IMAPSession object in byte
    */
    config.limit.msg_size = 512;

    /** Set the maximum attachments and inline images files size
     * that can be downloaded in byte. 
     * The file which its size is largger than this limit may be saved 
     * as truncated file.
    */
    config.limit.attachment_size = 1024 * 1024 * 5;


    /* Connect to server with the session and config */
    if (!imap.connect(&session, &config))
        return;

    /*  {Optional] */
    printAllMailboxesInfo(imap);

    /* Open or select the mailbox folder to read or search the message */
    if (!imap.selectFolder("INBOX"))
        return;

    /*  {Optional] */
    printSelectedMailboxInfo(imap);

    /** Read or search the Email and keep the TCP session to open 
     * The second parameter is for close the session.
    */
    MailClient.readMail(&imap, false);

    /* Clear all stored data in IMAPSession object */
    imap.empty();

    /** Open or select other mailbox folder 
     * The folder that previousely opened will be closed
    */
    if (imap.selectFolder("Junk"))
    {
        /*  {Optional] */
        printSelectedMailboxInfo(imap);

        /* Config to search all messages in the opened mailboax (Search mode) */
        config.search.criteria = "UID SEARCH ALL"; // or "UID SEARCH NEW" for recent received messages

        /* No message UID provide for fetching */
        config.fetch.uid = "";

        /* Search the Email and close the session */
        MailClient.readMail(&imap);
    }

    /* Close the seeion in case the session is still open */
    imap.closeSession();

    /* Clear all stored data in IMAPSession object */
    imap.empty();
}

void loop()
{
}

/* Callback function to get the Email reading status */
void imapCallback(IMAP_Status status)
{
    /* Print the current status */
    Serial.println(status.info());

    /* Show the result when reading finished */
    if (status.success())
    {
        /* Print the result */
        printMessages(imap);

        /* Clear all stored data in IMAPSession object */
        imap.empty();
    }
}

void printAllMailboxesInfo(IMAPSession &imap)
{
    /* Declare the folder collection class to get the list of mailbox folders */
    FoldersCollection folders;

    /* Get the mailbox folders */
    if (imap.getFolders(folders))
    {
        for (size_t i = 0; i < folders.size(); i++)
        {
            /* Iterate each folder info using the  folder info item data */
            FolderInfo folderInfo = folders.info(i);
            ESP_MAIL_PRINTF("%s%s%s", i == 0 ? "\nAvailable folders: " : ", ", folderInfo.name, i == folders.size() - 1 ? "\n" : "");
        }
    }
}

void printSelectedMailboxInfo(IMAPSession &imap)
{
    /* Declare the selected folder info class to get the info of selected mailbox folder */
    SelectedFolderInfo sFolder = imap.selectedFolder();

    /* Show the mailbox info */
    ESP_MAIL_PRINTF("\nInfo of the selected folder\nTotal Messages: %d\n", sFolder.msgCount());
    ESP_MAIL_PRINTF("Predicted next UID: %d\n", sFolder.nextUID());
    for (size_t i = 0; i < sFolder.flagCount(); i++)
        ESP_MAIL_PRINTF("%s%s%s", i == 0 ? "Flags: " : ", ", sFolder.flag(i).c_str(), i == sFolder.flagCount() - 1 ? "\n" : "");
}

void printRFC822Messages(IMAP_MSG_Item &msg)
{
    ESP_MAIL_PRINTF("RFC822 Messages: %d message(s)\n****************************\n", msg.rfc822.size());
    for (size_t j = 0; j < msg.rfc822.size(); j++)
    {
        IMAP_MSG_Item rfc822 = msg.rfc822[j];
        ESP_MAIL_PRINTF("%d. \n", j + 1);
        ESP_MAIL_PRINTF("Messsage ID: %s\n", rfc822.messageID);
        ESP_MAIL_PRINTF("From: %s\n", rfc822.from);
        ESP_MAIL_PRINTF("Sender: %s\n", rfc822.sender);
        ESP_MAIL_PRINTF("To: %s\n", rfc822.to);
        ESP_MAIL_PRINTF("CC: %s\n", rfc822.cc);
        ESP_MAIL_PRINTF("Subject: %s\n", rfc822.subject);
        ESP_MAIL_PRINTF("Date: %s\n", rfc822.date);
        ESP_MAIL_PRINTF("Reply-To: %s\n", rfc822.reply_to);
        ESP_MAIL_PRINTF("Return-Path: %s\n", rfc822.return_path);
        ESP_MAIL_PRINTF("Comment: %s\n", rfc822.comment);
        ESP_MAIL_PRINTF("Keyword: %s\n", rfc822.keyword);
        ESP_MAIL_PRINTF("Text Message: %s\n", rfc822.text.content);
        ESP_MAIL_PRINTF("Text Message Charset: %s\n", rfc822.text.charSet);
        ESP_MAIL_PRINTF("Text Message Transfer Encoding: %s\n", rfc822.text.transfer_encoding);
        ESP_MAIL_PRINTF("HTML Message: %s\n", rfc822.html.content);
        ESP_MAIL_PRINTF("HTML Message Charset: %s\n", rfc822.html.charSet);
        ESP_MAIL_PRINTF("HTML Message Transfer Encoding: %s\n\n", rfc822.html.transfer_encoding);

        if (rfc822.attachments.size() > 0)
            printAttacements(rfc822);
    }
}

void printAttacements(IMAP_MSG_Item &msg)
{
    ESP_MAIL_PRINTF("Attachment: %d file(s)\n****************************\n", msg.attachments.size());
    for (size_t j = 0; j < msg.attachments.size(); j++)
    {
        IMAP_Attach_Item att = msg.attachments[j];
        /** att.type can be
         * esp_mail_att_type_none or 0
         * esp_mail_att_type_attachment or 1
         * esp_mail_att_type_inline or 2
        */
        ESP_MAIL_PRINTF("%d. Filename: %s, Name: %s, Size: %d, MIME: %s, Type: %s, Creation Date: %s\n", j + 1, att.filename, att.name, att.size, att.mime, att.type == esp_mail_att_type_attachment ? "attachment" : "inline", att.creationDate);
    }
    Serial.println();
}

void printMessages(IMAPSession &imap)
{
    /* Get the message list from the message list data */
    IMAP_MSG_List msgList = imap.data();

    for (size_t i = 0; i < msgList.msgItems.size(); i++)
    {
        /* Iterate to get each message data through the message item data */
        IMAP_MSG_Item msg = msgList.msgItems[i];

        Serial.println("################################");
        ESP_MAIL_PRINTF("Messsage Number: %s\n", msg.msgNo);
        ESP_MAIL_PRINTF("Messsage UID: %s\n", msg.UID);
        ESP_MAIL_PRINTF("Messsage ID: %s\n", msg.ID);
        ESP_MAIL_PRINTF("Accept Language: %s\n", msg.acceptLang);
        ESP_MAIL_PRINTF("Content Language: %s\n", msg.contentLang);
        ESP_MAIL_PRINTF("From: %s\n", msg.from);
        ESP_MAIL_PRINTF("From Charset: %s\n", msg.fromCharset);
        ESP_MAIL_PRINTF("To: %s\n", msg.to);
        ESP_MAIL_PRINTF("To Charset: %s\n", msg.toCharset);
        ESP_MAIL_PRINTF("CC: %s\n", msg.cc);
        ESP_MAIL_PRINTF("CC Charset: %s\n", msg.ccCharset);
        ESP_MAIL_PRINTF("Date: %s\n", msg.date);
        ESP_MAIL_PRINTF("Subject: %s\n", msg.subject);
        ESP_MAIL_PRINTF("Subject Charset: %s\n", msg.subjectCharset);

        /* If the result contains the message info (Fetch mode) */
        if (!imap.headerOnly())
        {
            ESP_MAIL_PRINTF("Text Message: %s\n", msg.text.content);
            ESP_MAIL_PRINTF("Text Message Charset: %s\n", msg.text.charSet);
            ESP_MAIL_PRINTF("Text Message Transfer Encoding: %s\n", msg.text.transfer_encoding);
            ESP_MAIL_PRINTF("HTML Message: %s\n", msg.html.content);
            ESP_MAIL_PRINTF("HTML Message Charset: %s\n", msg.html.charSet);
            ESP_MAIL_PRINTF("HTML Message Transfer Encoding: %s\n\n", msg.html.transfer_encoding);

            if (msg.attachments.size() > 0)
                printAttacements(msg);

            if (msg.rfc822.size() > 0)
                printRFC822Messages(msg);
        }

        Serial.println();
    }
}
