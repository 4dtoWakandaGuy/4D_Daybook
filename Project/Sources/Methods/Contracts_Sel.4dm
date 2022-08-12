//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vContr; xNext)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_Sel")
//Contracts_Sel

vContr:=1
If (vSelPrev="•FSC")
	Contracts_SelP
Else 
	If (Count parameters:C259>=1)
		$_t_Search:="Contract: "+$1
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	
	$_t_Search:=Gen_SearchA("Contract or Company Code to find:"; vSelPrev; "Find Contracts"; $_t_Search; Sel_CompCode; "")
	If (OK=1)
		If (xNext=0)
			Contracts_Sel2($_t_Search)
			
		Else 
			Contracts_SelP
		End if 
	Else 
		vContr:=0
	End if 
End if 
ERR_MethodTrackerReturn("Contracts_Sel"; $_t_oldMethodName)