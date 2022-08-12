//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders View
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
	C_BOOLEAN:C305(<>DB_bo_AutoOut; $_bo_AutoSearch)
	C_LONGINT:C283(<>PER_l_AccessLevel; $LEVEL; vOrd)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $_t_AutosearchCode; $LAY; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders View")
//Orders View
Start_Process
OrdersV_File
$Level:=<>PER_l_AccessLevel
While (vOrd=1)
	If (Count parameters:C259>=2)
		$_bo_AutoSearch:=($2="TRUE")
		$_t_AutosearchCode:=$1
		Orders_Sel($1; $_bo_AutoSearch)
		
	Else 
		Orders_Sel
	End if 
	
	
	
	If ((Records in selection:C76([ORDERS:24])=0) & (vAutoFind) & (<>DB_bo_AutoOut))
		$Lay:="InEAdd"
	Else 
		$Lay:="InV"
	End if 
	Gen_ModMid(Term_OrdWT("View Sales Book"); "OrMaster"; ->[ORDERS:24]; ->vOrd; "Orders"; WIN_t_CurrentOutputform; 0; $Lay)
End while 
<>PER_l_AccessLevel:=$Level
Process_End
ERR_MethodTrackerReturn("Orders View"; $_t_oldMethodName)