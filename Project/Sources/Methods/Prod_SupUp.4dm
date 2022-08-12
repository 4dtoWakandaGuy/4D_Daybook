//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SupUp
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
	C_TEXT:C284($_t_oldMethodName; vButtDisPro; vProdCode; vProduct)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SupUp")
DB_SaveRecord(->[PRODUCTS:9])
AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
vProduct:=[PRODUCTS:9]Product_Code:1
vProdCode:=[PRODUCTS:9]Superior:15
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProdCode)
If (Records in selection:C76([PRODUCTS:9])=0)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProduct)
	Gen_Alert("Superior not found"; "")
End if 
Products_InLPB
In_ButtNextPrev(->[PRODUCTS:9]; ->vButtDisPro)
In_ButtChkDis(->vButtDisPro)
Products_InLPß("S1")
ERR_MethodTrackerReturn("Prod_SupUp"; $_t_oldMethodName)