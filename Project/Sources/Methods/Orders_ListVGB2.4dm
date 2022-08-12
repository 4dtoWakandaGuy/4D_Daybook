//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGB2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Identity;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $No; $Rep)
	C_TEXT:C284($_t_oldMethodName; vDesc; vText; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB2")
RELATE ONE:C42([ORDERS:24]Company_Code:1)
RELATE ONE:C42([ORDERS:24]Contact_Code:2)
MCont_Add("")
//If ([CONTACTS]Status#"")
// RELATE ONE([CONTACTS]Status)
//Else
RELATE ONE:C42([COMPANIES:2]Status:12)
//End if
If ([STATUS:4]Status_Name:2#"")
	vType:=[STATUS:4]Status_Name:2
Else 
	vType:=[COMPANIES:2]Status:12
End if 
If ([ORDERS:24]Comments:14#"")
	vDesc:=[ORDERS:24]Comments:14
Else 
	vDesc:="No further details given"
End if 

vText:="Telephone: "+[COMPANIES:2]Telephone:9
If ([CONTACTS:1]Extn:9#"")
	vText:=vText+" Extn: "+[CONTACTS:1]Extn:9
End if 
vText:=vText+Char:C90(13)
vText:=vText+"Business: "+vType+Char:C90(13)
vText:=vText+"Projects: "+vDesc+Char:C90(13)
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
vText:=vText+"Enquiry Number(s): "
$No:=0
FIRST RECORD:C50([ORDER_ITEMS:25])
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
	If (Find in array:C230(GEN_at_Identity; [ORDER_ITEMS:25]Product_Code:2)>0)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		vText:=vText+[PRODUCTS:9]Model_Code:5+", "
		If ([ORDER_ITEMS:25]Purchase_Order_Number:18="R")
			$Rep:=1
		Else 
			$Rep:=0
		End if 
		$No:=$No+1
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
vText:=Substring:C12(vText; 1; Length:C16(vText)-2)
If ($Rep=1)
	vText:=vText+" REPRESENTATIVE REQUESTED"
End if 
If (Records in selection:C76([ORDER_ITEMS:25])=1)
	vText:=vText+Char:C90(13)+"***  This was the only enquiry on card  ***"
Else 
	If (Records in selection:C76([ORDER_ITEMS:25])<=5)
		vText:=vText+Char:C90(13)+"***  This was 1 of "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" enquiries on card  ***"
	Else 
		vText:=vText+Char:C90(13)
	End if 
End if 

ADD TO SET:C119([ORDERS:24]; "Apply")
ERR_MethodTrackerReturn("Orders_ListVGB2"; $_t_oldMethodName)