//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers37004
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyNames; 0)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection)
	C_TEXT:C284($_t_DocumentCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers37004")

If (Not:C34(Semaphore:C143("$Update")))
	READ WRITE:C146([DIARY:12])
	QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15#"")
	ORDER BY:C49([DIARY:12]; [DIARY:12]Document_Code:15; >)
	FIRST RECORD:C50([DIARY:12])
	While (Not:C34(End selection:C36([DIARY:12])))
		$_t_DocumentCode:=[DIARY:12]Document_Code:15
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		While ((Not:C34(End selection:C36([DIARY:12]))) & ($_t_DocumentCode=[DIARY:12]Document_Code:15))
			If ([DOCUMENTS:7]Heading:2#"")
				[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			End if 
			NEXT RECORD:C51([DIARY:12])
		End while 
	End while 
	UNLOAD RECORD:C212([DIARY:12])
	
	READ WRITE:C146([COMPANIES:2])
	ALL RECORDS:C47([COMPANIES:2])
	CREATE SET:C116([COMPANIES:2]; "Master")
	REDUCE SELECTION:C351([COMPANIES:2]; 1000)
	While (Records in selection:C76([COMPANIES:2])>0)
		$_l_RecordsinSelection:=Records in selection:C76([COMPANIES:2])
		ARRAY TEXT:C222($_at_CompanyNames; $_l_RecordsinSelection)
		SELECTION TO ARRAY:C260([COMPANIES:2]Company_Name:2; $_at_CompanyNames)
		For ($_l_Index; 1; $_l_RecordsinSelection)
			$_at_CompanyNames{$_l_Index}:=Companies_Abbr($_at_CompanyNames{$_l_Index})
		End for 
		ARRAY TO SELECTION:C261($_at_CompanyNames; [COMPANIES:2]Company_Abbreviated_Name:52)
		
		CREATE SET:C116([COMPANIES:2]; "Extra")
		DIFFERENCE:C122("Master"; "Extra"; "Master")
		USE SET:C118("Master")
		REDUCE SELECTION:C351([COMPANIES:2]; 1000)
	End while 
	UNLOAD RECORD:C212([COMPANIES:2])
End if 

CLEAR SEMAPHORE:C144("$Update")
FLUSH CACHE:C297
ERR_MethodTrackerReturn("User Vers37004"; $_t_oldMethodName)
