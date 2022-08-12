//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDiaryStati
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	ARRAY TEXT:C222($_at_StatusSubcode; 0)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_StatusCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryStati")

$_t_StatusCode:=String:C10(Table:C252(->[STATUS:4]))
$_t_StatusCode:=("0"*(3-Length:C16($_t_StatusCode)))+$_t_StatusCode
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatusCode+"@")
QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=5)
SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_StatusCodes)
ARRAY TEXT:C222($_at_StatusSubcode; Size of array:C274($_at_StatusCodes))
For ($_l_Index; 1; Size of array:C274($_at_StatusCodes))
	$_at_StatusSubcode{$_l_Index}:=Replace string:C233($_at_StatusCodes{$_l_Index}; $_t_StatusCode; "")
End for 
If (Count parameters:C259>=3)
	ARRAY TEXT:C222($1->; 0)
	ARRAY TEXT:C222($2->; 0)
	QUERY WITH ARRAY:C644([STATUS:4]Status_Code:1; $_at_StatusSubcode)
	SELECTION TO ARRAY:C260([STATUS:4]Status_Code:1; $1->; [STATUS:4]Status_Name:2; $2->)
	SORT ARRAY:C229($2->; $1->)
	$3->:="ALL"
End if 
ERR_MethodTrackerReturn("SD2_LoadDiaryStati"; $_t_oldMethodName)