//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_GetLayoutName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/09/2012 06:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_LayoutIDS; 0)
	ARRAY TEXT:C222($_at_LayoutNames; 0)
	C_LONGINT:C283($_l_LayoutNamesID; $_l_LayoutRow; $_l_offset)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_GetLayoutName")
If (Count parameters:C259>=1)
	While (Semaphore:C143("SaveLayoutName"))
		
		DelayTicks(2)
	End while 
	$_l_LayoutNamesID:=PREF_GetPreferenceID("Definitions Names"; True:C214; -1)
	ARRAY TEXT:C222($_at_LayoutNames; 0)
	ARRAY TEXT:C222($_at_LayoutIDS; 0)
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_LayoutNamesID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_LayoutNamesID
		[PREFERENCES:116]Preference_DataID:7:=-1
		AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
		
		SAVE RECORD:C53([PREFERENCES:116])
		LBI_initLayoutNames
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_LayoutNamesID)
	End if 
	$_l_offset:=0
	If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_LayoutIDS; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_LayoutNames; $_l_offset)
		End if 
	End if 
	$_l_LayoutRow:=Find in array:C230($_at_LayoutIDS; $1)
	If ($_l_LayoutRow>0)
		$0:=$_at_LayoutNames{$_l_LayoutRow}
	Else 
		$0:=""
	End if 
	CLEAR SEMAPHORE:C144("SaveLayoutName")
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("LBI_GetLayoutName"; $_t_oldMethodName)