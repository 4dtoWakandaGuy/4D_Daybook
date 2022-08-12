//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_HistorySetInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountLevels; $_l_Index)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_ArrayOfArrayNamesp; $_ptr_InfoArray; $1; $2)
	C_REAL:C285($3)
	C_TEXT:C284($_t_InfoArrayName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_HistorySetInfo")


//This method-similar to SD2_workflowSetthreads. (in some ways)
//sets a picture into a picture array on the diary history window.
//This is for a column 'info'(we also have that on the workflow window.
//this column is then handled in the form method to display s 'quick view' when clicked
$_t_oldMethodName:=ERR_MethodTracker("SD2_HistorySetInfo")
//This method will use the current loaded records and set the threads

If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))
		If (Size of array:C274($1->)>0)
			$_ptr_ArrayOfArrayNamesp:=$1->{4}
			If (Not:C34(Is nil pointer:C315($_ptr_ArrayOfArrayNamesp)))
				If (Size of array:C274($_ptr_ArrayOfArrayNamesp->)>0)
					//$FldarrP:=$1->{2}
					$_t_InfoArrayName:=$_ptr_ArrayOfArrayNamesp->{1}
					//ALWAYS THE FIRST COLUMN
					$_l_CountLevels:=0
					$_ptr_InfoArray:=Get pointer:C304($_t_InfoArrayName)
					For ($_l_Index; 1; Size of array:C274($_ptr_InfoArray->))
						//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
						$_pic_Picture:=Get_Picture(418)
						$_ptr_InfoArray->{$_l_Index}:=$_pic_Picture
					End for 
					//Set the column width for the levels
					
					
				Else 
					//ERROR
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_HistorySetInfo"; $_t_oldMethodName)
