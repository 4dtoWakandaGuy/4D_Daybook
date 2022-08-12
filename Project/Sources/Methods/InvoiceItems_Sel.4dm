//%attributes = {}
If (False:C215)
	//Project Method Name:      InvoiceItems_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(xNext)
	C_REAL:C285(vInvI)
	C_TEXT:C284(<>InvoiceCode; <>ProdCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("InvoiceItems_Sel")
If (False:C215)
	
	vInvI:=1
	If (vSelPrev="•FSC")
		InvoiceItems_SelP
	Else 
		If (<>InvoiceCode#"")
			$_t_Search:="Invoice: "+<>InvoiceCode
		Else 
			$_t_Search:=""
		End if 
		If (Count parameters:C259>=1)
			If ($1#"")
				$_t_Search:="Invoice Item: "+$1
			End if 
		End if 
		If (Count parameters:C259>=2)
			SRCH_bo_AutoSearch:=$2
		Else 
			SRCH_bo_AutoSearch:=False:C215
		End if 
		
		$_t_Search:=Gen_SearchA("Invoice, Company or Product Code to find:"; vSelPrev; "Find Invoice Items"; $_t_Search; Sel_CompCode; <>ProdCode)
		If (OK=1)
			If (xNext=0)
				InvoiceItems_Sel2($_t_Search)
				
			Else 
				InvoiceItems_SelP
			End if 
		Else 
			vInvI:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("InvoiceItems_Sel"; $_t_oldMethodName)