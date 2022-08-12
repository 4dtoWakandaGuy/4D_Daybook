//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/01/2011 16:12 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyStatus; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	ARRAY TEXT:C222($_at_StatusNames; 0)
	//ARRAY TEXT(DB_at_StatusCodes;0)
	//ARRAY TEXT(DB_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_Used; $2; DB_bo_StatusReady)
	C_LONGINT:C283($_l_BlankRow; $_l_TableNumber; $1; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetStatus")
If (Count parameters:C259>=1)
	READ ONLY:C145([STATUS:4])
	If (Count parameters:C259>=2)
		$_bo_Used:=$2
	Else 
		$_bo_Used:=False:C215
	End if 
	If ($_bo_Used)
		If (Count parameters:C259>=3)
			$_l_TableNumber:=$3
		Else 
			$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		End if 
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				
				READ ONLY:C145([COMPANIES:2])
				ALL RECORDS:C47([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				
				DISTINCT VALUES:C339([COMPANIES:2]Status:12; $_at_CompanyStatus)
				QUERY WITH ARRAY:C644([STATUS:4]Status_Code:1; $_at_CompanyStatus)
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				
				READ ONLY:C145([CONTACTS:1])
				ALL RECORDS:C47([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
				
				DISTINCT VALUES:C339([CONTACTS:1]Status:14; $_at_CompanyStatus)
				QUERY WITH ARRAY:C644([STATUS:4]Status_Code:1; $_at_CompanyStatus)
			Else 
				ALL RECORDS:C47([STATUS:4])
		End case 
	Else 
		ALL RECORDS:C47([STATUS:4])
	End if 
	
	SELECTION TO ARRAY:C260([STATUS:4]Status_Code:1; $_at_StatusCodes; [STATUS:4]Status_Name:2; $_at_StatusNames)
	$_l_BlankRow:=Find in array:C230($_at_StatusCodes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_StatusCodes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_StatusNames; $_l_BlankRow)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_StatusNames; $_at_StatusNames; DB_at_StatusCodes; $_at_StatusCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_StatusReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetStatus"; $_t_oldMethodName)