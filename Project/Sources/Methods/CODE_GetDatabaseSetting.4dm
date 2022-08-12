//%attributes = {"invisible":true,"shared":true}

If (False:C215)
	//Project Method Name:      CODE_GetDatabaseSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_LongType; $_bo_TextType)
	C_LONGINT:C283($_l_InputLongValue; $_l_Parameter; $_l_Platform; $_l_ReturnValue; $0; $1; $3)
	C_POINTER:C301($_Ptr_ReturnTextValue; $_Ptr_ReturnValue; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_TextValue; $_t_Value)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CODE_GetDatabaseSetting")

If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_GetDatabaseSetting
	//Parameter Detail:
	
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	
	//Related Methods: 
	
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	
	//Date Created: 18/06/2017
	
	//Created BY: Nigel Greenlee
	////Date Modified: 05/07/2017
	//Modified By: Nigel Greenlee
	
End if 

//---------- Type Parameters & Local Variables ----------
If (True:C214)
	C_LONGINT:C283($_l_ReturnValue)
	
	
	C_LONGINT:C283($0)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_l_Parameter:=$1
	$_t_TextValue:=""
	$_bo_TextType:=False:C215
	If (Count parameters:C259>=2)
		$_Ptr_ReturnTextValue:=$2
		$_bo_TextType:=True:C214
	End if 
	If (Count parameters:C259>=3)
		$_l_InputLongValue:=$3
		
		$_bo_LongType:=True:C214
	End if 
	
Else 
	
End if 

//-------------------- Main Method -------------------"
$_l_ReturnValue:=0
If ($_l_Parameter>0)
	
	Case of 
		: ($_bo_LongType=True:C214)
			$_l_ReturnValue:=Get database parameter:C643($_l_Parameter; $_l_InputLongValue)
			
		: ($_bo_TextType=True:C214)
			$_l_ReturnValue:=Get database parameter:C643($_l_Parameter; $_t_TextValue)
			
			$_Ptr_ReturnTextValue->:=$_t_TextValue
		: ($_l_Parameter=64) | ($_l_Parameter=80)
			$_l_ReturnValue:=Get database parameter:C643($_l_Parameter; $_t_TextValue)
			
			$_Ptr_ReturnTextValue->:=$_t_TextValue
		: ($_l_Parameter=0) | ($_l_Parameter=1) | ($_l_Parameter=2) | ($_l_Parameter=3) | ($_l_Parameter=4) | ($_l_Parameter=5)
			$_l_Platform:=0
			//_O_PLATFORM PROPERTIES($_l_Platform)
			Get_PlatformProperty("Platform"; ->$_l_Platform)
			If ($_l_Platform=3)
				$_l_ReturnValue:=0
				$_l_ReturnValue:=Get database parameter:C643($_l_Parameter)
				
			End if 
			
		Else 
			
			$_l_ReturnValue:=Get database parameter:C643($_l_Parameter)
			
	End case 
	
End if 
$0:=$_l_ReturnValue
ERR_MethodTrackerReturn("CODE_GetDatabaseSetting"; $_t_oldMethodName)
