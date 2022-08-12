//%attributes = {}
If (False:C215)
	//Project Method Name:      DBQR_SetWindowSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2011 03:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ItemID; $_l_offset; DBQR_l_HorizontalSplitterPos; DBQR_l_ReportCodesColumnWidth; DBQR_l_ReportNamesColumnWidth; DBQr_l_VerticalSplitterPos)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBQR_SetWindowSettings")

$_l_ItemID:=PREF_GetPreferenceID("Report window Preferences")
If ($_l_ItemID>0)
	
	// Modified by: Nigel_Greenlee (04/12/2011)
	
	
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
	End if 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	$_l_offset:=0
	VARIABLE TO BLOB:C532(DBQr_l_VerticalSplitterPos; [PREFERENCES:116]DataBlob:2)  // log to diary
	VARIABLE TO BLOB:C532(DBQR_l_HorizontalSplitterPos; [PREFERENCES:116]DataBlob:2; *)  //log to email
	VARIABLE TO BLOB:C532(DBQR_l_ReportCodesColumnWidth; [PREFERENCES:116]DataBlob:2; *)  //log to email
	VARIABLE TO BLOB:C532(DBQR_l_ReportNamesColumnWidth; [PREFERENCES:116]DataBlob:2; *)  //log to email
	DB_SaveRecord(->[PREFERENCES:116])
	
End if 
ERR_MethodTrackerReturn("DBQR_SetWindowSettings"; $_t_oldMethodName)