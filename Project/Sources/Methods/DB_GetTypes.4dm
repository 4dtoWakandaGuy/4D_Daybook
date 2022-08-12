//%attributes = {}
If (False:C215)
	//Project Method Name: DB_GetTypes
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created:     07/01/2011 15:48 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_UsedTypes; 0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(DB_at_TypesNames;0)
	C_BOOLEAN:C305($_bo_GetUsedValues; $4; DB_bo_TypesReady)
	C_LONGINT:C283($_l_BlankCodePosition; $_l_CallingProcess; $_l_TableNumber; $1; $2)
	C_TEXT:C284($_t_Code; $_t_OldMethodName; $_t_UsageCode; $3)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_GetTypes")
If (Count parameters:C259>=3)
	//ALERT("TYPES1")
	$_l_CallingProcess:=$1
	
	$_l_TableNumber:=$2
	$_t_UsageCode:=$3
	If (Count parameters:C259>=4)
		$_bo_GetUsedValues:=$4
	Else 
		$_bo_GetUsedValues:=False:C215
	End if 
	$_t_Code:=String:C10(Table:C252(->[TYPES:5]))
	$_t_Code:=("0"*(3-Length:C16($_t_Code)))+$_t_Code
	$_t_Code:=$_t_Code+"@"
	QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
	QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_t_UsageCode)
	
	If (Records in selection:C76([CODE_USES:91])=0)
		$_t_Code:="@"
	End if 
	ALL RECORDS:C47([TYPES:5])
	If (Records in selection:C76([TYPES:5])>0)
		Project_SelCU(->[TYPES:5]; ->[TYPES:5]Type_Code:1; String:C10($_t_UsageCode))
	End if 
	
	If (Records in selection:C76([CODE_USES:91])=0)
		REDUCE SELECTION:C351([TYPES:5]; 0)
	Else 
		Join_SelCU(->[TYPES:5]; ->[TYPES:5]Type_Code:1)
	End if 
	//ALERT("TYPES4")
	If ($_bo_GetUsedValues)
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				READ ONLY:C145([COMPANIES:2])
				ALL RECORDS:C47([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				DISTINCT VALUES:C339([COMPANIES:2]Company_Type:13; $_at_UsedTypes)
				QUERY SELECTION WITH ARRAY:C1050([TYPES:5]Type_Code:1; $_at_UsedTypes)
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				
				READ ONLY:C145([CONTACTS:1])
				ALL RECORDS:C47([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
				DISTINCT VALUES:C339([COMPANIES:2]Company_Type:13; $_at_UsedTypes)
				QUERY SELECTION WITH ARRAY:C1050([TYPES:5]Type_Code:1; $_at_UsedTypes)
		End case 
	End if 
	SELECTION TO ARRAY:C260([TYPES:5]Type_Code:1; $_at_Codes; [TYPES:5]Type_Name:2; $_at_Names)
	Repeat 
		$_l_BlankCodePosition:=Find in array:C230($_at_Codes; "")
		If ($_l_BlankCodePosition>0)
			DELETE FROM ARRAY:C228($_at_Codes; $_l_BlankCodePosition)
			DELETE FROM ARRAY:C228($_at_Names; $_l_BlankCodePosition)
		End if 
	Until ($_l_BlankCodePosition<0)
	VARIABLE TO VARIABLE:C635($_l_CallingProcess; DB_at_TypesNames; $_at_Names; DB_at_TypesCodes; $_at_Codes)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; DB_bo_TypesReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetTypes"; $_t_OldMethodName)