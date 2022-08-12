//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_CustomLabelShare
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 11:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(WS_BLOB)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("WS_CustomLabelShare")
If (Count parameters:C259>=1)
	//this method will allow a label template to be moved to a blob,
	//from here it can be shared with others
	CONFIRM:C162("Do you wish to make the label template "+$1+"available to other users")
	If (OK=1)
		
		DOCUMENT TO BLOB:C525($1; WS_BLOB)
		CREATE RECORD:C68([DATA_AUDITS:102])
		
		[DATA_AUDITS:102]TABLE_NUMBER:2:=-(404+$2)
		
		
		[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
		[DATA_AUDITS:102]END_DATE:4:=Current date:C33(*)
		[DATA_AUDITS:102]DOCUMENT_NAME:5:=DocNameFromPath($1)
		[DATA_AUDITS:102]DATA:6:=WS_BLOB
		DB_SaveRecord(->[DATA_AUDITS:102])
		AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("WS_CustomLabelShare"; $_t_oldMethodName)