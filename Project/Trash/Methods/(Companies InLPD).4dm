//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPD")
Case of 
	: (Modified:C32([COMPANIES:2]Telephone:9))
		Companies_InLPX(->[COMPANIES:2]Telephone:9)
	: (Modified:C32([COMPANIES:2]Fax:10))
		Companies_InLPX(->[COMPANIES:2]Fax:10)
	: (Modified:C32([COMPANIES:2]Company_Name:2))
		Companies_InLPX(->[COMPANIES:2]Company_Name:2)
	: (Modified:C32([COMPANIES:2]Company_Code:1))
		Companies_InLPX(->[COMPANIES:2]Company_Code:1)
	: (Modified:C32([COMPANIES:2]Superior:34))
		Companies_InLPX(->[COMPANIES:2]Superior:34)
	: (Modified:C32([COMPANIES:2]Also_Known_As:43))
		Companies_InLPX(->[COMPANIES:2]Also_Known_As:43)
	: (Modified:C32([COMPANIES:2]Address_Line_one:3))
		Companies_InLPX(->[COMPANIES:2]Address_Line_one:3)
	: (Modified:C32([COMPANIES:2]Address_Line_two:4))
		Companies_InLPX(->[COMPANIES:2]Address_Line_two:4)
	: (Modified:C32([COMPANIES:2]Town_or_City:5))
		Companies_InLPX(->[COMPANIES:2]Town_or_City:5)
	: (Modified:C32([COMPANIES:2]County_or_State:6))
		Companies_InLPX(->[COMPANIES:2]County_or_State:6)
	: (Modified:C32([COMPANIES:2]Postal_Code:7))
		Companies_InLPX(->[COMPANIES:2]Postal_Code:7)
	: (Modified:C32([COMPANIES:2]Mailsort_SSC:49))
		Companies_InLPX(->[COMPANIES:2]Mailsort_SSC:49)
	: (Modified:C32([COMPANIES:2]Mailsort_OFN:50))
		Companies_InLPX(->[COMPANIES:2]Mailsort_OFN:50)
	: (Modified:C32([COMPANIES:2]Country:8))
		Companies_InLPX(->[COMPANIES:2]Country:8)
	: (Modified:C32([COMPANIES:2]Area:11))
		Companies_InLPX(->[COMPANIES:2]Area:11)
	: (Modified:C32([COMPANIES:2]Sales_Person:29))
		Companies_InLPX(->[COMPANIES:2]Sales_Person:29)
	: (Modified:C32([COMPANIES:2]Taken_By:26))
		Companies_InLPX(->[COMPANIES:2]Taken_By:26)
	: (Modified:C32([COMPANIES:2]Status:12))
		Companies_InLPX(->[COMPANIES:2]Status:12)
	: (Modified:C32([COMPANIES:2]Company_Type:13))
		Companies_InLPX(->[COMPANIES:2]Company_Type:13)
	: (Modified:C32([COMPANIES:2]Source:14))
		Companies_InLPX(->[COMPANIES:2]Source:14)
	: (Modified:C32([COMPANIES:2]Omit:17))
		Companies_InLPX(->[COMPANIES:2]Omit:17)
	: (Modified:C32([COMPANIES:2]Default_TAX:41))
		Companies_InLPX(->[COMPANIES:2]Default_TAX:41)
	: (Modified:C32([COMPANIES:2]Default_Credit_Stage:42))
		Companies_InLPX(->[COMPANIES:2]Default_Credit_Stage:42)
	: (Modified:C32([COMPANIES:2]SO_Price_Group:44))
		Companies_InLPX(->[COMPANIES:2]SO_Price_Group:44)
	: (Modified:C32([COMPANIES:2]PO_Price_Group:54))
		Companies_InLPX(->[COMPANIES:2]PO_Price_Group:54)
	: (Modified:C32([COMPANIES:2]Factor_Number:46))
		Companies_InLPX(->[COMPANIES:2]Factor_Number:46)
	: (Modified:C32([COMPANIES:2]Autopay_Number:47))
		Companies_InLPX(->[COMPANIES:2]Autopay_Number:47)
	: (Modified:C32([COMPANIES:2]Their_Account_Number:48))
		Companies_InLPX(->[COMPANIES:2]Their_Account_Number:48)
	: (Modified:C32([COMPANIES:2]TAX_Prefix:38))
		Companies_InLPX(->[COMPANIES:2]TAX_Prefix:38)
	: (Modified:C32([COMPANIES:2]TAX_Registration_Number:39))
		Companies_InLPX(->[COMPANIES:2]TAX_Registration_Number:39)
	: (Modified:C32([COMPANIES:2]Default_Layer:51))
		Companies_InLPX(->[COMPANIES:2]Default_Layer:51)
	: (Modified:C32([COMPANIES:2]Default_Currency:59))
		Companies_InLPX(->[COMPANIES:2]Default_Currency:59)
	: (Modified:C32([COMPANIES:2]SL_Terms:40))
		Companies_InLPX(->[COMPANIES:2]SL_Terms:40)
	: (Modified:C32([COMPANIES:2]PL_Terms:53))
		Companies_InLPX(->[COMPANIES:2]PL_Terms:53)
	: (Modified:C32([COMPANIES:2]Invoice_Dept:24))
		Companies_InLPX(->[COMPANIES:2]Invoice_Dept:24)
	: (Modified:C32([COMPANIES:2]Invoice_Name:25))
		Companies_InLPX(->[COMPANIES:2]Invoice_Name:25)
	: (Modified:C32([COMPANIES:2]Invoice_Address_Line_One:18))
		Companies_InLPX(->[COMPANIES:2]Invoice_Address_Line_One:18)
	: (Modified:C32([COMPANIES:2]Invoice_Address_Line_Two:19))
		Companies_InLPX(->[COMPANIES:2]Invoice_Address_Line_Two:19)
	: (Modified:C32([COMPANIES:2]Invoice_Town:20))
		Companies_InLPX(->[COMPANIES:2]Invoice_Town:20)
	: (Modified:C32([COMPANIES:2]Invoice_County:21))
		Companies_InLPX(->[COMPANIES:2]Invoice_County:21)
	: (Modified:C32([COMPANIES:2]Invoice_Postcode:22))
		Companies_InLPX(->[COMPANIES:2]Invoice_Postcode:22)
	: (Modified:C32([COMPANIES:2]Invoice_Country:23))
		Companies_InLPX(->[COMPANIES:2]Invoice_Country:23)
	: (Modified:C32([COMPANIES:2]Email_Before_At:58))
		Companies_InLPX(->[COMPANIES:2]Email_Before_At:58)
	: (Modified:C32([COMPANIES:2]EMail_After_At:55))
		Companies_InLPX(->[COMPANIES:2]EMail_After_At:55)
	: (Modified:C32([COMPANIES:2]Home_Page_URL:56))
		Companies_InLPX(->[COMPANIES:2]Home_Page_URL:56)
	: (Modified:C32([COMPANIES:2]Size:15))
		Companies_InLPX(->[COMPANIES:2]Size:15)
	: (Modified:C32([COMPANIES:2]Private:37))
		Companies_InLPX(->[COMPANIES:2]Private:37)
End case 
ERR_MethodTrackerReturn("Companies_InLPD"; $_t_oldMethodName)