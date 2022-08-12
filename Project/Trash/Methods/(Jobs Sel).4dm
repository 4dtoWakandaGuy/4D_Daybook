//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vJ; xNext)
	C_TEXT:C284(<>JobCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs Sel")
//Jobs Sel

vJ:=1
If (vSelPrev="•FSC")
	Jobs_SelP
Else 
	If (<>JobCode#"")
		$_t_Search:="Job: "+<>JobCode
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=1)
		$_t_Search:="Job: "+$1
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	$_t_Search:=Gen_SearchA("Job, Company or Contact to find:"; vSelPrev; "Find Jobs"; $_t_Search; Sel_CompCode; "")
	If (OK=1)
		If (xNext=0)
			Jobs_Sel2($_t_Search)
			Sel_FindMy(->[JOBS:26]; ->[JOBS:26]Person:19)
		Else 
			Jobs_SelP
		End if 
	Else 
		vJ:=0
	End if 
End if 
ERR_MethodTrackerReturn("Jobs Sel"; $_t_oldMethodName)