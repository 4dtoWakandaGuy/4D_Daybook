//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_GetInfo
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_GetInfo (group ID) --> Text
	
	// Returns a string describing the contents of the group.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The group ID
	
	// Returns:
	//   $0 : Text : The description
	
	// Created by Dave Batton on Jul 20, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:26`Method: Cal4D_Group_GetInfo
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_FIrstDate; $_d_LastDate)
	C_LONGINT:C283($_l_GroupID; $1)
	C_POINTER:C301(<>CAL_ptr_EventEndDateFld; <>Cal_ptr_EventGroupIDField; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventTable; <>Cal_ptr_GroupFld_ID)
	C_TEXT:C284($_t_Info; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_GetInfo")


$_l_GroupID:=$1

READ ONLY:C145(<>Cal_ptr_EventTable->)
QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventGroupIDField->=<>Cal_ptr_GroupFld_ID->)

If (Records in selection:C76(<>Cal_ptr_EventTable->)>0)
	ORDER BY:C49(<>Cal_ptr_EventTable->; <>CAL_ptr_EventStartDateFld->; >)
	$_d_FIrstDate:=<>CAL_ptr_EventStartDateFld->
	ORDER BY:C49(<>Cal_ptr_EventTable->; <>CAL_ptr_EventEndDateFld->; <)
	$_d_LastDate:=<>CAL_ptr_EventEndDateFld->
	$_t_Info:="This calendar includes "+String:C10(Records in selection:C76(<>Cal_ptr_EventTable->))+" events dating from "+String:C10($_d_FIrstDate; System date long:K1:3)+" through "+String:C10($_d_LastDate; System date long:K1:3)+"."
	
Else 
	$_t_Info:="There are no events associated with this calendar."
End if 

$0:=$_t_Info
ERR_MethodTrackerReturn("Cal4D_Group_GetInfo"; $_t_oldMethodName)