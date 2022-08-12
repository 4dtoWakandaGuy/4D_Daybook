//%attributes = {}
If (False:C215)
	//Project Method Name:      ST_SaveCodeUses
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
	//ARRAY LONGINT(ST_al_CodeID;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_StatesCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ST_SaveCodeUses")
$_t_StatesCode:=String:C10(Table:C252(->[TABLE_RECORD_STATES:90]))
$_t_StatesCode:=("0"*(3-Length:C16($_t_StatesCode)))+$_t_StatesCode+$1
//$_t_StatesCode:=$1
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatesCode)
CREATE SET:C116([CODE_USES:91]; "CurrentCodes")
CREATE EMPTY SET:C140([CODE_USES:91]; "UpdateCodes")
For ($_l_Index; 1; Size of array:C274(ST_al_CodeUsed))
	If (ST_al_CodeUsed{$_l_Index}=1)
		READ WRITE:C146([CODE_USES:91])
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatesCode; *)
		QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=ST_al_CodeID{$_l_Index})
		If (Records in selection:C76([CODE_USES:91])=0)
			CREATE RECORD:C68([CODE_USES:91])
		End if 
		[CODE_USES:91]Code:1:=$_t_StatesCode
		[CODE_USES:91]Use:2:=ST_al_CodeID{$_l_Index}
		DB_SaveRecord(->[CODE_USES:91])
		ADD TO SET:C119([CODE_USES:91]; "UpdateCodes")
	End if 
End for 
DIFFERENCE:C122("CurrentCodes"; "UpdateCodes"; "CurrentCodes")
CLEAR SET:C117("UpdateCodes")
USE SET:C118("CurrentCodes")
CLEAR SET:C117("CurrentCodes")
//the selection we have are any we wish to delete
If (Records in selection:C76([CODE_USES:91])>0)
	DELETE SELECTION:C66([CODE_USES:91])
End if 
UNLOAD RECORD:C212([CODE_USES:91])
READ ONLY:C145([CODE_USES:91])
ERR_MethodTrackerReturn("ST_SaveCodeUses"; $_t_oldMethodName)
