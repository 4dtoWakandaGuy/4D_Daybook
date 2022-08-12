//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPTextAd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPTextAd")
SEND PACKET:C103("Contact:"+vFld+[CONTACTS:1]Contact_Name:31+vRec)
SEND PACKET:C103("Company Name:"+vFld+[COMPANIES:2]Company_Name:2+vRec)
SEND PACKET:C103("Address:"+vFld+[COMPANIES:2]Address_Line_one:3+vRec)
SEND PACKET:C103("Address:"+vFld+[COMPANIES:2]Address_Line_two:4+vRec)
SEND PACKET:C103("City:"+vFld+[COMPANIES:2]Town_or_City:5+" "+[COMPANIES:2]County_or_State:6+" "+[COMPANIES:2]Postal_Code:7+vRec)
SEND PACKET:C103("Country:"+vFld+[COMPANIES:2]Country:8+vRec)
SEND PACKET:C103("Tel:"+vFld+[COMPANIES:2]Telephone:9+vRec)
SEND PACKET:C103("Fax:"+vFld+[COMPANIES:2]Fax:10+vRec+vRec)
ERR_MethodTrackerReturn("Orders PPTextAd"; $_t_oldMethodName)