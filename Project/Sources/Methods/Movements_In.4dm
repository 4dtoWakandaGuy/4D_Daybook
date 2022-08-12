//%attributes = {}
If (False:C215)
	//Project Method Name:      Movements_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 06:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283($_l_AddMode; Vadd)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements_In")
//Movements_In
Start_Process
Movements_File
If (In_Allowed("Enter Movements"; ->[STOCK_MOVEMENTS:40]))
	CREATE SET:C116([STOCK_MOVEMENTS:40]; "OMaster")
	REDUCE SELECTION:C351([STOCK_MOVEMENTS:40]; 0)
	OK:=1
	Open_Pro_Window("Enter Movements"; 0; 2; ->[STOCK_MOVEMENTS:40]; WIN_t_CurrentInputForm)
	
	While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
		$_l_AddMode:=Vadd
		vAdd:=1
		vFromIn:=False:C215
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		ADD RECORD:C56([STOCK_MOVEMENTS:40]; *)
		
		
		ADD TO SET:C119([STOCK_MOVEMENTS:40]; "OMaster")
		Transact_End
		
		Gen_InOne
		Vadd:=$_l_AddMode
	End while 
	Close_ProWin
	USE SET:C118("OMaster")
	vAdd:=0
End if 
Process_End
ERR_MethodTrackerReturn("Movements_In"; $_t_oldMethodName)