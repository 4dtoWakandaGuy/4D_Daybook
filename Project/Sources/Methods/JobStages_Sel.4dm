//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_Sel
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages_Sel")
//JobStages_Sel

vJ:=1
If (vSelPrev="•FSC")
	JobStages_SelP
Else 
	If (Count parameters:C259>=1)
		$_t_Search:="Job Stage Code: "+$1
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If ($_t_Search="")
		$_t_Search:=Gen_SearchA("Job or Stage to find:"; vSelPrev; "Find Job Stages"; <>JobCode; ""; "")
	Else 
		$_t_Search:=Gen_SearchA("Job or Stage to find:"; vSelPrev; "Find Job Stages"; $_t_Search; <>JobCode; "")
	End if 
	If (OK=1)
		If (xNext=0)
			JobStages_Sel2($_t_Search)
			
		Else 
			JobStages_SelP
		End if 
	Else 
		vJ:=0
	End if 
End if 
ERR_MethodTrackerReturn("JobStages_Sel"; $_t_oldMethodName)