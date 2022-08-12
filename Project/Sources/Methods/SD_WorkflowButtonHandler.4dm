//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_WorkflowButtonHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/02/2011 19:38 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_TabIds;0)
	//ARRAY TEXT(SD2_at_DiaryTabs;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ButtonPressed; $_l_TabIDRow; $_l_TabRef; $1; iCancel; iOK; IP_l_MessageReply)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_WorkflowButtonHandler")
If (Count parameters:C259>=1)
	$_l_ButtonPressed:=$1
	Case of 
		: ($_l_ButtonPressed=DB_GetButtonFunction("Plus")) | ($_l_ButtonPressed=DB_GetButtonFunction("Minus")) | ($_l_ButtonPressed=DB_GetButtonFunction("Open"))
			$_l_TabRef:=Find in array:C230(SD2_at_TabNames; SD2_at_DiaryTabs{SD2_at_DiaryTabs})
			$_l_TabIDRow:=Find in array:C230(SD2_al_DiaryUserIDs; <>PER_l_CurrentUserID)
			If ($_l_TabRef>0)
				inButtSubHandle(SD2_al_TabIds{$_l_TabIDRow}; ->[DIARY:12])
			Else 
				inButtSubHandle(0; ->[DIARY:12])
			End if 
		: ((($_l_ButtonPressed#0)) | (iOK=1) | (iCancel=1))
			Case of 
				: ($_l_ButtonPressed=DB_GetButtonFunction("OK"))
					CANCEL:C270
			End case 
			
			
		: ($_l_ButtonPressed=400)
			IP_l_MessageReply:=Table:C252(->[DIARY:12])
		: ($_l_ButtonPressed=DB_GetButtonFunction("Get Company Name"))
			//IP_t_MessageReplySTR:=[COMPANIES]Company Name
		: ($_l_ButtonPressed=DB_GetButtonFunction("Get Address"))
			//IP_t_MessageReplyTXT:=[COMPANIES]ADDRESS
			
	End case 
End if 
ERR_MethodTrackerReturn("SD_WorkflowButtonHandler"; $_t_oldMethodName)
