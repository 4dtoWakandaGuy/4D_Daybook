//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stock Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 21:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vSt; xNext)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock Sel")
//Stock Sel

vSt:=1
If (vSelPrev="•FSC")
	Stock_SelP
Else 
	If (Count parameters:C259>=1)
		$_t_Search:="Movement: "+$1
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	$_t_Search:=Gen_SearchA("Movement, Our Order or Product to find:"; vSelPrev; Term_StoWT("Find Stock Items"); $_t_Search; <>ProdCode; "")
	
	
	If (OK=1)
		If (xNext=0)
			StockItems_Sel2($_t_Search)
			//
		Else 
			Stock_SelP
		End if 
	Else 
		vSt:=0
	End if 
End if 
ERR_MethodTrackerReturn("Stock Sel"; $_t_oldMethodName)