//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DateSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>GRP_at_GroupMemberPersons;0)
	C_BOOLEAN:C305(<>PER_bo_GroupToDo)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; vDiaryCheck; vNo)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_SearchValue; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLongDate; vUser2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DateSrch")
//Diary_DateSrch
Long_Date2
vLongDate:=vLongDate+"  "+Lowercase:C14(String:C10(Current time:C178; 5))
MESSAGES OFF:C175
If ((vDiaryCheck=0) | (vDate<<>DB_d_CurrentDate))
	QUERY:C277([DIARY:12]Done:14=False:C215; *)
	If (<>DB_d_CurrentDate=vDate)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vDate; *)
	Else 
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=vDate; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vDate; *)
	End if 
	QUERY:C277([DIARY:12];  | ; [DIARY:12]Date_Done_From:5=vDate; *)
	If ((<>PER_bo_GroupToDo) & (DB_t_CurrentFormUsage#"NoGroup"))
		QUERY:C277([DIARY:12])
		$_l_SizeofArray:=Size of array:C274(<>GRP_at_GroupMemberPersons)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=<>GRP_at_GroupMemberPersons{1}; *)
		For ($_l_Index; 2; $_l_SizeofArray)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Person:8=<>GRP_at_GroupMemberPersons{$_l_Index}; *)
		End for 
		QUERY SELECTION:C341([DIARY:12])
	Else 
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=vUser2)
	End if 
Else 
	If (vDiaryCheck<3)
		
		If ((<>PER_bo_GroupToDo) & (DB_t_CurrentFormUsage#"NoGroup"))
			$_l_SizeofArray:=Size of array:C274(<>GRP_at_GroupMemberPersons)
			If (vDiaryCheck=1)
				$_t_SearchValue:=<>GRP_at_GroupMemberPersons{1}+(" "*(5-(Length:C16(vUser2))))+"1"
			Else 
				$_t_SearchValue:=<>GRP_at_GroupMemberPersons{1}+(" "*(5-(Length:C16(vUser2))))+"@"
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Personal_Priority:31=$_t_SearchValue; *)
			For ($_l_Index; 2; $_l_SizeofArray)
				If (vDiaryCheck=1)
					$_t_SearchValue:=<>GRP_at_GroupMemberPersons{$_l_Index}+(" "*(5-(Length:C16(vUser2))))+"1"
				Else 
					$_t_SearchValue:=<>GRP_at_GroupMemberPersons{$_l_Index}+(" "*(5-(Length:C16(vUser2))))+"@"
				End if 
				QUERY:C277([DIARY:12];  | ; [DIARY:12]Personal_Priority:31=$_t_SearchValue; *)
			End for 
			
		Else 
			If (vDiaryCheck=1)
				$_t_SearchValue:=vUser2+(" "*(5-(Length:C16(vUser2))))+"1"
			Else 
				$_t_SearchValue:=vUser2+(" "*(5-(Length:C16(vUser2))))+"@"
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Personal_Priority:31=$_t_SearchValue; *)
		End if 
		
		If (<>DB_d_CurrentDate=vDate)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vDate)
		Else 
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=vDate; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vDate)
		End if 
		
	Else 
		If ((<>PER_bo_GroupToDo) & (DB_t_CurrentFormUsage#"NoGroup"))
			$_l_SizeofArray:=Size of array:C274(<>GRP_at_GroupMemberPersons)
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=<>GRP_at_GroupMemberPersons{1}; *)
			For ($_l_Index; 2; $_l_SizeofArray)
				QUERY:C277([DIARY:12];  | ; [DIARY:12]Person:8=<>GRP_at_GroupMemberPersons{$_l_Index}; *)
			End for 
		Else 
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=vUser2; *)
		End if 
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34>=vDate; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vDate)
	End if 
End if 
MESSAGES ON:C181
If ((<>PER_t_CurrentUserInitials#vUser2) | (<>PER_bo_GroupToDo))
	Diary_SelCheck
End if 
vNo:=Records in selection:C76([DIARY:12])
CREATE SET:C116([DIARY:12]; "DMaster")
CREATE EMPTY SET:C140([DIARY:12]; "userset")
SET WINDOW TITLE:C213(Diary_DiaryWT)
ERR_MethodTrackerReturn("Diary_DateSrch"; $_t_oldMethodName)