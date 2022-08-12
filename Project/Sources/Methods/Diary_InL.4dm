//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DOC_al_FIeldLink;0)
	//ARRAY LONGINT(<>DOC_al_RecordID;0)
	//ARRAY LONGINT(<>DOC_al_TableLink;0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	C_BOOLEAN:C305(SD_bo_AdditionalRelations)
	C_LONGINT:C283($_l_ProcessState; DB_l_ButtonClickedFunction; SD_l_ParentProcess; vAdd)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $2; $3; $4; $5; DB_t_CallOnCloseorSave; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InL")
//Diary_In
SD_bo_AdditionalRelations:=False:C215
If (Count parameters:C259>=1)
	SD_l_ParentProcess:=Num:C11($1)
End if 
If (Count parameters:C259>=2)
	SD_t_CallingCompanyCode:=$2
End if 
If (Count parameters:C259>=3)
	SD_t_CallingContactCode:=$3
End if 
If (Count parameters:C259>=4)
	SD_t_InputFormName:=$4
End if 
If (Count parameters:C259>=5)
	// so we can pass other relations as well as the company /contact code in
	If ($5="OTHERRELS")
		ARRAY LONGINT:C221(DOC_al_TableLink; 0)
		ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
		ARRAY LONGINT:C221(DOC_al_RecordID; 0)
		ARRAY TEXT:C222(DOC_at_RecordCode; 0)
		COPY ARRAY:C226(<>DOC_al_TableLink; DOC_al_TableLink)
		COPY ARRAY:C226(<>DOC_al_FIeldLink; DOC_al_FIeldLink)
		COPY ARRAY:C226(<>DOC_al_RecordID; DOC_al_RecordID)
		COPY ARRAY:C226(<>DOC_at_RecordCode; DOC_at_RecordCode)
		ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)  //So the calling process can release
		ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
		ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
		ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
		SD_bo_AdditionalRelations:=True:C214  // so that in the form method we can read them
	End if 
End if 
$_t_WindowTitle:="Enter Letters"
Start_Process
If (Diary_FileL)  // modified NG June 2004
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([DIARY:12]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	
	
	If (In_Allowed($_t_WindowTitle; ->[DIARY:12]))
		CREATE SET:C116([DIARY:12]; "DMaster")
		REDUCE SELECTION:C351([DIARY:12]; 0)
		vAdd:=1
		OK:=1
		Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; "Diary_inL"+Documents_4DWriteAccessType(False:C215))  //NG May 2004 added form
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			FORM SET INPUT:C55([DIARY:12]; "Diary_inL"+Documents_4DWriteAccessType(False:C215))  //NG April 2004 removed reference to ◊screen
			ADD RECORD:C56([DIARY:12]; *)
			ADD TO SET:C119([DIARY:12]; "DMaster")
			Gen_InOne
		End while 
		Close_ProWin(Table name:C256(->[DIARY:12])+"_"+"Diary_inL"+Documents_4DWriteAccessType(False:C215))
		If (Count parameters:C259>=1)
			If (SD_l_ParentProcess>0)
				$_l_ProcessState:=Process state:C330(SD_l_ParentProcess)
				If ($_l_ProcessState>=0)
					BRING TO FRONT:C326(SD_l_ParentProcess)
					
					SET PROCESS VARIABLE:C370(SD_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Refresh"))
					
					POST OUTSIDE CALL:C329(SD_l_ParentProcess)
					
				End if 
				//call back to update 'parent process'(
				//if it is still running
			End if 
			
		End if 
		
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_InL"; $_t_oldMethodName)