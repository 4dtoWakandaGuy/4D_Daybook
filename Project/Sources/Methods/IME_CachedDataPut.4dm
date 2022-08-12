//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_CachedDataPut
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
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_ExpireMS; $_l_ParameterIndex; $_l_ParameterIndex2; $_l_ParameterIndex2DFrom; $_l_ParameterIndex2DTo; $_l_ParameterIndexPosEnd; $_l_ParameterIndexPosMid; $_l_ParameterIndexPosStart; $_l_ParameterIndexRecordCount; IME_l_CachedDataNumber)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2D)
	C_REAL:C285($_l_TimeOut; $2)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_l_DataCode; $_t_oldMethodName; $_t_Result; $_t_VariableName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_CachedDataPut")
//Method:  IME_CachedDataPut

//Purpose:  Puts some Named Data into the Cache
//Inputs:
//$1:  String (79) - Named Data Code
//$2:  Real - Timeout in Minutes
//$3 - $x String (33) - Names of Variables
//Outputs:
//$0:  Text - Result Description

//NB: See also IME_CachedDataPutBlob


$_t_Result:=<>GEN_t_ERROR

If (Count parameters:C259>2)
	
	$_l_DataCode:=$1
	$_l_TimeOut:=$2
	
	If ($_l_TimeOut<0)
		$_l_TimeOut:=60
	End if 
	
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=1  //$_l_DataCode
	
	
	For ($_l_ParameterIndex; 3; Count parameters:C259)
		
		$_t_VariableName:=${$_l_ParameterIndex}
		
		If ($_t_VariableName#"")
			
			//Rollo 6/15/99 - automatically deal with 2D arrays
			//Unfortunately, it doesn't currently work because 4D is incapable
			//of getting a pointer to the first dimension of an array!
			
			If (($_t_VariableName="@{@") & ($_t_VariableName="@ to @"))
				
				$_l_ParameterIndexPosStart:=Position:C15("{"; $_t_VariableName)
				$_l_ParameterIndexPosMid:=Position:C15(" to "; $_t_VariableName)
				$_l_ParameterIndexPosEnd:=Position:C15("}"; $_t_VariableName)
				If (($_l_ParameterIndexPosStart>0) & ($_l_ParameterIndexPosMid>$_l_ParameterIndexPosStart) & ($_l_ParameterIndexPosEnd>$_l_ParameterIndexPosMid))
					
					$_l_ParameterIndex2DFrom:=Num:C11(Substring:C12($_t_VariableName; $_l_ParameterIndexPosStart+1; $_l_ParameterIndexPosMid-$_l_ParameterIndexPosStart))
					$_l_ParameterIndex2DTo:=Num:C11(Substring:C12($_t_VariableName; $_l_ParameterIndexPosMid+4; $_l_ParameterIndexPosEnd-($_l_ParameterIndexPosMid+3)))
					
					If (($_l_ParameterIndex2DFrom>0) & ($_l_ParameterIndex2DTo>=$_l_ParameterIndex2DFrom))
						
						$_t_VariableName:=Substring:C12($_t_VariableName; 1; $_l_ParameterIndexPosStart-1)
						IME_l_CachedDataNumber:=$_l_ParameterIndex2DFrom
						$_t_Result:=BDL_PutVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{from}"; ->IME_l_CachedDataNumber)
						IME_l_CachedDataNumber:=$_l_ParameterIndex2DTo
						$_t_Result:=BDL_PutVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{to}"; ->IME_l_CachedDataNumber)
						
						$_ptr_Variable2D:=Get pointer:C304($_t_VariableName)
						
						
						For ($_l_ParameterIndex2; $_l_ParameterIndex2DFrom; $_l_ParameterIndex2DTo)
							$_ptr_Variable:=Get pointer:C304($_t_VariableName+"{"+String:C10($_l_ParameterIndex2)+"}")
							
							$_t_Result:=BDL_PutVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName+"{"+String:C10($_l_ParameterIndex2)+"}"; $_ptr_Variable)
						End for 
						
					Else 
						//SYS_ErrorLog("Bad 2D array definition in IME_CachedDataPut")
					End if 
					
				Else 
					$_ptr_Variable:=Get pointer:C304($_t_VariableName)
					$_t_Result:=BDL_PutVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName; $_ptr_Variable)
				End if 
				
			Else 
				//this is the normal case
				$_ptr_Variable:=Get pointer:C304($_t_VariableName)
				$_t_Result:=BDL_PutVar(->[PREFERENCES:116]DataBlob:2; $_t_VariableName; $_ptr_Variable)
			End if 
			
		End if 
		
		If ($_t_Result#<>GEN_t_OK)
			$_l_ParameterIndex:=Count parameters:C259  //eject out of loop
		End if 
		
	End for 
	
	If ($_t_Result=<>GEN_t_OK)
		
		If ($_l_TimeOut=0)
			$_l_ExpireMS:=0
		Else 
			$_l_ExpireMS:=CAC_Seconds+(60*$_l_TimeOut)  //Milliseconds+(1000*60*$_l_TimeOut)
		End if 
		
		$_t_Result:=CAC_SaveRecord(->[PREFERENCES:116]; $_l_DataCode; $_l_ExpireMS)
		
	End if 
	
	
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
End if 

$0:=$_t_Result
//end
ERR_MethodTrackerReturn("IME_CachedDataPut"; $_t_oldMethodName)