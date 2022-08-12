If (False:C215)
	//object Method Name: Object Name:      [USER].General_ChoiceFORM.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; Gen_ChoicePage; GEN_OK)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].General_ChoiceFORM.Variable1"; Form event code:C388)

Case of 
	: (Gen_ChoicePage=1)
		GEN_OK:=1
		CANCEL:C270
	: (Gen_ChoicePage=2)
		For ($_l_Index; 1; 10)
			$_ptr_Variable:=Get pointer:C304("Gen_CB"+String:C10($_l_Index))
			If ($_ptr_Variable->=1)
				//AT LEAST ONE CHOICE HAS BEEN MADE SO OK
				
				GEN_OK:=1
				$_l_Index:=10
			End if 
			
		End for 
		If (GEN_OK=1)
			CANCEL:C270
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].General_ChoiceFORM.Variable1"; $_t_oldMethodName)
