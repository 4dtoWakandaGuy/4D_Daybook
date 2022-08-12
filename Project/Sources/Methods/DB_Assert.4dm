//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Assert
	//------------------ Method Notes ------------------
	////
	////  Assert ( $_bo_Condition;$_t_Caller;$_t_AlertMsg )
	////
	////  Written by Charles Vass - 04/03/2009, 06:41
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:11`Method: DB_Assert
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Condition; $0; $1)
	C_TEXT:C284($_t_AlertMsg; $_t_Caller; $_t_oldMethodName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Assert")


If (Count parameters:C259#3)
	Gen_Alert("ALERT"+Current method name:C684+Char:C90(13)+"Assert called with incorrect # of parameters (3).")
	$_bo_Condition:=False:C215
	
Else 
	$_bo_Condition:=$1
	If (Not:C34($_bo_Condition))
		$_t_Caller:=$2
		$_t_AlertMsg:=$3
		Gen_Alert("ALERT"+Char:C90(13)+$_t_Caller+Char:C90(13)+$_t_AlertMsg)
	End if 
	
End if 

//================================================================================

$0:=$_bo_Condition
ERR_MethodTrackerReturn("DB_Assert"; $_t_oldMethodName)