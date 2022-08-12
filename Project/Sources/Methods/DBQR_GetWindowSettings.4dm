//%attributes = {}
If (False:C215)
	//Project Method Name:      DBQR_GetWindowSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2011 15:59
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

$_t_oldMethodName:=ERR_MethodTracker("DBQR_GetWindowSettings")

//this method will get the last positions the vertical and horizontal splitters of the reports and fields for the current user
//it will also get the last column widths of the reports list box(code/name)
$_l_ItemID:=PREF_GetPreferenceID("Report window Preferences")

If ($_l_ItemID>0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		DBQr_l_VerticalSplitterPos:=267
		DBQR_l_HorizontalSplitterPos:=196
		DBQR_l_ReportCodesColumnWidth:=40
		DBQR_l_ReportNamesColumnWidth:=100
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(DBQr_l_VerticalSplitterPos; [PREFERENCES:116]DataBlob:2)  // log to diary
		VARIABLE TO BLOB:C532(DBQR_l_HorizontalSplitterPos; [PREFERENCES:116]DataBlob:2; *)  //log to email
		VARIABLE TO BLOB:C532(DBQR_l_ReportCodesColumnWidth; [PREFERENCES:116]DataBlob:2; *)  //log to email
		VARIABLE TO BLOB:C532(DBQR_l_ReportNamesColumnWidth; [PREFERENCES:116]DataBlob:2; *)  //log to email
		DB_SaveRecord(->[PREFERENCES:116])
	Else 
		DBQr_l_VerticalSplitterPos:=267
		DBQR_l_HorizontalSplitterPos:=196
		DBQR_l_ReportCodesColumnWidth:=40
		DBQR_l_ReportNamesColumnWidth:=100
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DBQr_l_VerticalSplitterPos; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DBQR_l_HorizontalSplitterPos; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DBQR_l_ReportCodesColumnWidth; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DBQR_l_ReportNamesColumnWidth; $_l_offset)
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DBQR_GetWindowSettings"; $_t_oldMethodName)