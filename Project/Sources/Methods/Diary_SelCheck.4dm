//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_SelCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/11/2011 18:56:14If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DIA_at_Access;0)
	C_BOOLEAN:C305(DIA_bo_AccessInited)
	C_LONGINT:C283($_l_Index; $_l_MatchingRow; $_l_SizeofArray)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelCheck")
If (Records in selection:C76([DIARY:12])>0)
	If (Not:C34(DIA_bo_AccessInited))
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=<>PER_t_CurrentUserInitials)
		ARRAY TEXT:C222(DIA_at_Access; 0)
		SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person:1; DIA_at_Access)
		DIA_bo_AccessInited:=True:C214
	End if 
	$_l_SizeofArray:=Size of array:C274(DIA_at_Access)
	If ($_l_SizeofArray>0)
		$_l_MatchingRow:=Find in array:C230(DIA_at_Access; <>PER_t_CurrentUserInitials)
		
		If (($_l_SizeofArray=1) & ($_l_MatchingRow#-1))
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=DIA_at_Access{1}; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Originator:23=DIA_at_Access{1})
		Else 
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=DIA_at_Access{1}; *)
			For ($_l_Index; 2; $_l_SizeofArray-1)
				QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Person:8=DIA_at_Access{$_l_Index}; *)
			End for 
			If ($_l_MatchingRow=-1)
				QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials; *)
			End if 
			If ($_l_SizeofArray>1)
				QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Person:8=DIA_at_Access{$_l_SizeofArray}; *)
			End if 
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Originator:23=<>PER_t_CurrentUserInitials)
		End if 
		
	End if 
End if 
If (Records in selection:C76([DIARY:12])>0)
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43#1)
End if 
ERR_MethodTrackerReturn("Diary_SelCheck"; $_t_oldMethodName)