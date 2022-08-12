//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports Sel
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
	C_LONGINT:C283(vTr; xNext)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports Sel")
//Report Sel`See also Letters_Sel
$_t_Search:=Gen_Search("Report Code, Name or Person to find:"; vSelPrev; "Find Reports")
If (OK=0)
	vTr:=0
Else 
	If (xNext=0)
		vSelPrev:=$_t_Search
		Letters_Sel2($_t_Search)
		If (vFilePtr#(->[USER:15]))
			Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
			QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=Table:C252(vFilePtr))
		Else 
			QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11#0)
		End if 
	Else 
		QUERY:C277([DOCUMENTS:7])
		If (OK=1)
			If (vFilePtr#(->[USER:15]))
				Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=Table:C252(vFilePtr))
			Else 
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11#0)
			End if 
		Else 
			vTr:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Reports Sel"; $_t_oldMethodName)