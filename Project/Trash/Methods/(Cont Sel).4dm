//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 12:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vO; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont Sel")
//Cont Sel

vO:=1
If (vSelPrev="•FSC")
	Cont_SelP
Else 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Contact: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If ($_t_Search#"")
		$_t_Search:=Gen_SearchA(Term_FSWT("Name, Code or Company:"); vSelPrev; "Find Contacts"; $_t_Search; Sel_CompCode; "")
	Else 
		$_t_Search:=Gen_SearchA(Term_FSWT("Name, Code or Company:"); vSelPrev; "Find Contacts"; Sel_ContCode; Sel_CompCode; "")
	End if 
	
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			Cont_Sel2($_t_Search)
		Else 
			
			Cont_SelP
			//QUERY SELECTION([CONTACTS];[CONTACTS]Deleted#1)
		End if 
	Else 
		vO:=0
	End if 
End if 
ERR_MethodTrackerReturn("Cont Sel"; $_t_oldMethodName)