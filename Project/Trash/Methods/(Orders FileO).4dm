//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_FileO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(WIN_CURRENTMENU)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_FileO")
If ((DB_GetModuleSettingByNUM(1))=5)
	FORM SET OUTPUT:C54([ORDERS:24]; "Orders OutS")
	WIN_CURRENTMENU:=25
	
	WIN_t_CurrentOutputform:="Orders OutS"
Else 
	FORM SET OUTPUT:C54([ORDERS:24]; "Orders Out"+SYS_t_AccessType)
	WIN_t_CurrentOutputform:="Orders Out"+SYS_t_AccessType
	Case of 
		: (WIN_t_CurrentOutputform="Orders OutQ")
			WIN_CURRENTMENU:=25
		: (WIN_t_CurrentOutputform="Orders Out")
			
			WIN_CURRENTMENU:=25
		Else 
			
	End case 
	
End if 
ERR_MethodTrackerReturn("Orders_FileO"; $_t_oldMethodName)