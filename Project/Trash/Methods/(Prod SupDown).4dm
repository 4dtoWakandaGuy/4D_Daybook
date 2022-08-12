//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod SupDown
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
	C_TEXT:C284($_t_oldMethodName; vButtDisPro; vProdCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod SupDown")
// Prod SupDown
DB_SaveRecord(->[PRODUCTS:9])
AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
vProdCode:=[PRODUCTS:9]Product_Code:1
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Superior:15=vProdCode)
If (Records in selection:C76([PRODUCTS:9])=0)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProdCode)
	Gen_Alert("No inferiors found"; "")
End if 
Products_InLPB
In_ButtNextPrev(->[PRODUCTS:9]; ->vButtDisPro)
In_ButtChkDis(->vButtDisPro)
Products_InLPß("S1")
ERR_MethodTrackerReturn("Prod SupDown"; $_t_oldMethodName)