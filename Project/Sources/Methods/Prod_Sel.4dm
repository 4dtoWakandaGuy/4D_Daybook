//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 20:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(<>AutoProc; vP; xNext)
	C_TEXT:C284(<>CompCode; <>ProdCode; $_t_oldMethodName; $_t_Search; $1; PROD_t_ViewProductCode; VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_Sel")
//Prod_Sel
vAutoFind:=<>AutoFind

vP:=1
If (vSelPrev="•FSC")
	Prod_SelP
Else 
	If (<>ProdCode#"")
		$_t_Search:=<>ProdCode
	Else 
		$_t_Search:=PROD_t_ViewProductCode
		
	End if 
	PROD_t_ViewProductCode:=""
	If (<>AutoFind)
		If ((<>CompCode#"") & (<>ProdCode=""))
			$_t_Search:="Company: "+<>CompCode
		Else 
			If (<>CompCode="*Compo")
				$_t_Search:="Components of: "+<>ProdCode
				<>CompCode:=""
				vItemNum:=<>AutoProc
			End if 
		End if 
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Product: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	End if 
	$_t_Search:=Gen_SearchA("Product Code(s) or Name to find:"; vSelPrev; "Find Products"; $_t_Search; ""; "")
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			Prod_Sel2($_t_Search)
		Else 
			Prod_SelP
		End if 
	Else 
		vP:=0
	End if 
End if 
ERR_MethodTrackerReturn("Prod_Sel"; $_t_oldMethodName)
