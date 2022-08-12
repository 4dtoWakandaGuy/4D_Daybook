//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_PictObjectMethod
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_PictObjectMethod (->form bject)
	
	// Called from the Picture event objects on the Cal4D_Cal_Objects form.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : A pointer to the picture form object
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 5, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_PictObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PictObjectMethod")



Cal4D_TextObjectMethod($1)
ERR_MethodTrackerReturn("Cal4D_PictObjectMethod"; $_t_oldMethodName)