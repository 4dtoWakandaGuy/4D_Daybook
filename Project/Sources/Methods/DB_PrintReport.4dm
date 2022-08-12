//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PrintReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/06/2012 21:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ReportAccess; 0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	ARRAY TEXT:C222($_at_IncludeReports; 0)
	C_BOOLEAN:C305(<>SR; $_bo_OptionKey; $_bo_UseNS)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AccessLevel; $_l_AccessLevel2; $_l_AddMode; $_l_DocumentIndex; $_l_GroupAccessRow; $_l_GroupID; $_l_MenuParameterNumber; $_l_Number; $_l_PersonAccessRow; $_l_TableNumber)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vAdd; vNo)
	C_POINTER:C301($_ptr_Table; vFilePtr)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_MenuItemParameter; $_t_oldMethodName; $_t_Reference; $_t_CurrentOutputform; vMTitle2; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PrintReport")

$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_MenuParameterNumber:=Num:C11($_t_MenuItemParameter)
	$_ptr_Table:=Table:C252($_l_MenuParameterNumber)
Else 
	
	$_l_MenuParameterNumber:=0
	$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
End if 

$_t_Reference:=""



//C_POINTER($_Ptr_Table)
If ($_l_MenuParameterNumber=0)
	
	If (Records in set:C195("ListboxSet0")>0)
		CUT NAMED SELECTION:C334($_ptr_Table->; "$NS")
		$_bo_UseNS:=True:C214
		USE SET:C118("ListboxSet0")
	Else 
		COPY NAMED SELECTION:C331($_ptr_Table->; "$NS")
		$_bo_UseNS:=True:C214
	End if 
End if 



//ON ERR CALL("Error_Macro")
vMTitle2:="n/a"
//TRACE




$_bo_OptionKey:=Gen_Option
If ((((<>SR) & ($_bo_OptionKey=False:C215)) | ((<>SR=False:C215) & ($_bo_OptionKey)))) | (True:C214)
	SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
	
	READ WRITE:C146([DOCUMENTS:7])
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	//Reports_FileI
	//FORM SET OUTPUT([DOCUMENTS];"Reports_Out")
	WIN_t_CurrentOutputform:="Reports_Out"
	$_l_TableNumber:=Table:C252($_ptr_Table)
	//  $_Ptr_Table:=vFilePtr
	$_l_Number:=DB_l_CurrentDisplayedForm
	vFilePtr:=Table:C252(DB_l_CurrentDisplayedForm)
	$_l_AddMode:=vAdd
	Userset_Empty(->[DOCUMENTS:7])
	
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
	QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@")
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
	
	
	
	Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
	$_l_Number:=Records in selection:C76([DOCUMENTS:7])
	ARRAY TEXT:C222($_at_IncludeReports; 0)
	ARRAY LONGINT:C221($_al_ReportAccess; 0)
	//TRACE
	For ($_l_DocumentIndex; 1; Records in selection:C76([DOCUMENTS:7]))
		DOC_LoadAccess([DOCUMENTS:7]Document_Code:1)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
		$_l_GroupID:=[PERSONNEL_GROUPS:92]x_ID:12
		$_l_GroupAccessRow:=Find in array:C230(DOC_Al_GroupsAccess; $_l_GroupID)
		$_l_AccessLevel:=0
		$_l_AccessLevel2:=0
		If ($_l_GroupAccessRow>0)
			$_l_AccessLevel:=DOC_al_GroupAccessLevel{$_l_GroupAccessRow}
		End if 
		$_l_PersonAccessRow:=Find in array:C230(DOC_al_PersonAccess; <>PER_l_CurrentUserID)
		If ($_l_PersonAccessRow>0)
			$_l_AccessLevel2:=DOC_al_PersonAccessLevel{$_l_PersonAccessRow}
		End if 
		If ($_l_AccessLevel2>0)
			If ($_l_AccessLevel2#$_l_AccessLevel)
				$_l_AccessLevel:=$_l_AccessLevel2
			End if 
		End if 
		If ($_l_AccessLevel>1)
			APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
			APPEND TO ARRAY:C911($_al_ReportAccess; $_l_AccessLevel2)
		Else 
			If ($_l_AccessLevel=0)
				APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
				APPEND TO ARRAY:C911($_al_ReportAccess; $_l_AccessLevel2)
			End if 
		End if 
		NEXT RECORD:C51([DOCUMENTS:7])
		
	End for 
	QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_IncludeReports)
	
	
	//If ($_l_Number=0)
	//Open_Pro_Window ("Create a SuperReport";0;2;->[DOCUMENTS];WIN_t_CurrentInputForm)
	//$_t_Reference:=Table name(->[DOCUMENTS])+"_"+WIN_t_CurrentInputForm
	//vAdd:=1
	//ADD RECORD([DOCUMENTS];*)
	//Else
	//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];"Reports_Out")
	//$_t_Reference:=""
	//vAdd:=0
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	//WIn_SetFormSize (1;->[DOCUMENTS];"Reports_Out")
	//MODIFY SELECTION([DOCUMENTS];*)
	DB_PrintSelectSRReport
	//End if
	
	If ($_t_Reference#"")
		Close_ProWin($_t_Reference)
	Else 
		
		Close_ProWin
	End if 
	
	vAdd:=$_l_AddMode
	vNo:=$_l_Number
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	// vFilePtr:=$_Ptr_Table
	//Userset_Empty ($0)
End if 
ERR_MethodTrackerReturn("DB_PrintReport"; $_t_oldMethodName)