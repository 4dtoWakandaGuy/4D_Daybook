//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_GetOrderTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(DB_at_TypesNames;0)
	C_BOOLEAN:C305(DB_bo_TypesReady)
	C_LONGINT:C283($_l_CallingProcess; $_l_CodePosition; $_l_TableNumber; $1; $2)
	C_TEXT:C284($_l_Usage; $_t_Code; $_t_OldMethodName; $3)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_GetOrderTypes")

If (Count parameters:C259>=3)
	$_l_CallingProcess:=$1
	$_l_TableNumber:=$2
	$_l_Usage:=$3
	
	$_t_Code:=(("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber))+"@"
	QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
	QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_l_Usage)
	If (Records in selection:C76([CODE_USES:91])=0)
		$_t_Code:="@"
	End if 
	ALL RECORDS:C47([JOB_TYPES:65])
	If (Records in selection:C76([JOB_TYPES:65])>0)
		Project_SelCU(->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; "1")
	End if 
	If (Records in selection:C76([CODE_USES:91])=0)
		REDUCE SELECTION:C351([JOB_TYPES:65]; 0)
	Else 
		Join_SelCU(->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1)
	End if 
	SELECTION TO ARRAY:C260([JOB_TYPES:65]Type_Code:1; $_at_Codes; [JOB_TYPES:65]Type_Name:2; $_at_Names)
	SORT ARRAY:C229($_at_Codes; $_at_Names)
	Repeat 
		$_l_CodePosition:=Find in array:C230($_at_Codes; "")
		
		If ($_l_CodePosition>0)
			DELETE FROM ARRAY:C228($_at_Codes; $_l_CodePosition)
			DELETE FROM ARRAY:C228($_at_Names; $_l_CodePosition)
		End if 
	Until ($_l_CodePosition<0)
	VARIABLE TO VARIABLE:C635($_l_CallingProcess; DB_at_TypesNames; $_at_Names; DB_at_TypesCodes; $_at_Codes)
	SET PROCESS VARIABLE:C370($_l_CallingProcess; DB_bo_TypesReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetOrderTypes"; $_t_OldMethodName)