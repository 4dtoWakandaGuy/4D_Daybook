//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      States Create
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
	C_LONGINT:C283($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States Create")

QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$4)
If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
	CREATE RECORD:C68([TABLE_RECORD_STATES:90])
	[TABLE_RECORD_STATES:90]State_Code:1:=$1
	[TABLE_RECORD_STATES:90]Listing_Name:2:=$2
	[TABLE_RECORD_STATES:90]Table_number:3:=$3
	[TABLE_RECORD_STATES:90]State_Reference:4:=$4
	[TABLE_RECORD_STATES:90]Entry_Name:5:=$5
	[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=$6
	DB_SaveRecord(->[TABLE_RECORD_STATES:90])
Else 
	UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
End if 
ERR_MethodTrackerReturn("States Create"; $_t_oldMethodName)