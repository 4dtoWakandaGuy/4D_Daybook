//%attributes = {}
If (False:C215)
	//Project Method Name:      JobPers_Sel
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
	C_LONGINT:C283(vJ; xNext)
	C_TEXT:C284(<>JobCode; $_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers_Sel")
//JobStages_Sel

vJ:=1
If (vSelPrev="•FSC")
	JobPers_SelP
Else 
	$_t_Search:=""
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Job Person: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	End if 
	//Note that this uses Gen_Search as opposed to Gen_SearchA
	If ($_t_Search#"") & (SRCH_bo_AutoSearch)
		OK:=1
		xNext:=0
	Else 
		$_t_Search:=Gen_Search("Job, Stage or Person to find:"; vSelPrev; "Find Job Personnel"; <>JobCode; ""; "")
	End if 
	If (OK=1)
		If (xNext=0)
			JobPersonnel_Sel2($_t_Search)
			
		Else 
			JobPers_SelP
		End if 
	Else 
		vJ:=0
	End if 
End if 
ERR_MethodTrackerReturn("JobPers_Sel"; $_t_oldMethodName)