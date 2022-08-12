//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:42
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
	C_BOOLEAN:C305($_bo_WindowOpen; SD_bo_AdditionalRelations)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_ProcessState; DB_l_ButtonClickedFunction; SD_l_ParentProcess; vAdd)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; $_t_WindowTitle; $1; $2; $3; $4; $5; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; EMAIL_t_Attachment; vCompCode; vContCode; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InEmail")
//Diary_InEmail
SD_bo_AdditionalRelations:=False:C215
$_t_WindowTitle:="Enter "+Term_OrdWT("Email")
Start_Process
If (Diary_FileL(3))  // modified NG June 2004
	
	If (True:C214)
		If (In_Allowed($_t_WindowTitle; ->[DIARY:12]))
			
			CREATE SET:C116([DIARY:12]; "DMaster")
			FORM SET INPUT:C55([DIARY:12]; "Diary_InEmail")
			WIN_t_CurrentInputForm:="Diary_InEmail"
			REDUCE SELECTION:C351([DIARY:12]; 0)
			vAdd:=1
			OK:=1
			//Open_Pro_Window ($_t_WindowTitle)`NG May 2004 moved to inside cases
			$_t_FormReference:=""  //Added NG  may 2004
			$_bo_WindowOpen:=False:C215
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				IDLE:C311  // 03/04/03 pb
				DB_t_CurrentFormUsage:="E"
				EMAIL_t_Attachment:=""
				If (Count parameters:C259>=1)
					//$1 the company ID
					//$2 the contactID attachment
					//$3 the attachment PATH
					vCompCode:=$1
					vContCode:=$2
					If (Count parameters:C259>=3)  //NG Modified March 2004
						EMAIL_t_Attachment:=$3
					End if 
					If (Count parameters:C259>=4)  //NG Modified March 2004
						//Call back process was in $1
						SD_l_ParentProcess:=Num:C11($4)
					End if 
					If (Count parameters:C259>=5)
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
					
				End if 
				If (Not:C34($_bo_WindowOpen))
					Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
					$_t_FormReference:=Table name:C256(->[DIARY:12])+WIN_t_CurrentInputForm
					$_bo_WindowOpen:=True:C214
				End if 
				If (False:C215)  // | (Compiled application)
					ADD RECORD:C56([DIARY:12]; *)
				Else 
					
					//NG -jan 2007 working on this
					CREATE RECORD:C68([DIARY:12])
					FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
					READ WRITE:C146([USER:15])
					
					ADD RECORD:C56([USER:15]; *)  //we dont save this!
				End if 
				ADD TO SET:C119([DIARY:12]; "DMaster")
				Gen_InOne
			End while 
			If ($_t_FormReference#"")
				Close_ProWin($_t_FormReference)
			Else 
				Close_ProWin
			End if 
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
	Else 
		Gen_Alert("Email is not enabled.")
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_InEmail"; $_t_oldMethodName)