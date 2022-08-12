//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_GetSources
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SourceNames; 0)
	ARRAY TEXT:C222($_at_Sources; 0)
	//ARRAY TEXT(DB_at_SourceCodes;0)
	//ARRAY TEXT(DB_at_SourceNames;0)
	C_BOOLEAN:C305(DB_bo_SourcesReady)
	C_LONGINT:C283($_l_BlankSourcePosition; $_l_CallBackProcess; $_l_TableNumber; $2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_OldMethodName)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_GetSources")

If (Count parameters:C259>=2)
	$_l_TableNumber:=$2
	$_l_CallBackProcess:=$1
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			ALL RECORDS:C47([COMPANIES:2])
			DISTINCT VALUES:C339([COMPANIES:2]Source:14; $_at_Sources)
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			ALL RECORDS:C47([CONTACTS:1])
			DISTINCT VALUES:C339([CONTACTS:1]Source:16; $_at_Sources)
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			ALL RECORDS:C47([ORDERS:24])
			DISTINCT VALUES:C339([ORDERS:24]Source:18; $_at_Sources)
			
	End case 
	If (Size of array:C274($_at_Sources)>0)
		QUERY WITH ARRAY:C644([SOURCES:6]Source_Code:1; $_at_Sources)
		SELECTION TO ARRAY:C260([SOURCES:6]Source_Name:2; $_at_SourceNames; [SOURCES:6]Source_Code:1; $_at_Sources)
	End if 
	$_l_BlankSourcePosition:=Find in array:C230($_at_Sources; "")
	If ($_l_BlankSourcePosition>0)
		DELETE FROM ARRAY:C228($_at_Sources; $_l_BlankSourcePosition)
		DELETE FROM ARRAY:C228($_at_SourceNames; $_l_BlankSourcePosition)
	End if 
	
	VARIABLE TO VARIABLE:C635($_l_CallBackProcess; DB_at_SourceNames; $_at_SourceNames; DB_at_SourceCodes; $_at_Sources)
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_bo_SourcesReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetSources"; $_t_OldMethodName)