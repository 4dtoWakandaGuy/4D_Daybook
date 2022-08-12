//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Calendar_Mini
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:50`Method: Cal4D_Cal_Calendar_Mini
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_FormEvent)
	C_POINTER:C301($_ptr_Self)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Calendar_Mini")

Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Activate:K2:9)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Header:K2:17)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Unload:K2:2)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Outside Call:K2:11)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Validate:K2:3)
		//insert_code_here
		//
	: ($_l_FormEvent=On Resize:K2:27)
		// The following code sets the lines at the top of the Master Input form to the
		// width of the window.
		//
		//--------------------------------------------------------------------------------
End case 
ERR_MethodTrackerReturn("Cal4D_Cal_Calendar_Mini"; $_t_oldMethodName)