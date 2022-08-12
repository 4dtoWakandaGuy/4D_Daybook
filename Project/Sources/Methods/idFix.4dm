//%attributes = {}
If (False:C215)
	//Project Method Name:      idFix
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 06:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CompaniesIndex; $_l_CompanyID; $_l_Index; $_l_RecordCount)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("idFix")
QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=2)
FIRST RECORD:C50([INFORMATION:55])
For ($_l_Index; 1; Records in selection:C76([INFORMATION:55]))
	$_t_RecordCode:=[INFORMATION:55]Company_Code:7
	$_l_CompanyID:=[INFORMATION:55]RelateTableRecordNumber:13
	READ WRITE:C146([COMPANIES:2])
	
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$_l_CompanyID; *)
	QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Code:1#$_t_RecordCode)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[COMPANIES:2])
		APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]x_ID:63:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
		
	Else 
		FIRST RECORD:C50([COMPANIES:2])
		For ($_l_CompaniesIndex; 1; Records in selection:C76([COMPANIES:2]))
			[COMPANIES:2]x_ID:63:=0
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			NEXT RECORD:C51([COMPANIES:2])
		End for 
	End if 
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$_l_CompanyID)
	[COMPANIES:2]x_ID:63:=$_l_CompanyID
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
	NEXT RECORD:C51([INFORMATION:55])
End for 
ALL RECORDS:C47([COMPANIES:2])
CREATE SET:C116([COMPANIES:2]; "ALL")
$_l_RecordCount:=Records in table:C83([COMPANIES:2])
For ($_l_Index; 1; $_l_RecordCount)
	USE SET:C118("ALL")
	GOTO SELECTED RECORD:C245([COMPANIES:2]; $_l_Index)
	$_l_CompanyID:=[COMPANIES:2]x_ID:63
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$_l_CompanyID)
	If (Records in selection:C76([COMPANIES:2])>1)
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[COMPANIES:2])
			APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]x_ID:63:=0)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
		Else 
			FIRST RECORD:C50([COMPANIES:2])
			For ($_l_CompaniesIndex; 1; Records in selection:C76([COMPANIES:2]))
				[COMPANIES:2]x_ID:63:=0
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				NEXT RECORD:C51([COMPANIES:2])
			End for 
		End if 
	End if 
	
End for 
ERR_MethodTrackerReturn("idFix"; $_t_oldMethodName)