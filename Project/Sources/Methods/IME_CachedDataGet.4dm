//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IndexParameter; $_l_IndexParameter2DFrom; $_l_IndexParameter2DTo; $_l_ParameterIndex2; IME_l_CachedDataNumber)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2D)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_DataCode; $_t_oldMethodName; $_t_Result; $_t_VariableName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataGet")

//Method:  IME_CachedDataGet
//Purpose:  Get some Named Data from Cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2 - $x String (33) - Names of Variables
//Outputs:
//$0:  Text - Result Description

//NB: See also IME_CachedDataGetBlob


$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>1)
	
	$_t_DataCode:=$1
	
	UNLOAD RECORD:C212([PREFERENCES:116])  //table just used as a temporary container
	//no record is ever saved
	
	$_t_Result:=CAC_Query(->[PREFERENCES:116]; $_t_DataCode)
	
	If ([PREFERENCES:116]IDNumber:1>0)  //(Records in selection([preferences])=1)
		
		For ($_l_IndexParameter; 2; Count parameters:C259)
			
			$_t_VariableName:=${$_l_IndexParameter}
			
			If ($_t_VariableName#"")
				
				//Rollo 6/15/99 - automatically deal with 2D arrays
				//Unfortunately, it doesn't currently work because 4D is incapable
				//of getting a pointer to the first dimension of an array!
				
				If ($_t_VariableName="@{all}")
					
					$_t_VariableName:=Substring:C12($_t_VariableName; 1; Length:C16($_t_VariableName)-5)
					
					$_t_Result:=BDL_GetVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{from}"; ->IME_l_CachedDataNumber)
					$_l_IndexParameter2DFrom:=IME_l_CachedDataNumber
					
					$_t_Result:=BDL_GetVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{to}"; ->IME_l_CachedDataNumber)
					$_l_IndexParameter2DTo:=IME_l_CachedDataNumber
					
					If (($_l_IndexParameter2DFrom>0) & ($_l_IndexParameter2DTo>=$_l_IndexParameter2DFrom))
						
						$_ptr_Variable2D:=Get pointer:C304($_t_VariableName)
						
						For ($_l_ParameterIndex2; $_l_IndexParameter2DFrom; $_l_IndexParameter2DTo)
							
							$_ptr_Variable:=Get pointer:C304($_t_VariableName+"{"+String:C10($_l_ParameterIndex2)+"}")
							$_t_Result:=BDL_GetVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{"+String:C10($_l_ParameterIndex2)+"}"; $_ptr_Variable)
							
						End for 
						
					Else 
						//SYS_ErrorLog("Bad 2D array definition in IME_CachedDataPut")
					End if 
					
				Else 
					//this is the normal case
					$_ptr_Variable:=Get pointer:C304($_t_VariableName)
					$_t_Result:=BDL_GetVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName; $_ptr_Variable)
					
				End if 
				
			End if 
			
			If ($_t_Result#<>GEN_t_OK)
				$_l_IndexParameter:=Count parameters:C259  //eject out of loop
			End if 
			
		End for 
		
	Else 
		
		$_t_Result:=$_t_Result+Char:C90(Tab:K15:37)+"Data Not in Cache"
		
	End if 
	
End if 

$0:=$_t_Result
//end

//LOG_ResetMethod
ERR_MethodTrackerReturn("IME_CachedDataGet"; $_t_oldMethodName)