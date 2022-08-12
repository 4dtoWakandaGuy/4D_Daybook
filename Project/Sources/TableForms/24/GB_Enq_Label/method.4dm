If (False:C215)
	//Table Form Method Name: [ORDERS]GB_Enq_Label
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].GB_Enq_Label"; Form event code:C388)
ERR_MethodTrackerReturn("FM [ORDERS].GB_Enq_Label"; $_t_oldMethodName)