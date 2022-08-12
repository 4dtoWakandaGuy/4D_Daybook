//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_Edit
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_Edit ({record ID})
	
	// Displays the currently loaded [Cal4D_iCal] record using MODIFY RECORD. If a
	//   record number is passed, that record will be loaded first.  If the record
	//   number is -3 (4D's New record constant value) then a new record will be
	//   created using the ADD RECORD command.
	
	// Access Type: Privaate
	
	// Parameters:
	//   $1 : Longint : A [Cal4D_iCal] record ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 1, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_Edit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordID; $_l_windowReference; $1)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_FormName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_Edit")


Cal4D_Init

If (Count parameters:C259>0)
	$_l_RecordID:=$1
Else 
	$_l_RecordID:=0
End if 

If ($_l_RecordID=New record:K29:1)
	$_t_FormName:="Cal4D_iCal_Subscribe"
Else 
	$_t_FormName:="Cal4D_iCal_Edit"
End if 

$_l_windowReference:=Open form window:C675($_t_FormName; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)

READ WRITE:C146(<>Cal_ptr_GroupTable->)

If ($_l_RecordID=New record:K29:1)
	CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
	DIALOG:C40($_t_FormName)
Else 
	If (Count parameters:C259>0)
		QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$_l_RecordID)
	End if 
	If (Records in selection:C76(<>Cal_ptr_GroupTable->)>=1)
		DIALOG:C40($_t_FormName)
	Else 
		BEEP:C151  // Something went wrong. We couldn't find the record.
		OK:=0
	End if 
End if 

CLOSE WINDOW:C154

If (OK=1)
	SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
End if 
UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_iCal_Edit"; $_t_oldMethodName)