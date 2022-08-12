//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetAreas
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    07/01/2011 13:57 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AreaCodes; 0)
	ARRAY TEXT:C222($_at_AreaNames; 0)
	//ARRAY TEXT(DB_at_AreaCodes;0)
	//ARRAY TEXT(DB_at_AreaNames;0)
	C_BOOLEAN:C305($_bo_Used; $2; DB_bo_AreasReady)
	C_LONGINT:C283($_l_BlankAreaRow; $_l_TableNumber; $1; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetAreas")
If (Count parameters:C259>=1)
	READ ONLY:C145([AREAS:3])
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
				
				DISTINCT VALUES:C339([COMPANIES:2]Area:11; $_at_AreaCodes)
				QUERY WITH ARRAY:C644([AREAS:3]Area_Code:1; $_at_AreaCodes)
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				
				READ ONLY:C145([ORDERS:24])
				ALL RECORDS:C47([ORDERS:24])
				
				DISTINCT VALUES:C339([ORDERS:24]Area_Code:35; $_at_AreaCodes)
				QUERY WITH ARRAY:C644([AREAS:3]Area_Code:1; $_at_AreaCodes)
		End case 
		
	Else 
		ALL RECORDS:C47([AREAS:3])
	End if 
	
	SELECTION TO ARRAY:C260([AREAS:3]Area_Code:1; $_at_AreaCodes; [AREAS:3]Area_Name:2; $_at_AreaNames)
	$_l_BlankAreaRow:=Find in array:C230($_at_AreaCodes; "")
	If ($_l_BlankAreaRow>0)
		DELETE FROM ARRAY:C228($_at_AreaCodes; $_l_BlankAreaRow)
		DELETE FROM ARRAY:C228($_at_AreaNames; $_l_BlankAreaRow)
	End if 
	
	VARIABLE TO VARIABLE:C635($1; DB_at_AreaNames; $_at_AreaNames; DB_at_AreaCodes; $_at_AreaCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_AreasReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetAreas"; $_t_oldMethodName)