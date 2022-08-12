//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sources Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources Mod")
//Sources Mod
Start_Process
If (Sources_File)
	ALL RECORDS:C47([SOURCES:6])
	vNo:=Records in selection:C76([SOURCES:6])
	READ ONLY:C145([PUBLICATIONS:52])
	READ ONLY:C145([PRODUCTS:9])
	READ ONLY:C145([PERSONNEL:11])
	CREATE SET:C116([SOURCES:6]; "Master")
	Open_Pro_Window("Sources"; 0; 1; ->[SOURCES:6]; WIN_t_CurrentOutputform)
	WIn_SetFormSize(1; ->[SOURCES:6]; WIN_t_CurrentOutputform)
	MODIFY SELECTION:C204([SOURCES:6]; *)
	Close_ProWin
End if 

Process_End
ERR_MethodTrackerReturn("Sources Mod"; $_t_oldMethodName)