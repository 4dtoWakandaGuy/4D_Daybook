//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40036
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:18
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40036")
If ((DB_GetModuleSettingByNUM(Module_StockControl))>0)
	User_Message(Char:C90(13)+"      Updating Stock Types"+Char:C90(13))
End if 
//actually do it anyway in case the data is there
READ WRITE:C146([STOCK_TYPES:59])
QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Allocated:6=True:C214)
If (Records in selection:C76([STOCK_TYPES:59])>0)
	DB_lockFile(->[STOCK_TYPES:59])
	APPLY TO SELECTION:C70([STOCK_TYPES:59]; [STOCK_TYPES:59]Allocation_Allowed:8:=True:C214)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_TYPES:59]))
End if 
READ ONLY:C145([STOCK_TYPES:59])
UNLOAD RECORD:C212([STOCK_TYPES:59])
ERR_MethodTrackerReturn("User_Vers40036"; $_t_oldMethodName)
