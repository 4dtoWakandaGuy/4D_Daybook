//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2010 08:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vC; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_Sel")
//Comp_Sel

vC:=1
If (vSelPrev="•FSC")
	Comp_SelP
Else 
	If (Count parameters:C259>=2)
		
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Company: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If ($_t_Search#"")
		$_t_Search:=Gen_SearchA(Term_FSWT("Company, Postcode, Tel or Surname to find:"); vSelPrev; "Find Companies"; $_t_Search; ""; "")
	Else 
		$_t_Search:=Gen_SearchA(Term_FSWT("Company, Postcode, Tel or Surname to find:"); vSelPrev; "Find Companies"; Sel_CompCode; ""; "")
	End if 
	
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			Comp_Sel2($_t_Search)
		Else 
			Comp_SelP
		End if 
	Else 
		vC:=0
	End if 
End if 
ERR_MethodTrackerReturn("Comp_Sel"; $_t_oldMethodName)