//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 21:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vA; xNext)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_Sel")
//Projects_Sel

vA:=1
If (vSelPrev="•FSC")
	Projects_SelP
Else 
	If (Count parameters:C259>=1)
		//$_t_Search:="Project : "+$1
		$_t_Search:="Project: "+$1  //took out space (presumably a typo - further down in code it checks for this string), 27/04/07 -kmw
	Else 
		$_t_Search:=""
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If ($_t_Search#"")
		$_t_Search:=Gen_SearchA("Project, Company or Contact to find:"; vSelPrev; "Find Projects"; $_t_Search; Sel_ContCode; Sel_CompCode; "")
	Else 
		$_t_Search:=Gen_SearchA("Project, Company or Contact to find:"; vSelPrev; "Find Projects"; Sel_ContCode; Sel_CompCode; "")
	End if 
	
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			Projects_Sel2($_t_Search)
			Sel_FindMy(->[PROJECTS:89]; ->[PROJECTS:89]Person:8)
		Else 
			Projects_SelP
		End if 
	Else 
		vA:=0
	End if 
End if 
ERR_MethodTrackerReturn("Projects_Sel"; $_t_oldMethodName)