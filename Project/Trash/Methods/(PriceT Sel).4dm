//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vP; xNext)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT Sel")
//PriceT Sel

vP:=1
If (Count parameters:C259>=1)
	$_t_Search:="Price Code: "
Else 
	$_t_Search:=""
End if 
If (Count parameters:C259>=2)
	SRCH_bo_AutoSearch:=$2
Else 
	SRCH_bo_AutoSearch:=False:C215
End if 

If ($_t_Search#"")
	$_t_Search:=Gen_SearchA("Price Code, Group, Brand, Product or Company:"; vSelPrev; "Find Price Table Entries"; $_t_Search; <>ProdCode; Sel_CompCode)
Else 
	$_t_Search:=Gen_SearchA("Price Code, Group, Brand, Product or Company:"; vSelPrev; "Find Price Table Entries"; <>ProdCode; Sel_CompCode; "")
End if 
If (OK=1)
	If (xNext=0)
		PriceTable_Sel2($_t_Search)
		
	Else 
		QUERY:C277([PRICE_TABLE:28])
		If (OK=0)
			vP:=0
		End if 
	End if 
Else 
	vP:=0
End if 
ERR_MethodTrackerReturn("PriceT Sel"; $_t_oldMethodName)