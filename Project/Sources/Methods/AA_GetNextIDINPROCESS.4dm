//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_GetNextIDINPROCESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Exit; $_bo_TableNumbers; $_bo_TablePointer; $_bo_UseRandom; $7; SYS_bo_IDCodeActivate)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_QuantitytoGet; $_l_RecordNoFix; $_l_RecordNumber; $_l_StartAt; $0; $1; $4; $5; $6)
	C_LONGINT:C283(AA_GenericID; AA_l_CallBackProcess; ID_l_Parameter4; ID_l_Parameter5; ID_l_Parameter6; RecNo)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_VariableToSet)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_VariableName2; $2; $3; ID_t_Parameter3; ID_t_ParentProcessName; SEM_t_GetID)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetNextIDINPROCESS")
MESSAGES OFF:C175


//AA_GetNextIDinprocess

CREATE EMPTY SET:C140([IDENTIFIERS_MULTI_NUMBERS:94]; "$ToDelete")
$0:=0
If (Count parameters:C259>=2)
	$_t_VariableName2:=$2  // we will be ignoring this now
	AA_l_CallBackProcess:=$1
	PROCESS PROPERTIES:C336(AA_l_CallBackProcess; ID_t_ParentProcessName; $_l_ProcessState; $_l_ProcessTime)
	
	$_bo_UseRandom:=False:C215
	$_l_QuantitytoGet:=1
	$_l_StartAt:=0
	If (Count parameters:C259>=6)
		ID_t_Parameter3:=$3
		ID_l_Parameter5:=$5
		ID_l_Parameter4:=$4
		ID_l_Parameter6:=$6  //File Number
		Repeat 
			SYS_bo_IDCodeActivate:=False:C215
			$_l_RecordNumber:=0
			$_l_QuantitytoGet:=1
			$_l_StartAt:=ID_l_Parameter6
			If (ID_l_Parameter6<0)
				$_l_QuantitytoGet:=Abs:C99(ID_l_Parameter6)
				$_l_StartAt:=0
			End if 
			//If (◊ConUsers>0)|(Application type<4)`AA_GetNextID
			
			//gets the next ID from the numbers table
			//First get the context
			$_bo_TablePointer:=False:C215
			$_bo_TableNumbers:=False:C215
			
			
			//Here check record Locking
			
			If (ID_t_Parameter3#"")  // if it's a variable
				Case of 
					: ($_l_QuantitytoGet>0)
						$_l_RecordNumber:=AA_GetNextID(->AA_GenericID; -($_l_QuantitytoGet); False:C215; ID_t_Parameter3)
					: ($_l_StartAt>0)
						$_l_RecordNumber:=AA_GetNextID(->AA_GenericID; $_l_StartAt; False:C215; ID_t_Parameter3)
					Else 
						$_l_RecordNumber:=AA_GetNextID(->AA_GenericID; 1; False:C215; ID_t_Parameter3)
						
				End case 
			Else   //It is a pointer to a field
				
				$_ptr_FieldPointer:=Field:C253(ID_l_Parameter4; ID_l_Parameter5)
				Case of 
					: ($_l_QuantitytoGet>0)
						$_l_RecordNumber:=AA_GetNextID($_ptr_FieldPointer; -($_l_QuantitytoGet))
					: ($_l_StartAt>0)
						$_l_RecordNumber:=AA_GetNextID($_ptr_FieldPointer; $_l_StartAt)
					Else 
						$_l_RecordNumber:=AA_GetNextID($_ptr_FieldPointer)
						
				End case 
				
			End if 
			$_ptr_VariableToSet:=Get pointer:C304($_t_VariableName2)
			SET PROCESS VARIABLE:C370(AA_l_CallBackProcess; RecNo; $_l_RecordNumber)
			RESUME PROCESS:C320(AA_l_CallBackProcess)
			
			$_bo_Exit:=False:C215
			Repeat   //NG APril 2004 test
				CLEAR SEMAPHORE:C144(SEM_t_GetID)
				If (Not:C34(SYS_bo_IDCodeActivate))
					DELAY PROCESS:C323(Current process:C322; 60)
				End if 
				PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState<0) | ($_t_ProcessName#ID_t_ParentProcessName)
					$_bo_Exit:=True:C214
				End if 
				
			Until (SYS_bo_IDCodeActivate) | ($_bo_Exit) | (<>SYS_bo_QuitCalled)
			$_bo_UseRandom:=False:C215
			$_l_RecordNoFix:=0
		Until ($_bo_Exit) | (<>SYS_bo_QuitCalled)
		
		
		
		
		CLEAR SEMAPHORE:C144(SEM_t_GetID)
	End if 
	
	
End if 
ERR_MethodTrackerReturn("AA_GetNextIDINPROCESS"; $_t_oldMethodName)
