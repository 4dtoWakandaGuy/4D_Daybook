//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPTextIA
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

$_t_oldMethodName:=ERR_MethodTracker("Orders PPTextIA")
SEND PACKET:C103("Contact:"+vFld+[COMPANIES:2]Invoice_Dept:24+vRec)
SEND PACKET:C103("Company:"+vFld+[COMPANIES:2]Invoice_Name:25+vRec)
SEND PACKET:C103("Address:"+vFld+[COMPANIES:2]Invoice_Address_Line_One:18+vRec)
SEND PACKET:C103("Address:"+vFld+[COMPANIES:2]Invoice_Address_Line_Two:19+vRec)
SEND PACKET:C103("City:"+vFld+[COMPANIES:2]Invoice_Town:20+" "+[COMPANIES:2]Invoice_County:21+" "+[COMPANIES:2]Invoice_Postcode:22+vRec)
SEND PACKET:C103("Country:"+vFld+[COMPANIES:2]Invoice_Country:23+vRec+vRec)
ERR_MethodTrackerReturn("Orders PPTextIA"; $_t_oldMethodName)