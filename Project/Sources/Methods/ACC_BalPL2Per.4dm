//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalPL2Per
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalPL2Per")
READ WRITE:C146([PERIODS:33])
LOAD RECORD:C52([PERIODS:33])
If (Locked:C147([PERIODS:33]))
	Gen_Alert("NB: The Period record's 'Fully Posted' field cannot be updated"+" because the record is locked.  You will need to run this report "+"again to update it."; "")
Else 
	[PERIODS:33]Profit_Posted:9:=True:C214
	DB_SaveRecord(->[PERIODS:33])
	AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
End if 
UNLOAD RECORD:C212([PERIODS:33])
READ ONLY:C145([PERIODS:33])
ERR_MethodTrackerReturn("ACC_BalPL2Per"; $_t_oldMethodName)
