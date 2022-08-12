//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2010 08:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vPu; xNext)
	C_TEXT:C284(<>OrderCode; $_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd Sel")
//PurchOrd Sel

vPu:=1
If (vSelPrev="•FSC")
	PurchOrd_SelP
Else 
	$_t_Search:=""
	If ((<>AutoFind) & (<>OrderCode#""))
		$_t_Search:="Order: "+<>OrderCode
	End if 
	If (Count parameters:C259>=1)
		$_t_Search:="pOrder: "+$1
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	
	$_t_Search:=Gen_SearchA("Supplier or Purch Ord No to find:"; vSelPrev; "Find Purchase Orders"; $_t_Search; Sel_CompCode; "")
	If (OK=1)
		If (xNext=0)
			PurchaseOrders_Sel2($_t_Search)
		Else 
			PurchOrd_SelP
		End if 
	Else 
		vPu:=0
	End if 
End if 
ERR_MethodTrackerReturn("PurchOrd Sel"; $_t_oldMethodName)